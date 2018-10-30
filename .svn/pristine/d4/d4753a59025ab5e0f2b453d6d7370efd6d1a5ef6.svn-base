package com.wgb.util;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class XcxParamsUtil {

    private static final String PAGE = "page";
    private static final String PAGESIZE = "pageSize";

    /**
     * @param request
     * @return
     */
    public static Map<String, Object> getParams(HttpServletRequest request) {
        return getParams(request, null);
    }

    /**
     * @param request
     * @return
     */
    public static Map<String, Object> getParams(HttpServletRequest request, Map<String, Object> memberInfo) {
        Map<String, Object> requestParams = XcxParamsUtil.handleServletParameter(request);

        if (StringUtils.isEmpty(requestParams.get(PAGE) == null ? null : requestParams.get(PAGE).toString())) {
            requestParams.put(PAGE, Contants.PAGE_START);

        } else {
            requestParams.put(PAGE, MapUtils.getIntValue(requestParams, PAGE, Contants.PAGE_START));
        }
        if (StringUtils.isEmpty(requestParams.get(PAGESIZE) == null ? null : requestParams.get(PAGESIZE).toString())) {
            requestParams.put(PAGESIZE, Contants.PAGE_SIZE);
        } else {
            requestParams.put(PAGESIZE, MapUtils.getIntValue(requestParams, PAGESIZE, Contants.PAGE_SIZE));
        }

        requestParams.put(Contants.USER_IP, CommonUtil.getRemortIP(request));
        requestParams.put("loginmemberid", MapUtils.getString(memberInfo, "memberid"));
        requestParams.put("memberid", MapUtils.getString(memberInfo, "memberid"));
        requestParams.put("loginmembername", MapUtils.getString(memberInfo, "membername"));
        requestParams.put("loginnickname", MapUtils.getString(memberInfo, "buyernickname"));
        requestParams.put("telephone", MapUtils.getString(memberInfo, "mobile"));
        requestParams.put("loginmembershopcode", MapUtils.getString(memberInfo, "shopcode"));
        requestParams.put("loginmemberxcxopenid", MapUtils.getString(memberInfo, "xcxopenid"));
        requestParams.put("loginmemberheadpic", MapUtils.getString(memberInfo, "headpic"));
        requestParams.put("loginmemberweixin", MapUtils.getString(memberInfo, "weixin"));
        requestParams.put("loginmembercode", MapUtils.getString(memberInfo, "membercode"));
        requestParams.put("shopname", MapUtils.getString(memberInfo, "shopname"));
        requestParams.put("xcxopenid",MapUtils.getString(memberInfo, "xcxopenid"));
        requestParams.put("loginuserid",MapUtils.getString(memberInfo, "id"));
        requestParams.put("userid",MapUtils.getString(memberInfo, "id"));
        requestParams.put("membermodel",MapUtils.getString(memberInfo, "membermodel"));
        requestParams.put("loginbranchcode",MapUtils.getString(memberInfo, "branchcode"));
        requestParams.put("loginbranchname",MapUtils.getString(memberInfo, "branchname"));
        requestParams.put("loginuserbranchcode",MapUtils.getString(memberInfo, "branchcode"));
        requestParams.put("loginuserbranchname",MapUtils.getString(memberInfo, "branchname"));
        requestParams.put("dadacode",MapUtils.getString(memberInfo, "dadacode"));
        requestParams.put("recommendstatus",MapUtils.getString(memberInfo, "recommendstatus"));

        return requestParams;
    }

    /**
     * @param request
     * @return
     */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> handleServletParameter(HttpServletRequest request) {
        Map<String, String[]> requestParameter = request.getParameterMap();

        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.putAll(requestParameter);

        Map<String, Object> rParams = new HashMap<String, Object>(0);
        for (Map.Entry<String, Object> m : parameter.entrySet()) {
            String key = m.getKey();
            Object[] obj = (Object[]) parameter.get(key);
            rParams.put(key, (obj.length > 1) ? obj : obj[0]);
        }
        return rParams;
    }
}
