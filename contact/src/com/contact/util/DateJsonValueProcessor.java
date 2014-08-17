package com.contact.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

/**
 * 用于处理时间类型(java.util.Date)的JsonValueProcessor辅助类
 * 
 */
public class DateJsonValueProcessor implements JsonValueProcessor {

	/**
	 * 默认时间格式，年月日时分秒
	 */
	public String DEFAULT_DATE_PATTERN = "yyyy-MM-dd HH:mm:ss";

	/**
	 * 日期格式类
	 */
	private DateFormat dateFormat;

	/**
	 * 创建DateJsonValueProcessor，并使用默认时间格式初始化日期格式类
	 */
	public DateJsonValueProcessor() {
		dateFormat = new SimpleDateFormat(DEFAULT_DATE_PATTERN);
	}

	/**
	 * 创建DateJsonValueProcessor，并使用指定的参数初始化日期格式类
	 * 
	 * @param pattern
	 *            时间格式
	 */
	public DateJsonValueProcessor(String pattern) {
		try {
			dateFormat = new SimpleDateFormat(pattern);
		} catch (Exception e) {
			dateFormat = new SimpleDateFormat(DEFAULT_DATE_PATTERN);
		}
	}

	/**
	 * 重写processArrayValue
	 * 
	 * @param arg0
	 *            字符型参数
	 * @param arg1
	 *            Object
	 * @return Object
	 */
	public Object processArrayValue(Object arg0, JsonConfig arg1) {
		return process(arg1);
	}

	/**
	 * 重写processObjectValue
	 * 
	 * @param arg0
	 *            字符型参数
	 * @param arg1
	 *            Object
	 * @param arg2
	 *            JsonConfig
	 * @return Object
	 */
	public Object processObjectValue(String arg0, Object arg1, JsonConfig arg2) {

		return process(arg1);
	}

	/**
	 * 格式化时间
	 * 
	 * @param value
	 *            时间值
	 * @return 格式化结果，如果value为空直接返回null
	 */
	private Object process(Object value) {
		if (value != null)
			return dateFormat.format((Date) value);
		return null;
	}

}
