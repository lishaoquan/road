package com.contact.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.contact.model.ProductCategory;
import com.contact.product.dao.ProductCategoryDao;
import com.contact.util.TreeNode;
import com.jfinal.core.Controller;

public class ProductCategoryController extends Controller {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void index() {
		List<ProductCategory> categoryList = ProductCategory.dao
				.getAllCategory();
		//获取产品分类类型根节点
		if (null == categoryList || categoryList.isEmpty()){
			tempRootProductCategory();
		}
		Map map = new HashMap();
		map.put("total", categoryList.size());
		map.put("rows", categoryList);
		renderJson(categoryList);
	}

	/**
	 * 构造顶级分类,用于页面展示
	 * 
	 * @return
	 */
	public ProductCategory getRootProductCategory(
			List<ProductCategory> categoryList) {
		for (ProductCategory category : categoryList) {
			if ("-1".equals(category.getParentId())) {
				return category;
			}
		}
		//如果没有获取到则说明数据库中不存在根产品分类类型
		return tempRootProductCategory();
	}

	/**
	 * 构建产品类型的根节点
	 * @return
	 */
	private ProductCategory tempRootProductCategory() {
		ProductCategory root = new ProductCategory();
		root.setId("0");
		root.setName("顶级分类");
		root.setDescription("模拟的产品顶级分类");
		root.setImageurl("");
		root.setParentId("-1");
		ProductCategoryDao.saveProductCategory(root);//存储根产品分类类型
		return root;
	}

}
