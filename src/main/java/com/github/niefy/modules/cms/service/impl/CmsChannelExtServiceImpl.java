package com.github.niefy.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.niefy.modules.cms.dao.CmsChannelExtMapper;
import com.github.niefy.modules.cms.entity.CmsChannelExtEntity;
import com.github.niefy.modules.cms.service.CmsChannelExtService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("cmsChannelExtService")
public class CmsChannelExtServiceImpl extends ServiceImpl<CmsChannelExtMapper, CmsChannelExtEntity> implements CmsChannelExtService {

    @Resource
    private CmsChannelExtMapper cmsChannelExtMapper;

    @Override
    public CmsChannelExtEntity loadChannelExt(Long channelId) {
        return cmsChannelExtMapper.selectOne(new QueryWrapper<CmsChannelExtEntity>().eq("channel_id", channelId));
    }

    @Override
    public void updateChannelExt(CmsChannelExtEntity channelExt) {
        cmsChannelExtMapper.update(channelExt,new QueryWrapper<CmsChannelExtEntity>().eq("channel_id", channelExt.getChannelId()));
    }

}
