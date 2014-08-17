package com.contact.config;

import com.contact.login.controller.LoginController;
import com.contact.login.controller.ToLoginController;
import com.contact.test.controlller.HelloWordController;
import com.jfinal.config.Routes;

/**
 * ��ͬ�е�·������
 * @author Administrator
 *
 */
public class ContactRoutes extends Routes {
	public void config() {
		add("/hello", HelloWordController.class);
		add("/home", LoginController.class);
		add("/", ToLoginController.class);
	}
}