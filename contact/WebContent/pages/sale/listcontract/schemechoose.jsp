<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>合同方案选择</title>
		<% 
		  String context = request.getContextPath(); 
		  Object obj = session.getAttribute("userInfo");
			 if (null == obj){
				 response.sendRedirect("../login.jsp");
				 return;
			 }
		      String basePath = request.getScheme() + "://"
		              + request.getServerName() + ":" + request.getServerPort()
		              + context + "/";
		%>
	<link rel="stylesheet" href="<%=context %>/js/jquery/themes/default/easyui.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<%=context %>/js/jquery/themes/icon.css" type="text/css" media="screen" />
	<script src="<%=context %>/js/jquery/jquery.min.js"></script>
	<script src="<%=context %>/js/jquery/jquery.easyui.min.js"></script>
	<script src="<%=context %>/js/jquery/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
    <h2>合同方案选择</h2>
    <div class="easyui-layout" style="width:100%;height:550px;">
        <div id="p" data-options="region:'west'" title="合同方案" style="width:30%;padding:10px">
	              <div class="easyui-accordion" data-options="multiple:true" style="width:500px;height1:300px;">
			        <div title="简易方案" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
			            <p>A programming language is a formal language designed to communicate instructions to a machine, particularly a computer. Programming languages can be used to create programs that control the behavior of a machine and/or to express algorithms precisely.</p>
			        </div>
			        <div title="完整方案" style="padding:10px;">
			            <p>Java (Indonesian: Jawa) is an island of Indonesia. With a population of 135 million (excluding the 3.6 million on the island of Madura which is administered as part of the provinces of Java), Java is the world's most populous island, and one of the most densely populated places in the world.</p>
			        </div>
			        <div title="自定义方案" style="padding:10px;">
			            <p>C# is a multi-paradigm programming language encompassing strong typing, imperative, declarative, functional, generic, object-oriented (class-based), and component-oriented programming disciplines.</p>
			        </div>
			    </div>
        </div>
        <div data-options="region:'center'" title="Center">
            <table class="easyui-propertygrid" style="width:100%;height:450px;" data-options="
                url: 'propertygrid_data1.json',
                method: 'get',
                showGroup: true,
                scrollbarSize: 0,
                columns: mycolumns
            ">
    </table>
        </div>
    </div>
</body>
<script>
        var mycolumns = [[
            {field:'name',title:'MyName',width:100,sortable:true},
               {field:'value',title:'MyValue',width:100,resizable:false}
        ]];
    </script>
</html>