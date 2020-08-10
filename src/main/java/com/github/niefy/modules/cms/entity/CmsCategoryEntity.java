package com.github.niefy.modules.cms.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Data
@TableName("cms_category")
public class CmsCategoryEntity  implements Serializable {

    @TableId(value="category_id", type= IdType.INPUT)
    private Long categoryId;

    @NotBlank(message = "类型名称不能为空")
    private String categoryName;

    @NotBlank(message = "父类ID不能为空")
    private String parentId;

    @NotBlank(message = "显示顺序不能为空")
    private Integer priority;

    private String remark;

    public CmsCategoryEntity() { }

    public CmsCategoryEntity(Long categoryId, @NotBlank(message = "类型名称不能为空") String categoryName, @NotBlank(message = "父类ID不能为空") String parentId, @NotBlank(message = "显示顺序不能为空") Integer priority, String remark) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.parentId = parentId;
        this.priority = priority;
        this.remark = remark;
    }

}
