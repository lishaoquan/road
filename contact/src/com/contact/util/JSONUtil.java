package com.contact.util;

import java.util.Collection;
import java.util.Date;
import java.util.Map;

import org.apache.commons.beanutils.DynaBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONFunction;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

/**
 * JSON 处理工具类
 * 
 */
public class JSONUtil {
	/**
	 * 将Bean中不需要装换的属性数组配置到Json的配置中
	 * 
	 * @param excludes
	 *            不需要转换的属性数组
	 * @return 返回 已经配置过后的JsonConfig
	 */
	public static JsonConfig configJson(String[] excludes) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(excludes);
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		return jsonConfig;
	}

	/**
	 * 将对象转换成JSONArray,未配置JsonConfig
	 * 
	 * @param obj
	 *            待转换的数组，集合等对象
	 * @return 转换后得到的json数组
	 */
	@SuppressWarnings("rawtypes")
	public static JSONArray toJSONArray(Object obj) {
		JsonConfig jsonConfig = defaultValueProcessor();
		jsonConfig.registerJsonValueProcessor(Date.class,
				new DateJsonValueProcessor());
		Class sqlDate = java.sql.Date.class;
		jsonConfig.registerJsonValueProcessor(sqlDate,
				new DateJsonValueProcessor());
		return JSONArray.fromObject(obj, jsonConfig);
	}

	/**
	 * 转化成jsonObject的格式，其中有些属性不需要被转化
	 * 
	 * @param obj
	 *            要转化的对象
	 * @param properties
	 *            不需要转化的object的属性
	 * @return 返回json格式
	 */
	@SuppressWarnings("rawtypes")
	public static JSONArray toJSONArrayExcludes(Object obj, String[] properties) {
		JsonConfig jsonConfig = defaultValueProcessor();
		jsonConfig.setExcludes(properties);
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class,
				new DateJsonValueProcessor());
		Class sqlDate = java.sql.Date.class;
		jsonConfig.registerJsonValueProcessor(sqlDate,
				new DateJsonValueProcessor());
		return JSONArray.fromObject(obj, jsonConfig);
	}

	/**
	 * 将对象转换成JSONArray,已经配置JsonConfig
	 * 
	 * @param obj
	 *            待转换的数组，集合等对象
	 * @param jsonConfig
	 *            已经配置过的JsonConfig对象
	 * @return JSONArray，转换后的json数组
	 */
	public static JSONArray toJSONArray(Object obj, JsonConfig jsonConfig) {
		return JSONArray.fromObject(obj, jsonConfig);
	}

	/**
	 * 将对象转换成JSONObject,未配置JsonConfig
	 * 
	 * @param obj
	 *            待转换的对象
	 * @return JSONObject，转换后的json对象
	 */
	@SuppressWarnings("rawtypes")
	public static JSONObject toJSONObject(Object obj) {
		JsonConfig jsonConfig = defaultValueProcessor();
		jsonConfig.registerJsonValueProcessor(Date.class,
				new DateJsonValueProcessor());
		Class sqlDate = java.sql.Date.class;
		jsonConfig.registerJsonValueProcessor(sqlDate,
				new DateJsonValueProcessor());
		return JSONObject.fromObject(obj, jsonConfig);
	}

	/**
	 * 转化成jsonObject的格式，其中有些属性不需要被转化
	 * 
	 * @param obj
	 *            要转化的对象
	 * @param properties
	 *            不需要转化的object的属性
	 * @return 返回json格式
	 */
	@SuppressWarnings("rawtypes")
	public static JSONObject toJSONObjectExcludes(Object obj,
			String[] properties) {
		JsonConfig jsonConfig = defaultValueProcessor();
		jsonConfig.setExcludes(properties);
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class,
				new DateJsonValueProcessor());
		Class sqlDate = java.sql.Date.class;
		jsonConfig.registerJsonValueProcessor(sqlDate,
				new DateJsonValueProcessor());
		return JSONObject.fromObject(obj, jsonConfig);
	}

	/**
	 * 将JSON字符串转换成java对象，其中有些属性不需要被转化
	 * 
	 * @param json
	 *            json 格式字符串
	 * @param clazz
	 *            需要转换的java对象
	 * @param properties
	 *            不需要转化的object的属性
	 * @return 返回得到的java对象
	 */
	@SuppressWarnings("unchecked")
	public static <T> T toBeanFromJson(String json, Class<T> clazz,
			String[] properties) {
		JSONObject jsonObject = JSONUtil.toJSONObjectExcludes(json, properties);
		return (T) JSONObject.toBean(jsonObject, clazz);
	}

	/**
	 * 将JSON字符串转换成java对象
	 * 
	 * @param json
	 *            json 格式字符串
	 * @param clazz
	 *            需要转换的java对象
	 * @return 返回得到的java对象
	 */
	@SuppressWarnings("unchecked")
	public static <T> T toBeanFromJson(String json, Class<T> clazz) {
		JSONObject jsonObject = JSONUtil.toJSONObject(json);
		return (T) JSONObject.toBean(jsonObject, clazz);
	}

	/**
	 * 将JSON字符串转换成java集合，指定集合中数据所对应的java对象
	 * 
	 * @param json
	 *            json字符串
	 * @param clazz
	 *            需要转换的java对象
	 * @return 返回得到的java集合
	 */
	public static Collection<?> toCollectionFromJson(String json, Class<?> clazz) {
		JSONArray jsonArray = JSONUtil.toJSONArray(json);
		return (Collection<?>) JSONArray.toCollection(jsonArray, clazz);
	}

	/**
	 * 将JSON字符串转换成java集合
	 * 
	 * @param json
	 *            json字符串
	 * @return 返回得到的java集合
	 */
	public static Collection<?> toCollectionFromJson(String json) {
		JSONArray jsonArray = JSONUtil.toJSONArray(json);
		return (Collection<?>) JSONArray.toCollection(jsonArray);
	}

	/**
	 * 将JSON格式字符串转成Map
	 * 
	 * @param json
	 *            JSON字符串
	 * @return 返回解析后的Map
	 */
	public static Map<?, ?> toMapFromJson(String json) {
		JSONObject jsonObject = JSONUtil.toJSONObject(json);
		return (Map<?, ?>) JSONObject.toBean(jsonObject, Map.class);
	}

	/**
	 * 将JSON格式字符串转成Map,指定JSON字符串中数据的java对象类型
	 * 
	 * @param json
	 *            JSON字符串
	 * @param classMap
	 *            json字符串数据中德java对象类型
	 * @return 返回解析后的Map
	 */
	public static Map<?, ?> toMapFromJson(String json,
			Map<String, Class<?>> classMap) {
		JSONObject jsonObject = JSONUtil.toJSONObject(json);
		return (Map<?, ?>) JSONObject.toBean(jsonObject, Map.class, classMap);
	}

	/**
	 * 将JSON格式字符串转成Map
	 * 
	 * @param obj
	 *            java对象
	 * @return 返回解析后的Map
	 */
	public static Map<?, ?> toMapFromObject(Object obj) {
		JSONObject jsonObject = JSONUtil.toJSONObject(JSONUtil
				.toJSONObject(obj));
		return (Map<?, ?>) JSONObject.toBean(jsonObject, Map.class);
	}

	/**
	 * 将JSON格式字符串转成Map，转换中将不需要转换的对象过滤掉
	 * 
	 * @param obj
	 *            java对象
	 * @param properties
	 *            对象中不需要被转换的属性
	 * @return 返回解析后的Map
	 */
	public static Map<?, ?> toMapFromObject(Object obj, String[] properties) {
		JSONObject jsonObject = JSONUtil.toJSONObject(JSONUtil
				.toJSONObjectExcludes(obj, properties));
		return (Map<?, ?>) JSONObject.toBean(jsonObject, Map.class);
	}

	/**
	 * 将对象转换成JSONObject,已经配置JsonConfig
	 * 
	 * @param obj
	 *            待转换的数组，集合等对象
	 * @param jsonConfig
	 *            已经配置过的JsonConfig对象
	 * @return JSONObject，转化的json对象
	 */
	public static JSONObject toJSONObject(Object obj, JsonConfig jsonConfig) {
		return JSONObject.fromObject(obj, jsonConfig);
	}

	/**
	 * 将一段脚本字符串转换成JSONFunction
	 * 
	 * @param script
	 *            待转换的脚本字符串
	 * @return JSONFunction
	 */
	public static JSONFunction parseFunctionScript(String script) {
		return JSONFunction.parse(script);
	}

	/**
	 * 从动态Bean中得到属性的值
	 * 
	 * @param bean
	 *            动态Bean
	 * @param property
	 *            属性名称
	 */
	public static String getDynaBeanValue(DynaBean bean, String property) {

		try {
			Object propertyValue = bean.get(property);

			if (propertyValue != null)
				return propertyValue.toString();

			return null;

		} catch (Exception e) {
			return null;
		}

	}

	/**
	 * 默认处理
	 * 
	 * @return json配置
	 */
	private static JsonConfig defaultValueProcessor() {
		JsonConfig jsonConfig = new JsonConfig();
		OurDefaultValueProcessor odv = new OurDefaultValueProcessor();
		jsonConfig.registerDefaultValueProcessor(Long.class, odv);
		jsonConfig.registerDefaultValueProcessor(Integer.class, odv);
		jsonConfig.registerDefaultValueProcessor(Double.class, odv);
		jsonConfig.registerDefaultValueProcessor(Float.class, odv);
		jsonConfig.registerDefaultValueProcessor(Short.class, odv);
		return jsonConfig;
	}

}