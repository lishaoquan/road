package com.contact.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.jfinal.plugin.activerecord.Model;

@Data
@EqualsAndHashCode(callSuper = false)
public class Product extends Model<Product> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2551599335381133431L;

	public static final Product dao = new Product();
	private String id;
	private String parentId;
	private String productCategory;
	private String part;
	private String image;
	private String code;
	private String item;
	private String name;
	private String dimensions;
	private String descriptionen;
	private String descriptioncn;
	private String color;
	private String qty;
	private String amount;
	private String cbm1;
	private String cbm2;
	private String gw1;
	private String gw2;
	private String workshop;
}
