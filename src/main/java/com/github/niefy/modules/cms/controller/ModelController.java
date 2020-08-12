package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.R;
import com.github.niefy.common.utils.SnowflakeIdWorker;
import com.github.niefy.modules.cms.entity.CmsModelEntity;
import com.github.niefy.modules.cms.service.CmsModelService;

import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import lombok.extern.slf4j.Slf4j;

/**
 * @ClassName ModelController
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/6/260:23
 * @Version 1.0
 */
@Slf4j
@RestController
@RequestMapping("/cms/model")
public class ModelController {

    @Resource
    private CmsModelService cmsModelService;

    @GetMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page =  cmsModelService.queryPage(params);
        return R.ok().put("page", page);
    }

    @GetMapping("/detail")
    public R add(Long modelId){
        cmsModelService.detail(modelId);
        return R.ok();
    }

    @PostMapping("/add")
    public R add(@RequestBody CmsModelEntity cmsModel){
        cmsModel.setModelId(SnowflakeIdWorker.getSnowflakeId());
        cmsModelService.add(cmsModel);
        return R.ok();
    }

    @PostMapping("/update")
    public R update(@RequestBody CmsModelEntity cmsModel){
        cmsModelService.update(cmsModel);
        return R.ok();
    }

    @PostMapping("/delete")
    public R delete(@RequestBody List<Long> modelIds){
        Integer status = 0;
        cmsModelService.batchDelete( modelIds, status);
        return R.ok();
    }

    @PostMapping("/resume")
    public R resume(@RequestBody List<Long> modelIds){
        Integer status = 1;
        cmsModelService.batchDelete( modelIds, status);
        return R.ok();
    }

}
