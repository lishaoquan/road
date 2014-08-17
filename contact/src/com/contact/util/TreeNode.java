package com.contact.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import net.sf.json.JSONArray;

/**
 * ���ڱ�ʾjquery�е����νṹ�ı�����ʽ
 * @author Administrator
 *
 */
public class TreeNode implements Comparable<TreeNode> {
	/**
	 * �ڵ����ʾֵ
	 */
	private String text;

	/**
	 * �ڵ��id
	 */
	private String id;

	/**
	 * �ýڵ��Ƿ���Ҷ��
	 */
	private Boolean leaf = new Boolean(true);

	/**
	 * �ڵ����������
	 */
	private Map<String, Object> otherProperty = new HashMap<String, Object>();

	/**
	 * �ڵ���ӽڵ��б�
	 */
	private Set<TreeNode> children = new TreeSet<TreeNode>();

	/**
	 * ���ڵ��Ƿ�ѡ��
	 */
	private Boolean checked = new Boolean(false);

	/**
	 * ���������ֵ(ֻ�ṩInteger��String)
	 */
	private Object sortValue;

	/**
	 * �ڵ�ͼ��
	 */
	private String icon;

	/**
	 * ����
	 */
	public static String SORT_STARATEGY_DESC = "desc";

	/**
	 * ����
	 */
	public static String SORT_STARATEGY_ASC = "asc";

	/**
	 * ѡ��
	 */
	public static String CHECKED_NAME = "checked";

	/**
	 * �������
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
	 * �����ӽڵ�
	 * 
	 * @param treeNode
	 *            �ӽڵ�Node
	 */
	public void addChild(TreeNode treeNode) {
		leaf = new Boolean(false);
		this.children.add(treeNode);
	}
	
	/**
	 * �������ڵ�Ķ������ԣ�������������ֵ�Ǵ����otherProperty Map������
	 * 
	 * @param name
	 *            ������
	 * @param value
	 *            ���Ե�ֵ
	 */
	public void addProperty(String name, Object value) {
		this.otherProperty.put(name, value);
	}

	/**
	 * ���name����Ӧ��ֵ
	 * 
	 * @param name
	 *            ������
	 * @return ����ֵ
	 */
	public Object getProperty(String name) {
		return this.otherProperty.get(name);
	}
	
	/**
	 * ���������ֵ(�ַ���)
	 * 
	 * @param sortValue
	 *            �����ֵ
	 */
	public void setSortValueString(String sortValue) {
		this.setSortValue(sortValue);
	}

	/**
	 * ���������ֵ(����)
	 * 
	 * @param intValue
	 *            �����ֵ
	 */
	public void setSortValueInteger(int intValue) {
		this.setSortValue(new Integer(intValue));
	}

	/**
	 * �õ����ε�����ֵ
	 * 
	 * @return -1
	 */
	public int getSortValueInteger() {
		return -1;
	}

	/**
	 * �õ��ַ������͵�����ֵ
	 * 
	 * @return ""
	 */
	public String getSortValueString() {
		return "";
	}

	/**
	 * �ݹ����ָ����������ڵ㣬������������Result���������
	 * 
	 * @param node
	 *            ���ڵ�
	 * @param code
	 *            �ڵ����
	 * @param result
	 *            Result�������
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
	 * ���ڵ�ת�ɴ��и�ѡ���ܵĽڵ�
	 * 
	 * @return JSONArray json����
	 */
	public JSONArray toJsonArrayOfChecked() {
		return JSONUtil.toJSONArray(this);
	}

	/**
	 * ���ڵ�ת��û�и�ѡ���ܵĽڵ�
	 * 
	 * @return JSONArray json����
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

		// ���û����������������
		if (thisSortValue == null || otherSortValue == null)
			return -1;

		int compareValue = -1;

		// �������������ַ���
		if (thisSortValue instanceof String) {
			compareValue = ((String) this.getSortValue())
					.compareTo((String) tempTreeNode.getSortValue());
		}

		// ����������������
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
