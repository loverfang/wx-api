package com.github.niefy.modules.cms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.SnowflakeIdWorker;
import com.github.niefy.modules.cms.dao.CmsContentExtMapper;
import com.github.niefy.modules.cms.dao.CmsContentMapper;
import com.github.niefy.modules.cms.dao.CmsContentTxtMapper;
import com.github.niefy.modules.cms.entity.CmsContentEntity;
import com.github.niefy.modules.cms.entity.CmsContentExtEntity;
import com.github.niefy.modules.cms.entity.CmsContentTxtEntity;
import com.github.niefy.modules.cms.service.CmsContentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Map;

@Service("cmsContentService")
public class CmsContentServiceImpl extends ServiceImpl<CmsContentMapper, CmsContentEntity> implements CmsContentService {

    @Resource
    CmsContentMapper cmsContentMapper;
    @Resource
    CmsContentExtMapper cmsContentExtMapper;
    @Resource
    CmsContentTxtMapper cmsContentTxtMapper;

    @Override
    public PageUtils queryPage(Map<String, Object> params, Integer current, Integer pageSize) {
        // 新建分页
        Page<Map<String,Object>> page =new Page<Map<String,Object>>(current, pageSize);
        // 返回结果
        return  new PageUtils(page.setRecords(cmsContentMapper.queryPage(page,  params)));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int addContent(CmsContentEntity cmsContentEntity) {
        int addResult = 0;
        Long contentId = SnowflakeIdWorker.getSnowflakeId();
        // 内容基本信息
        cmsContentEntity.setContentId(contentId);
        cmsContentEntity.setStatus(2);
        cmsContentEntity.setViewsDay(0);
        cmsContentEntity.setCommentsDay(0);
        cmsContentEntity.setDownloadsDay(0);
        cmsContentEntity.setUpsDay(0);
        cmsContentMapper.insert(cmsContentEntity);

        // 内容扩展信息
        CmsContentExtEntity contentExt = cmsContentEntity.getExt();
        contentExt.setContentId(contentId);
        cmsContentExtMapper.insert(contentExt);

        // 内容文本信息
        CmsContentTxtEntity contentTxt = cmsContentEntity.getTxt();
        contentTxt.setContentId(contentId);
        cmsContentTxtMapper.insert(contentTxt);
        return addResult;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateContent(CmsContentEntity cmsContentEntity){

        return 0;
    }
}
