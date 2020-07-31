package com.github.niefy.modules.cms.controller;

import com.github.niefy.common.utils.R;
import com.github.niefy.modules.cms.entity.CmsModelEntity;
import com.github.niefy.modules.cms.service.CmsModelService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

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

    @GetMapping("/loadModelList")
    public R loadChannelTree(){

        //查询列表数据
        //List<CmsModelEntity> modelList =  cmsModelService.loadModelList();
        List<CmsModelEntity> modelList = new ArrayList<>();

        CmsModelEntity entity1 = new CmsModelEntity();
        entity1.setModelId(1);
        entity1.setModelName("单页");

        CmsModelEntity entity2 = new CmsModelEntity();
        entity2.setModelId(2);
        entity2.setModelName("新闻列表");

        CmsModelEntity entity3 = new CmsModelEntity();
        entity3.setModelId(3);
        entity3.setModelName("图片列表");

        modelList.add(entity1);
        modelList.add(entity2);
        modelList.add(entity3);

        return R.ok().put("modelList", modelList);
    }
}
