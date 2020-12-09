package com.tom.login_boot.controller;

import com.tom.login_boot.common.ResultEntity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.Data;
import lombok.ToString;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@RestController
@RequestMapping("/file")
@Api(tags = "FileController", description = "文件管理")
public class FileController {

    @PostMapping("/uploadFile")
    @ApiOperation("适用于base64位上传")
    public ResultEntity uploadFile(@RequestBody InnerFileParams fileParams) {
        System.out.println("fileParams--->" + fileParams);
        return null;
    }


    @Data
    @ToString
    private static class InnerFileParams {
        private List<MultipartFile> files;
    }

    @ApiOperation("上传单个文件")
    @PostMapping(value = "/uploading")
    public ResultEntity uploadFile(@RequestParam("filename") MultipartFile file) {
//        log.info("接收到的文件数据为：" + file);
        if (file.isEmpty()) {
            return ResultEntity.fail("上传文件为空", 500, null);
        }
        // 获取文件全名a.py
        String fileName = file.getOriginalFilename();
        // 文件上传路径<br>
        String templatePath = "E:/file/template/";
//        log.info("文件路径:" + templatePath);
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        //获取文件名
        String prefixName = fileName.substring(0, fileName.lastIndexOf("."));
        // 解决中文问题,liunx 下中文路径,图片显示问题
        //fileName = UUID.randomUUID() + suffixName;
        File dest0 = new File(templatePath);
        File dest = new File(dest0, prefixName + File.separator + fileName);
        //文件上传-覆盖
        try {
            // 检测是否存在目录
            if (!dest0.getParentFile().exists()) {
                dest0.getParentFile().mkdirs();
                //检测文件是否存在
            }
            if (!dest.exists()) {
                dest.mkdirs();
            }
            file.transferTo(dest);
            return ResultEntity.fail("上传成功", 200, null);
        } catch (Exception e) {
//            log.error("文件上传错误");
            return ResultEntity.fail("上传失败", 500, null);
        }

    }

    @PostMapping("/uploadMultiFiles")
    @ApiOperation("多文件上传")
    public ResultEntity uploadFile(HttpServletRequest request, @RequestParam("files") MultipartFile[] files) {
        try {
//            String uploadPath = request.getSession().getServletContext().getContextPath() + "/upload/";
//            System.out.println("filePath--->" + uploadPath);
//            File file = new File(uploadPath);
            //如果文件夹不存在，则创建文件夹
//            if (!file.exists()) {
//                file.mkdir();
//            }
            System.out.println("files---->" + files);
            String templatePath = "E:/file/template/";
            for (MultipartFile multipartFile : files) {
                System.out.println("multiFile---->" + multipartFile);
                String fileName = multipartFile.getOriginalFilename();

                File dest0 = new File(templatePath);
                String prefixName = fileName.substring(0, fileName.lastIndexOf("."));
                File dest = new File(dest0, prefixName + File.separator + fileName);
                System.out.println("child----" + prefixName + File.separator + fileName);
                //文件上传-覆盖
                try {
                    // 检测是否存在目录
                    if (!dest0.getParentFile().exists()) {
                        dest0.getParentFile().mkdirs();
                        //检测文件是否存在
                    }
                    if (!dest.exists()) {
                        dest.mkdirs();
                    }
                    multipartFile.transferTo(dest);
                } catch (Exception e) {
                    return ResultEntity.fail("上传失败", 500, null);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return ResultEntity.fail("上传失败", 500, null);
        }
        return ResultEntity.success("上传成功", 200, null);
    }


    @PostMapping("/uploadMultiFilesNew")
    @ApiOperation("多文件上传")
    public ResultEntity uploadMultiFilesNew(HttpServletRequest request, @RequestParam("files") MultipartFile[] files) {
        try {
            String templatePath = "E:/file/template/";
//            String templatePath = "temp/file/";
            String temp = "temp/file/";
            for (MultipartFile multipartFile : files) {
                System.out.println("multiFile---->" + multipartFile);
                String fileName = multipartFile.getOriginalFilename();
                File dest0 = new File(templatePath);
                String prefixName = fileName.substring(0, fileName.lastIndexOf("."));
                File dest = new File(dest0, prefixName + File.separator + fileName);
                System.out.println("child----" + prefixName + File.separator + fileName);
                //文件上传-覆盖

                // 检测是否存在目录
                if (!dest0.getParentFile().exists()) {
                    dest0.getParentFile().mkdirs();
                    //检测文件是否存在
                }
                if (!dest.exists()) {
                    dest.mkdirs();
                }
                multipartFile.transferTo(dest);
                File file = new File(temp + fileName);
                if (!file.exists()) {
                    file.mkdir();
                }
                multipartFile.transferTo(file);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return ResultEntity.fail("上传失败", 500, null);
        }
        return ResultEntity.success("上传成功", 200, null);
    }

}
