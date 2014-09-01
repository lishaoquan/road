package com.contact.util;

import java.io.Serializable;
import net.sf.json.JSONArray;

/**
 * 用于表示jquery中的树形表格结构的表现形式
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class TreeGridNode implements Serializable{
	/**
	 * 节点的显示值
	 */
	private String name;

	/**
	 * 节点的id
	 */
	private String id;
	
	/**
	 * 节点状态
	 */
	private String state;
	
	/**
	 * 父节点
	 */
	private String _parentId;

	/**
	 * 描述
	 */
	private String description;
	
	/**
	 * 图片连接
	 */
	private String imageurl;
	
	public TreeGridNode(String id, String name) {
		this.id = id;
		this.name = name;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String get_parentId() {
		return _parentId;
	}
	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	/**
	 * 将节点转成带有复选功能的节点
	 * 
	 * @return JSONArray json数组
	 */
	public JSONArray toJsonArrayOfChecked() {
		return JSONUtil.toJSONArray(this);
	}

	/**
	 * 将节点转成没有复选功能的节点
	 * 
	 * @return JSONArray json数组
	 */
	public JSONArray toJsonArrayOfNoChecked() {
		return JSONUtil.toJSONArrayExcludes(this, new String[] { "checked" });
	}
}
