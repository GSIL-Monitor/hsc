package com.wgb.controller;

import com.wgb.dao.Page;
import com.wgb.service.helpcentre.HelpCentreService;
import com.wgb.service.helpcentre.HelpLevelModuleService;
import com.wgb.util.CommonUtil;
import com.wgb.util.Contants;
import com.wgb.util.JsonUtil;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import net.sf.json.JSONArray;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yiw on 2018/9/21.
 */
@Controller
@RequestMapping("/help")
public class HelpCentreController extends BaseController {

    @Autowired
    private HelpCentreService helpCentreService;

    @Autowired
    private HelpLevelModuleService helpLevelModuleService;

    @RequestMapping("/getproblemList.action")
    public String getproblemList(HttpServletRequest request) {
        Map<String, Object> params = getParams();

        String level1moduleid = MapUtils.getString(params, "level1moduleid");
        String titleid = MapUtils.getString(params, "titleid");
        List<Map<String, Object>> level1ModelList = helpLevelModuleService.getLevel1ModelList(params);
        if (StringUtils.isEmpty(level1moduleid)) {
            Map<String, Object> levelModel = level1ModelList.get(0);
            params.put("level1moduleid", MapUtils.getString(levelModel, "level1moduleid"));
        }

        for (Map<String, Object> level1Model : level1ModelList) {
            List<Map<String, Object>> level2ModelList = helpLevelModuleService.getLevel2ModelList(level1Model);
            level1Model.put("level2ModelList", level2ModelList);
        }
        if (StringUtils.isEmpty(titleid)) {
            Page<?> pageInfo = helpCentreService.getModProblemelPageList(params);
            request.setAttribute("pageInfo", pageInfo);
        } else {
            Map<String, Object> titleDetail = helpCentreService.getModProblemelDetail(params);
            request.setAttribute("titleDetail", titleDetail);
        }

        request.setAttribute("level1ModelList", level1ModelList);

        return "helpcentre/problem_list_manage";
    }


}
