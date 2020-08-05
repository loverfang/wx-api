package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.R;
import com.github.niefy.modules.cms.entity.CmsChannelBannerEntity;
import com.github.niefy.modules.cms.service.CmsChannelBannerService;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/cms/channelBanner")
public class ChannelBannerController {

    @Resource
    CmsChannelBannerService cmsChannelBannerService;

    /**
     * 指定栏目的Banner列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = cmsChannelBannerService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 新增栏目Banner
     * @param bannerList
     * @return
     */
    @PostMapping("/addChannelBanner")
    public R addChannelBanner(@RequestBody List<CmsChannelBannerEntity> bannerList){
        int addResult = cmsChannelBannerService.batchInsertBanner( bannerList );
        return R.ok().put("data", addResult);
    }

    /**
     * 修改栏目Banner
     * @param cmsChannelBanner
     * @return
     */
    @PostMapping("/updateChannelBanner")
    public R updateChannelBanner(@RequestBody CmsChannelBannerEntity cmsChannelBanner){
        int updateResult = cmsChannelBannerService.updateChannelBanner( cmsChannelBanner );
        return R.ok().put("data", updateResult);
    }

    /**
     * 加载Banner详情
     * @param bannerId
     * @return
     */
    @GetMapping("/loadChannelBannerDetail")
    public R loadChannelBannerDetail(Long bannerId){
        log.info("bannerId:{}",bannerId);
        CmsChannelBannerEntity cmsChannelBannerEntity = cmsChannelBannerService.selectByBannerId(bannerId);
        return R.ok().put("data", cmsChannelBannerEntity);
    }

    /**
     * 批量删除选择的Banner
     * @param bannerIds
     * @return
     */
    @PostMapping("/deleteChannelBanner")
    public R deleteChannelBanner(@RequestBody List<Long> bannerIds){
        log.info("channelId:{}",bannerIds);
        cmsChannelBannerService.batchDeleteBanners(bannerIds);
        return R.ok().put("channelBanner", null);
    }

}
