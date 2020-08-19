package com.github.niefy.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.Query;
import com.github.niefy.modules.cms.dao.CmsCategoryMapper;
import com.github.niefy.modules.cms.entity.CmsCategoryEntity;
import com.github.niefy.modules.cms.service.CmsCategoryService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("cmsCategoryService")
public class CmsCategoryServiceImpl extends ServiceImpl<CmsCategoryMapper, CmsCategoryEntity> implements CmsCategoryService {

    @Resource
    private CmsCategoryMapper cmsCategoryMapper;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String categoryName = (String)params.get("categoryName");
        Long parentId = Long.parseLong((String)params.get("parentId"));
        IPage<CmsCategoryEntity> page = this.page(
                new Query<CmsCategoryEntity>().getPage(params),
                new QueryWrapper<CmsCategoryEntity>()
                        .like(StringUtils.isNotBlank(categoryName), "category_name", categoryName)
                        .eq("parent_id", parentId)
        );
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPageByParent(Map<String,Object> params, Integer pageNo, Integer limit) {
        // 新建分页
        Page<Map<String,Object>> page = new Page<Map<String,Object>>(pageNo,limit);
        // 返回结果
        return  new PageUtils(page.setRecords(cmsCategoryMapper.queryPage(page,  params)));
    }

    @Override
    public List<Map<String, Object>> childList(Long parentId) {
        return cmsCategoryMapper.childList(parentId);
    }

    @Override
    public List<CmsCategoryEntity> treeList() {
        return this.baseMapper.selectList(null);
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
