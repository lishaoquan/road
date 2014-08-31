/**
 * 
 */
package com.contact.user.db;

import org.apache.commons.lang.StringUtils;

import com.contact.constant.Constant;
import com.contact.user.model.RoleUser;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * 用户角色管理数据库操作
 * @author Administrator
 *
 */
public class RoleUserDao {

	/**
	 * 保存用户角色信息
	 * @param roleUser
	 */
	public static void saveRoleUser(RoleUser roleUser){
		Record record = new Record().set("id",roleUser.getId())
				.set("roleId", roleUser.getRoleId())
				.set("userId", roleUser.getUserId());
		Db.save(Constant.TABLE_NAME.ROLEUSER, record);
	}
	
    /**
     * 根据用户删除角色用户信息
     * @param userId
     */
    public static void removeUser(String userId){
    	Db.deleteById(Constant.TABLE_NAME.ROLEUSER, "userId",userId);
    }
    
    /**
     * 根据用户主键获取角色信息
     * @param userId
     * @return
     */
	public static RoleUser findRoleByUserId(String userId){
		Record record = Db.findFirst("select * from " + Constant.TABLE_NAME.ROLEUSER + " where userId ='" + userId + "'");
		RoleUser roleUser = null;
		if (null != record && StringUtils.isNotBlank(record.getStr("id"))){
			roleUser = new RoleUser();
			roleUser.setId(record.getStr("id"));
			roleUser.setRoleId(record.getStr("roleId"));
			roleUser.setUserId(record.getStr("userId"));
		}
		return roleUser;
	}
}
