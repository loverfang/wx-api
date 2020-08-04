package com.github.niefy.modules.cms.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;

/**
 * @ClassName CmsChannelEntity
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/7/423:55
 * @Version 1.0
 */
@Data
@TableName("cms_channel")
public class CmsChannelEntity implements Serializable {
    @TableId(value="channel_id", type=IdType.INPUT)
    private Long channelId;
    @NotBlank(message = "栏目名称不能为空")
    private String channelName;
    private Long modelId;
    private Long parentId;

    private String channelPath;
    private Integer priority;
    private Integer isDisplay;
    private Integer status;

    /**栏目扩展属性*/
    @TableField(exist = false)
    private CmsChannelExtEntity ext;
    /**栏目扩展内容*/
    @TableField(exist = false)
    private CmsChannelTxtEntity txt;

    @TableField(exist = false)
    private List<CmsChannelBannerEntity> bannerList;
    /**子栏目*/
    @TableField(exist = false)
    private List<?> list;

    public CmsChannelEntity() { }

    public CmsChannelEntity(Long channelId, @NotBlank(message = "栏目名称不能为空") String channelName, Long modelId, Long parentId, String channelPath, Integer priority, Integer isDisplay) {
        this.channelId = channelId;
        this.channelName = channelName;
        this.modelId = modelId;
        this.parentId = parentId;
        this.channelPath = channelPath;
        this.priority = priority;
        this.isDisplay = isDisplay;
    }

}
