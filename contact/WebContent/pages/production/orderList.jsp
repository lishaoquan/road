<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生产清单</title>
<%
	String context = request.getContextPath();
	Object obj = session.getAttribute("userInfo");
	if (null == obj) {
		response.sendRedirect("../../login.jsp");
		return;
	}
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ context + "/";
%>
<link rel="stylesheet"
	href="<%=context%>/js/jquery/themes/default/easyui.css"
	type="text/css" media="screen" />
<link rel="stylesheet" href="<%=context%>/js/jquery/themes/icon.css"
	type="text/css" media="screen" />
<script src="<%=context%>/js/jquery/jquery.min.js"></script>
<script src="<%=context%>/js/jquery/jquery.easyui.min.js"></script>
<script src="<%=context%>/js/jquery/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=context%>/js/jquery/plugins/datagrid-filter.js"></script>
</head>
<body>
<div id="p" class="easyui-panel" title="导出生产单操作" 
        style="width:100%;height:auto;background:#fafafa;">
            <a id="back" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
    	    <a href="#" id="export" style="float:right;" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出生产单</a>
</div>
	 <div id="p" class="easyui-panel" title="生产清单(五金车间)" style="width:100%;height:300px;padding:10px;">
	 	<div id="p_description" class="easyui-panel" style="width:100%;height:60px>
	 		<table cellpadding="2">
	 			<tr>
					<td>客户名称:</td>
					<td><input class="easyui-textbox" type="text" name="name"/></td>
					<td>日期:</td>
					<td><input class="easyui-textbox" type="text" name="name"/></td>
					<td>客户国家:</td>
					<td><input class="easyui-textbox" type="text" name="email"/></td>
					<td>合同编号:</td>
					<td><input class="easyui-textbox" type="text" name="email"/></td>
				</tr>
	 		</table>
	 		<table id="dg"></table>
	 	</div>
	 </div>
	 <div style="height: 5px;"></div>
	 <div id="p2" class="easyui-panel" title="生产清单(板式车间)" style="width:100%;height:300px;padding:10px;">
	 	<div id="p2_description" class="easyui-panel" style="width:100%;height:60px>
	 		<table cellpadding="2">
	 			<tr>
					<td>客户名称:</td>
					<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"/></td>
					<td>日期:</td>
					<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"/></td>
					<td>客户国家:</td>
					<td><input class="easyui-textbox" type="text" name="email" data-options="required:true,validType:'email'"/></td>
					<td>合同编号:</td>
					<td><input class="easyui-textbox" type="text" name="email" data-options="required:true,validType:'email'"/></td>
				</tr>
	 		</table>
	 		<table id="dg2"></table>
	 	</div>
	 </div>
</body>
<script type="text/javascript">
$(function(){
	$('#dg').datagrid({
	    url:'../sale/listcontract/datagrid_data1.json',
	    columns:[[
	     {field:'itemid',title:'Code',width:100},
	     {field:'productid',title:'Code',width:100},
	     {field:'productname',title:'Name',width:100},
	     {field:'unitcost',title:'Price',width:100,align:'right'},
	     {field:'status',title:'Price',width:100,align:'right'},
	     {field:'listprice',title:'Price',width:100,align:'right'},
	     {field:'attr1',title:'Price',width:100,align:'right'}
	    ]]
	});
	$('#dg2').datagrid({
	    url:'../sale/listcontract/datagrid_data1.json',
	    columns:[[
	     {field:'itemid',title:'Code',width:100},
	     {field:'productid',title:'Code',width:100},
	     {field:'productname',title:'Name',width:100},
	     {field:'unitcost',title:'Price',width:100,align:'right'},
	     {field:'status',title:'Price',width:100,align:'right'},
	     {field:'listprice',title:'Price',width:100,align:'right'},
	     {field:'attr1',title:'Price',width:100,align:'right'}
	    ]]
	});
	
	 $('#export').bind('click', function(){
			 $.messager.confirm('确认', '确认要导出生产单吗?', function(r){
				if (r){
					alert("开始导出!");
				}
			});
    });
    
    $('#back').bind('click', function(){
	        history.go(-1);
	    });
});

</script>
</html>