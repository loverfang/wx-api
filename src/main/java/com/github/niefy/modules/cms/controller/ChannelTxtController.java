package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.R;
import com.github.niefy.modules.cms.entity.CmsChannelTxtEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/cms/channelTxt")
public class ChannelTxtController {

    @PostMapping("/updateChannelTxt")
    public R updateChannelTxt(@RequestBody CmsChannelTxtEntity cmsChannelTxt){

        return R.ok();
    }

    /**
     * 加载栏目属性详情
     * @param channelId
     * @return
     */
    @GetMapping("/loadChannelTxtDetail")
    public R loadChannelTxtDetail(Integer channelId){
        log.info("channelId:{}",channelId);
        return R.ok().put("channelTxt", null);
    }

}
