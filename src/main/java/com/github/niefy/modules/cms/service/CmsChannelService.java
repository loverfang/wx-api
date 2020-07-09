package com.github.niefy.modules.cms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.niefy.modules.cms.entity.CmsChannelEntity;

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


}
