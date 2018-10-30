package com.wgb.controller.helpcenter;

import com.wgb.controller.BaseController;
import com.wgb.dao.Page;
import com.wgb.service.helpcenter.HelpCenterService;
import com.wgb.service.module.ModuleService;
import org.apache.commons.collections.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/module")
public class ModuleController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ModuleController.class);

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private HelpCenterService helpCenterService;

    /**
     * 一级模块列表列表
     *
     * @param request
     * @return
     */
    @RequestMapping("/modulelist.action")
    public String getModuleList(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        //查所有信息列表
        Page pageInfo = moduleService.queryModuleCenterList(params);
        request.setAttribute("pageInfo", pageInfo);
        return "module/modulelist";
    }

    /**
     * 跳转新增链接用
     *
     * @param request
     * @return
     */
    @RequestMapping("/move.action")
    public String moveUrl(HttpServletRequest request) {
        return "module/module_add";
    }

    /**
     * 跳修改转链接用
     *
     * @param request
     * @return
     */
    @RequestMapping("/updatemove.action")
    public String updatemove(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        Map<String, Object> moduleInfo = moduleService.queryModuleInfo(params);
        String id = MapUtils.getString(params, "id");
        request.setAttribute("moduleInfo", moduleInfo);
        request.setAttribute("mid", id);
        return "module/module_update";
    }

    /**
     * 修改一级模块
     *
     * @param request
     * @return
     */
    @RequestMapping("/updatemodule.action")
    @ResponseBody
    public String updateModule(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        moduleService.updateNewModule(params);
        return "";
    }

    /**
     * 新增一级模块
     *
     * @param request
     * @return
     */
    @RequestMapping("/addnewmodule.action")
    @ResponseBody
    public String addNewModule(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        //查所有信息列表
        moduleService.saveNewModule(params);
        return "";
    }
    /**
     * 查询序号是否存在
     *
     * @param request
     * @return
     */
    @RequestMapping("/checknum.action")
    @ResponseBody
    public Map<String, Object> checknum(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        //查所有信息列表
      Map<String,Object>  num= moduleService.checknum(params);
        return num;
    }
    /**
     * 查询2级模块序号是否存在序号是否存在
     *
     * @param request
     * @return
     */
    @RequestMapping("/checknum2.action")
    @ResponseBody
    public Map<String, Object> checknum2(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        //查所有信息列表
        Map<String,Object>  num= moduleService.checknum2(params);
        return num;
    }

    /**
     * 二级模块详情
     *
     * @param request
     * @return
     */
    @RequestMapping("/module2list.action")
    public String getModule2List(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        String id = MapUtils.getString(params, "id");
        //查所有信息列表
        Page pageInfo = moduleService.queryModule2CenterList(params);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("mid", id);
        return "module/module2list";
    }

    /**
     * 删除一级模块
     *
     * @param request
     * @return
     */
    @RequestMapping("/delete1module.action")
    @ResponseBody
    public String delete1Module(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        //删除
        moduleService.deletemodule(params);
        Page pageInfo = moduleService.queryModuleCenterList(params);
        request.setAttribute("pageInfo", pageInfo);
        return  "";
    }

    /**
     * 跳转二级模块新增链接用
     *
     * @param request
     * @return
     */
    @RequestMapping("/moudle2move.action")
    public String moudle2Move(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        String id = MapUtils.getString(params, "id");
        request.setAttribute("pid", id);
        return "module/module2_add";
    }

    /**
     * 新增二级模块
     *
     * @param request
     * @return
     */
    @RequestMapping("/addnewmodule2.action")
    @ResponseBody
    public String addNewModule2(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        //查所有信息列表
        moduleService.saveNew2Module(params);
        return "";
    }

    /**
     * 跳转二级模块编辑链接用
     *
     * @param request
     * @return
     */
    @RequestMapping("/updatemoudle2move.action")
    public String updateMoudle2Move(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        //查一级模块
        List<Map<String, Object>> listformodule1 = helpCenterService.queryLevelModule(params);
        Map<String, Object> moduleInfo = moduleService.queryModuleInfo(params);
        Map<String, Object> module2Info = moduleService.queryModule2Info(params);
        String id = MapUtils.getString(params, "id");
        String pid = MapUtils.getString(params, "pid");
        request.setAttribute("pid", pid);
        request.setAttribute("moduleInfo", moduleInfo);
        request.setAttribute("module2Info", module2Info);
        request.setAttribute("mid", id);
        request.setAttribute("list", listformodule1);
        return "module/module2_update";
    }

    /**
     * 修改二级模块
     *
     * @param request
     * @return
     */
    @RequestMapping("/updatemodule2.action")
    @ResponseBody
    public String updateModule2(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        moduleService.updateModule2(params);
        return "";
    }

    /**
     * 删除一级模块
     *
     * @param request
     * @return
     */
    @RequestMapping("/delete1module2.action")
    @ResponseBody
    public String delete1Module2(HttpServletRequest request) {
        Map<String, Object> params = getParams();
        String id = MapUtils.getString(params, "pid");
        //查所有信息列表
        moduleService.deletemodule2(params);
        Page pageInfo = moduleService.queryModule2CenterList(params);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("id", id);
        return  "";
    }
}
