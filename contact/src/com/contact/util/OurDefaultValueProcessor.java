package com.contact.util;

import net.sf.json.JSONArray;
import net.sf.json.processors.DefaultValueProcessor;
import net.sf.json.util.JSONUtils;

/**
 * Ĭ�ϵ����ɲ���
 * 
 */
public class OurDefaultValueProcessor implements DefaultValueProcessor {

	/**
	 * �õ�Ĭ�ϵ�ֵ
	 * 
	 * @param type
	 *            java����
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