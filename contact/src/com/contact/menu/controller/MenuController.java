/**
 * 
 */
package com.contact.menu.controller;

import java.util.List;

import net.sf.json.JSONArray;

import com.contact.menu.dao.MenuDao;
import com.contact.menu.model.Menu;
import com.contact.util.Result;
import com.contact.util.TreeNode;
import com.contact.util.UUIDUtil;
import com.jfinal.core.Controller;

/**
 * 菜单控制器处理类
 * @author Administrator
 *
 */
public class MenuController extends Controller{

	/**
	 * 查询所有的菜单Action
	 */
	public void index() {
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
	
	/**
	 * 菜单新增Action
	 */
	public void add(){
		String parentId= getPara("menuId");
		String menuName = getPara("menuName");
		String url = getPara("url");
		Menu menu = new Menu();
		menu.setMenuId(UUIDUtil.generate());
		menu.setMenuName(menuName);
		menu.setUrl(url);
		menu.setParentId(parentId);
		menu.setSort(MenuDao.getMaxSortInParentId(parentId));
		MenuDao.saveMenu(menu);
	}
	
	/**
	 * 更新菜单Action
	 */
	public void update(){
		String menuId= getPara("menuId");
		String menuName = getPara("menuName");
		String url = getPara("url");
		Menu menu = new Menu();
		menu.setMenuId(menuId);
		menu.setMenuName(menuName);
		menu.setUrl(url);
		MenuDao.updateMenu(menu);
	}
	
	/**
	 * 查询单条菜单信息Action
	 */
	public void loadMenu(){
		String menuId= getPara("menuId");
		Menu menu = MenuDao.findMenuById(menuId);
		renderJson(menu);
	}
	
	/**
	 * 删除菜单
	 */
	public void remove(){
		String menuId= getPara("menuId");
		MenuDao.removeMenu(menuId);
		Result result = new Result();
		result.setCode("0");
		result.setName("删除");
		result.setMsg("删除成功");
		renderJson(result);
	}
}
