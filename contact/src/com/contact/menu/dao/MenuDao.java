/**
 * 
 */
package com.contact.menu.dao;

import java.util.ArrayList;
import java.util.List;

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
    	List<Record> list = Db.find("select * from " + Constant.TABLE_NAME.MENU);
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
}
