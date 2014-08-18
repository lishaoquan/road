/**
 * 
 */
package com.contact.user.db;

import org.apache.commons.lang.StringUtils;

import com.contact.constant.Constant;
import com.contact.user.model.User;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * 提供用户操作数据库的工具
 * @author Administrator
 *
 */
public class UserDao {

	/**
	 * 根据主键获取用户信息
	 * @param id
	 * @return user
	 */
	public static User findUserById(String id){
		Record record = Db.findById(Constant.TABLE_NAME.USER,"id",id,"id,userName,email,userId,password");
		User user = null;
		if (null != record && StringUtils.isNotBlank(record.getStr("id"))){
			user = new User();
			user.setId(record.getStr("id"));
			user.setEmail(record.getStr("email"));
			user.setPassword(record.getStr("password"));
			user.setUserId(record.getStr("userId"));
			user.setUserName(record.getStr("userName"));
		}
		return user;
	}
	
	/**
	 * 根据用户登录名获取用户信息
	 * @param userId
	 * @return user
	 */
	public static User findUserByUserId(String userId){
		Record record = Db.findFirst("select * from " + Constant.TABLE_NAME.USER + " where userId ='" + userId + "'");
		User user = null;
		if (null != record && StringUtils.isNotBlank(record.getStr("id"))){
			user = new User();
			user.setId(record.getStr("id"));
			user.setEmail(record.getStr("email"));
			user.setPassword(record.getStr("password"));
			user.setUserId(record.getStr("userId"));
			user.setUserName(record.getStr("userName"));
		}
		return user;
	}
}
