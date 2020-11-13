package com.tom.login_boot.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.Base64Utils;
import org.springframework.util.StringUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/**
 * 图片 与 Base64 互相转换
 */
@Slf4j
public class Base64Util {

    /**
     * base64字符串转换成图片 (对字节数组字符串进行Base64解码并生成图片)
     *
     * @param imgStr      base64字符串
     * @param imgFilePath 指定图片存放路径  （注意：带文件名）
     * @return 是否成功
     */
    public static boolean Base64ToImage(String imgStr, String imgFilePath, String fileName) {
        if (StringUtils.isEmpty(imgStr)) {
            // 图像数据为空
            log.info("图像数据为空");
            return false;
        }
        try {
            // Base64解码
            byte[] b = Base64Utils.decodeFromString(imgStr);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {// 调整异常数据
                    b[i] += 256;
                }
            }
            File file = new File(imgFilePath);
            if (!file.isDirectory()) {
                if (!file.mkdirs()) {
                    log.info("创建文件夹失败！");
                    return false;
                }
            }
            OutputStream out = new FileOutputStream(imgFilePath + fileName);
            out.write(b);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            log.info("异常：---------------->", e);
            return false;
        }
    }

    /**
     * 创建临时文件
     *
     * @param prefix    is 临时文件的前缀
     * @param suffix    is 临时文件的后缀
     * @param directory is 临时文件的目录
     */
    public static void createTempFile(String prefix, String suffix, String directory) {

        File file = new File(directory);//根据指定的文件名创建File对象

        if (!file.exists()) {  //要创建的文件目录不存在，则创建目录
            System.out.println("目录" + directory + "的不存在，正在创建");
            if (file.mkdirs())
                System.out.println("目录" + directory + "创建成功！");
            else
                System.out.println("目录" + directory + "创建失败！");
        }


        File tempfile = null;

        try {
            tempfile = File.createTempFile(prefix, suffix, file);//用指定目录的方法创建临时文件
            System.out.println("成功创建了临时文件" + tempfile);

        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("创建临时文件" + tempfile + "失败:" + e.getMessage());
        }

    }


}