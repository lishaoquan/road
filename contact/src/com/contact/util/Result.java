/**
 * 
 */
package com.contact.util;

import java.io.Serializable;

/**
 * 封装返回结果
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class Result implements Serializable{

	//结果编码
	private String code;
	
	//结果名称
	private String name;
	
	//结果消息
	private String msg;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
