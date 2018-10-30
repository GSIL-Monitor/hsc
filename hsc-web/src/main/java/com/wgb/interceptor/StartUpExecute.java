package com.wgb.interceptor;

import com.wgb.service.CacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

/**
 * Created by wgb on 2016/8/24.
 */
@Service
public class StartUpExecute implements ApplicationListener<ContextRefreshedEvent> {

    @Autowired
    private CacheService cacheService;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        //系统初始化完成，刷新所有缓存
        cacheService.updateAllCache();
    }
}
