/**
 * 
 */
package com.contact.util;

import net.sf.json.JSONObject;

import org.apache.commons.beanutils.DynaBean;

/**
 * 提供对象操作的方法
 * @author Administrator
 *
 */
public class ObjectUtil {

	/**
	 * 从类名来实例化对象
	 * 
	 * @param className
	 *            列名称
	 * @return 对象实例
	 */
	public static Object getInstanceByName(String className) {

		try {
			Class cls = Class.forName(className);
			return cls.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("未能实例化对象!");
		}
	}
	
	/**
	 * 从Dynabean中获得属性为name的值，如果没有则返回null
	 * 
	 * @param bean
	 *            动态Bean
	 * @param name
	 *            属性名称
	 * @return 属性值
	 */
	public static Object parseDynaBean(DynaBean bean, String name) {
		try {
			return bean.get(name);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 从JsonObject中获得name对应的值
	 * 
	 * @param object
	 *            jsonObject对象
	 * @param name
	 *            属性名称
	 * @return 属性值
	 */
	public static String parseJsonObject(JSONObject object, String name) {

		try {
			return object.getString(name);
		} catch (Exception e) {
			return null;
		}

	}
	
	/**
	 * 根据类型返回值
	 * 
	 * @param classType
	 *            类型
	 * @param value
	 *            值
	 * @return 转化后的值
	 */
	public static Object getPropertyValue(Class classType, Object value) {

		if (classType.getName().equals(String.class.getName())) {
			return value.toString();
		}

		if (classType.getName().equals(Long.class.getName())) {
			return Long.valueOf(value.toString());
		}

		if (classType.getName().equals(Integer.class.getName())) {
			return Integer.valueOf(value.toString());
		}

		return null;

	}
}
