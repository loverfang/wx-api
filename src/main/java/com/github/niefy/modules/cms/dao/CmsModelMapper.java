package com.github.niefy.modules.cms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.niefy.modules.cms.entity.CmsModelEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * @ClassName CmsModelMapper
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/6/260:28
 * @Version 1.0
 */
@Mapper
public interface CmsModelMapper extends BaseMapper<CmsModelEntity> {
    int batchUpdateIsDisplay(@Param("paramMap") Map<String,Object> params);
}
