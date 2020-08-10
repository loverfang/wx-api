package com.github.niefy.modules.cms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.modules.cms.dao.CmsCategoryMapper;
import com.github.niefy.modules.cms.entity.CmsCategoryEntity;
import com.github.niefy.modules.cms.service.CmsCategoryService;

import java.util.List;
import java.util.Map;

public class CmsCategoryServiceImpl extends ServiceImpl<CmsCategoryMapper, CmsCategoryEntity> implements CmsCategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        return null;
    }

    @Override
    public int add(CmsCategoryEntity cmsCategoryEntity) {
        return 0;
    }

    @Override
    public int update(CmsCategoryEntity cmsCategoryEntity) {
        return 0;
    }

    @Override
    public int batchDelete(List<Long> bannerIds, Integer status) {
        return 0;
    }

}
