package com.contact.product.controller;

import java.util.List;

import com.contact.model.ProductCategory;
import com.contact.product.dao.ProductCategoryDao;
import com.contact.util.Result;
import com.contact.util.TreeNode;
import com.jfinal.core.Controller;

public class ProductCategoryController extends Controller {

	public void index() {
		List<ProductCategory> categoryList = ProductCategoryDao
				.getAllCategory();
		//获取产品分类类型根节点
		ProductCategory root = getRootProductCategory(categoryList);
		if (null == categoryList || categoryList.isEmpty()){
			categoryList = ProductCategoryDao.getAllCategory();
		}
		TreeNode treeNode = ProductCategory.assembleCategoryTree(root, categoryList);
		renderText(treeNode.toJsonArrayOfNoChecked().toString());
	}

	public void treeGrig() {
		List<ProductCategory> categoryList = ProductCategoryDao
				.getAllCategory();
		//获取产品分类类型根节点
		if (null == categoryList || categoryList.isEmpty()){
			constructRootProductCategory();
			categoryList = ProductCategoryDao.getAllCategory();
		}
		renderJson(ProductCategory.assembleCategoryTreeGrid(categoryList));
	}
	
	public void save(){
		String name = getPara("name");
		String parentId = getPara("parentId");
		String description = getPara("description");
		ProductCategory productCategory = new ProductCategory();
		productCategory.setDescription(description);
		productCategory.setName(name);
		productCategory.setParentId(parentId);
		ProductCategoryDao.saveProductCategory(productCategory);
		Result result = new Result();
		result.setCode("0");
		result.setName("新增");
		result.setMsg("新增成功");
		renderJson(result);
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
		return constructRootProductCategory();
	}

	/**
	 * 构建产品类型的根节点
	 * @return
	 */
	private ProductCategory constructRootProductCategory() {
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
