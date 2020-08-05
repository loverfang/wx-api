package com.github.niefy.modules.cms.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.niefy.modules.cms.entity.CmsChannelEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @ClassName CmsChannelMapper
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/7/50:29
 * @Version 1.0
 */
@Mapper
public interface CmsChannelMapper extends BaseMapper<CmsChannelEntity> {

    /**
     * 加载栏目基本信息,扩展信息,txt信息
     * @param channelId
     * @return
     */
    CmsChannelEntity loadChannelDetail(Long channelId);

    /**
     * 根据一个栏目ID查询出其子子孙孙节点Id
     * @param channelId
     * @return
     */
    List<Long> loadAllChildAndGrandchilds(Long channelId);

    /**
     * 批量修改栏目状态
     * @param statusParamMap
     * @return
     */
    int batchUpdateStatusByIdList(@Param("statusParamMap") Map<String, Object> statusParamMap);
}
