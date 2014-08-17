package com.contact.util;

import net.sf.json.JSONArray;
import net.sf.json.processors.DefaultValueProcessor;
import net.sf.json.util.JSONUtils;

/**
 * 默认的生成策略
 * 
 */
public class OurDefaultValueProcessor implements DefaultValueProcessor {

	/**
	 * 得到默认的值
	 * 
	 * @param type
	 *            java对象
	 */
	@SuppressWarnings("rawtypes")
	public Object getDefaultValue(Class type) {
		if (JSONUtils.isArray(type)) {
			return new JSONArray();
		} else {
			return "";
		}
	}
}