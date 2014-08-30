/**
 * 
 */
package com.contact.role.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.contact.role.dao.RoleDao;
import com.contact.role.model.Role;
import com.contact.util.Result;
import com.contact.util.UUIDUtil;
import com.jfinal.core.Controller;

/**
 * 角色操作处理控制器
 * @author Administrator
 *
 */
public class RoleController extends Controller{

	/**
	 * 查询所有的角色信息
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void index(){
		//获取所有的角色信息
		List<Role> roleList = RoleDao.getAllRole();
		Map map = new HashMap();
		map.put("total", roleList.size());
		map.put("rows", roleList);
		renderJson(map);
	}
	
	/**
	 * 新增一个角色信息
	 */
	public void add(){
		String roleName = getPara("roleName");
		String desc = getPara("desc");
		Role role = new Role();
		role.setId(UUIDUtil.generate());
		role.setRoleName(roleName);
		role.setDesc(desc);
		role.setSort(RoleDao.getMaxSortInRole());
		Result result = new Result();
		try {
			RoleDao.saveRole(role);
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
	 * 删除一个角色信息
	 */
	public void remove(){
		String ids = getPara("id");
		Result result = new Result();
		try {
			String[] idsArr = ids.split("-");
			for (String id : idsArr) {
				RoleDao.removeRole(id);
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
	 * 更新一个角色信息
	 */
	public void update(){
		String roleName = getPara("roleName");
		String desc = getPara("desc");
		String id = getPara("id");
		Role role = new Role();
		role.setId(id);
		role.setRoleName(roleName);
		role.setDesc(desc);
		Result result = new Result();
		try {
			RoleDao.updateRole(role);
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
	
	/**
	 * 根据主键查询一个角色
	 */
	public void loadRole(){
		String id = getPara("id");
		Role role = RoleDao.findRoleById(id);
		renderJson(role);
	}
}
