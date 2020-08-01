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
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName CmsChannelServiceImpl
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/7/50:28
 * @Version 1.0
 */
@Service("CmsChannelService")
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
    public CmsChannelEntity loadChannelDetail(Integer channelId) {
        return cmsChannelMapper.loadChannelDetail(channelId);
    }

    @Override
    @Transactional(rollbackFor=Exception.class)
    public int addChannel(CmsChannelEntity cmsChannelEntity) {
        // 插入栏目表
        return cmsChannelMapper.insert( cmsChannelEntity );
//        int channelId = cmsChannelEntity.getChannelId();
//
//        CmsChannelExtEntity cmsChannelExtEntity = new CmsChannelExtEntity();
//        cmsChannelExtEntity.setChannelId(channelId);
//        cmsChannelExtEntity.setAllowScore(0);
//        cmsChannelExtEntity.setAllowShare(0);
//        // 初始栏目属性表
//        cmsChannelExtMapper.insert(cmsChannelExtEntity);
//
//        CmsChannelTxtEntity cmsChannelTxtEntity = new CmsChannelTxtEntity();
//        cmsChannelTxtEntity.setChannelId(channelId);
//        // 初始栏目文本表
//        cmsChannelTxtMapper.insert(cmsChannelTxtEntity);
//        return channelId;
    }

    @Override
    @Transactional(rollbackFor=Exception.class)
    public void updateChannel(CmsChannelEntity cmsChannelEntity, CmsChannelExtEntity cmsChannelExt) {
        cmsChannelMapper.updateById(cmsChannelEntity);
        cmsChannelExtMapper.updateById(cmsChannelEntity.getExt());
        cmsChannelTxtMapper.updateById(cmsChannelEntity.getTxt());
    }

    @Override
    public int updateChannelStatus(CmsChannelEntity cmsChannelEntity) {
        return cmsChannelMapper.updateById(cmsChannelEntity);
    }
}
