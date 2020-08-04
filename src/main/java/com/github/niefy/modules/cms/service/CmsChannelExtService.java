package com.github.niefy.modules.cms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.niefy.modules.cms.entity.CmsChannelExtEntity;

public interface CmsChannelExtService extends IService<CmsChannelExtEntity> {
    /**
     * 加载栏目扩展属性信息
     * @param channelId
     * @return
     */
    CmsChannelExtEntity loadChannelExt(Long channelId);

    /**
     * 更新栏目扩展属性信息
     * @param channelExt
     */
    void updateChannelExt(CmsChannelExtEntity channelExt);
}
