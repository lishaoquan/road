package com.contact.product.dao;

import java.util.List;

import com.contact.constant.Constant;
import com.contact.model.ProductCategory;
import com.contact.util.UUIDUtil;


public class ProductCategoryDao {

	/**
	 * 获取所有的产品分类
	 * 
	 * @return
	 */
	public static List<ProductCategory> getAllCategory() {
		return ProductCategory.dao.find("select * from productcategory");
	}
	
	/**
	 * 新增产品分类信息
	 * @param category
	 */
	public static void saveProductCategory(ProductCategory category){
		new ProductCategory().dao.set("id", UUIDUtil.generate()).set("name", category.getName())
		                          .set("description", category.getDescription())
		                          .set("imageurl", category.getImageurl())
		                          .set("parentId", category.getParentId()).save();
	}
	
	/**
	 * 根据主键删除产品分类信息
	 * @param id
	 */
	public static void removeProductCategory(String id){
		ProductCategory.dao.deleteById(id);
	}
	
	/**
	 * 根据产品父Id获取所有的子产品类型
	 * @param parentId
	 * @return list
	 */
	public static List<ProductCategory> getProductCategoryByParentId(String parentId){
		return ProductCategory.dao.find("select * from " + Constant.TABLE_NAME.PRODUCT_CATEGORY + " where parentId='" + parentId + "'");
	}
	
	/**
	 * 产品类型修改
	 * @param category
	 */
	public static void updateProductCategory(ProductCategory category){
		new ProductCategory().dao.set("id", category.getId()).set("name", category.getName())
							.set("description", category.getDescription())
							.set("imageurl", category.getImageurl()).update();
	}
}
