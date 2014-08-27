<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>合同管理</title>
<%
	String context = request.getContextPath();
	Object obj = session.getAttribute("userInfo");
	if (null == obj) {
		response.sendRedirect("../login.jsp");
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
	<table id="dg" class="easyui-datagrid" title="查看/修改合同" style="width:700px;height:auto"
            data-options="rownumbers:true,iconCls:'icon-edit', singleSelect: true,toolbar: toolbar, url: 'contractlist.json',method: 'get', onDblClickRow: showContract">
        <thead>
            <tr>
                <th data-options="field:'itemid',width:80">Item ID</th>
                <th data-options="field:'productid',width:100">Product</th>
                <th data-options="field:'listprice',width:80,align:'right'">List Price</th>
                <th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
                <th data-options="field:'attr1',width:250">Attribute</th>
                <th data-options="field:'status',width:60,align:'center'">Status</th>
            </tr>
        </thead>
    </table>
</body>
<script type="text/javascript">
var toolbar = [{
    text:'查看',
    iconCls:'icon-open',
    handler:function(){view();}
},'-',{
    text:'修改',
    iconCls:'icon-edit',
    handler:function(){alert('修改')}
}];
/*
$('#dg').datagrid({
    url:'contractlist.json',
    method:'get',
    onDblClickRow:'showContract',
    rownumbers:true,
    singleSelect:true,
    toolbar:toolbar,
    columns:[[
        {field:'itemid',title:'Item ID',width:80},
        {field:'code',title:'Code',width:100},
        {field:'name',title:'Name',width:100},
        {field:'price',title:'Price',width:100,align:'right'}
    ]]
});*/
function showContract(){
	
}
function editContact()
{
	alert("editContract");
}
function modify(){
	
}
function view(){
	var a= $('#dg').datagrid('selectRow');
	debugger;
	alert(a);
}
</script>
</html>