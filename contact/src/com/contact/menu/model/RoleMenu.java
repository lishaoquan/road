/**
 * 
 */
package com.contact.menu.model;

/**
 * ��ɫ�˵���Ӧģ��
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class RoleMenu implements java.io.Serializable{

	//����
	private String id;
	
	//��ɫ����
	private String roleId;
	
	//�˵�����
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
