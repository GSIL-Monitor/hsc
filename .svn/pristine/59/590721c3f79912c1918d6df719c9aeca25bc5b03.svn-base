package com.wgb.controller.helpcenter;

import com.wgb.controller.BaseController;
import com.wgb.dao.Page;
import com.wgb.dubbo.ZLRpcResult;
import com.wgb.exception.ServiceException;
import com.wgb.service.dubbo.fms.admin.ApiFileService;
import com.wgb.service.helpcenter.FileService;
import com.wgb.util.Contants;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by wgb on 2017/2/6.
 */
@Controller
@RequestMapping("/file")
public class FileController extends BaseController {

    @Autowired
    private FileService fileService;

    @Autowired
    private ApiFileService apiFileService;

    @RequestMapping("/manage")
    public String manage(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        Page<?> pageInfo = fileService.queryPageList(params);
        request.setAttribute("pageInfo", pageInfo);
        return "system/file_manage";
    }

    @RequestMapping("/toFileUpload")
    public String toFileUpload(HttpServletRequest request) {
        return "fileupload";
    }

    @RequestMapping("/toPlUpload")
    public String toPlFileUpload(HttpServletRequest request) {
        return "plupload";
    }

    @RequestMapping("/list")
    public String list(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        Page<?> pageInfo = fileService.queryFilePage(params);
        request.setAttribute("pageInfo", pageInfo);
        return "system/file_list";
    }

    @RequestMapping("/upload")
    public void upload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) {

       /* Map<String, Object> params = getParams();
        Map<String, Object> fileInfo = fileService.saveFile(file, params, request);
        JSONObject jsonObject = JSONObject.fromObject(fileInfo);
        try {
            response.getWriter().write(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }*/
    }

    @RequestMapping("/delFile")
    @ResponseBody
    public String delFile(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        String id = MapUtils.getString(params, "id", "");
        if (StringUtils.isNotEmpty(id)) {
            fileService.deleteFile(id);
        } else {
            throw new ServiceException("操作异常！");
        }
        return "";
    }

    @RequestMapping("/checkFileSize")
    @ResponseBody
    public Map<String, Object> checkFileSize(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        params.put("success", "1");
        return params;
    }

    @RequestMapping("/postObjectPolicy")
    @ResponseBody
    public Map<String, Object> postObjectPolicy(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        return fileService.postObjectPolicy(params);
    }
}
