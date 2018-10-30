package com.wgb.service.helpcenter;

import com.wgb.dao.Page;

import java.util.List;
import java.util.Map;

public interface HelpCenterService {
    Page<?> queryHelpCenterList(Map<String, Object> params);

    void saveNewHelp(Map<String, Object> params);

    List<Map<String, Object>> queryLevelModule(Map<String, Object> params);

    List<Map<String, Object>> queryLevel2Module(Map<String, Object> params);

    void updateHelp(Map<String, Object> params);

    void deleteHelp(Map<String, Object> params);

    Map<String, Object>  queryHelpInfo(Map<String,Object> params);

    List<Map<String,Object>>  queryLevelOnly2Module(Map<String,Object> params);

    List<Map<String,Object>> getModProblemelListForSlave(Map<String, Object> params);

    /**
     * 查询默认展示页面
     * @param params
     * @return
     */
    Map<String,Object> getHelpCenterForApp(Map<String, Object> params);

    /**
     * 获取标题分页
     * @param params
     * @return
     */
    Page<?> getHelpCenterPageListForAppForSlave(Map<String, Object> params);

    /**
     * 根据标题搜索问题
     * @param params
     * @return
     */
    List<Map<String,Object>> getSearchHelpCenterForAppForSlave(Map<String, Object> params);
}
