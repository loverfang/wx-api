package com.github.niefy.modules.cms.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;

import lombok.Data;

@Data
@TableName("cms_content")
public class CmsContentEntity implements Serializable {
    @TableId(value="content_id", type= IdType.INPUT)
    private Long contentId;
    @NotBlank(message = "栏目Id不能为空")
    private Long channelId;
    @NotBlank(message = "文章类型不能为空")
    private Long typeId;

    private Integer topLevel;
    private Integer hasTitleImg;
    private Integer isRecommend;
    private Integer status;
    private Integer viewsDay;
    private Integer commentsDay;
    private Integer downloadsDay;
    private Integer upsDay;

    @TableField(exist = false)
    private CmsContentExtEntity ext;

    @TableField(exist = false)
    private CmsContentTxtEntity txt;

    @TableField(exist = false)
    private List<CmsContentPictureEntity> pictureList;

    @TableField(exist = false)
    private List<CmsContentAttachment> attachmentList;
}
