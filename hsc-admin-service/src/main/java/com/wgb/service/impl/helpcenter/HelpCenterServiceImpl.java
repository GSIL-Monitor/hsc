package com.wgb.service.impl.helpcenter;

import com.wgb.dao.CommonDalClient;
import com.wgb.dao.Page;
import com.wgb.service.helpcenter.HelpCenterService;
import com.wgb.service.module.ModuleService;
import com.wgb.util.CommonConstant;
import com.wgb.util.CommonUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HelpCenterServiceImpl implements HelpCenterService {

    private static final String NAMESPACE = "shardName.com.wgb.service.impl.helpcenter.HelpCenterServiceImpl.";

    protected final Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private CommonDalClient dal;

    @Autowired
    private ModuleService moduleService;

    @Override
    public Page<?> queryHelpCenterList(Map<String, Object> params) {
        return dal.getDalClient().queryForListPage(NAMESPACE + "queryhelpcenterPageList", params);
    }

    @Override
    public void saveNewHelp(Map<String, Object> params) {
        dal.getDalClient().execute4PrimaryKey(NAMESPACE + "saveHelpInfo", params);
    }

    @Override
    public List<Map<String, Object>> queryLevelModule(Map<String, Object> params) {
        return dal.getDalClient().queryForList(NAMESPACE + "queryModulLevelList", params);
    }

    @Override
    public List<Map<String, Object>> queryLevel2Module(Map<String, Object> params) {
        return dal.getDalClient().queryForList(NAMESPACE + "queryModulLevel2List", params);
    }

    @Override
    public void updateHelp(Map<String, Object> params) {
        dal.getDalClient().execute(NAMESPACE + "updateHelp", params);
    }

    @Override
    public void deleteHelp(Map<String, Object> params) {
        dal.getDalClient().execute(NAMESPACE + "deleteHelp", params);
    }


    @Override
    public Map<String, Object> queryHelpInfo(Map<String, Object> params) {
        return dal.getDalClient().queryForMap(NAMESPACE + "queryhelpcenterInfo", params);
    }

    @Override
    public List<Map<String, Object>> queryLevelOnly2Module(Map<String, Object> params) {
        return dal.getDalClient().queryForList(NAMESPACE + "queryOnlyModulLevel2List", params);
    }

    @Override
    public List<Map<String, Object>> getModProblemelListForSlave(Map<String, Object> params) {
        return dal.getReadOnlyDalClient().queryForList(NAMESPACE + "getModProblemelList", params);
    }

    @Override
    public Map<String, Object> getHelpCenterForApp(Map<String, Object> params) {
        Map<String, Object> data = new HashMap<>();

        List<Map<String, Object>> level1ModelList = moduleService.getLevel1ModelListFotAppForSlave(params);
        for (Map<String, Object> level1Model : level1ModelList) {
            List<Map<String, Object>> level2ModelList = moduleService.getLevel2ModelListFotAppForSlave(level1Model);
            level1Model.put("level2ModelList", level2ModelList);
        }
        if(CollectionUtils.isNotEmpty(level1ModelList)){
            Map<String, Object> levelModel = level1ModelList.get(0);
            Page<?> pageInfo = getHelpCenterPageListForAppForSlave(levelModel);
            data.put("pageInfo", pageInfo);
        }
        data.put("level1ModelList", level1ModelList);
        return data;
    }

    @Override
    public Page<?> getHelpCenterPageListForAppForSlave(Map<String, Object> params) {
        return dal.getReadOnlyDalClient().queryForListPage(NAMESPACE + "getHelpCenterPageListForApp", params);
    }

    @Override
    public List<Map<String, Object>> getSearchHelpCenterForAppForSlave(Map<String, Object> params) {
        return dal.getReadOnlyDalClient().queryForList(NAMESPACE + "getSearchHelpCenterForApp", params);
    }
}
