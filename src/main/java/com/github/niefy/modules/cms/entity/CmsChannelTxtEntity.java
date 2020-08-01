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
@TableName("cms_channel_txt")
public class CmsChannelTxtEntity implements Serializable {
    private Integer channelId;
    private String txt;
    private String txt1;
    private String txt2;
    private String txt3;
    private String txt4;

    public CmsChannelTxtEntity() { }

    public CmsChannelTxtEntity(Integer channelId, String txt, String txt1, String txt2, String txt3, String txt4) {
        this.channelId = channelId;
        this.txt = txt;
        this.txt1 = txt1;
        this.txt2 = txt2;
        this.txt3 = txt3;
        this.txt4 = txt4;
    }
}
