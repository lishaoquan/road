/**
 * 
 */
package com.contact.login.controller;

import java.util.ArrayList;
import java.util.List;

import com.contact.menu.dao.MenuDao;
import com.contact.menu.model.Menu;
import com.contact.user.db.UserDao;
import com.contact.user.model.User;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

/**
 * 登录操作的控制器
 * @author Administrator
 *
 */
public class LoginController extends Controller{
	/**
	 * 登录处理操作
	 */
	@ActionKey("/home/login")
	public void login() {
		//模拟用户登录
		String role = getPara("role");
		String username = getPara("username");
		String password = getPara("password");
		//在登录页面操作之前将session信息清空
		removeSessionAttr("fromLogin");
		removeSessionAttr("userInfo");
		User user = UserDao.findUserByUserId(username);
		if (null == user || !password.equals(user.getPassword())){
			setSessionAttr("fromLogin",true);
			redirect("/login.jsp");
			return;
		}
		//如果用户通过验证，则将用户信息设置到session中
		setSessionAttr("userInfo",user);
		//这里从数据库中获取菜单信息并进行组装，暂时这里获取所有的菜单
		//后面会根据登录用户的角色进行菜单的过滤
		List<Menu> mList = MenuDao.getAllMenu();
		mList = Menu.assembleSystemUserMenu(mList);
		setSessionAttr("menuInfo", mList);
		redirect("/pages/index.jsp");
	}
}
