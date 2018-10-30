package com.wgb.interceptor;

import com.wgb.util.CommonUtil;
import com.wgb.util.ParamsUtil;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    /**
     * 日志工具
     */
    private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

       public static final String[] whites = {
            "/entry/"};

    /**
     * 判断是否客户端请求
     *
     * @param url
     * @return
     */
    private boolean clientAuth(String url) {
        if (StringUtils.isEmpty(url)) {
            return false;
        }
        return url.indexOf("/wxcs") != -1;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
        String uri = request.getRequestURI();
        String userIp = CommonUtil.getRemortIP(request);
        logger.info("客户端IP：" + userIp + "，访问链接：" + uri + "，请求参数：" + ParamsUtil.handleServletParameter(request));
        return true;
    }

    /**
     * @param uri
     * @return
     */
    private boolean isNeedCheckLogin(String uri) {
        if (whites == null || whites.length == 0) {
            return true;
        }
        for (String white : whites) {
            if (uri.indexOf(white) != -1) {
                return false;
            }
        }
        return true;
    }
}