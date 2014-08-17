package com.contact.config;

import com.contact.login.controller.LoginController;
import com.contact.login.controller.ToLoginController;
import com.contact.test.controlller.HelloWordController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.render.ViewType;

public class ContactJFinalConfig extends JFinalConfig {

	/**
	 * 此方法用来配置 JFinal 常量值， 如开发模式常量 devMode 的配置
	 */
	public void configConstant(Constants me) {
		me.setDevMode(true);
		me.setViewType(ViewType.JSP);
	}

	/**
	 * 此方法用来配置 JFinal 访问路由， 如下代码配置了将”/hello”映射到 HelloController 这个控 制 器
	 */
	public void configRoute(Routes me) {
		me.add("/hello", HelloWordController.class);
		me.add("/home", LoginController.class);
		me.add("/", ToLoginController.class);
	}

	/**
	 * 此方法用来配置 JFinal 的 Plugin
	 */
	public void configPlugin(Plugins me) {
		loadPropertyFile("plugins.properties");
		// C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"),
		// getProperty("user"), getProperty("password"));
		// me.add(c3p0Plugin);
		// ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		// me.add(arp);
		// arp.addMapping("user", User.class);
	}

	/**
	 * 此方法用来配置 JFinal 的 Interceptor
	 */
	public void configInterceptor(Interceptors me) {
	}

	/**
	 * 此方法用来配置JFinal的Handler
	 */
	public void configHandler(Handlers me) {
	}
}