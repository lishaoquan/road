package com.contact.model;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

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

}
