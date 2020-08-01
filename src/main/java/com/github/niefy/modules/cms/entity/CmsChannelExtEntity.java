package com.github.niefy.modules.cms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("cms_channel_ext")
public class CmsChannelExtEntity implements Serializable {
    private Integer channelId;
    private String title;
    private String keywords;
    private String description;
    private String link;
    private String channelPcPath;
    private String channelPcContentPath;
    private String channelMobilePath;
    private String channelMobileContentPath;
    private String isBlank;
    private Integer allowShare;
    private Integer allowScore;

    public CmsChannelExtEntity() { }

    public CmsChannelExtEntity(Integer channelId, String title, String keywords, String description, String link, String channelPcPath, String channelPcContentPath, String channelMobilePath, String channelMobileContentPath, String isBlank, Integer allowShare, Integer allowScore) {
        this.channelId = channelId;
        this.title = title;
        this.keywords = keywords;
        this.description = description;
        this.link = link;
        this.channelPcPath = channelPcPath;
        this.channelPcContentPath = channelPcContentPath;
        this.channelMobilePath = channelMobilePath;
        this.channelMobileContentPath = channelMobileContentPath;
        this.isBlank = isBlank;
        this.allowShare = allowShare;
        this.allowScore = allowScore;
    }
}
