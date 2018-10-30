package com.wgb.util;

import com.wgb.exception.ServiceException;
import net.sf.json.JSONObject;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;

/**
 * Created by Administrator on 2017/5/22 0022.
 */
public class WeixinCommon {

    protected final static Logger logger = LoggerFactory.getLogger(WeixinCommon.class);

    /**
     * 获取网页授权凭证
     *
     * @param appId     公众账号的唯一标识
     * @param appSecret 公众账号的密钥
     * @param code
     * @return WeixinAouth2Token
     */
    public static Map<String, Object> getOauth2AccessToken(String appId, String appSecret, String code) {
        // 拼接请求地址
        String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
        requestUrl = requestUrl.replace("APPID", appId);
        requestUrl = requestUrl.replace("SECRET", appSecret);
        requestUrl = requestUrl.replace("CODE", code);
        // 获取网页授权凭

        String httpResult = HttpClientUtil.httpGetRequest(requestUrl);

        if (StringUtils.isNotEmpty(httpResult)) {
            try {
                JSONObject jsonObject = JSONObject.fromObject(httpResult);

                Map<String, Object> resultMap = new HashMap<String, Object>();
                resultMap.put("access_token", jsonObject.getString("access_token"));
                resultMap.put("expires_in", jsonObject.getString("expires_in"));
                resultMap.put("refresh_token", jsonObject.getString("refresh_token"));
                resultMap.put("xcxopenid", jsonObject.getString("xcxopenid"));
                resultMap.put("scope", jsonObject.getString("scope"));

                return resultMap;
            } catch (Exception e) {
                System.out.println("调用获取网页授权接口异常了:" + e.getMessage());
            }
        }

        return null;
    }

    /**
     * 通过网页授权获取用户信息
     *
     * @param accessToken 网页授权接口调用凭证
     * @param openId      用户标识
     * @return SNSUserInfo
     */
    @SuppressWarnings({"deprecation", "unchecked"})
    public static Map<String, Object> getUserInfo(String accessToken, String openId) {
        // 拼接请求地址
        String requestUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&xcxopenid=OPENID&lang=zh_CN";
        requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken).replace("OPENID", openId);
        // 通过网页授权获取用户信息
        String httpResult = HttpClientUtil.httpGetRequest(requestUrl);

        System.out.println(httpResult);

        if (StringUtils.isNotEmpty(httpResult)) {
            try {

                String filterString = EmojiFilterUtils.filterEmoji(httpResult);
                JSONObject jsonObject = JSONObject.fromObject(filterString);
                Map<String, Object> resultMap = new HashMap<String, Object>();
                resultMap.put("xcxopenid", jsonObject.getString("xcxopenid"));
                resultMap.put("nickname", jsonObject.getString("nickname"));
                resultMap.put("sex", jsonObject.getString("sex"));
                resultMap.put("country", jsonObject.getString("country"));
                resultMap.put("province", jsonObject.getString("province"));
                resultMap.put("city", jsonObject.getString("city"));
                resultMap.put("headimgurl", jsonObject.getString("headimgurl"));
                return resultMap;
            } catch (Exception e) {
                System.out.println("调用获取微信用户信息接口异常了:" + e.getMessage());
            }
        }
        return null;
    }

    public static String getPrepayId(SortedMap<String, Object> parameterMap) {

        String requestUrl = "https://api.mch.weixin.qq.com/pay/unifiedorder";

        String requestXML = PayCommonUtil.getRequestXml(parameterMap);
        String payResult = PayCommonUtil.httpsRequest(
                requestUrl, "POST",
                requestXML);

        logger.info("统一下单接口调用返回结果：" + payResult);

        Map<String, String> payResultMap = null;
        try {
            payResultMap = PayCommonUtil.doXMLParse(payResult);
        } catch (Exception e) {
            throw new ServiceException("调用微信接口异常");
        }

        logger.info("统一下单接口调用返回结果map：" + payResultMap);

        //用于说明请求是否成功
        String returnCode = MapUtils.getString(payResultMap, "return_code", "");
        if (!returnCode.equals("SUCCESS")) {
            throw new ServiceException("调用微信接口失败");
        }

        String prepayId = MapUtils.getString(payResultMap, "prepay_id", "");
        if (StringUtils.isEmpty(prepayId)) {
            throw new ServiceException("调用微信接口失败");
        }

        return prepayId;
    }

    /**
     * 判断微信商户是否营业
     * @param params  商户信息
     * @return
     */
    public static  Boolean checkShopIsOpen(Map<String,Object> params){
        String businessstate = MapUtils.getString(params,"businessstate","");
        String openstate = MapUtils.getString(params,"openstate","");
        String strstarttime = MapUtils.getString(params,"starttime","");
        String strendtime = MapUtils.getString(params,"endtime","");
        SimpleDateFormat dataform = new SimpleDateFormat("HH:mm:ss");
        String strnow = dataform.format(new Date());
        //营业状态为休息的时候直接返回
        if(StringUtils.equals(businessstate,"0")){
            return false;
        }

        if(StringUtils.equals(openstate,"0")){
            return true;
        }else {
            try {
                Date now = dataform.parse(strnow);
                Date startime = dataform.parse(strstarttime);
                Date endtime = dataform.parse(strendtime);
                if(now.getTime()>=startime.getTime()&&now.getTime()<=endtime.getTime()){
                    return  true;
                }else {
                    return  false;
                }
            } catch (ParseException e) {
                e.printStackTrace();
                throw new ServiceException("时间转换错误");
            }
        }
    }
}
