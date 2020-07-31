package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.R;
import com.github.niefy.modules.cms.entity.CmsChannelEntity;
import com.github.niefy.modules.cms.service.CmsChannelService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName ChannelController
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/7/423:51
 * @Version 1.0
 */
@Slf4j
@RestController
@RequestMapping("/cms/channel")
public class ChannelController {

    @Resource
    private CmsChannelService cmsChannelService;

    @GetMapping("/loadChannelTree")
    public R loadChannelTree(){

        //查询列表数据
        List<CmsChannelEntity> channelList = cmsChannelService.loadChannelTree();

        //  添加顶级栏目
        CmsChannelEntity root = new CmsChannelEntity();
        root.setChannelId(0);
        root.setChannelName("顶级栏目");
        root.setParentId(-1);
        channelList.add(root);

        return R.ok().put("channelList", channelList);
    }

    @GetMapping("/loadChannelDetail")
    public R loadchannelDetail(Integer channelId){

        log.info("channelId:{}",channelId);


        CmsChannelEntity  channelInfo = new CmsChannelEntity();
        channelInfo.setChannelId(1);
        channelInfo.setChannelName("myTest");

        return R.ok().put("channelInfo", channelInfo);
    }

    public R new new
}
