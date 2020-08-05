package com.github.niefy.modules.cms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("cms_content_picture")
public class CmsContentPictureEntity implements Serializable {
    private Long contentId;
    private Long priority;
    private String imgPath;
    private String description;

    public CmsContentPictureEntity() {}

    public CmsContentPictureEntity(Long contentId, Long priority, String imgPath, String description) {
        this.contentId = contentId;
        this.priority = priority;
        this.imgPath = imgPath;
        this.description = description;
    }
}
