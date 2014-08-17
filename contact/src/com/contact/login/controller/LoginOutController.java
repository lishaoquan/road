/**
 * 
 */
package com.contact.login.controller;

import com.jfinal.core.Controller;

/**
 * 注销系统的控制器
 * @author Administrator
 *
 */
public class LoginOutController extends Controller{

	/**
	 * 退出登录
	 */
	public void index() {
		removeSessionAttr("userInfo");
		redirect("/login");
		}
	
}
