package com.wgb.service.impl.gaode;

import com.wgb.service.gaode.GaoDeUtilService;
import com.wgb.util.ArithUtil;
import com.wgb.util.Contants;
import com.wgb.util.HttpClientUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 〈高德工具类〉
 *
 * @author 11609
 */
@Service
public class GaoDeUtilServiceImpl implements GaoDeUtilService {

    public static final String CALL_SUCCESS = "1";

    /**
     * 调用高德api获取两点之间距离
     *
     * @param destination
     * @param origins
     * @param scpList
     */
    @Override
    public void getDistance(String destination, String origins, List<Map<String, Object>> scpList) {
        String httpResult = getGaoDeDistance(origins, destination);
        JSONObject result = JSONObject.fromObject(httpResult);
        String status = MapUtils.getString(result, "status");
        if (CALL_SUCCESS.equals(status)) {
            String results = MapUtils.getString(result, "results");
            JSONArray jsonArrayDetail = JSONArray.fromObject(results);
            for (int index = 0; index < jsonArrayDetail.size(); index++) {
                JSONObject detailObject = jsonArrayDetail.getJSONObject(index);
                Double distance = MapUtils.getDoubleValue(detailObject, "distance", Contants.SCP_DEFAULT_DISTANCE);
                //高德位置id
                String gdoriginid = MapUtils.getString(detailObject, "origin_id");
                for (Map<String, Object> scpMap : scpList) {
                    //供应商位置id
                    String scporiginid = MapUtils.getString(scpMap, "originid");
                    if (StringUtils.isNotEmpty(scporiginid)) {
                        if (scporiginid.equals(gdoriginid)) {
                            scpMap.put("distance", ArithUtil.div(distance, 1000));
                        }
                    } else {
                        scpMap.put("distance", Contants.SCP_DEFAULT_DISTANCE);
                    }
                }
            }
        } else {
            for (Map<String, Object> scpMap : scpList) {
                scpMap.put("distance", Contants.SCP_DEFAULT_DISTANCE);
            }
        }
    }

    /**
     * 单个供应商获取距离
     *
     * @param scpInfo
     * @param params
     * @return
     */
    @Override
    public Double getDistance(Map<String, Object> scpInfo, Map<String, Object> params) {

        String destination = formatDestination(params);

        String origins = formatOriginsMap(scpInfo);

        String httpResult = getGaoDeDistance(origins, destination);
        JSONObject result = JSONObject.fromObject(httpResult);
        String status = MapUtils.getString(result, "status");
        if (CALL_SUCCESS.equals(status)) {
            String results = MapUtils.getString(result, "results");
            JSONArray jsonArrayDetail = JSONArray.fromObject(results);
            for (int index = 0; index < jsonArrayDetail.size(); index++) {
                JSONObject detailObject = jsonArrayDetail.getJSONObject(index);
                Double distance = MapUtils.getDoubleValue(detailObject, "distance", 0.00);
                return ArithUtil.div(distance, 1000);
            }
        }
        return 0.00;
    }

    /**
     * 格式化多个供应商坐标位置
     *
     * @param scpList
     * @return
     */
    @Override
    public String formatOriginsList(List<Map<String, Object>> scpList) {
        StringBuilder origins = new StringBuilder();
        int originid = 0;
        for (Map<String, Object> scpMap : scpList) {
            String coordinate = MapUtils.getString(scpMap, "coordinate");
            if (StringUtils.isNotEmpty(coordinate)) {
                JSONObject data = JSONObject.fromObject(coordinate);
                String lng = MapUtils.getString(data, "lng");
                String lat = MapUtils.getString(data, "lat");
                String origin = lng + "," + lat;
                originid = originid + 1;
                scpMap.put("originid", originid);
                if ("".equals(origins.toString())) {
                    origins.append(origin);
                } else {
                    origins.append("%7C" + origin);
                }
            }
        }
        return origins.toString();
    }

    /**
     * 格式化单个个供应商坐标位置
     *
     * @param scpInfo
     * @return
     */
    @Override
    public String formatOriginsMap(Map<String, Object> scpInfo) {
        StringBuilder origins = new StringBuilder();
        String coordinate = MapUtils.getString(scpInfo, "coordinate");
        if (StringUtils.isNotEmpty(coordinate)) {
            JSONObject data = JSONObject.fromObject(coordinate);
            String lng = MapUtils.getString(data, "lng");
            String lat = MapUtils.getString(data, "lat");
            String origin = lng + "," + lat;
            origins.append(origin);
        }
        return origins.toString();
    }

    /**
     * 格式化当前位置
     *
     * @param params
     * @return
     */
    @Override
    public String formatDestination(Map<String, Object> params) {
        String destination = MapUtils.getString(params, "destination");
        if (StringUtils.isEmpty(destination)) {
            return null;
        }

        String[] place = destination.split(",");
        StringBuilder newDestination = new StringBuilder();

        for (int i = 0; i < place.length; i++) {
            if ("".equals(newDestination.toString())) {
                newDestination.append(place[i].substring(0, place[i].indexOf(".") + 7));
            } else {
                newDestination.append("," + place[i].substring(0, place[i].indexOf(".") + 7));
            }
        }
        return newDestination.toString();
    }

    public String getGaoDeDistance(String origins, String destination) {
        String requestUrl = "https://restapi.amap.com/v3/distance?" +
                "origins=" + origins +
                "&destination=" + destination +
                "&key=a4b0ccf0c2479fa2da661227c30e4cfd";
        String httpResult = HttpClientUtil.httpGetRequest(requestUrl);
        return httpResult;
    }


}
