package com.contact.login.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.contact.menu.model.Menu;

/**
 * 用户登录
 */
@WebServlet("/home/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//模拟用户登录
		String role = request.getParameter("role");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//在登录页面操作之前将session信息清空
		request.getSession().removeAttribute("fromLogin");
		request.getSession().removeAttribute("userInfo");
		if (!username.equals("admin") && !password.equals("admin")){
			request.getSession().setAttribute("fromLogin",true);
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}
		//如果用户通过验证，则将用户信息设置到session中
		request.getSession().setAttribute("userInfo", "admin");
		//这里模拟数据库中获取菜单信息并进行组装
		List<Menu> mList = new ArrayList<Menu>();
		Menu p1 = new Menu();
		p1.setMenuId("001");
		p1.setMenuName("销售管理");
		p1.setParentId("-1");
		p1.setSort(1);
		Menu c10 = new Menu();
		c10.setMenuId("0010");
		c10.setMenuName("从列表生成合同");
		c10.setParentId("001");
		c10.setSort(10);
		c10.setUrl("http://www.baidu.com");
		p1.addChildMenu(c10);
		Menu c11 = new Menu();
		c11.setMenuId("0011");
		c11.setMenuName("从编码生成合同");
		c11.setParentId("001");
		c11.setSort(11);
		c11.setUrl("/pages/code.jsp");
		p1.addChildMenu(c11);
		
		Menu p2 = new Menu();
		p2.setMenuId("002");
		p2.setMenuName("生产管理");
		p2.setParentId("-1");
		p2.setSort(2);
		Menu c20 = new Menu();
		c20.setMenuId("0020");
		c20.setMenuName("新订单生产安排");
		c20.setParentId("002");
		c20.setSort(20);
		c20.setUrl("/pages/neworder.jsp");
		p2.addChildMenu(c20);
		
		Menu p3 = new Menu();
		p3.setMenuId("003");
		p3.setMenuName("合同管理");
		p3.setParentId("-1");
		p3.setSort(3);
		Menu c30 = new Menu();
		c30.setMenuId("0030");
		c30.setMenuName("合同管理");
		c30.setParentId("003");
		c30.setSort(30);
		c30.setUrl("/pages/contact.jsp");
		p3.addChildMenu(c30);
		
		Menu p4 = new Menu();
		p4.setMenuId("004");
		p4.setMenuName("产品类型管理");
		p4.setParentId("-1");
		p4.setSort(4);
		Menu c40 = new Menu();
		c40.setMenuId("0040");
		c40.setMenuName("产品类型管理");
		c40.setParentId("004");
		c40.setSort(30);
		c40.setUrl("http://www.youdao.com");
		p4.addChildMenu(c40);
		
		mList.add(p1);
		mList.add(p2);
		mList.add(p3);
		mList.add(p4);
		request.getSession().setAttribute("menuInfo", mList);
		response.sendRedirect(request.getContextPath() + "/pages/index.jsp");
	}
}
