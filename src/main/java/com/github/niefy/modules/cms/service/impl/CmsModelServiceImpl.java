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

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String paramKey = (String) params.get("paramKey");

        IPage<CmsModelEntity> page = this.page(
                new Query<CmsModelEntity>().getPage(params),
                new QueryWrapper<CmsModelEntity>()
                        .like(StringUtils.isNotBlank(paramKey), "param_key", paramKey)
                        .eq("status", 1)
        );

        return new PageUtils(page);
    }

}
