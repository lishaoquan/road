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
	 * �˷����������� JFinal ����ֵ�� �翪��ģʽ���� devMode ������
	 */
	public void configConstant(Constants me) {
		me.setDevMode(true);
		me.setViewType(ViewType.JSP);
	}

	/**
	 * �˷����������� JFinal ����·�ɣ� ���´��������˽���/hello��ӳ�䵽 HelloController ����� �� ��
	 */
	public void configRoute(Routes me) {
		me.add("/hello", HelloWordController.class);
		me.add("/home", LoginController.class);
		me.add("/", ToLoginController.class);
	}

	/**
	 * �˷����������� JFinal �� Plugin
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
	 * �˷����������� JFinal �� Interceptor
	 */
	public void configInterceptor(Interceptors me) {
	}

	/**
	 * �˷�����������JFinal��Handler
	 */
	public void configHandler(Handlers me) {
	}
}