package com.wgb.service.impl.helpcentre;

import com.wgb.dao.CommonDalClient;
import com.wgb.service.helpcentre.HelpLevelModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by wgb on 2016/8/27.
 */
@Service
public class HelpLevelModuleServiceImpl implements HelpLevelModuleService {

    private static final String NAMESPACE = "shardName.com.wgb.service.impl.helpcentre.HelpLevelModuleServiceImpl.";

    @Autowired
    private CommonDalClient dal;

    @Override
    public List<Map<String, Object>> getLevel1ModelList(Map<String, Object> params) {
        return dal.getDalClient().queryForList(NAMESPACE + "getLevel1ModelList", params);
    }

    @Override
    public List<Map<String, Object>> getLevel2ModelList(Map<String, Object> params) {
        return dal.getDalClient().queryForList(NAMESPACE + "getLevel2ModelList", params);
    }
}
