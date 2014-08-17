package com.contact.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

/**
 * ���ڴ���ʱ������(java.util.Date)��JsonValueProcessor������
 * 
 */
public class DateJsonValueProcessor implements JsonValueProcessor {

	/**
	 * Ĭ��ʱ���ʽ��������ʱ����
	 */
	public String DEFAULT_DATE_PATTERN = "yyyy-MM-dd HH:mm:ss";

	/**
	 * ���ڸ�ʽ��
	 */
	private DateFormat dateFormat;

	/**
	 * ����DateJsonValueProcessor����ʹ��Ĭ��ʱ���ʽ��ʼ�����ڸ�ʽ��
	 */
	public DateJsonValueProcessor() {
		dateFormat = new SimpleDateFormat(DEFAULT_DATE_PATTERN);
	}

	/**
	 * ����DateJsonValueProcessor����ʹ��ָ���Ĳ�����ʼ�����ڸ�ʽ��
	 * 
	 * @param pattern
	 *            ʱ���ʽ
	 */
	public DateJsonValueProcessor(String pattern) {
		try {
			dateFormat = new SimpleDateFormat(pattern);
		} catch (Exception e) {
			dateFormat = new SimpleDateFormat(DEFAULT_DATE_PATTERN);
		}
	}

	/**
	 * ��дprocessArrayValue
	 * 
	 * @param arg0
	 *            �ַ��Ͳ���
	 * @param arg1
	 *            Object
	 * @return Object
	 */
	public Object processArrayValue(Object arg0, JsonConfig arg1) {
		return process(arg1);
	}

	/**
	 * ��дprocessObjectValue
	 * 
	 * @param arg0
	 *            �ַ��Ͳ���
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
	 * ��ʽ��ʱ��
	 * 
	 * @param value
	 *            ʱ��ֵ
	 * @return ��ʽ����������valueΪ��ֱ�ӷ���null
	 */
	private Object process(Object value) {
		if (value != null)
			return dateFormat.format((Date) value);
		return null;
	}

}
