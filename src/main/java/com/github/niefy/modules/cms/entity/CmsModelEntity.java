package com.github.niefy.modules.cms.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * @ClassName CmsModel
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/6/260:29
 * @Version 1.0
 */
@Data
@TableName("cms_model")
public class CmsModelEntity  implements Serializable {
    @TableId(value="model_id", type= IdType.INPUT)
    private Long modelId;

    // 模型名称,如新闻,视频,图片,单页等
    @NotBlank(message = "模型名称不能为空")
    private String modelName;
    // 模型路径
    private String modelPath;
    // 栏目内容对应的路径
    private String modelContentPath;
    // 栏目标题图宽度
    private Integer titleImgWidth;
    // 栏目标题图高度
    private Integer titleImgHeight;
    // 栏目内容图宽度
    private Integer contentImgWidth;
    // 栏目内容图高度
    private Integer contentImgHeight;
    // 排列顺序
    private Integer priority;
    // 页面呈现方式:1新闻列表,2产品图片列表,3案例图片列表,4单篇展示
    private Integer viewStyle;
    // 是否禁用(0:是,1否)
    private Integer isDisabled;
    // 是否是默认的模型（0否,1是,默认0）
    private Integer isDef;

    public CmsModelEntity() { }

    public CmsModelEntity(Long modelId, String modelName, String modelPath, String modelContentPath, Integer titleImgWidth, Integer titleImgHeight, Integer contentImgWidth, Integer contentImgHeight, Integer priority, Integer viewStyle, Integer isDisabled, Integer isDef) {
        this.modelId = modelId;
        this.modelName = modelName;
        this.modelPath = modelPath;
        this.modelContentPath = modelContentPath;
        this.titleImgWidth = titleImgWidth;
        this.titleImgHeight = titleImgHeight;
        this.contentImgWidth = contentImgWidth;
        this.contentImgHeight = contentImgHeight;
        this.priority = priority;
        this.viewStyle = viewStyle;
        this.isDisabled = isDisabled;
        this.isDef = isDef;
    }
}
