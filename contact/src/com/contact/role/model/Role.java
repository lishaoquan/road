/**
 * 
 */
package com.contact.role.model;

import java.io.Serializable;

/**
 * ϵͳ�еĽ�ɫģ��
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class Role implements Serializable{
    
	//����
	private String id;
	
	//��ɫ��
	private String roleName;
	
	//����
	private int sort;
	
	//��ɫ����
	private String desc;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
}
