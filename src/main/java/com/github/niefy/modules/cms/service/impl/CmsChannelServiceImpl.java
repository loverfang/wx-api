package com.github.niefy.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.niefy.modules.cms.dao.CmsChannelExtMapper;
import com.github.niefy.modules.cms.dao.CmsChannelMapper;
import com.github.niefy.modules.cms.dao.CmsChannelTxtMapper;
import com.github.niefy.modules.cms.entity.CmsChannelEntity;
import com.github.niefy.modules.cms.entity.CmsChannelExtEntity;
import com.github.niefy.modules.cms.entity.CmsChannelTxtEntity;
import com.github.niefy.modules.cms.service.CmsChannelService;
import org.apache.shiro.crypto.hash.Hash;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName CmsChannelServiceImpl
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/7/50:28
 * @Version 1.0
 */
@Service("cmsChannelService")
public class CmsChannelServiceImpl extends ServiceImpl<CmsChannelMapper, CmsChannelEntity> implements CmsChannelService {

    @Resource
    CmsChannelMapper cmsChannelMapper;
    @Resource
    CmsChannelExtMapper cmsChannelExtMapper;
    @Resource
    CmsChannelTxtMapper cmsChannelTxtMapper;

    @Override
    public List<CmsChannelEntity> loadChannelTree() {
        List<CmsChannelEntity> channelEntityList =  cmsChannelMapper.selectList(new QueryWrapper<CmsChannelEntity>().eq("is_display",1));
        return channelEntityList;
    }

    @Override
    public CmsChannelEntity loadChannelDetail(Long channelId) {
        return cmsChannelMapper.loadChannelDetail(channelId);
    }

    @Override
    @Transactional(rollbackFor=Exception.class)
    public int addChannel(CmsChannelEntity cmsChannelEntity) {
        // 插入栏目表
        int insertResult = cmsChannelMapper.insert( cmsChannelEntity );

        CmsChannelExtEntity cmsChannelExtEntity = new CmsChannelExtEntity();
        cmsChannelExtEntity.setChannelId(cmsChannelEntity.getChannelId());
        cmsChannelExtEntity.setAllowScore(0);
        cmsChannelExtEntity.setAllowShare(0);
        // 初始栏目属性表
        cmsChannelExtMapper.insert(cmsChannelExtEntity);

        CmsChannelTxtEntity cmsChannelTxtEntity = new CmsChannelTxtEntity();
        cmsChannelTxtEntity.setChannelId(cmsChannelEntity.getChannelId());

        // 初始栏目文本表
        cmsChannelTxtMapper.insert(cmsChannelTxtEntity);
        return insertResult;
    }

    @Override
    @Transactional(rollbackFor=Exception.class)
    public void updateChannel(CmsChannelEntity cmsChannelEntity) {
        cmsChannelMapper.updateById(cmsChannelEntity);
        cmsChannelTxtMapper.updateById(cmsChannelEntity.getTxt());
        // cmsChannelExtMapper.updateById(cmsChannelEntity.getExt());
    }

    @Override
    public int updateChannelStatus(CmsChannelEntity cmsChannelEntity) {
        List<Long> childsChannelId = cmsChannelMapper.loadAllChildAndGrandchilds(cmsChannelEntity.getChannelId());
        // 加入当前节点
        childsChannelId.add(cmsChannelEntity.getChannelId());

        // 批量修改菜单的状态
        Map<String,Object> updateStatusParamMap = new HashMap<String,Object>();
        updateStatusParamMap.put("status",cmsChannelEntity.getStatus());
        updateStatusParamMap.put("channelIds",childsChannelId);
        return cmsChannelMapper.batchUpdateStatusByIdList(updateStatusParamMap);
    }

    @Override
    public List<Long> loadAllChildAndgrandchilds(Long channelId) {
        return cmsChannelMapper.loadAllChildAndGrandchilds( channelId );
    }
}
