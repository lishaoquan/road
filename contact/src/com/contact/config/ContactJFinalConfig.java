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
 * Jfinal的核心类，用于提供控制器，插件配置等统一入口
 * @author Administrator
 *
 */
public class ContactJFinalConfig extends JFinalConfig {

	/**
	 * 此方法用来配置 JFinal 常量值， 如开发模式常量 devMode 的配置
	 */
	public void configConstant(Constants me) {
		loadPropertyFile("common.properties");
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setViewType(ViewType.JSP);
	}

	/**
	 * 此方法用来配置 JFinal 访问路由， 如下代码配置了将”/hello”映射到 HelloController 这个控 制 器
	 */
	public void configRoute(Routes me) {
		//统一设置路由方式
		me.add(new ContactRoutes());
	}

	/**
	 * 此方法用来配置 JFinal 的 Plugin
	 */
	public void configPlugin(Plugins me) {
		//配置数据源
		 C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("db.url"),
		 getProperty("db.user"), getProperty("db.password"));
		 System.out.println("数据源连接信息:" + getProperty("db.url"));
		 me.add(c3p0Plugin);
		 ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		 me.add(arp);
		// arp.addMapping("user", User.class);
	}

	/**
	 * 此方法用来配置 JFinal 的 Interceptor
	 */
	public void configInterceptor(Interceptors me) {
//		me.add(new TxByRegex(".*save.*"));
//		me.add(new TxByActionKeys("/test", "/other"));
		//添加声明式事务处理
		me.add(new TxByActionMethods("save", "update","remove","load"));
	}

	/**
	 * 此方法用来配置JFinal的Handler
	 */
	public void configHandler(Handlers me) {
	}
}