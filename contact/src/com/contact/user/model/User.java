/**
 * 
 */
package com.contact.user.model;

import java.io.Serializable;

/**
 * �û�ģ��
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class User implements Serializable{
	
	//����
    private String id;
    
    //�û�����
    private String userName;
    
    //��¼��
    private String userId;
    
    //����
    private String password;
    
    //Email��ַ
    private String email;

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
}
