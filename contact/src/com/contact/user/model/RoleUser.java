/**
 * 
 */
package com.contact.user.model;

import java.io.Serializable;

/**
 * �û���Ӧ��ɫ�Ķ�Ӧģ��
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class RoleUser implements Serializable{

	//����
	private String id;
	
	//��ɫ����
	private String roleId;
	
	//�û�����
	private String userId;

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
