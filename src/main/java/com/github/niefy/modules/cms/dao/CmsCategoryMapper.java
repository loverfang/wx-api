package com.github.niefy.modules.cms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.niefy.modules.cms.entity.CmsCategoryEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface CmsCategoryMapper extends BaseMapper<CmsCategoryEntity> {

    //多表联合查询 按任意条件进行查询
    List<Map<String,Object>> queryPage(Page<Map<String,Object>> page, @Param("paramMap") Map<String,Object> paramMap);

    List<Map<String,Object>> childList(@Param("parentId") Long parentId);
}
