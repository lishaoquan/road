/**
 * 
 */
package com.contact.user.db;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.contact.constant.Constant;
import com.contact.user.model.RoleUser;
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
	
	/**
	 * 查询所有的用户信息
	 * @return
	 */
	public static List<User> findAllUsers(){
    	List<User> userList = new ArrayList<User>();
    	List<Record> list = Db.find("select * from " + Constant.TABLE_NAME.USER);
    	if (null != list && !list.isEmpty()){
    		for (Record record : list) {
    			User user = new User();
    			user.setId(record.getStr("id"));
    			RoleUser roleUser = RoleUserDao.findRoleByUserId(record.getStr("id"));
    			if (null != roleUser){
    				user.setRole(roleUser.getRoleId());
    			}
    			user.setEmail(record.getStr("email"));
    			user.setPassword(record.getStr("password"));
    			user.setUserId(record.getStr("userId"));
    			user.setUserName(record.getStr("userName"));
    			userList.add(user);
			}
    	}
    	return userList;
	}
	
	/**
	 * 新增用户信息
	 * @param user
	 */
	public static void saveUser(User user){
		Record record = new Record().set("id",user.getId())
				.set("email", user.getEmail()).set("password", user.getPassword())
				.set("userId", user.getUserId()).set("userName", user.getUserName());
		Db.save(Constant.TABLE_NAME.USER, record);
	}
	
    /**
     * 更新用户信息
     * @param user
     */
    public static void updateUser(User user){
    	String sql = "update " + Constant.TABLE_NAME.USER + " set userName = '" + user.getUserName()
    			+ "',email='" + user.getEmail() + "' where id = '" + user.getId() + "'";
    	Db.update(sql);
    }
    
    /**
     * 更新用户的密码
     */
    public static void updatePassword(String id,String password){
    	String sql = "update " + Constant.TABLE_NAME.USER + " set password = '" + password
    			+ "' where id = '" + id + "'";
    	Db.update(sql);
    }
    
    /**
     * 根据主键删除用户信息
     * @param id
     */
    public static void removeUser(String id){
    	Db.deleteById(Constant.TABLE_NAME.USER, "id",id);
    }
}
