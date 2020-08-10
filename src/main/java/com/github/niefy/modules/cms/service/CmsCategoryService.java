package com.github.niefy.modules.cms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.modules.cms.entity.CmsCategoryEntity;
import com.github.niefy.modules.cms.entity.CmsModelEntity;

import java.util.List;
import java.util.Map;

public interface CmsCategoryService extends IService<CmsCategoryEntity> {

    /**
     * 分页查询模型列表:分页参数为page(当前页码),limit(每页条数)
     * @param params
     * @return
     */
    PageUtils queryPage(Map<String, Object> params);

    /**
     * 添加模型
     * @param cmsCategoryEntity
     * @return
     */
    int add(CmsCategoryEntity cmsCategoryEntity);

    /**
     * 更新模型
     * @param cmsCategoryEntity
     * @return
     */
    int update(CmsCategoryEntity cmsCategoryEntity);

    /**
     * 批量删除模型
     * @param bannerIds
     * @return
     */
    int batchUpdateStatus(List<Long> bannerIds, Integer status);

}
