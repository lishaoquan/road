/**
 * 
 */
package com.contact.menu.controller;

import java.util.List;

import net.sf.json.JSONArray;

import com.contact.menu.dao.MenuDao;
import com.contact.menu.model.Menu;
import com.contact.util.TreeNode;
import com.jfinal.core.Controller;

/**
 * 菜单控制器处理类
 * @author Administrator
 *
 */
public class MenuController extends Controller{

	public void index() {
		//这里需要根据用户角色获取菜单信息，暂时这里先获取所有的菜单信息
		List<Menu> menuList = MenuDao.getAllMenu();
		Menu menu = new Menu();
		for (Menu tempMenu : menuList) {
			if ("-1".equals(tempMenu.getParentId())) {
				menu = tempMenu;
			}
		}
		
		Menu.assembleMenu(null, menuList);
		TreeNode treeNode = Menu.assembleMenuNode(menu);
		Menu.assembleMenuTreeNode(menu, treeNode);
		JSONArray json = treeNode.toJsonArrayOfNoChecked();
		renderText(json.toString());
	}
}
