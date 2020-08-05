package com.github.niefy.modules.cms.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("cms_content_txt")
public class CmsContentTxtEntity implements Serializable {
    private Long contentId;
    private String txt;
    private String txt1;
    private String txt2;
    private String txt3;

    public CmsContentTxtEntity() { }

    public CmsContentTxtEntity(Long contentId, String txt, String txt1, String txt2, String txt3) {
        this.contentId = contentId;
        this.txt = txt;
        this.txt1 = txt1;
        this.txt2 = txt2;
        this.txt3 = txt3;
    }
}
