/**
 * 
 */
package com.contact.menu.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.contact.util.TreeNode;

/**
 * 菜单模型
 * @author Administrator
 *
 */
@SuppressWarnings({ "serial", "rawtypes" })
public class Menu implements Serializable, Comparable{
	//主键
    private String menuId;
    
    //菜单名称
    private String menuName;
    
    //排序
    private int sort;
    
    //父节点ID
    private String parentId;
    
    //父菜单对象
    private Menu parentMenu;
    
    //所有的子菜单列表
    private Set<Menu> childrenMenu;
    
    //菜单链接
    private String url;
    
	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public Menu getParentMenu() {
		return parentMenu;
	}

	public void setParentMenu(Menu parentMenu) {
		this.parentMenu = parentMenu;
	}

	public Set<Menu> getChildrenMenu() {
		return childrenMenu;
	}

	public void setChildrenMenu(Set<Menu> childrenMenu) {
		if (null == childrenMenu){
			childrenMenu = new TreeSet<Menu>();
		}
		this.childrenMenu = childrenMenu;
	}

	public void addChildMenu(Menu childMenu){
		if (null == childrenMenu){
			childrenMenu = new TreeSet<Menu>();
		}
		this.childrenMenu.add(childMenu);
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public int compareTo(Object o) {
		if (!(o instanceof Menu)) {
			throw new RuntimeException("在 Menu 类中的compareTo方法参数的类型不匹配");
		}

		Menu temp = (Menu) o;
		return String.valueOf(this.sort).compareTo(
				String.valueOf(temp.getSort()));
	}
	
	/**
	 * 拷贝该对象
	 * 
	 * @return 返回该对象的拷贝
	 */
	public Menu cloneMenu() {
		Menu menu = new Menu();
		menu.setMenuId(menuId);
		menu.setMenuName(menuName);
		menu.setParentId(parentId);
		menu.setSort(sort);
		menu.setUrl(url);
		return menu;
	}
	
	/**
	 * 组装菜单
	 * @param menu
	 * @param menuList
	 */
	public static void assembleMenu(Menu menu,List<Menu> menuList){
		if(null == menu)
		{
			Iterator<Menu> it = menuList.iterator();
			while (it.hasNext())
			{
				Menu m = (Menu)it.next();
				if (m.getParentId().equals("-1"))//根节点
				{
					menu =  m;
				}
			}
		}
		// 循环所有的节点找到子节点
		for (Iterator<Menu> it = menuList.iterator(); it.hasNext();)
		{
			Menu tempMenu =  it.next();
			if (tempMenu.getParentId().equals(menu.getMenuId())) 
			{
				menu.addChildMenu(tempMenu);
				tempMenu.setParentMenu(menu);
				assembleMenu(tempMenu, menuList);
			}
		}
	}
	
	/**
	 * 组装菜单节点
	 * @param menu
	 * @return
	 */
	public static TreeNode assembleMenuNode(Menu menu)
	{
		TreeNode menuNode = new TreeNode(menu.getMenuId(),menu.getMenuName());
		menuNode.setSortValueInteger(menu.getSort());
		menuNode.addProperty("parentid", menu.getParentId());
		menuNode.addProperty("url", menu.getUrl());
		return menuNode;
	}
	
	/**
	 * 组装菜单树形节点
	 * @param menu
	 * @param treeNode
	 */
	public static void assembleMenuTreeNode(Menu menu,TreeNode treeNode)
	{
		if (null == menu.getChildrenMenu())
		{
			return;
		}
		for (Iterator<Menu> it = menu.getChildrenMenu().iterator(); it.hasNext();) 
		{
			Menu m = (Menu) it.next();
			TreeNode menuNode = assembleMenuNode(m);
			treeNode.addChild(menuNode);
			assembleMenuTreeNode(m, menuNode);
		}
	}
	
	public static List<Menu> assembleSystemUserMenu(List<Menu> menuList){
		List<Menu> mList = new ArrayList<Menu>();
		if (null != menuList && !menuList.isEmpty()){
			String rootId = "";
			//现获取顶级菜单
			for (Menu menu : menuList) {
				if (menu.getParentId().equals("-1")){
					rootId = menu.getMenuId();
					break;
				}
			}
			//获取所有的一级菜单
			for (Menu menu : menuList) {
				if (rootId.equals(menu.getParentId())){
					Menu first = menu;
					//二级菜单
					for (Menu menu2 : menuList) {
						if (first.getMenuId().equals(menu2.getParentId())){
							Menu second = menu2;
							//三级菜单
							for (Menu menu3 : menuList) {
								second.addChildMenu(menu3);
							}
							first.addChildMenu(second);//将二级菜单设置一级菜单中
						}
					}
					mList.add(first);
				}
			}
		}
		
		return mList;
	}
}
