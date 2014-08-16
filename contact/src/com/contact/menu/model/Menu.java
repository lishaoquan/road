/**
 * 
 */
package com.contact.menu.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 菜单模型
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class Menu implements Serializable{
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
			childrenMenu = new HashSet<Menu>();
		}
		this.childrenMenu = childrenMenu;
	}

	public void addChildMenu(Menu childMenu){
		if (null == childrenMenu){
			childrenMenu = new HashSet<Menu>();
		}
		this.childrenMenu.add(childMenu);
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}
