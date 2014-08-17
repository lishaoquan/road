/**
 * 
 */
package com.contact.login.controller;

import com.jfinal.core.Controller;

/**
 * 转向登录界面的控制器
 * @author Administrator
 *
 */
public class ToLoginController extends Controller {
	
	/**
	 * 转向登录界面（此默认）
	 */
	public void index() {
		renderJsp("/login.jsp");
		}
	
	/**
	 * 转向登录界面
	 */
	public void login() {
		renderJsp("/login.jsp");
		}
}
