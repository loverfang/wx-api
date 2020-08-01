package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.Constant;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.R;
import com.github.niefy.modules.cms.entity.CmsChannelBannerEntity;
import com.github.niefy.modules.cms.entity.CmsChannelExtEntity;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/cms/channelBanner")
public class ChannelBannerController {

    /**
     * 查询指定栏目下的所有Banner列表
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = sysUserService.queryPage(params);
        return R.ok().put("page", page);
    }

    /**
     * 新增栏目Banner
     * @param cmsChannelBanner
     * @return
     */
    @PostMapping("/addChannelBanner")
    public R addChannelBanner(@RequestBody CmsChannelBannerEntity cmsChannelBanner){

        return R.ok();
    }

    /**
     * 修改栏目Banner
     * @param cmsChannelBanner
     * @return
     */
    @PostMapping("/updateChannelBanner")
    public R updateChannelBanner(@RequestBody CmsChannelBannerEntity cmsChannelBanner){

        return R.ok();
    }

    /**
     * 加载栏目属性详情
     * @param channelId
     * @return
     */
    @GetMapping("/loadChannelBannerDetail")
    public R loadChannelBannerDetail(Integer channelId){
        log.info("channelId:{}",channelId);
        return R.ok().put("channelBanner", null);
    }

    /**
     * 加载栏目属性详情
     * @param cmsChannelBanner
     * @return
     */
    @PostMapping("/deleteChannelBanner")
    public R deleteChannelBanner(@RequestBody CmsChannelBannerEntity cmsChannelBanner){
        log.info("channelId:{}",cmsChannelBanner);
        return R.ok().put("channelBanner", null);
    }

}
