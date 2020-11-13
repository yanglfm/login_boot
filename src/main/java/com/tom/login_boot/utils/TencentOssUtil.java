package com.tom.login_boot.utils;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.exception.CosClientException;
import com.qcloud.cos.http.HttpMethodName;
import com.qcloud.cos.model.*;
import com.qcloud.cos.region.Region;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
@Slf4j
@Data
public class TencentOssUtil {
    //腾讯云的SecretId
    @Value("${oss.secretId}")
    private String secretId;
    //腾讯云的SecretKey
    @Value("${oss.secretKey}")
    private String secretKey;
    //腾讯云的bucket (存储桶)
    @Value("${oss.bucketName}")
    private String bucket;
    //腾讯云的region(bucket所在地区)
    @Value("${oss.region}")
    private String region;
    //腾讯云的访问基础链接:
    @Value("${oss.baseUrl}")
    private String baseUrl;


    private COSClient openClient() {
        COSCredentials cred = new BasicCOSCredentials(secretId, secretKey);
        ClientConfig clientConfig = new ClientConfig(new Region(region));
        COSClient cosClient = new COSClient(cred, clientConfig);
        return cosClient;
    }

    /**
     * 文件路径上传
     *
     * @param input   文件输入流
     * @param extname 文件的后缀名
     * @return
     */
    public String fileUpload(InputStream input, String extname) {

        // 指定要上传到 COS 上对象键
        UUID uuid = UUID.randomUUID();
        String key = uuid.toString().replace("-", "") + extname;
        return getStringUrl(input, key);
    }

    /**
     * @param input 文件输入流
     * @param key   文件名（上传到 COS 上对象键）
     * @return
     */
    public String fileUploadKeyName(InputStream input, String key) {
        return getStringUrl(input, key);
    }

