package com.contact.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

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
}
