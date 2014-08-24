/**
 * 
 */
package com.contact.menu.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.contact.constant.Constant;
import com.contact.menu.model.Menu;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * 菜单dao操作
 * @author Administrator
 *
 */
public class MenuDao {
	
	/**
	 * 获取所有的菜单信息
	 * @return
	 */
    public static List<Menu> getAllMenu(){
    	List<Menu> menuList = new ArrayList<Menu>();
    	List<Record> list = Db.find("select * from " + Constant.TABLE_NAME.MENU + " order by sort asc");
    	if (null != list && !list.isEmpty()){
    		for (Record record : list) {
    			Menu menu = new Menu();
    			menu.setMenuId(record.getStr("menuid"));
    			menu.setMenuName(record.getStr("menuName"));
    			menu.setParentId(record.getStr("parentId"));
    			menu.setSort(record.getInt("sort"));
    			menu.setUrl(record.getStr("url"));
    			menuList.add(menu);
			}
    	}
    	return menuList;
    }
    
    /**
     * 新增一个菜单
     * @param menu
     */
    public static void saveMenu(Menu menu){
		Record record = new Record().set("menuid",menu.getMenuId())
				.set("menuName", menu.getMenuName()).set("parentId", menu.getParentId())
				.set("sort", menu.getSort()).set("url", menu.getUrl());
		Db.save(Constant.TABLE_NAME.MENU, record);
    }
    
    /**
     * 更新菜单信息
     * @param menu
     */
    public static void updateMenu(Menu menu){
    	String sql = "update " + Constant.TABLE_NAME.MENU + " set menuName = '" + menu.getMenuName()
    			+ "',url='" + menu.getUrl() + "' where menuid = '" + menu.getMenuId() + "'";
    	Db.update(sql);
    }
    
    /**
     * 根据主键删除菜单信息
     * @param menuId
     */
    public static void removeMenu(String menuId){
    	Db.deleteById(Constant.TABLE_NAME.MENU, "menuid",menuId);
    }
    
    /**
     * 在同一个父节点下查找最大排序的几率并返回最大排序值
     * @param parentId
     * @return
     */
    public static int getMaxSortInParentId(String parentId){
    	String sql = "sort in (select max(sort) from " + Constant.TABLE_NAME.MENU + " where parentId='" + parentId + "')";
    	List<Record> menuList = Db.find("select * from " + Constant.TABLE_NAME.MENU + " where " + sql);
    	int maxSort = 1;
    	if (null != menuList && !menuList.isEmpty()){
    		maxSort = menuList.get(0).getInt("sort") + 1;
    	}
    	return maxSort;
    }
    
	/**
	 * 根据主键获取菜单信息
	 * @param id
	 * @return menu
	 */
	public static Menu findMenuById(String menuId){
		Record record = Db.findById(Constant.TABLE_NAME.MENU,"menuid",menuId,"menuid,menuName,parentId,sort,url");
		Menu menu = null;
		if (null != record && StringUtils.isNotBlank(record.getStr("menuid"))){
			menu = new Menu();
			menu.setMenuId(record.getStr("menuid"));
			menu.setMenuName(record.getStr("menuName"));
			menu.setParentId(record.getStr("parentId"));
			menu.setSort(record.getInt("sort"));
			menu.setUrl(record.getStr("url"));
		}
		return menu;
	}
}
