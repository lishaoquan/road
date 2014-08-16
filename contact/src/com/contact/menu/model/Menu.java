/**
 * 
 */
package com.contact.menu.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * �˵�ģ��
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class Menu implements Serializable{
	//����
    private String menuId;
    
    //�˵�����
    private String menuName;
    
    //����
    private int sort;
    
    //���ڵ�ID
    private String parentId;
    
    //���˵�����
    private Menu parentMenu;
    
    //���е��Ӳ˵��б�
    private Set<Menu> childrenMenu;
    
    //�˵�����
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
