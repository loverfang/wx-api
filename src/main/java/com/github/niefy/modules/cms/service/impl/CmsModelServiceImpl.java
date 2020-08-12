package com.github.niefy.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.Query;
import com.github.niefy.modules.cms.dao.CmsModelMapper;
import com.github.niefy.modules.cms.entity.CmsModelEntity;
import com.github.niefy.modules.cms.service.CmsModelService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName CmsModelServiceImpl
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/6/260:58
 * @Version 1.0
 */
@Service("cmsModelService")
public class CmsModelServiceImpl extends ServiceImpl<CmsModelMapper, CmsModelEntity> implements CmsModelService {

    @Resource
    CmsModelMapper cmsModelMapper;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String modelName = (String) params.get("modelName");

        IPage<CmsModelEntity> page = this.page(
                new Query<CmsModelEntity>().getPage(params),
                new QueryWrapper<CmsModelEntity>()
                        .like(StringUtils.isNotBlank(modelName), "model_name", modelName)
                        .eq("is_disabled", 1)
        );

        return new PageUtils(page);
    }

    @Override
    public int add(CmsModelEntity cmsModelEntity) {
        return this.baseMapper.insert( cmsModelEntity );
    }

    @Override
    public int update(CmsModelEntity cmsModelEntity) {
        return this.baseMapper.updateById(cmsModelEntity);
    }

    @Override
    public int batchDelete(List<Long> modelIds,Integer status) {
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("status",status);
        paramMap.put("modelIds", modelIds);
        return cmsModelMapper.batchUpdateIsDisplay( paramMap );
    }

    @Override
    public CmsModelEntity detail(Long modelId) {
        return this.baseMapper.selectById( modelId );
    }
}
