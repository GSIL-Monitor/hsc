package com.wgb.service.gaode;

import net.sf.json.JSONObject;

import java.util.List;
import java.util.Map;

/**
 * Created by 11609 on 2018/8/28.
 */
public interface GaoDeUtilService {
    /**
     * 调用高德api获取两点之间距离
     *
     * @param destination
     * @param origins
     * @param scpList
     */
    void getDistance(String destination, String origins, List<Map<String, Object>> scpList);
    /**
     * 格式化多个供应商坐标位置
     *
     * @param scpList
     * @return
     */
    String formatOriginsList(List<Map<String, Object>> scpList);
    /**
     * 格式化单个个供应商坐标位置
     *
     * @param scpInfo
     * @return
     */
    String formatOriginsMap(Map<String, Object> scpInfo);
    /**
     * 格式化当前位置
     *
     * @param params
     * @return
     */
    String formatDestination(Map<String, Object> params);
    /**
     * 单个供应商获取距离
     *
     * @param scpInfo
     * @param params
     * @return
     */
    Double getDistance(Map<String, Object> scpInfo, Map<String,Object> params);
}
