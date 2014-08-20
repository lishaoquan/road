<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单管理</title>
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
	<h2>菜单管理</h2>
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" style="padding:5px">
		<ul id="tt" class="easyui-tree" data-options="
				url: '/contact/menu',
				method: 'get',
				animate: true,
				onContextMenu: function(e,node){
					e.preventDefault();
					$(this).tree('select',node.target);
					$('#mm').menu('show',{
						left: e.pageX,
						top: e.pageY
					});
				}
			"></ul>
	</div>
	<div id="mm" class="easyui-menu" style="width:120px;">
		<div onclick="append()" data-options="iconCls:'icon-add'">新增</div>
		<div onclick="modify()" data-options="iconCls:'icon-edit'">修改</div>
		<div onclick="removeit()" data-options="iconCls:'icon-remove'">删除</div>
		<div class="menu-sep"></div>
		<div onclick="expand()">Expand</div>
		<div onclick="collapse()">Collapse</div>
	</div>
	<script type="text/javascript">
	    //新增菜单
		function append(){
	    	$('#addMenuPanel').panel("open");
 			var t = $('#tt');
			var node = t.tree('getSelected');
			$('#menuId').val(node.id);
		}
	    
	    function modify(){
	    	$('#updateMenuPanel').panel("open");
 			var t = $('#tt');
			var node = t.tree('getSelected');
			$('#updateMenuId').val(node.id);
			$('#updateff').form('load','/contact/menu/loadMenu?menuId='+node.id);
	    }
	    
		function removeit(){
			var t = $('#tt');
			var node = t.tree('getSelected');
			$.ajax({
				  type: "POST",
				  url: "/contact/menu/remove",
				  data: { menuId:node.id},
				  dataType:'json',
				  success:function(data, textStatus){
				      var node = t.tree('reload');
					  $.messager.alert('提示', "删除成功!", 'info');
				  }
				});
		}
		
		function collapse(){
			var node = $('#tt').tree('getSelected');
			$('#tt').tree('collapse',node.target);
		}
		
		function expand(){
			var node = $('#tt').tree('getSelected');
			$('#tt').tree('expand',node.target);
		}
	</script>
	
	<!-- 菜单新增panel -->
		<div id="addMenuPanel"  class="easyui-panel" closed="true" title="新增菜单" style="width:400px">
		<div style="padding:10px 60px 20px 60px">
	    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
	    	<input type="text" id="menuId" name="menuId" style='display: none;'>
	    	<table cellpadding="5">
	    		<tr>
	    			<td>菜单名称:</td>
	    			<td><input class="easyui-textbox" type="text" name="menuName" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>菜单链接:</td>
	    			<td><input class="easyui-textbox" type="text" name="url"></input></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	    </div>
	</div>
	
		<!-- 菜单更新panel -->
		<div id="updateMenuPanel"  class="easyui-panel" closed="true" title="更新菜单" style="width:400px">
		<div style="padding:10px 60px 20px 60px">
	    <form id="updateff" class="easyui-form" method="post" data-options="novalidate:true">
	    	<input type="text" id="updateMenuId" name="menuId" style='display: none;'>
	    	<table cellpadding="5">
	    		<tr>
	    			<td>菜单名称:</td>
	    			<td><input class="easyui-textbox" type="text" id="addMenuName" name="menuName" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>菜单链接:</td>
	    			<td><input class="easyui-textbox" type="text" id="addUrl" name="url"></input></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	    </div>
	</div>
	
		<script>
		function submitForm(){
			$('#ff').form('submit',{
				url:'/contact/menu/add',
				onSubmit:function(){
					return $(this).form('enableValidation').form('validate');
				},
				success:function(data){
		 			var t = $('#tt');
					var node = t.tree('reload');
					$('#addMenuPanel').panel("close");
					$.messager.alert('提示', "新增成功!", 'info');
				 }

			});
		}
		
		function updateForm(){
			$('#updateff').form('submit',{
				url:'/contact/menu/update',
				onSubmit:function(){
					return $(this).form('enableValidation').form('validate');
				},
				success:function(data){
		 			var t = $('#tt');
					var node = t.tree('reload');
					$('#updateMenuPanel').panel("close");
					$.messager.alert('提示', "更新成功!", 'info');
				 }

			});
		}
		
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>
</body>
</html>