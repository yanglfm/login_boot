package com.tom.login_boot.controller;

import com.tom.login_boot.common.ResultEntity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.Data;
import lombok.ToString;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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

    @PostMapping("/upload")
    @ApiOperation("单个文件上传")
    public ResultEntity uploadFile(HttpServletRequest request, @RequestBody MultipartFile multipartFile) {
        try {
            String uploadPath = request.getSession().getServletContext().getRealPath("/") + "upload/";
            System.out.println("filePath--->" + request.getSession().getServletContext().getRealPath("/") + "upload/");
            File file = new File(uploadPath);
            //如果文件夹不存在，则创建文件夹
            if (!file.exists()) {
                file.mkdir();
            }
            System.out.println("-----MultipartFile---->"+multipartFile);
//            上传文件名
            String fileName = multipartFile.getOriginalFilename();

//            服务器端保存的文件对象
            File severFile = new File(uploadPath + fileName);
//            将上传的文件写入到服务器端文件对象中
            multipartFile.transferTo(severFile);
            System.out.println("fileParams--->" + file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Data
    @ToString
    private static class InnerFileParams {
        private List<MultipartFile> files;
    }

}
