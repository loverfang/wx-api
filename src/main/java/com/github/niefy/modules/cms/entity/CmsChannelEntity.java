package com.github.niefy.modules.cms.entity;

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
public class CmsChannelEntity   implements Serializable {
    @TableId
    private Integer channelId;  //'栏目ID',
    @NotBlank(message = "栏目名称不能为空")
    private String channelName; // '栏目名称',
    private Integer modelId; // '模型ID',
    private Integer parentId; //' 父栏目ID',
    private String channelPath; // '访问路径',
    private Integer priority; //' 排列顺序',
    private Integer isDisplay;// '是否显示(0：否，1：是)',



    @TableField(exist = false) // 表示不是数据库字段
    private List<?> list;

    public CmsChannelEntity() {
    }

    public CmsChannelEntity(Integer channelId, @NotBlank(message = "栏目名称不能为空") String channelName, Integer modelId, Integer parentId, String channelPath, Integer priority, Integer isDisplay) {
        this.channelId = channelId;
        this.channelName = channelName;
        this.modelId = modelId;
        this.parentId = parentId;
        this.channelPath = channelPath;
        this.priority = priority;
        this.isDisplay = isDisplay;
    }


}
