package com.github.niefy.modules.cms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName CmsChannelEntity
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/7/423:55
 * @Version 1.0
 */
@Data
@TableName("cms_channel_banner")
public class CmsChannelBannerEntity implements Serializable {
    private Long bannerId;
    private Long channelId;
    private String path;
    private String link;
    private Integer priority;

    public CmsChannelBannerEntity() { }

    public CmsChannelBannerEntity(Long bannerId, Long channelId, String path, Integer priority, String link) {
        this.bannerId = bannerId;
        this.channelId = channelId;
        this.path = path;
        this.priority = priority;
        this.link = link;
    }
}
