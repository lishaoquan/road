package com.contact.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import net.sf.json.JSONArray;

/**
 * 用于表示jquery中的树形结构的表现形式
 * @author Administrator
 *
 */
public class TreeNode implements Comparable<TreeNode> {
	/**
	 * 节点的显示值
	 */
	private String text;

	/**
	 * 节点的id
	 */
	private String id;

	/**
	 * 该节点是否是叶子
	 */
	private Boolean leaf = new Boolean(true);

	/**
	 * 节点的其他属性
	 */
	private Map<String, Object> otherProperty = new HashMap<String, Object>();

	/**
	 * 节点的子节点列表
	 */
	private Set<TreeNode> children = new TreeSet<TreeNode>();

	/**
	 * 树节点是否选中
	 */
	private Boolean checked = new Boolean(false);

	/**
	 * 用于排序的值(只提供Integer和String)
	 */
	private Object sortValue;

	/**
	 * 节点图标
	 */
	private String icon;

	/**
	 * 降序
	 */
	public static String SORT_STARATEGY_DESC = "desc";

	/**
	 * 升序
	 */
	public static String SORT_STARATEGY_ASC = "asc";

	/**
	 * 选中
	 */
	public static String CHECKED_NAME = "checked";

	/**
	 * 排序策略
	 */
	private String sortStrategy = SORT_STARATEGY_ASC;
	
	public String getText() {
		return text;
	}



	public void setText(String text) {
		this.text = text;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public Boolean getLeaf() {
		return leaf;
	}



	public void setLeaf(Boolean leaf) {
		this.leaf = leaf;
	}



	public Map<String, Object> getOtherProperty() {
		return otherProperty;
	}



	public void setOtherProperty(Map<String, Object> otherProperty) {
		this.otherProperty = otherProperty;
	}



	public Set<TreeNode> getChildren() {
		return children;
	}



	public void setChildren(Set<TreeNode> children) {
		this.children = children;
	}



	public Boolean getChecked() {
		return checked;
	}



	public void setChecked(Boolean checked) {
		this.checked = checked;
	}



	public Object getSortValue() {
		return sortValue;
	}



	public void setSortValue(Object sortValue) {
		this.sortValue = sortValue;
	}



	public String getIcon() {
		return icon;
	}



	public void setIcon(String icon) {
		this.icon = icon;
	}



	public String getSortStrategy() {
		return sortStrategy;
	}



	public void setSortStrategy(String sortStrategy) {
		this.sortStrategy = sortStrategy;
	}

	/**
	 * 加入子节点
	 * 
	 * @param treeNode
	 *            子节点Node
	 */
	public void addChild(TreeNode treeNode) {
		leaf = new Boolean(false);
		this.children.add(treeNode);
	}
	
	/**
	 * 增加树节点的额外属性，属性名和属性值是存放在otherProperty Map集合中
	 * 
	 * @param name
	 *            属性名
	 * @param value
	 *            属性的值
	 */
	public void addProperty(String name, Object value) {
		this.otherProperty.put(name, value);
	}

	/**
	 * 获得name所对应的值
	 * 
	 * @param name
	 *            属性名
	 * @return 属性值
	 */
	public Object getProperty(String name) {
		return this.otherProperty.get(name);
	}
	
	/**
	 * 设置排序的值(字符串)
	 * 
	 * @param sortValue
	 *            排序的值
	 */
	public void setSortValueString(String sortValue) {
		this.setSortValue(sortValue);
	}

	/**
	 * 设置排序的值(整型)
	 * 
	 * @param intValue
	 *            排序的值
	 */
	public void setSortValueInteger(int intValue) {
		this.setSortValue(new Integer(intValue));
	}

	/**
	 * 得到整形的排序值
	 * 
	 * @return -1
	 */
	public int getSortValueInteger() {
		return -1;
	}

	/**
	 * 得到字符串类型的排序值
	 * 
	 * @return ""
	 */
	public String getSortValueString() {
		return "";
	}

	/**
	 * 递归查找指定编码的树节点，并将结果存放在Result结果对象中
	 * 
	 * @param node
	 *            树节点
	 * @param code
	 *            节点编码
	 * @param result
	 *            Result结果对象
	 */
	public void lookTreeNode(TreeNode node, String code, Map<Object,Object> result) {

		if (node.getId().equals(code)) {
			result.put(code, node);
		} else {

			for (Iterator<TreeNode> it = node.getChildren().iterator(); it.hasNext();) {
				TreeNode tempNode = it.next();
				lookTreeNode(tempNode, code, result);
			}

		}
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
	
	@Override
	public int compareTo(TreeNode o) {
		
		if (o == null)
			return -1;

		TreeNode tempTreeNode = o;

		Object thisSortValue = this.getSortValue();
		Object otherSortValue = tempTreeNode.getSortValue();

		// 如果没有设置则任意排序
		if (thisSortValue == null || otherSortValue == null)
			return -1;

		int compareValue = -1;

		// 如果排序策略是字符串
		if (thisSortValue instanceof String) {
			compareValue = ((String) this.getSortValue())
					.compareTo((String) tempTreeNode.getSortValue());
		}

		// 如果排序策略是整型
		if (thisSortValue instanceof Integer) {
			compareValue = ((Integer) this.getSortValue())
					.compareTo((Integer) tempTreeNode.getSortValue());
		}

		if (sortStrategy.equals(SORT_STARATEGY_ASC))
			return compareValue;
		if (sortStrategy.equals(SORT_STARATEGY_DESC))
			return -compareValue;

		return compareValue;
	}

}
