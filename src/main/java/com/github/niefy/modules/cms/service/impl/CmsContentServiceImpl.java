package com.github.niefy.modules.cms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.modules.cms.dao.CmsContentMapper;
import com.github.niefy.modules.cms.entity.CmsContentEntity;
import com.github.niefy.modules.cms.service.CmsContentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("cmsContentService")
public class CmsContentServiceImpl extends ServiceImpl<CmsContentMapper, CmsContentEntity> implements CmsContentService {

    @Resource
    CmsContentMapper cmsContentMapper;

    @Override
    public PageUtils queryPage(Map<String, Object> params, Integer current, Integer pageSize) {

        // 新建分页
        Page<Map<String,Object>> page =new Page<Map<String,Object>>(current, pageSize);

        // 返回结果
        return  new PageUtils(page.setRecords(cmsContentMapper.queryPage(page,  params)));
    }

}
