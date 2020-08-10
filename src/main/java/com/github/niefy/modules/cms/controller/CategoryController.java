package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.R;
import com.github.niefy.common.utils.SnowflakeIdWorker;
import com.github.niefy.modules.cms.entity.CmsCategoryEntity;
import com.github.niefy.modules.cms.entity.CmsModelEntity;
import com.github.niefy.modules.cms.service.CmsCategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/cms/category")
public class CategoryController {

    private CmsCategoryService cmsCategoryService;

    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page =  cmsCategoryService.queryPage(params);
        return R.ok().put("page", page);
    }

    @PostMapping("/add")
    public R add(@RequestBody CmsCategoryEntity cmsCategory){
        cmsCategory.setCategoryId(SnowflakeIdWorker.getSnowflakeId());
        cmsCategoryService.add(cmsCategory);
        return R.ok();
    }

    @PostMapping("/update")
    public R update(@RequestBody CmsCategoryEntity cmsCategory){
        cmsCategoryService.update(cmsCategory);
        return R.ok();
    }

    @PostMapping("/delete")
    public R delete(@RequestBody List<Long> modelIds){
        Integer status = 0;
        cmsCategoryService.batchUpdateStatus( modelIds, status);
        return R.ok();
    }

    @PostMapping("/resume")
    public R resume(@RequestBody List<Long> modelIds){
        Integer status = 1;
        cmsCategoryService.batchUpdateStatus( modelIds, status);
        return R.ok();
    }

}
