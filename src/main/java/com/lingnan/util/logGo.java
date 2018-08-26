package com.lingnan.util;


import java.util.logging.Logger;

/**
 * Created By HongJei Lee on 2018/8/26
 */
public class logGo {

    private static Logger logger = Logger.getLogger("log");

    /**
     * @param args
     */
    public static void main(String[] args) {
        // System.out.println("This is println message.");

        // 记录debug级别的信息
        // 记录info级别的信息
        logger.info("This is info message.");
        // 记录error级别的信息
    }


}
