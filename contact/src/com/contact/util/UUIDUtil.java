/**
 * 
 */
package com.contact.util;

import java.util.UUID;

/**
 * uuid生成工具类
 * @author Administrator
 *
 */
public class UUIDUtil {
	
	/**
	 * 获取生成后的UUID，将-去掉
	 * @return uuid
	 */
    public static String generate()
    {
    	return UUID.randomUUID().toString().replaceAll("-", "");
    }
    
    /**
     * generate whole uuid string without cutting the char '-'
     * @return uuid
     */
    public static String generateFullUUID()
    {
    	return UUID.randomUUID().toString();
    }
    
    /**
     * 根据传入的数字个数生成指定个数的唯一字符，可以用来生成某些表的主键
     * 一般适合主键位数在32以下的，即num的值小于32,但是不能太小，建议10-32之间
     * @return uuid
     */
    public static String generateIdByNum(int num)
    {
    	String uuid = UUID.randomUUID().toString();//uuid 
    	if (num >= uuid.length())
    	{
    		return uuid;
    	}
    	else
    	{
    		return uuid.substring(0,num);
    	}
    }
}
