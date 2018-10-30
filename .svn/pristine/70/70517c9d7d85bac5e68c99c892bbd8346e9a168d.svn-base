package com.wgb.util;

import java.util.UUID;

/**
 * Created by wgy on 2018/8/12.
 */
public class UUIDUtils {

    private  static  UUIDUtils  instance = new UUIDUtils();

    public static UUIDUtils  getInstance(){
        if(instance == null){
            instance = new UUIDUtils();
        }
        return instance;
    }

    private UUIDUtils(){

    }

    public  String  getUUID (){
        return UUID.randomUUID().toString().replace("-", "").toUpperCase();
    }

    public static void main(String [] args){
        System.out.println(UUIDUtils.getInstance().getUUID());
    }
}
