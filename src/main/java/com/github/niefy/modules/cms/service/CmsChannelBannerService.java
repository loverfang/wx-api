package com.github.niefy.modules.cms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.modules.cms.entity.CmsChannelBannerEntity;

import java.util.List;
import java.util.Map;

/**
 * @ClassName CmsChannelBannerService
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/7/50:06
 * @Version 1.0
 */
public interface CmsChannelBannerService extends IService<CmsChannelBannerEntity> {

    PageUtils queryPage(Map<String, Object> params);

    int batchInsertBanner(List<CmsChannelBannerEntity> bannerList);

    int updateChannelBanner(CmsChannelBannerEntity cmsChannelBannerEntity);

    CmsChannelBannerEntity selectByBannerId(Long bannerId);

    int batchDeleteBanners(List<Long> bannerIds);

}
