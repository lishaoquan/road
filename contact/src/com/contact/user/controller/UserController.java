/**
 * 
 */
package com.contact.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.contact.user.db.RoleUserDao;
import com.contact.user.db.UserDao;
import com.contact.user.model.RoleUser;
import com.contact.user.model.User;
import com.contact.util.Result;
import com.contact.util.UUIDUtil;
import com.jfinal.core.Controller;

/**
 * 用户管理的控制器
 * @author Administrator
 *
 */
public class UserController extends Controller{

	/**
	 * 查询所有的用户信息
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void index(){
		List<User> userList =  UserDao.findAllUsers();
		Map map = new HashMap();
		map.put("total", userList.size());
		map.put("rows", userList);
		renderJson(map);
	}
	
	/**
	 * 新增一个角色信息
	 */
	public void add(){
		String userId = getPara("userId");
		String userName = getPara("userName");
		String email = getPara("email");
		String roleId = getPara("role");
		User user = new User();
		String id = UUIDUtil.generate();
		user.setId(id);
		user.setUserName(userName);
		user.setUserId(userId);
		user.setEmail(email);
		user.setPassword("123456");//默认密码
		Result result = new Result();
		try {
			//新增用户信息
			UserDao.saveUser(user);
			//新增角色用户信息
			RoleUser roleUser = new RoleUser();
			roleUser.setId(UUIDUtil.generate());
			roleUser.setRoleId(roleId);
			roleUser.setUserId(id);
			RoleUserDao.saveRoleUser(roleUser);
			result.setCode("0");
			result.setName("新增");
			result.setMsg("新增成功");
			renderJson(result);
		} catch (Exception e) {
			result.setCode("1");
			result.setName("新增");
			result.setMsg("新增失败");
			renderJson(result);
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除一个用户信息
	 */
	public void remove(){
		String ids = getPara("id");
		Result result = new Result();
		try {
			String[] idsArr = ids.split("-");
			for (String id : idsArr) {
				//删除用户
				UserDao.removeUser(id);
				//删除角色用户
				RoleUserDao.removeUser(id);
			}
			result.setCode("0");
			result.setName("删除");
			result.setMsg("删除成功");
			renderJson(result);
		} catch (Exception e) {
			result.setCode("1");
			result.setName("删除");
			result.setMsg("删除失败");
			renderJson(result);
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新一个用户信息
	 */
	public void update(){
		String userName = getPara("userName");
		String email = getPara("email");
		String roleId = getPara("role");
		String id = getPara("id");//用户主键
		RoleUserDao.removeUser(id);//将该用户的角色信息清空
		User user = new User();
		user.setId(id);
		user.setUserName(userName);
		user.setEmail(email);
		Result result = new Result();
		try {
			//更新用户信息
			UserDao.updateUser(user);
			//新增角色用户信息
			RoleUser roleUser = new RoleUser();
			roleUser.setId(UUIDUtil.generate());
			roleUser.setRoleId(roleId);
			roleUser.setUserId(id);
			RoleUserDao.saveRoleUser(roleUser);
			result.setCode("0");
			result.setName("修改");
			result.setMsg("修改成功");
			renderJson(result);
		} catch (Exception e) {
			result.setCode("1");
			result.setName("修改");
			result.setMsg("修改失败");
			renderJson(result);
			e.printStackTrace();
		}
	}
}
