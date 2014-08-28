<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>采购管理</title>
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
</head>
<body>
	<table id="dg" class="easyui-datagrid" title="采购状态查看" style="width:100%;height:auto"
            data-options="rownumbers:true,singleSelect:true,url:'purchase.json',method:'get',toolbar:'#tb'">
        <thead>
            <tr>
                <th data-options="field:'itemid',width:100">Item ID</th>
                <th data-options="field:'productid',width:100">Product</th>
                <th data-options="field:'listprice',width:100,align:'right'">List Price</th>
                <th data-options="field:'unitcost',width:100,align:'right'">Unit Cost</th>
                <th data-options="field:'attr1',width:250">Attribute</th>
                <th data-options="field:'status',width:100,align:'center'">Status</th>
            </tr>
        </thead>
    </table>
    
    <div id="tb" style="padding:5px;height:auto">
        <div>
			<div class="easyui-panel" title="基本信息" 
			        style="width:100%;height:auto;padding:10px;background:#fafafa;"
			        data-options="collapsible:true">
			  <table cellpadding="2">
				<tr>
					<td>产品图片:</td>
					<td><img src="test.jpg"></td>
					<td>产品名称:</td>
					<td><label>SLP009</label></td>
				    <td></td>
				    <td></td>
				</tr>
				<tr>
					<td>仓库数量:</td>
					<td><label>500</label></td>
					<td>订单明细:</td>
					<td><label>2014-01-01~2014-12-23</label></td>
					<td></td>
				    <td></td>
				</tr>
			</table>  
			</div>
			
			  <div class="easyui-panel" title="检索条件" 
		        style="width:100%;height:auto;padding:10px;background:#fafafa;"
		        data-options="collapsible:true">
		            <table cellpadding="2">
			            <tr>
			            <td>颜色:</td>
					    <td>
						<input class="easyui-combobox" 
							name="language"
							data-options="
									url:'combobox_data1.json',
									method:'get',
									valueField:'id',
									textField:'text',
									panelHeight:'auto'
							">
					   </td>
					   
					   	<td rowspan="1" style="padding-left:100px;">
            			    <a id="search" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
					    </td>
			            </tr>
		            </table>
		        </div>
			
        </div>
        <div style="margin-bottom:5px">
            <a id="back" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true">返回</a>
        </div>
    </div>
</body>
<script type="text/javascript">
$(function(){
    $('#back').bind('click', function(){
        history.go(-1);
    });
    
    $('#search').bind('click', function(){
        alert('根据条件查询采购状态！');
    });
});
</script>
</html>