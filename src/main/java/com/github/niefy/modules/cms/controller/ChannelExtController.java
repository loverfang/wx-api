package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.R;
import com.github.niefy.modules.cms.entity.CmsChannelExtEntity;
import com.github.niefy.modules.cms.entity.CmsChannelTxtEntity;
import com.github.niefy.modules.cms.service.CmsChannelExtService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Slf4j
@RestController
@RequestMapping("/cms/channelExt")
public class ChannelExtController {

    @Resource
    private CmsChannelExtService cmsChannelExtService;

    /**
     * 修改栏目属性
     * @param cmsChannelExt
     * @return
     */
    @PostMapping("/updateChannelExt")
    public R updateChannelExt(@RequestBody CmsChannelExtEntity cmsChannelExt){
        cmsChannelExtService.updateChannelExt(cmsChannelExt);
        return R.ok();
    }

    /**
     * 加载栏目属性详情
     * @param channelId
     * @return
     */
    @GetMapping("/loadChannelExtDetail")
    public R loadChannelExtDetail(Long channelId){
        return R.ok().put("channelExt", cmsChannelExtService.loadChannelExt( channelId ));
    }

}
