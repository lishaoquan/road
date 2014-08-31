package com.contact.product.dao;


public class ProductCategoryDao {

//	public static List<ProductCategory> getAllProductCategory() {
//		List<ProductCategory> ProductCategoryList = new ArrayList<ProductCategory>();
//		List<Record> list = Db.find("select * from " + Constant.TABLE_NAME.PRODUCT_CATEGORY
//				+ " order by sort asc");
//		if (null != list && !list.isEmpty()) {
//			for (Record record : list) {
//				ProductCategory ProductCategory = new ProductCategory();
//				ProductCategory.setId(record.getStr("id"));
//				ProductCategory.setName(record.getStr("name"));
//				ProductCategory.setParentId(record.getStr("parentId"));
//				ProductCategory.setDescription(record.getStr("description"));
//				ProductCategory.setImageurl(record.getStr("imageurl"));
//				ProductCategoryList.add(ProductCategory);
//			}
//		}
//		return ProductCategoryList;
//	}
}
