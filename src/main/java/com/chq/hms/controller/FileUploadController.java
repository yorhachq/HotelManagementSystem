package com.chq.hms.controller;

import com.chq.hms.anno.OperationLog;
import com.chq.hms.domain.Result;
import com.chq.hms.util.AliOssUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

@RestController
public class FileUploadController {
    @Autowired
    private AliOssUtil aliOssUtil;

    @OperationLog("系统功能：上传文件")
    @PostMapping("/upload")
    public Result<String> upload(MultipartFile file) throws Exception {
        String originalFilename = file.getOriginalFilename();
        ///保证文件的名字是唯一的,防止文件覆盖
        String filename = null;
        if (originalFilename != null) {
            filename = UUID.randomUUID() + originalFilename.substring(originalFilename.indexOf("."));
        }
        String url= aliOssUtil.uploadFile(filename,file.getInputStream());
        return Result.success(url);
    }
}
