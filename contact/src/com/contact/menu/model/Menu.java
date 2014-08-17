/**
 * 
 */
package com.contact.menu.model;

import java.io.Serializable;
import java.util.Set;
import java.util.TreeSet;

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
}
