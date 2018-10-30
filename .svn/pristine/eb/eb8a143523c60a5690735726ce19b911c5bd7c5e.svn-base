package com.wgb.controller.helpcenter;

import com.wgb.controller.BaseController;
import com.wgb.dao.Page;
import com.wgb.service.helpcenter.HelpCenterService;
import com.wgb.service.module.ModuleService;
import com.wgb.util.CommonUtil;
import com.wgb.util.Contants;

import net.sf.json.JSONArray;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import org.apache.commons.collections.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/help")
public class HelpCenterController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(HelpCenterController.class);

    @Autowired
    private HelpCenterService helpCenterService;

    @Autowired
    private ModuleService moduleService;

    /**
     * 帮助中心列表
     *
     * @param request
     * @return
     */
    @RequestMapping("/helpcentermanage.action")
    public String getHelpCenterList(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        // 查所有信息列表
        Page pageInfo = helpCenterService.queryHelpCenterList(params);
        // 查一级模块
        List<Map<String, Object>> listformodule1 = helpCenterService.queryLevelModule(params);
        // 查二级模块
        List<Map<String, Object>> listformodule2 = helpCenterService.queryLevel2Module(params);
        request.setAttribute("list", listformodule1);
        request.setAttribute("listformodule2", listformodule2);
        request.setAttribute("pageInfo", pageInfo);
        return "help/helpcenter";
    }

    /**
     * 二级模块列表
     *
     * @param request
     * @return
     */
    @RequestMapping("/module2list.action")
    @ResponseBody
    public List<Map<String, Object>> module2list(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        // 查二级模块
        List<Map<String, Object>> listformodule2 = helpCenterService.queryLevel2Module(params);
        Map<String, Object> map = new HashMap<>();
        map.put("levelmodulename", "");
        if (listformodule2.size() == 0) {
            listformodule2.add(map);
            return listformodule2;
        }
        return listformodule2;
    }

    /**
     * 根据帮助类型查1级模块
     *
     * @param request
     * @return
     */
    @RequestMapping("/modulelistbyhelptype.action")
    @ResponseBody
    public List<Map<String, Object>> moduleListByHelpType(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        // 查二级模块
        List<Map<String, Object>> listformodule2 = moduleService.getLevel1ModelList(params);
        Map<String, Object> map = new HashMap<>();
        map.put("levelmodulename", "");
        if (listformodule2.size() == 0) {
            listformodule2.add(map);
            return listformodule2;
        }
        return listformodule2;
    }

    /**
     * 跳转新增帮助中心页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/addnewhelp.action")
    public String addNewHelp(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        //查一级模块
        List<Map<String, Object>> listformodule1 = helpCenterService.queryLevelModule(params);
        //查二级模块
        List<Map<String, Object>> listformodule2 = helpCenterService.queryLevelOnly2Module(params);
        request.setAttribute("list", listformodule1);
        request.setAttribute("listformodule2", listformodule2);
        return "help/act_add";
    }

    /**
     * 新增帮助中心
     *
     * @param request
     * @return
     */
    @RequestMapping("/addnewhelpcenter.action")
    @ResponseBody
    public String addnewhelpcenter(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        //新增新的帮助
        helpCenterService.saveNewHelp(params);
        return "";
    }

    /**
     * 跳转更新帮助页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/moveupdatenewhelp.action")
    public String moveupdatenewhelp(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        Map<String, Object> helpInfo = helpCenterService.queryHelpInfo(params);
        //查一级模块
        List<Map<String, Object>> listformodule1 = helpCenterService.queryLevelModule(params);
        //查二级模块
        List<Map<String, Object>> listformodule2 = helpCenterService.queryLevelOnly2Module(params);
        request.setAttribute("level1modulename", MapUtils.getString(params, "level1modulename"));
        request.setAttribute("list", listformodule1);
        request.setAttribute("helpInfo", helpInfo);
        request.setAttribute("url", MapUtils.getString(params, "videourl"));
        request.setAttribute("listformodule2", listformodule2);
        return "help/help_update";
    }

    /**
     * 更新帮助
     *
     * @param request
     * @return
     */
    @RequestMapping("/updatenewhelp.action")
    @ResponseBody
    public String updatenewhelp(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        helpCenterService.updateHelp(params);
        return "";
    }

    /**
     * 删除帮助
     *
     * @param request
     * @return
     */
    @RequestMapping("/delethelp.action")
    @ResponseBody
    public String delethelp(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        //查所有信息列表
        Page pageInfo = helpCenterService.queryHelpCenterList(params);
        //查一级模块
        List<Map<String, Object>> listformodule1 = helpCenterService.queryLevelModule(params);
        //查二级模块
        List<Map<String, Object>> listformodule2 = helpCenterService.queryLevel2Module(params);
        request.setAttribute("list", listformodule1);
        request.setAttribute("listformodule2", listformodule2);
        request.setAttribute("pageInfo", pageInfo);
        helpCenterService.deleteHelp(params);
        return "";
    }

    @ResponseBody
    @RequestMapping("/createHtml.action")
    public String createHtml(HttpServletRequest request) throws IOException, TemplateException {
        Map<String, Object> params = new HashMap<>();
        //新手指导模块
        params.put("helptype", Contants.PROBLEM_SUMMARY_MODEL);
        List<Map<String, Object>> newGuidanceLevel1ModelList = moduleService.getLevel1ModelListForSlave(params);
        for (Map<String, Object> level1Model : newGuidanceLevel1ModelList) {
            List<Map<String, Object>> level2ModelList = moduleService.getLevel2ModelList(level1Model);
            level1Model.put("level2ModelList", level2ModelList);
        }

        //问题汇总模块
        params.put("helptype", Contants.NEW_GUIDANCE_MODEL);
        List<Map<String, Object>> problemSummaryLevel1ModelList = moduleService.getLevel1ModelListForSlave(params);
        for (Map<String, Object> level1Model : problemSummaryLevel1ModelList) {
            List<Map<String, Object>> level2ModelList = moduleService.getLevel2ModelList(level1Model);
            level1Model.put("level2ModelList", level2ModelList);
        }

        //设置新手指导初始一级模块id
        Map<String, Object> nglevelModel = newGuidanceLevel1ModelList.get(0);
        String nglevel1moduleid = MapUtils.getString(nglevelModel, "level1moduleid");
        //设置问题汇总初始一级模块id
        Map<String, Object> pslevelModel = problemSummaryLevel1ModelList.get(0);
        String pslevel1moduleid = MapUtils.getString(pslevelModel, "level1moduleid");

        //生成datalist 页面js 数据
        List<Map<String, Object>> dataList = helpCenterService.getModProblemelListForSlave(params);
        for (Map<String, Object> data : dataList) {
            data.put("videourl", CommonUtil.getFileUrl(MapUtils.getString(data, "videourl", "")));
        }

        params.put("newGuidanceLevel1ModelList", newGuidanceLevel1ModelList);
        params.put("problemSummaryLevel1ModelList", problemSummaryLevel1ModelList);
        params.put("nglevel1moduleid", nglevel1moduleid);
        params.put("pslevel1moduleid", pslevel1moduleid);
        params.put("dataList", JSONArray.fromObject(dataList).toString());
        createHelpCenterHtml(params, request);
        return "页面生成成功  路径/data/nginx/html/helpcrenter.html";
    }

    private void createHelpCenterHtml(Map<String, Object> params, HttpServletRequest request) {
        //创建fm的配置
        Configuration config = new Configuration();
        //指定默认编码格式
        config.setDefaultEncoding("UTF-8");
        //设置模版文件的路径
        config.setServletContextForTemplateLoading(request.getSession().getServletContext(), "/WEB-INF/ftl/helpcentre");
        //获得模版包
        Template template = null;
        try {
            template = config.getTemplate("problem_list_manage.ftl");
        } catch (IOException e) {
            e.printStackTrace();
        }
        //定义输出流，注意必须指定编码
        Writer writer = null;
        try {
            writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("/data/nginx/html/helpcrenter.html")), "UTF-8"));
            // writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("E:/html/result.html")), "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        //生成模版
        try {
            template.process(params, writer);
        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
