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
   <div class="easyui-tabs" data-options="tabWidth:100,tabHeight:60" style="width:100%;height:600px">
        <div title="<span class='tt-inner'><img src='images/modem.png'/><br>简易方案</span>" style="padding:10px">
			<table class="easyui-propertygrid" style="width:100%;height:500px" data-options="
			                url: 'propertygrid_data1.json',
			                method: 'get',
			                showGroup: true,
			                scrollbarSize: 0,
			                columns: mycolumns
			            ">
			    </table>
			    <script>
			        var mycolumns = [[
			            {field:'name',title:'MyName',width:100,sortable:true},
			               {field:'value',title:'MyValue',width:100,resizable:false}
			        ]];
			    </script>
        </div>
        <div title="<span class='tt-inner'><img src='images/scanner.png'/><br>完整方案</span>" style="padding:10px">
            			<table class="easyui-propertygrid" style="width:100%;height:500px" data-options="
			                url: 'propertygrid_data1.json',
			                method: 'get',
			                showGroup: true,
			                scrollbarSize: 0,
			                columns: mycolumns
			            ">
			    </table>
			    <script>
			        var mycolumns = [[
			            {field:'name',title:'MyName',width:100,sortable:true},
			               {field:'value',title:'MyValue',width:100,resizable:false}
			        ]];
			    </script>
        </div>
        <div title="<span class='tt-inner'><img src='images/pda.png'/><br>自定义方案</span>" style="padding:10px">
             <table class="easyui-propertygrid" style="width:100%;height:500px" data-options="
			                url: 'propertygrid_data1.json',
			                method: 'get',
			                showGroup: true,
			                scrollbarSize: 0,
			                columns: mycolumns
			            ">
			    </table>
			    <script>
			        var mycolumns = [[
			            {field:'name',title:'MyName',width:100,sortable:true},
			               {field:'value',title:'MyValue',width:100,resizable:false}
			        ]];
			    </script>
        </div>
    </div>
    <style scoped="scoped">
        .tt-inner{
            display:inline-block;
            line-height:12px;
            padding-top:5px;
        }
        .tt-inner img{
            border:0;
        }
    </style>
</body>
</html>