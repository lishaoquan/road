package com.contact.config;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.tx.TxByActionMethods;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;

/**
 * Jfinal�ĺ����࣬�����ṩ��������������õ�ͳһ���
 * @author Administrator
 *
 */
public class ContactJFinalConfig extends JFinalConfig {

	/**
	 * �˷����������� JFinal ����ֵ�� �翪��ģʽ���� devMode ������
	 */
	public void configConstant(Constants me) {
		loadPropertyFile("common.properties");
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setViewType(ViewType.JSP);
	}

	/**
	 * �˷����������� JFinal ����·�ɣ� ���´��������˽���/hello��ӳ�䵽 HelloController ����� �� ��
	 */
	public void configRoute(Routes me) {
		//ͳһ����·�ɷ�ʽ
		me.add(new ContactRoutes());
	}

	/**
	 * �˷����������� JFinal �� Plugin
	 */
	public void configPlugin(Plugins me) {
		//��������Դ
		 C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("db.url"),
		 getProperty("db.user"), getProperty("db.password"));
		 System.out.println("����Դ������Ϣ:" + getProperty("db.url"));
		 me.add(c3p0Plugin);
		 ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		 me.add(arp);
		// arp.addMapping("user", User.class);
	}

	/**
	 * �˷����������� JFinal �� Interceptor
	 */
	public void configInterceptor(Interceptors me) {
//		me.add(new TxByRegex(".*save.*"));
//		me.add(new TxByActionKeys("/test", "/other"));
		//�������ʽ������
		me.add(new TxByActionMethods("save", "update","remove","load"));
	}

	/**
	 * �˷�����������JFinal��Handler
	 */
	public void configHandler(Handlers me) {
	}
}