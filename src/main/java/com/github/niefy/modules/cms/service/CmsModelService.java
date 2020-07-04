package com.github.niefy.modules.cms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.modules.cms.entity.CmsModelEntity;

import java.util.Map;

/**
 * @ClassName ModelService
 * @Description Cms模型管理
 * @Author Luo.z.x
 * @Date 2020/6/260:24
 * @Version 1.0
 */
public interface CmsModelService  extends IService<CmsModelEntity> {

    PageUtils queryPage(Map<String, Object> params);



}
