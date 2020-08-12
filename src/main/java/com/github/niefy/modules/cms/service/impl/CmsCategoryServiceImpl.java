package com.github.niefy.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.Query;
import com.github.niefy.modules.cms.dao.CmsCategoryMapper;
import com.github.niefy.modules.cms.entity.CmsCategoryEntity;
import com.github.niefy.modules.cms.service.CmsCategoryService;
import org.apache.commons.lang.StringUtils;

import java.util.List;
import java.util.Map;

public class CmsCategoryServiceImpl extends ServiceImpl<CmsCategoryMapper, CmsCategoryEntity> implements CmsCategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String categoryName = (String)params.get("categoryName");
        Long parentId = (Long)params.get("parentId");
        IPage<CmsCategoryEntity> page = this.page(
                new Query<CmsCategoryEntity>().getPage(params),
                new QueryWrapper<CmsCategoryEntity>()
                        .like(StringUtils.isNotBlank(categoryName), "category_name", categoryName)
                        .eq("parent_id", parentId)
        );
        return new PageUtils(page);
    }

    @Override
    public List<CmsCategoryEntity> childList(Long parentId) {
        return this.baseMapper.selectList(new QueryWrapper<CmsCategoryEntity>()
        .eq("parent_id", parentId));
    }

    @Override
    public CmsCategoryEntity detail(Long categoryId) {
        return this.baseMapper.selectById( categoryId );
    }

    @Override
    public int add(CmsCategoryEntity cmsCategoryEntity) {
        return this.baseMapper.insert(cmsCategoryEntity);
    }

    @Override
    public int update(CmsCategoryEntity cmsCategoryEntity) {
        return this.baseMapper.updateById(cmsCategoryEntity);
    }

    /**
     * 批量更新状态
     * @param bannerIds
     * @param status
     * @return
     */
    @Override
    public int batchUpdateStatus(List<Long> bannerIds, Integer status) {
        return 0;
    }

}
