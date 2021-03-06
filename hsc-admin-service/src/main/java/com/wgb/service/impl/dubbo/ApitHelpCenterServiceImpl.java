package com.wgb.service.impl.dubbo;

import com.wgb.dao.Page;
import com.wgb.dubbo.ZLRpcResult;
import com.wgb.service.dubbo.hsc.admin.ApitHelpCenterService;
import com.wgb.service.helpcenter.HelpCenterService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by 11609 on 2018/4/28.
 */
@Service
public class ApitHelpCenterServiceImpl implements ApitHelpCenterService {

    @Autowired
    private HelpCenterService helpCenterService;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 查询默认展示页面
     * @param params
     * @return
     */
    @Override
    public ZLRpcResult getHelpCenterForApp(Map<String, Object> params) {
        //返回结果
        ZLRpcResult zlRpcResult = new ZLRpcResult();
        Map<String, Object> data = helpCenterService.getHelpCenterForApp(params);
        zlRpcResult.setData(data);
        //返回数据对象
        return zlRpcResult;
    }

    /**
     * 根据标题搜索问题
     * @param params
     * @return
     */
    @Override
    public ZLRpcResult getSearchHelpCenterForApp(Map<String, Object> params) {
        //返回结果
        ZLRpcResult zlRpcResult = new ZLRpcResult();
        List<Map<String, Object>> activityList = helpCenterService.getSearchHelpCenterForAppForSlave(params);
        zlRpcResult.setData(activityList);
        //返回数据对象
        return zlRpcResult;
    }

    /**
     * 获取标题分页
     * @param params
     * @return
     */
    @Override
    public ZLRpcResult getHelpCenterPageListForApp(Map<String, Object> params) {
        //返回结果
        ZLRpcResult zlRpcResult = new ZLRpcResult();
        Page<?> pageInfo = helpCenterService.getHelpCenterPageListForAppForSlave(params);
        zlRpcResult.setData(pageInfo);
        //返回数据对象
        return zlRpcResult;
    }
}
