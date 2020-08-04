/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 * 版权所有，侵权必究！
 */

package com.github.niefy.modules.oss.controller;

import com.alibaba.fastjson.JSON;
import com.github.niefy.common.exception.RRException;
import com.github.niefy.common.utils.ConfigConstant;
import com.github.niefy.common.utils.Constant;
import com.github.niefy.common.utils.PageUtils;
import com.github.niefy.common.utils.R;
import com.github.niefy.common.validator.ValidatorUtils;
import com.github.niefy.common.validator.group.AliyunGroup;
import com.github.niefy.common.validator.group.QcloudGroup;
import com.github.niefy.common.validator.group.QiniuGroup;
import com.github.niefy.modules.oss.cloud.CloudStorageConfig;
import com.github.niefy.modules.oss.cloud.OSSFactory;
import com.github.niefy.modules.oss.entity.SysOssEntity;
import com.github.niefy.modules.oss.service.SysOssService;
import com.github.niefy.modules.sys.service.SysConfigService;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.*;

/**
 * 文件上传
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("sys/oss")
public class SysOssController {
    @Autowired
    private SysOssService sysOssService;
    @Autowired
    private SysConfigService sysConfigService;

    private final static String KEY = ConfigConstant.CLOUD_STORAGE_CONFIG_KEY;

    /**
     * 列表
     */
    @GetMapping("/list")
    @RequiresPermissions("sys:oss:all")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = sysOssService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 云存储配置信息
     */
    @GetMapping("/config")
    @RequiresPermissions("sys:oss:all")
    public R config() {
        CloudStorageConfig config = sysConfigService.getConfigObject(KEY, CloudStorageConfig.class);

        return R.ok().put("config", config);
    }


    /**
     * 保存云存储配置信息
     */
    @PostMapping("/saveConfig")
    @RequiresPermissions("sys:oss:all")
    public R saveConfig(@RequestBody CloudStorageConfig config) {
        //校验类型
        ValidatorUtils.validateEntity(config);

        if (config.getType() == Constant.CloudService.QINIU.getValue()) {
            //校验七牛数据
            ValidatorUtils.validateEntity(config, QiniuGroup.class);
        } else if (config.getType() == Constant.CloudService.ALIYUN.getValue()) {
            //校验阿里云数据
            ValidatorUtils.validateEntity(config, AliyunGroup.class);
        } else if (config.getType() == Constant.CloudService.QCLOUD.getValue()) {
            //校验腾讯云数据
            ValidatorUtils.validateEntity(config, QcloudGroup.class);
        }

        sysConfigService.updateValueByKey(KEY, JSON.toJSONString(config));

        return R.ok();
    }


    /**
     * 上传文件
     */
    @PostMapping("/upload")
    @RequiresPermissions("sys:oss:all")
    public R upload(@RequestParam("file") MultipartFile file) throws Exception {
        if (file.isEmpty()) {
            throw new RRException("上传文件不能为空");
        }

        // 文件名称
        String fileName = file.getOriginalFilename();

        // 文件后缀
        String suffix = fileName.substring( fileName.lastIndexOf(".") );
        String url = OSSFactory.build().uploadSuffix(file.getBytes(), suffix);

        //保存文件信息
        SysOssEntity ossEntity = new SysOssEntity();
        ossEntity.setFileName(fileName);
        ossEntity.setFileSize(file.getSize() / 1024f);
        ossEntity.setFilePath(url);
        ossEntity.setCreateDate(new Date());

        return R.ok().put("file", ossEntity);
    }

    /**
     * 上传图片文件七牛云
     * @param files
     * @return
     */
    @RequestMapping(value="/files", method = RequestMethod.POST)
    @RequiresPermissions("sys:oss:all")
    public R upload(@RequestParam("file") MultipartFile[] files) throws Exception {

        if(ArrayUtils.isEmpty(files)){
            throw new RRException("上传文件不能为空");
        }

        List<SysOssEntity> list = new LinkedList<>();

        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            // 文件名称
            String fileName = file.getOriginalFilename();
            // 文件后缀
            String suffix = fileName.substring( fileName.lastIndexOf(".") );
            String url = OSSFactory.build().uploadSuffix(file.getBytes(), suffix);

            //保存文件信息
            SysOssEntity ossEntity = new SysOssEntity();
            ossEntity.setFileName(fileName);
            ossEntity.setFileSize(file.getSize() / 1024f);
            ossEntity.setFilePath(url);
            ossEntity.setCreateDate(new Date());
            list.add(ossEntity);
        }

        return R.ok().put("files", list);
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    @RequiresPermissions("sys:oss:all")
    public R delete(@RequestBody Long[] ids) {
        sysOssService.removeByIds(Arrays.asList(ids));
        return R.ok();
    }

}
