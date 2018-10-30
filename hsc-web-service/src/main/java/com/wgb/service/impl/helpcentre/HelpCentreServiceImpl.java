package com.wgb.service.impl.helpcentre;

import com.wgb.dao.CommonDalClient;
import com.wgb.dao.Page;
import com.wgb.service.SeqGenService;
import com.wgb.service.helpcentre.HelpCentreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wgb on 2016/8/27.
 */
@Service
public class HelpCentreServiceImpl implements HelpCentreService {

    private static final String NAMESPACE = "shardName.com.wgb.service.impl.helpcentre.HelpCentreServiceImpl.";

    @Autowired
    private CommonDalClient dal;

    @Override
    public Page<?> getModProblemelPageList(Map<String, Object> params) {
        return dal.getDalClient().queryForListPage(NAMESPACE + "getModProblemelPageList", params);
    }

    @Override
    public List<Map<String,Object>> getModProblemelList(Map<String, Object> params) {
        return dal.getDalClient().queryForList(NAMESPACE + "getModProblemelList", params);
    }

    @Override
    public Map<String, Object> getModProblemelDetail(Map<String, Object> params) {
        return dal.getDalClient().queryForMap(NAMESPACE + "getModProblemelDetail", params);
    }
}
