package com.contact.product.controller;

import java.util.List;

import net.sf.json.JSONArray;

import com.contact.model.ProductCategory;
import com.contact.util.TreeNode;
import com.jfinal.core.Controller;

public class ProductCategoryController extends Controller {

	public void index() {
		List<ProductCategory> categoryList = ProductCategory.dao
				.getAllCategory();
		ProductCategory root = getRootProductCategory(categoryList);
		TreeNode node = ProductCategory
				.assembleCategoryTree(root, categoryList);
		JSONArray json = node.toJsonArrayOfNoChecked();
		renderText(json.toString());
	}

	/**
	 * 构造顶级分类,用于页面展示
	 * 
	 * @return
	 */
	private ProductCategory getRootProductCategory(
			List<ProductCategory> categoryList) {
		for (ProductCategory category : categoryList) {
			if ("0".equals(category.getId())) {
				return category;
			}
		}
		return tempRootProductCategory();
	}

	private ProductCategory tempRootProductCategory() {
		ProductCategory root = new ProductCategory();
		root.setId("0");
		root.setName("顶级分类");
		root.setDescription("模拟的产品顶级分类");
		return root;
	}

}
