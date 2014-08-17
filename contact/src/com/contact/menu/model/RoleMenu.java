/**
 * 
 */
package com.contact.menu.model;

/**
 * 角色菜单对应模型
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class RoleMenu implements java.io.Serializable{

	//主键
	private String id;
	
	//角色主键
	private String roleId;
	
	//菜单主键
	private String menuId;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
}
