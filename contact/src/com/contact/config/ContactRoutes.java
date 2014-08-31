package com.contact.config;

import com.contact.login.controller.LoginController;
import com.contact.login.controller.LoginOutController;
import com.contact.login.controller.ToLoginController;
import com.contact.menu.controller.MenuController;
import com.contact.role.controller.RoleController;
import com.contact.test.controlller.HelloWordController;
import com.contact.user.controller.UserController;
import com.jfinal.config.Routes;

/**
 * 合同中的路由配置
 * @author Administrator
 *
 */
public class ContactRoutes extends Routes {
	public void config() {
		add("/hello", HelloWordController.class);
		add("/home", LoginController.class);
		add("/loginOut", LoginOutController.class);
		add("/menu", MenuController.class);
		add("/role", RoleController.class);
		add("/user", UserController.class);
		add("/", ToLoginController.class);
	}
}