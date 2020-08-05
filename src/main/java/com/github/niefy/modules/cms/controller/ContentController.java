package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.R;
import com.github.niefy.modules.cms.service.CmsContentService;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

import lombok.extern.slf4j.Slf4j;

import javax.annotation.Resource;

@Slf4j
@RestController
@RequestMapping("/cms/content")
public class ContentController {

    @Resource
    CmsContentService cmsContentService;

    /**
     * 指定栏目(包括其子孙)栏目下的文章列表
     * @param params
     * @return
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        Integer current = params.get("current")==null?1:Integer.valueOf((String)params.get("current"));
        Integer pageSize = params.get("pageSize")==null?1:Integer.valueOf((String)params.get("pageSize"));

        PageUtils page = cmsContentService.queryPage(params, current, pageSize);
        return R.ok().put("page", page);
    }

    /**
     * 添加文章
     * @return
     */
    @PostMapping("/detail")
    public R detail(){

        return R.ok();
    }

    /**
     * 添加文章
     * @return
     */
    @PostMapping("/add")
    public R add(){

        return R.ok();
    }

    /**
     * 编辑文章
     * @return
     */
    @PostMapping("/edit")
    public R edit(){

        return R.ok();
    }

    /**
     * 删除文章
     * @return
     */
    @PostMapping("/delete")
    public R delete(){

        return R.ok();
    }

}
