<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>合同预览</title>
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
<script type="text/javascript"
	src="<%=context%>/pages/sale/listcontract/datagrid-detailview.js"></script>
</head>
<style>
.label{text-align: right;}
</style>
<body>
	<div class="easyui-panel" title="合同基本信息"  data-options="collapsible:true">
		<table cellpadding="2">
			<tr>
				<td class="label">客户名称:</td>
				<td><input class="easyui-textbox" type="text" name="name" value ="ttt" readonly="readonly"/></td>
				<td class="label">日期:</td>
				<td><input class="easyui-textbox" type="text" name="name" readonly="readonly"/></td>
				<td class="label">客户国家:</td>
				<td><input class="easyui-textbox" type="text" name="email" readonly="readonly"/></td>
				<td class="label">合同编号:</td>
				<td><input class="easyui-textbox" type="text" name="email" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="label">客户地址:</td>
				<td><input class="easyui-textbox" type="text" name="subject"/></td>
				<td class="label">客户编号:</td>
				<td><input class="easyui-textbox" type="text" name="subject"/></td>
				<td class="label">固话:</td>
				<td><input class="easyui-textbox" type="text" name="subject"/></td>
				<td class="label">手机:</td>
				<td><input class="easyui-textbox" type="text" name="subject"/></td>
			</tr>
			<tr>
				<td class="label">传真:</td>
				<td><input class="easyui-textbox" type="text" name="subject"/></td>
				<td class="label">邮箱:</td>
				<td><input class="easyui-textbox" type="text" name="subject"/></td>
				<td class="label">业务编号:</td>
				<td><input class="easyui-textbox" type="text" name="subject"/></td>
			</tr>
		</table>
	</div>
	<table style="padding-top: 5px;" id="dg" url="datagrid_data1.json" title="合同产品信息" singleSelect="false" fitColumns="true">
		<thead>
			<tr>
				<th field="itemid" width="80">Item ID</th>
				<th field="productid" width="100">Product ID</th>
				<th field="listprice" align="right" width="80">List Price</th>
				<th field="unitcost" align="right" width="80">Unit Cost</th>
				<th field="attr1" width="220">Attribute</th>
				<th field="status" width="60" align="center">Status</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true">导出合同</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-mini-refresh',plain:true">生成生产单</a>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		var ddv = null;
		$('#dg').datagrid({
			view : detailview,
			singleSelect : false,
			rownumbers : true,
			toolbar: '#tb',
			detailFormatter : function(index, row) {
				return '<div style="padding:2px"><table class="ddv"></table></div>';
			},
			onExpandRow : function(index, row) {
				ddv = $(this).datagrid('getRowDetail', index).find('table.ddv');
				ddv.datagrid({
					url : 'datagrid_data2.json',
					fitColumns : true,
					singleSelect : false,
					checkOnSelect : true,
					rownumbers : true,
					loadMsg : '',
					height : 'auto',
					columns : [ [ 
					   {field : 'orderid',title : 'Order ID',width : 200},
					   {field : 'quantity',title : 'Quantity',width : 100,align : 'right'}, 
					   {field : 'unitprice',title : 'Unit Price',width : 100,align : 'right'} 
					   ] ],
					onResize : function() {$('#dg').datagrid('fixDetailRowHeight',index);},
					onLoadSuccess : function() {
						setTimeout(function() {
							$('#dg').datagrid('fixDetailRowHeight',index);}, 0);
					},
				});
				$('#dg').datagrid('fixDetailRowHeight', index);
			},
		});
	});
</script>

</html>