    private String getStringUrl(InputStream input, String key) {
        COSClient cosClient = openClient();
        // 指定要上传到 COS 上对象键
        ObjectMetadata objectMetadata = new ObjectMetadata();
        // 设置 Content type, 默认是 application/octet-stream
        objectMetadata.setContentType("image/jpeg");
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucket, key, input, objectMetadata);
        PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);
        String eTag = putObjectResult.getETag();
        cosClient.shutdown();
        return baseUrl + "/" + key;
    }

    /**
     * 文件流上传
     *
     * @param file        文件
     * @param inputStream 输入流
     * @param key         文件名
     * @return
     */
    public String inputStreamUpload(MultipartFile file, InputStream inputStream, String key) {
        COSClient cosClient = openClient();
        ObjectMetadata objectMetadata = new ObjectMetadata();
        objectMetadata.setContentLength(file.getSize());
        objectMetadata.setContentType(file.getContentType());
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucket, key, inputStream, objectMetadata);
        PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);
        cosClient.shutdown();
        return baseUrl + "/" + key;
    }

    /**
     * 下载文件
     *
     * @param key
     * @return
     */
    public String downLoadFile(String key) {
        File downFile = new File("E:\\software\\1.jpg");
        COSClient cosClient = openClient();
        GetObjectRequest getObjectRequest = new GetObjectRequest(bucket, key);
        ObjectMetadata downObjectMeta = cosClient.getObject(getObjectRequest, downFile);
        cosClient.shutdown();
        String etag = downObjectMeta.getETag();
        return etag;
    }

    /**
     * 删除文件
     *
     * @param key 原名
     */
    public void deleteFile(String key) {
        COSClient cosClient = openClient();
        cosClient.deleteObject(bucket, key);
        cosClient.shutdown();
    }

    /**
     * 删除多个文件
     *
     * @param keyList
     */
    public void deleteFile(List<String> keyList) {
        COSClient cosClient = openClient();
        for (String key : keyList) {
            cosClient.deleteObject(bucket, key);
        }
        cosClient.shutdown();
    }


    public String getUrl(String key) {
        // 初始化永久密钥信息
        // 生成 cos 客户端。
        COSClient cosClient = openClient();
// 存储桶的命名格式为 BucketName-APPID，此处填写的存储桶名称必须为此格式
        GeneratePresignedUrlRequest req =
                new GeneratePresignedUrlRequest(bucket, key, HttpMethodName.GET);
// 设置签名过期时间(可选), 若未进行设置, 则默认使用 ClientConfig 中的签名过期时间(1小时)
// 这里设置签名在半个小时后过期
        Date expirationDate = new Date(System.currentTimeMillis() + 30L * 60L * 1000L);
        req.setExpiration(expirationDate);
        URL url = cosClient.generatePresignedUrl(req);
        System.out.println(url.toString());
        cosClient.shutdown();
        return url.toString();
    }

    /**
     * 查询存储桶中对象列表
     *
     * @return
     */

    public List<String> bucketList() {
        // Bucket的命名格式为 BucketName-APPID ，此处填写的存储桶名称必须为此格式
//        String bucketName = "examplebucket-1250000000";
        ListObjectsRequest listObjectsRequest = new ListObjectsRequest();
// 设置bucket名称
        listObjectsRequest.setBucketName(bucket);
// prefix表示列出的object的key以prefix开始
//        listObjectsRequest.setPrefix("images/");
//        listObjectsRequest.setPrefix("");
// deliter表示分隔符, 设置为/表示列出当前目录下的object, 设置为空表示列出所有的object
        listObjectsRequest.setDelimiter("/");
// 设置最大遍历出多少个对象, 一次listobject最大支持1000
        listObjectsRequest.setMaxKeys(1000);
        ObjectListing objectListing = null;
        COSClient cosClient = openClient();
        List<String> keyList = new ArrayList<>();
        do {
            try {
                objectListing = cosClient.listObjects(listObjectsRequest);
            } catch (CosClientException e) {
                e.printStackTrace();
                return null;
            }
            // common prefix表示表示被delimiter截断的路径, 如delimter设置为/, common prefix则表示所有子目录的路径
            List<String> commonPrefixs = objectListing.getCommonPrefixes();

            // object summary表示所有列出的object列表
            List<COSObjectSummary> cosObjectSummaries = objectListing.getObjectSummaries();
            for (COSObjectSummary cosObjectSummary : cosObjectSummaries) {
                // 文件的路径key
                String key = cosObjectSummary.getKey();
                // 文件的etag
                String etag = cosObjectSummary.getETag();
                // 文件的长度
                long fileSize = cosObjectSummary.getSize();
                // 文件的存储类型
                String storageClasses = cosObjectSummary.getStorageClass();

                keyList.add(key);
            }

            String nextMarker = objectListing.getNextMarker();
            listObjectsRequest.setMarker(nextMarker);
        } while (objectListing.isTruncated());
        cosClient.shutdown();
        return keyList;
    }


    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    /**
     * 下载文件
     *
     * @param key
     */
    public void downFile(String key) {
        COSClient cosClient = openClient();
        // 指定要下载到的本地路径
        String f = "D:\\nine\\idea\\projects\\yanhuo\\yanhuo_api\\src\\main\\resources\\downloadFile";
        File file = new File(f);
        String filePath = f + "\\" + key;
        // 指定要下载的文件所在的 bucket 和对象键
        GetObjectRequest getObjectRequest = new GetObjectRequest(bucket, key);
//        delete(file, key);
        cosClient.getObject(getObjectRequest, new File(filePath));
        log.info("{} 腾讯云下载文件完成", key);
        cosClient.shutdown();
    }

    public static void delete(File f, String key) {
        //数组指向文件夹中的文件和文件夹
        File[] fi = f.listFiles();
        //遍历文件和文件夹
        for (File file : fi) {
            //如果是文件夹，递归查找
            if (file.isDirectory())
                delete(file, key);
            else if (file.isFile()) {
                //是文件的话，把文件名放到一个字符串中
                String filename = file.getName();
                //如果是“class”后缀文件，返回一个boolean型的值
                if (filename.equals(key)) {
                    System.out.println("成功删除：：" + file.getName());
                    file.delete();
                }
            }
        }
    }


    public static String replaceBlank(String str) {
        String dest = "";

        if (str != null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");


        }
        return dest;


    }


}
