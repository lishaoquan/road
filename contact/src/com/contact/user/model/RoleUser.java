/**
 * 
 */
package com.contact.user.model;

import java.io.Serializable;

/**
 * 用户对应角色的对应模型
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class RoleUser implements Serializable{

	//主键
	private String id;
	
	//角色主键
	private String roleId;
	
	//用户主键
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
