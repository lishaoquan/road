package com.contact.model;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.contact.product.util.TreeGridNode;
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

	public static TreeGridNode assembleCategoryTree(ProductCategory parent,
			List<ProductCategory> categoryList) {
		TreeGridNode node = new TreeGridNode(parent.getId(), parent.getName());
		node.setDescription(parent.getDescription());
		node.setImageurl(parent.getImageurl());
		for (ProductCategory category : categoryList) {
			if (parent.getId().equals(category.getParentId())) {
				node.addChild(assembleCategoryTree(category,categoryList));
			}
		}
		return node;
	}
}
