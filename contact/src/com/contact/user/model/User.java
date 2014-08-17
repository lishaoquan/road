/**
 * 
 */
package com.contact.user.model;

import java.io.Serializable;
import java.util.List;

import com.contact.role.model.Role;

/**
 * 用户模型
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class User implements Serializable{
	
	//主键
    private String id;
    
    //用户姓名
    private String userName;
    
    //登录名
    private String userId;
    
    //密码
    private String password;
    
    //Email地址
    private String email;
    
    //用户角色集合
    private List<Role> role;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Role> getRole() {
		return role;
	}

	public void setRole(List<Role> role) {
		this.role = role;
	}
}
