package com.wgb.util;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class ParamsUtil {

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
    public static Map<String, Object> getParams(HttpServletRequest request, Map<String, Object> branchInfo) {
        Map<String, Object> requestParams = ParamsUtil.handleServletParameter(request);

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
        requestParams.put("membermodel", MapUtils.getString(branchInfo, "membermodel"));
        requestParams.put("loginuserbranchcode", MapUtils.getString(branchInfo, "branchcode"));
        requestParams.put("loginuserbranchname", MapUtils.getString(branchInfo, "branchname"));
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

    public static int getCount(Map<String, Object> params) {

        if (null == params || params.size() == 0) {
            return 0;
        }
        int count = 0;
        String billcode = MapUtils.getString(params, "billcode");
        if (StringUtils.isNotEmpty(billcode)) {
            String[] bill = StringUtils.split(billcode, "-");
            count = Integer.valueOf(bill[bill.length - 1]);
            return count;
        } else {
            return count;
        }
    }
}
