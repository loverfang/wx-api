package com.github.niefy.modules.cms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.niefy.modules.cms.entity.CmsChannelEntity;
import com.github.niefy.modules.cms.entity.CmsChannelExtEntity;

import java.util.List;

/**
 * @ClassName CmsChannelService
 * @Description TODO
 * @Author Luo.z.x
 * @Date 2020/7/50:06
 * @Version 1.0
 */
public interface CmsChannelService extends IService<CmsChannelEntity> {
    /**
     * 加载栏目树
     * @return
     */
    List<CmsChannelEntity> loadChannelTree();

    /**
     * 加载栏目详情
     * @param channelId
     * @return
     */
    CmsChannelEntity loadChannelDetail(Long channelId);

    /**
     * 添加栏目
     * @param cmsChannelEntity
     * @return
     */
    int addChannel(CmsChannelEntity cmsChannelEntity);

    /**
     * 更新栏目
     * @param cmsChannelEntity
     * @return
     */
    void updateChannel(CmsChannelEntity cmsChannelEntity);

    /**
     * 修改栏目属性
     * @param cmsChannelEntity
     * @return
     */
    int updateChannelStatus(CmsChannelEntity cmsChannelEntity);

    /**
     * 获得指定栏目下的所有子孙节点
     * @param channelId
     * @return
     */
    List<Long> loadAllChildAndgrandchilds(Long channelId);
}
