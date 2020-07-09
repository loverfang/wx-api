package com.github.niefy.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.niefy.common.utils.R;
import com.github.niefy.modules.cms.dao.CmsChannelMapper;
import com.github.niefy.modules.cms.entity.CmsChannelEntity;
import com.github.niefy.modules.cms.entity.CmsModelEntity;
import com.github.niefy.modules.cms.service.CmsChannelService;
import com.github.niefy.modules.sys.entity.SysMenuEntity;
import org.springframework.stereotype.Service;

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

    @Override
    public List<CmsChannelEntity> loadChannelTree() {

        List<CmsChannelEntity> channelEntityList =  cmsChannelMapper.selectList(new QueryWrapper<CmsChannelEntity>().eq("is_display",1));

        return channelEntityList;

    }

}
