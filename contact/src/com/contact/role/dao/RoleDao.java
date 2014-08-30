/**
 * 
 */
package com.contact.role.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.contact.constant.Constant;
import com.contact.role.model.Role;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * 角色数据库操作
 * @author Administrator
 *
 */
public class RoleDao {

	/**
	 * 获取所有的角色信息
	 * @return
	 */
    public static List<Role> getAllRole(){
    	List<Role> roleList = new ArrayList<Role>();
    	List<Record> list = Db.find("select * from " + Constant.TABLE_NAME.ROLE + " order by sort desc");
    	if (null != list && !list.isEmpty()){
    		for (Record record : list) {
    			Role role = new Role();
    			role.setId(record.getStr("id"));
    			role.setRoleName(record.getStr("roleName"));
    			role.setSort(record.getInt("sort"));
    			role.setDesc(record.getStr("desc"));
    			roleList.add(role);
			}
    	}
    	return roleList;
    }
    
    /**
     * 新增一个角色
     * @param role
     */
    public static void saveRole(Role role){
		Record record = new Record().set("id",role.getId())
				.set("roleName", role.getRoleName()).set("desc", role.getDesc())
				.set("sort", role.getSort());
		Db.save(Constant.TABLE_NAME.ROLE, record);
    }
    
    /**
     * 更新角色信息
     * @param role
     */
    public static void updateRole(Role role){
    	String sql = "update " + Constant.TABLE_NAME.ROLE + " set roleName = '" + role.getRoleName()
    			+ "',`desc`='" + role.getDesc() + "' where id = '" + role.getId() + "'";
    	Db.update(sql);
    }
    
    /**
     * 根据主键删除角色信息
     * @param menuId
     */
    public static void removeRole(String id){
    	Db.deleteById(Constant.TABLE_NAME.ROLE, "id",id);
    }
    
    /**
     * 在角色下查找最大排序的几率并返回最大排序值
     * @return
     */
    public static int getMaxSortInRole(){
    	String sql = "sort in (select max(sort) from " + Constant.TABLE_NAME.ROLE + ")";
    	List<Record> roleList = Db.find("select * from " + Constant.TABLE_NAME.ROLE + " where " + sql);
    	int maxSort = 1;
    	if (null != roleList && !roleList.isEmpty()){
    		maxSort = roleList.get(0).getInt("sort") + 1;
    	}
    	return maxSort;
    }
    
	/**
	 * 根据主键获取角色信息
	 * @param id
	 * @return role
	 */
	public static Role findRoleById(String id){
		Record record = Db.findById(Constant.TABLE_NAME.ROLE,"id",id,"id,roleName,sort,desc");
		Role role = null;
		if (null != record && StringUtils.isNotBlank(record.getStr("id"))){
			role = new Role();
			role.setId(record.getStr("id"));
			role.setRoleName(record.getStr("roleName"));
			role.setSort(record.getInt("sort"));
			role.setDesc(record.getStr("desc"));
		}
		return role;
	}
}
