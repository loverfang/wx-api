package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.R;
import com.github.niefy.common.utils.SnowflakeIdWorker;
import com.github.niefy.modules.cms.entity.CmsChannelEntity;
import com.github.niefy.modules.cms.entity.CmsChannelExtEntity;
import com.github.niefy.modules.cms.service.CmsChannelService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description 栏目管理
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

    /**
     * 加载所有栏目列表
     * @return
     */
    @GetMapping("/loadChannelTree")
    public R loadChannelTree(){
        List<CmsChannelEntity> channelList = cmsChannelService.loadChannelTree();

//        // 添加顶级栏目
//        CmsChannelEntity root = new CmsChannelEntity();
//        root.setChannelId(0);
//        root.setChannelName("顶级栏目");
//        root.setParentId(-1);
//        channelList.add(root);
        return R.ok().put("channelList", channelList);
    }

    /**
     * 加载栏目详情
     * @param channelId
     * @return
     */
    @GetMapping("/loadChannelDetail")
    public R loadChannelDetail(Long channelId){
        log.info("channelId:{}",channelId);
        CmsChannelEntity  cmsChannelEntity= cmsChannelService.loadChannelDetail(channelId);
        return R.ok().put("channelInfo", cmsChannelEntity  );
    }

    /**
     * 新增栏目
     * @param cmsChannel
     * @return
     */
    @PostMapping("/addChannel")
    public R addChannel(@RequestBody CmsChannelEntity cmsChannel){
        cmsChannel.setStatus(1);
        cmsChannel.setChannelId( SnowflakeIdWorker.getSnowflakeId() );
        cmsChannelService.addChannel(cmsChannel);
        return R.ok();
    }

    /**
     * 更新栏目
     * @param cmsChannel
     * @return
     */
    @PostMapping("/updateChannel")
    public R updateChannel(@RequestBody CmsChannelEntity cmsChannel){
        CmsChannelExtEntity cmsChannelExtEntity = null;
        cmsChannelService.updateChannel(cmsChannel, cmsChannelExtEntity);
        return R.ok();
    }

    /**
     * 删除栏目
     * @param cmsChannel
     * @return
     */
    @PostMapping("/deleteChannel")
    public R deleteChannel(@RequestBody CmsChannelEntity cmsChannel){
        CmsChannelEntity cmsChannelEntity = new CmsChannelEntity();
        cmsChannelEntity.setStatus(cmsChannel.getStatus());
        cmsChannelEntity.setChannelId(cmsChannel.getChannelId());
        cmsChannelService.updateChannelStatus(cmsChannelEntity);
        return R.ok();
    }
}