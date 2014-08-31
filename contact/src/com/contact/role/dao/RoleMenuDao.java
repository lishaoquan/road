/**
 * 
 */
package com.contact.role.dao;

import java.util.ArrayList;
import java.util.List;

import com.contact.constant.Constant;
import com.contact.menu.model.RoleMenu;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * 角色菜单的数据库操作
 * @author Administrator
 *
 */
public class RoleMenuDao {
    
	/**
	 * 新增角色菜单数据
	 */
	public static void saveRoleMenu(List<RoleMenu> list){
		if (null != list){
			for (RoleMenu roleMenu : list) {
				Record record = new Record().set("id",roleMenu.getId())
						.set("roleId", roleMenu.getRoleId()).set("menuid", roleMenu.getMenuId());
				Db.save(Constant.TABLE_NAME.ROLEMENU, record);
			}
		}
	}
	
	/**
	 * 根据角色获取对应的所有菜单信息
	 * @param roleId
	 */
	public static List<RoleMenu> loadMenusByRole(String roleId){
    	List<RoleMenu> roleMenuList = new ArrayList<RoleMenu>();
    	List<Record> list = Db.find("select * from " + Constant.TABLE_NAME.ROLEMENU + " where roleId = '" + roleId + "'");
    	if (null != list && !list.isEmpty()){
    		for (Record record : list) {
    			RoleMenu roleMenu = new RoleMenu();
    			roleMenu.setId(record.getStr("id"));
    			roleMenu.setRoleId(record.getStr("roleId"));
    			roleMenu.setMenuId(record.getStr("menuid"));
    			roleMenuList.add(roleMenu);
			}
    	}
    	return roleMenuList;
	}
	
    /**
     * 删除该角色的菜单信息
     * @param roleId
     */
    public static void removeRoleMenu(String roleId){
    	Db.deleteById(Constant.TABLE_NAME.ROLEMENU, "roleId",roleId);
    }
}
