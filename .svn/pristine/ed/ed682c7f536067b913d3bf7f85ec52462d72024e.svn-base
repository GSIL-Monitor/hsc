package com.wgb.service;

import com.aliyun.oss.ClientConfiguration;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.PutObjectResult;
import com.wgb.util.CommonConfig;

import java.io.InputStream;

/**
 * Created by wgb on 2016/8/28.
 */
public class OssUtil {

    private static OSSClient ossClient;

    private static OSSClient getOssClient() {

        if (ossClient == null) {

            // 创建ClientConfiguration实例
            ClientConfiguration conf = new ClientConfiguration();

            // 设置OSSClient使用的最大连接数，默认1024
            conf.setMaxConnections(200);
            // 设置请求超时时间，默认50秒
            conf.setSocketTimeout(10000);
            // 设置失败请求重试次数，默认3次
            conf.setMaxErrorRetry(5);

            ossClient = new OSSClient(CommonConfig.OSS_ENDPOINT, CommonConfig.OSS_ACCESS_KEY_ID, CommonConfig.OSS_ACCESS_KEY_SECRET, conf);
        }

        return ossClient;
    }

    /**
     * 向阿里云的OSS存储中存储文件
     *
     * @param key 上传文件的文件路径+文件名
     * @return String 唯一MD5数字签名
     */
    public static final String uploadFile2OSS(InputStream inputStream, String key) {
        String resultStr = null;
        try {
            //上传文件
            PutObjectResult putResult = getOssClient().putObject(CommonConfig.OSS_BUCKET, key, inputStream);
            //解析结果
            resultStr = putResult.getETag();
        } catch (Exception e) {
        }
        return resultStr;
    }

    /**
     * 根据key删除OSS服务器上的文件
     *
     * @param client     OSS客户端
     * @param bucketName bucket名称
     * @param diskName   文件路径
     * @param key        Bucket下的文件的路径名+文件名
     */
    public static void deleteFile(OSSClient client, String bucketName, String diskName, String key) {
        client.deleteObject(bucketName, diskName + key);
    }

    /**
     * 通过文件名判断并获取OSS服务文件上传时文件的contentType
     *
     * @param fileName 文件名
     * @return 文件的contentType
     */
    public static final String getContentType(String fileName) {
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        if ("bmp".equalsIgnoreCase(fileExtension)) return "image/bmp";
        if ("gif".equalsIgnoreCase(fileExtension)) return "image/gif";
        if ("jpeg".equalsIgnoreCase(fileExtension) || "jpg".equalsIgnoreCase(fileExtension) || "png".equalsIgnoreCase(fileExtension))
            return "image/jpeg";
        if ("html".equalsIgnoreCase(fileExtension)) return "text/html";
        if ("txt".equalsIgnoreCase(fileExtension)) return "text/plain";
        if ("vsd".equalsIgnoreCase(fileExtension)) return "application/vnd.visio";
        if ("ppt".equalsIgnoreCase(fileExtension) || "pptx".equalsIgnoreCase(fileExtension))
            return "application/vnd.ms-powerpoint";
        if ("doc".equalsIgnoreCase(fileExtension) || "docx".equalsIgnoreCase(fileExtension))
            return "application/msword";
        if ("xml".equalsIgnoreCase(fileExtension)) return "text/xml";
        return "text/html";
    }
}
