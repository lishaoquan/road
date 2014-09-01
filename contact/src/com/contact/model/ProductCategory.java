package com.contact.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.contact.util.TreeGridNode;
import com.contact.util.TreeNode;
import com.jfinal.plugin.activerecord.Model;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProductCategory extends Model<ProductCategory> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5798480113455707330L;
	public static final ProductCategory dao = new ProductCategory();
	private String id;
	private String name;
	private String description;
	private String imageurl;
	private String parentId;

	/**
	 * 获取所有的产品分类
	 * 
	 * @return
	 */
	public List<ProductCategory> getAllCategory() {
		return dao.find("select * from productcategory");
	}

	public static TreeNode assembleCategoryTree(ProductCategory parent,
			List<ProductCategory> categoryList) {
		TreeNode node = new TreeNode(parent.getId(), parent.getName());
		for (ProductCategory category : categoryList) {
			if (parent.getId().equals(category.getParentId())) {
				node.addChild(assembleCategoryTree(category,categoryList));
			}
		}
		return node;
	}

	public static List<TreeGridNode> assembleCategoryTreeGrid(List<ProductCategory> categoryList) {
		List<TreeGridNode> list = new ArrayList<TreeGridNode>();
		for (ProductCategory category : categoryList) {
			TreeGridNode node = new TreeGridNode(category.getId(), category.getName());
			node.set_parentId(category.getParentId());
			node.setDescription(category.getDescription());
			node.setImageurl(category.getImageurl());
			list.add(node);
		}
		return list;
	}
}
