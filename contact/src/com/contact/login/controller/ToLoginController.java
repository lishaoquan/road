/**
 * 
 */
package com.contact.login.controller;

import com.jfinal.core.Controller;

/**
 * ת���¼����Ŀ�����
 * @author Administrator
 *
 */
public class ToLoginController extends Controller {
	
	/**
	 * ת���¼���棨��Ĭ�ϣ�
	 */
	public void index() {
		renderJsp("/login.jsp");
		}
	
	/**
	 * ת���¼����
	 */
	public void login() {
		renderJsp("/login.jsp");
		}
}
