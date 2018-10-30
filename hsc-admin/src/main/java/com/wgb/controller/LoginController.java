package com.wgb.controller;

import com.wgb.cache.RedisFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

    @RequestMapping("/entry/logout")
    @ResponseBody
    public boolean logout(HttpServletRequest request, HttpServletResponse response) {

        String username = request.getRemoteUser();
        HttpSession session = request.getSession();
        ServletContext application = session.getServletContext();
        session.invalidate();

        String menuKey = "admin_menu_" + username;
        String userKey = "admin_user_" + username;
        //更新用户数据到redis中
        RedisFactory.getPassportClient().setMapToJedis(null, userKey);
        //更新用户数据到redis中
        RedisFactory.getPassportClient().setListToJedis(null, menuKey);

        try {
            response.sendRedirect(application
                    .getInitParameter("casServerLogoutUrl")
                    + "?service="
                    + application.getInitParameter("serverName") + "/index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;
    }
}
