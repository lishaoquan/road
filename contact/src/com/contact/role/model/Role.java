/**
 * 
 */
package com.contact.role.model;

import java.io.Serializable;

import com.contact.util.TreeNode;

/**
 * 系统中的角色模型
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class Role implements Serializable{
    
	//主键
	private String id;
	
	//角色名
	private String roleName;
	
	//排序
	private int sort;
	
	//角色描述
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
	
	/**
	 * 组装角色树节点
	 * @param role
	 * @return
	 */
	public static TreeNode assembleTreeNode(Role role){
		TreeNode roleNode = new TreeNode(role.getId(),role.getRoleName());
		roleNode.setSortValueInteger(role.getSort());
		return roleNode;
	}
}
