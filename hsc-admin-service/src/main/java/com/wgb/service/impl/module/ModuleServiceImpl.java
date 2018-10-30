package com.wgb.service.impl.module;

import com.wgb.dao.CommonDalClient;
import com.wgb.dao.Page;
import com.wgb.service.module.ModuleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ModuleServiceImpl implements ModuleService {
    private static final String NAMESPACE = "shardName.com.wgb.service.impl.module.ModuleServiceImpl.";
    @Autowired
    private CommonDalClient dal;
    protected final Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    public Page<?> queryModuleCenterList(Map<String, Object> params) {
        return dal.getDalClient().queryForListPage(NAMESPACE + "querymodulePageList", params);
    }

    @Override
    public void saveNewModule(Map<String, Object> params) {
        dal.getDalClient().execute4PrimaryKey(NAMESPACE + "savenewmodule", params);
    }

    @Override
    public Page<?> queryModule2CenterList(Map<String, Object> params) {
        return dal.getDalClient().queryForListPage(NAMESPACE + "querymodule2PageList", params);

    }

    @Override
    public void updateNewModule(Map<String, Object> params) {
        dal.getDalClient().execute(NAMESPACE + "updatemodule", params);
    }

    @Override
    public void deletemodule(Map<String, Object> params) {
        dal.getDalClient().execute(NAMESPACE + "deletemodule", params);
    }

    @Override
    public void saveNew2Module(Map<String, Object> params) {
        dal.getDalClient().execute4PrimaryKey(NAMESPACE + "savenew2module", params);

    }

    @Override
    public void updateModule2(Map<String, Object> params) {
        dal.getDalClient().execute(NAMESPACE + "updatemodule2", params);
    }

    @Override
    public void deletemodule2(Map<String, Object> params) {
        dal.getDalClient().execute(NAMESPACE + "deletemodule2", params);
    }


    @Override
    public List<Map<String, Object>> getLevel1ModelListForSlave(Map<String, Object> params) {
        return dal.getReadOnlyDalClient().queryForList(NAMESPACE + "getLevel1ModelList", params);
    }

    @Override
    public List<Map<String, Object>> getLevel1ModelList(Map<String, Object> params) {
        return dal.getReadOnlyDalClient().queryForList(NAMESPACE + "getLevel1ModelList1", params);
    }

    @Override
    public List<Map<String, Object>> getLevel2ModelList(Map<String, Object> params) {
        return dal.getDalClient().queryForList(NAMESPACE + "getLevel2ModelList", params);
    }

    @Override
    public Map<String, Object> queryModuleInfo(Map<String, Object> params) {
        return dal.getDalClient().queryForMap(NAMESPACE + "querymoduleInfo", params);
    }

    @Override
    public Map<String, Object> queryModule2Info(Map<String, Object> params) {
        return dal.getDalClient().queryForMap(NAMESPACE + "querymodule2Info", params);
    }

    @Override
    public List<Map<String, Object>> getLevel1ModelListByHelp(Map<String, Object> params) {
        return dal.getDalClient().queryForList(NAMESPACE + "getLevel2ModelList", params);
    }

    @Override
    public Map<String, Object> checknum(Map<String, Object> params) {
        return dal.getDalClient().queryForMap(NAMESPACE + "querynum", params);
    }

    @Override
    public Map<String, Object> checknum2(Map<String, Object> params) {
        return dal.getDalClient().queryForMap(NAMESPACE + "querynum2", params);
    }

    @Override
    public List<Map<String, Object>> getLevel1ModelListFotAppForSlave(Map<String, Object> params) {
        return dal.getReadOnlyDalClient().queryForList(NAMESPACE + "getLevel1ModelListForApp", params);
    }

    @Override
    public List<Map<String, Object>> getLevel2ModelListFotAppForSlave(Map<String, Object> params) {
        return dal.getReadOnlyDalClient().queryForList(NAMESPACE + "getLevel2ModelListForApp", params);
    }

}
