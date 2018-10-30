package com.wgb.service.impl;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.wgb.dao.CommonDalClient;
import com.wgb.exception.ServiceException;
import com.wgb.util.CommonUtil;
import com.wgb.util.UniqueCodeGenerate;
import org.apache.commons.collections.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wgb on 2017/3/6.
 */
public abstract class BaseServiceImpl {
    protected final Logger logger = LoggerFactory.getLogger(getClass());
    /**
     * 流水号初始值
     */
    private static final int START_INDEX = 1;

    /**
     * 默认获取流水号个数
     */
    private static final int DEFAULT_LEN = 1;
    @Autowired
    protected CommonDalClient dal;

    private static final String NAMESPACE = "shardName.com.wgb.service.impl.BaseServiceImpl.";
    protected String generateShopUniqueBusinessCode(String NAMESPACE, Map<String, Object> params, int min) {
        Integer integer = dal.getDalClient().queryForObject(NAMESPACE + "generateShopUniqueBusinessCode", params, Integer.class);
        return CommonUtil.generateCode(integer, min);
    }

    protected String generateBranchUniqueBusinessCode(String NAMESPACE, Map<String, Object> params, int min) {
        Integer integer = dal.getDalClient().queryForObject(NAMESPACE + "generateBranchUniqueBusinessCode", params, Integer.class);
        return CommonUtil.generateCode(integer, min);
    }
   //生成唯一编码
   //(新)生成商户级编码
   protected String generateShopSerialCode(Map<String, Object> params, String codename, int min) {
       return generateShopSerialCodeList(params, codename, min, DEFAULT_LEN).get(0);
   }
    //(新)生成门店级编码
    protected String generateBranchSerialCode(Map<String, Object> params, String codename, int min) {
        return generateBranchSerialCodeList(params, codename, min, DEFAULT_LEN).get(0);
    }

    protected List<String> generateShopSerialCodeList(Map<String, Object> params, String codename, int min, int len) {

        if (StringUtils.isEmpty(codename)) {
            logger.error("生成商户唯一流水号失败，codename未提供");
            throw new ServiceException(ServiceException.SYS_ERROR);
        }

        String shopcode = MapUtils.getString(params, "shopcode");
        if (StringUtils.isEmpty(shopcode)) {
            logger.error("生成商户唯一流水号失败，shopcode未提供，codename：" + codename);
            throw new ServiceException(ServiceException.SYS_ERROR);
        }

        Map<String, Object> p1 = new HashMap<String, Object>();
        p1.put("shopcode", shopcode);
        p1.put("codename", codename);


        p1.put("len", len);

        return updateSerialCodes(p1, min, len);
    }

    protected List<String> generateBranchSerialCodeList(Map<String, Object> params, String codename, int min, int len) {

        if (StringUtils.isEmpty(codename)) {
            logger.error("生成商户唯一流水号失败，codename未提供");
            throw new ServiceException(ServiceException.SYS_ERROR);
        }

        String shopcode = MapUtils.getString(params, "shopcode");
        String branchcode = MapUtils.getString(params, "branchcode");
        if (StringUtils.isEmpty(shopcode) || StringUtils.isEmpty(branchcode)) {
            logger.error("生成商户唯一流水号失败，shopcode或branchcode未提供，codename：" + codename);
            throw new ServiceException(ServiceException.SYS_ERROR);
        }

        Map<String, Object> p1 = new HashMap<String, Object>();
        p1.put("shopcode", shopcode);
        p1.put("branchcode", branchcode);
        p1.put("codename", codename);
        p1.put("len", len);

        return updateSerialCodes(p1, min, len);
    }

    /**
     * 更新商户业务流水号，返回对应流水号
     *
     * @param params
     * @param min
     * @param len
     * @return
     */
    private synchronized  List<String> updateSerialCodes(Map<String, Object> params, int min, int len) {

        //刷新流水号
        int count = dal.getDalClient().execute(NAMESPACE + "updateSerialIndex", params);

        int codemax;
        //如果流水号存在，则返回最新流水号
        if (count != 0) {
            codemax = dal.getDalClient().queryForObject(NAMESPACE + "getSerialIndex", params, Integer.class);
        }
        //如果流水号不存在，则新增流水号数据
        else {
            codemax = START_INDEX + len - 1;
            params.put("codemax", codemax);
            dal.getDalClient().execute(NAMESPACE + "insertSerialIndex", params);
        }
        List<String> resultList = new ArrayList<String>();
        for (int index = 0; index < len; index++) {
            resultList.add(UniqueCodeGenerate.appendZero(codemax - index, min));
        }
        return resultList;
    }

}
