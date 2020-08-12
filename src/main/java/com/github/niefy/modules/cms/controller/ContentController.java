package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.R;
import com.github.niefy.modules.cms.entity.CmsContentEntity;
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
        Integer page = params.get("page")==null?1:Integer.valueOf((String)params.get("page"));
        Integer limit = params.get("limit")==null?1:Integer.valueOf((String)params.get("limit"));
        PageUtils pageUtils = cmsContentService.queryPage(params, page, limit);
        return R.ok().put("page", pageUtils);
    }

    /**
     * 加载文章详情
     * @return
     */
    @GetMapping("/detail")
    public R detail(Long conentId){
        return R.ok();
    }

    /**
     * 添加文章
     * @return
     */
    @PostMapping("/add")
    public R add(@RequestBody CmsContentEntity cmsContentEntity){
        int addResult = cmsContentService.addContent(cmsContentEntity);
        return R.ok();
    }

    /**
     * 编辑文章
     * @return
     */
    @PostMapping("/update")
    public R update(@RequestBody CmsContentEntity cmsContentEntity){
        int updateResult = cmsContentService.updateContent(cmsContentEntity);
        return R.ok();
    }

    /**
     * 删除文章
     * @return
     */
    @PostMapping("/delete")
    public R delete(Long[] ids){
        return R.ok();
    }

}
