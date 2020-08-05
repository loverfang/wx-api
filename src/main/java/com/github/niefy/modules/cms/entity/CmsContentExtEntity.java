package com.github.niefy.modules.cms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.io.Serializable;

@Data
@TableName("cms_content_txt")
public class CmsContentExtEntity implements Serializable {
    private Long contentId;
    private String title;
    private String shortTitle;
    private String author;
    private String origin;
    private String originUrl;
    private String description;
    private String mediaType;
    private String mediaPath;
    private String titleImg;
    private String contentImg;
    private String link;
    private String tplContent;
    private String releaseDate;

    public CmsContentExtEntity() { }

    public CmsContentExtEntity(Long contentId, String title, String shortTitle, String author, String origin, String originUrl, String description, String mediaType, String mediaPath, String titleImg, String contentImg, String link, String tplContent, String releaseDate) {
        this.contentId = contentId;
        this.title = title;
        this.shortTitle = shortTitle;
        this.author = author;
        this.origin = origin;
        this.originUrl = originUrl;
        this.description = description;
        this.mediaType = mediaType;
        this.mediaPath = mediaPath;
        this.titleImg = titleImg;
        this.contentImg = contentImg;
        this.link = link;
        this.tplContent = tplContent;
        this.releaseDate = releaseDate;
    }
}
