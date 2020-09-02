package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.R;
import com.github.niefy.common.utils.SnowflakeIdWorker;
import com.github.niefy.modules.cms.entity.CmsCategoryEntity;
import com.github.niefy.modules.cms.service.CmsCategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/cms/category")
public class CategoryController {

    @Resource
    private CmsCategoryService cmsCategoryService;

    /**
     * 类别第一层分页查询
     * @param params
     * @return
     */
    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        Integer pageNo = params.get("page")==null?1:Integer.valueOf((String)params.get("page"));
        Integer limit = params.get("limit")==null?1:Integer.valueOf((String)params.get("limit"));

        PageUtils page = cmsCategoryService.queryPageByParent(params ,pageNo, limit);
        return R.ok().put("page", page);
    }

    @GetMapping("/childList")
    public R childList(Long parentId) {
        List<Map<String, Object>> childList = cmsCategoryService.childList(parentId);
        return R.ok().put("page", childList);
    }

    @GetMapping("/treeList")
    public R treeList(){
        List<CmsCategoryEntity> treeList = cmsCategoryService.treeList();
        return R.ok().put("page", treeList);
    }

    @GetMapping("/detail")
    public R detail(Long categoryId){
        return R.ok().put("category",cmsCategoryService.detail(categoryId));
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
