package com.github.niefy.modules.cms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.modules.cms.entity.CmsModelEntity;

import java.util.List;
import java.util.Map;

/**
 * @ClassName ModelService
 * @Description Cms模型管理
 * @Author Luo.z.x
 * @Date 2020/6/260:24
 * @Version 1.0
 */
public interface CmsModelService  extends IService<CmsModelEntity> {

    /**
     * 分页查询模型列表:分页参数为page(当前页码),limit(每页条数)
     * @param params
     * @return
     */
    PageUtils queryPage(Map<String, Object> params);

    /**
     * 添加模型
     * @param cmsModelEntity
     * @return
     */
    int add(CmsModelEntity cmsModelEntity);

    /**
     * 更新模型
     * @param cmsModelEntity
     * @return
     */
    int update(CmsModelEntity cmsModelEntity);

    /**
     * 批量删除模型
     * @param bannerIds
     * @return
     */
    int batchDelete(List<Long> bannerIds, Integer status);

    CmsModelEntity detail(Long modelId);
}
