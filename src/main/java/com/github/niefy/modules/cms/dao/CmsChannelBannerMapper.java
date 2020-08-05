package com.github.niefy.modules.cms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.niefy.modules.cms.entity.CmsChannelBannerEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CmsChannelBannerMapper extends BaseMapper<CmsChannelBannerEntity>{
    int batchInsertBanner(@Param("bannerList") List<CmsChannelBannerEntity> bannerList);
}
