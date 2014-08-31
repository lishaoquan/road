/**
 * 
 */
package com.contact.login.controller;

import java.util.ArrayList;
import java.util.List;

import com.contact.menu.dao.MenuDao;
import com.contact.menu.model.Menu;
import com.contact.menu.model.RoleMenu;
import com.contact.role.dao.RoleMenuDao;
import com.contact.user.db.RoleUserDao;
import com.contact.user.db.UserDao;
import com.contact.user.model.RoleUser;
import com.contact.user.model.User;
import com.contact.util.Result;
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
		List<Menu> mList = new ArrayList<Menu>();//盛装菜单的容器
		//根据用户主键获取角色用户信息
		RoleUser roleUser = RoleUserDao.findRoleByUserId(user.getId());
		String roleId = "";
		if (null != roleUser){
			roleId = roleUser.getRoleId();
		}
		//根据角色获取角色菜单信息
		List<RoleMenu> rmList = RoleMenuDao.loadMenusByRole(roleId);
		List<String> menuIdList = new ArrayList<String>();//菜单主键的集合
		if (!rmList.isEmpty()){
			for (RoleMenu roleMenu : rmList) {
				String menuId = roleMenu.getMenuId();
				if (!menuIdList.contains(menuId)){
					menuIdList.add(menuId);
					Menu menu = MenuDao.findMenuById(menuId);
					mList.add(menu);//当前菜单
					if (!menuIdList.contains(menu.getParentId())){
						menuIdList.add(menu.getParentId());
						mList.add(MenuDao.findMenuById(menu.getParentId()));//父菜单
					}
				}
			}
			Menu rootMenu = MenuDao.findRootMenu();
			if (!menuIdList.contains(rootMenu.getMenuId())){
				menuIdList.add(rootMenu.getMenuId());
				mList.add(rootMenu);
			}
		}
		//如果用户通过验证，则将用户信息设置到session中
		user.setRole(roleId);
		setSessionAttr("userInfo",user);
		//这里从数据库中获取菜单信息并进行组装，暂时这里获取所有的菜单
		//后面会根据登录用户的角色进行菜单的过滤
//		mList = MenuDao.getAllMenu();
		mList = Menu.assembleSystemUserMenu(mList);
		setSessionAttr("menuInfo", mList);
		redirect("/pages/index.jsp");
	}
	
	@ActionKey("/home/verifyPwd")
	public void verifyPwd(){
		String password = getPara("oldPassword");
		User user = (User)getSessionAttr("userInfo");
		Result result = new Result();
		if (password.equals(user.getPassword())){
			result.setCode("0");
			result.setName("验证密码");
			result.setMsg("验证密码成功");
		}
		else{
			result.setCode("1");
			result.setName("验证密码");
			result.setMsg("旧密码和系统的不一致!");
		}
		renderJson(result);
	}
	
	@ActionKey("/home/modifyPwd")
	public void modifyPwd(){
		String password = getPara("newPassword");
		User user = (User)getSessionAttr("userInfo");
		UserDao.updatePassword(user.getId(), password);
		user.setPassword(password);
		setSessionAttr("userInfo",user);
		Result result = new Result();
		result.setCode("0");
		result.setName("修改密码");
		result.setMsg("修改密码成功");
		renderJson(result);
	}
}
