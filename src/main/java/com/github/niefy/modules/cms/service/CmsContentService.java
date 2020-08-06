package com.github.niefy.modules.cms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.modules.cms.entity.CmsContentEntity;

import java.util.Map;

public interface CmsContentService extends IService<CmsContentEntity> {

    PageUtils queryPage(Map<String, Object> params, Integer current, Integer pageSize);

    int addContent(CmsContentEntity cmsContentEntity);

    int updateContent(CmsContentEntity cmsContentEntity);

}
