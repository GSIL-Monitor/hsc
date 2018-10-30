package com.wgb.util;

/**
 * Created by Administrator on 2017/5/23 0023.
 */
public class SystemConfig {

    public static String WX_TOKEN;
    public static String PAY_WX_BODY;
    public static String PAY_WX_NOTIFY_URL;

    private static PropConfig propConfig;

    static {
        propConfig = PropConfig.loadConfig("setting-web.properties");

        if (propConfig != null) {
            WX_TOKEN = propConfig.getConfigString("wx.token");
            PAY_WX_BODY = propConfig.getConfigString("pay.wx.body");
            PAY_WX_NOTIFY_URL = propConfig.getConfigString("pay.wx.notifyUrl");
        }
    }
}
