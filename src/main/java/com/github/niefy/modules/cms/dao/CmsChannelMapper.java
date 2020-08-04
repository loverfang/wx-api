package com.github.niefy.modules.cms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.niefy.modules.cms.entity.CmsChannelEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @ClassName CmsChannelMapper
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/7/50:29
 * @Version 1.0
 */
@Mapper
public interface CmsChannelMapper extends BaseMapper<CmsChannelEntity> {
    CmsChannelEntity loadChannelDetail(Long channelId);
}
