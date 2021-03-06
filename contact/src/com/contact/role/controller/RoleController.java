/**
 * 
 */
package com.contact.role.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import net.sf.json.JSONArray;

import com.contact.menu.model.RoleMenu;
import com.contact.role.dao.RoleDao;
import com.contact.role.dao.RoleMenuDao;
import com.contact.role.model.Role;
import com.contact.util.Result;
import com.contact.util.TreeNode;
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
	 * 加载角色的下拉框
	 */
	public void roleCombo(){
		//获取所有的角色信息
		List<Role> roleList = RoleDao.getAllRole();
		renderJson(roleList);
	}
	
	/**
	 * 角色树
	 */
	public void roleTree(){
		List<Role> roleList = RoleDao.getAllRole();
		Role root = new Role();
		root.setId("-1");
		root.setRoleName("角色节点");
		root.setSort(-1);
		TreeNode rootNode = Role.assembleTreeNode(root);
        if (null != roleList){
        	for (Role role : roleList) {
        		TreeNode treeNode = Role.assembleTreeNode(role);
        		rootNode.addChild(treeNode);
			}
        }		
		JSONArray json = rootNode.toJsonArrayOfNoChecked();
		renderText(json.toString());
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
	
	/**
	 * 新增角色菜单信息
	 */
	public void addRoleMenu(){
		List<RoleMenu> list = new ArrayList<RoleMenu>();
		String menuIds = getPara("menuIds");
		String roleId = getPara("roleId");
		//现将该角色的对应菜单全部清除,后面统一添加啊
		RoleMenuDao.removeRoleMenu(roleId);
		String[] menuIdArr = menuIds.split("-");
		for (String menuId : menuIdArr) {
			if (StringUtils.isNotBlank(menuId)){
				RoleMenu roleMenu = new RoleMenu();
				roleMenu.setId(UUIDUtil.generate());
				roleMenu.setMenuId(menuId);
				roleMenu.setRoleId(roleId);
				list.add(roleMenu);
			}
		}
		RoleMenuDao.saveRoleMenu(list);
		Result result = new Result();
		result.setCode("0");
		result.setName("新增");
		result.setMsg("菜单分配成功");
		renderJson(result);
	}
	
	/**
	 * 根据角色获取对应的菜单信息
	 */
	public void getMenusByRole(){
		String roleId = getPara("roleId");
		List<RoleMenu> list = RoleMenuDao.loadMenusByRole(roleId);
		renderJson(list);
	}
}
