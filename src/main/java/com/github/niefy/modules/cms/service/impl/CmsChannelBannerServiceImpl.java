package com.github.niefy.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.Query;
import com.github.niefy.modules.cms.dao.CmsChannelBannerMapper;
import com.github.niefy.modules.cms.entity.CmsChannelBannerEntity;
import com.github.niefy.modules.cms.service.CmsChannelBannerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("cmsChannelBannerService")
public class CmsChannelBannerServiceImpl extends ServiceImpl<CmsChannelBannerMapper, CmsChannelBannerEntity> implements CmsChannelBannerService {

    @Resource
    CmsChannelBannerMapper cmsChannelBannerMapper;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String channelId = (String) params.get("channelId");

        IPage<CmsChannelBannerEntity> page = this.page(
                new Query<CmsChannelBannerEntity>().getPage(params),
                new QueryWrapper<CmsChannelBannerEntity>()
                        .eq(channelId != null, "channel_id", channelId)
        );

        return new PageUtils(page);
    }

    @Override
    public int batchInsertBanner(List<CmsChannelBannerEntity> bannerList){
        return cmsChannelBannerMapper.batchInsertBanner(bannerList);
    }

    @Override
    public int updateChannelBanner(CmsChannelBannerEntity cmsChannelBannerEntity) {
        return cmsChannelBannerMapper.update(cmsChannelBannerEntity, new QueryWrapper<CmsChannelBannerEntity>().eq("channel_id", cmsChannelBannerEntity.getChannelId()));
    }

    @Override
    public CmsChannelBannerEntity selectByBannerId(Long bannerId) {
        return cmsChannelBannerMapper.selectById(bannerId);
    }

    @Override
    public int batchDeleteBanners(List<Long> bannerIds) {
        return cmsChannelBannerMapper.deleteBatchIds( bannerIds );
    }

}
