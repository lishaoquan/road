<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理</title>
		<% 
		  String context = request.getContextPath(); 
		  Object obj = session.getAttribute("userInfo");
			 if (null == obj){
				 response.sendRedirect("../../login.jsp");
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
<div id="p" class="easyui-panel" title="权限管理" style="width:100%;height:600px;padding:0;margin:0;">
 <div class="easyui-layout" style="width:100%;height:550px;">
        <div data-options="region:'west',split:true" title="角色树" style="width:180px;">
            <ul id="role" class="easyui-tree" data-options="
				url: '/contact/role/roleTree',
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
        <div data-options="region:'center',title:'菜单树'">
				<div class="easyui-panel" style="width:100%;height:550px"
						data-options="fit:true,border:false">
						<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">分配菜单</a>
						<hr/>
						<ul id="menu" class="easyui-tree" data-options="url:'/contact/menu',method:'get',animate:true,checkbox:true"></ul>
				</div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
	$('#btn').linkbutton('disable');
	var currentNode;
	$('#role').tree({
		onClick: function(node){
			if (node.id == '-1'){
				$('#btn').linkbutton('disable');
				return;
			}
			$('#btn').linkbutton('enable');
			currentNode = node;
			$('#menu').tree('reload');
		}
	});
	
	$('#menu').tree({
		onLoadSuccess:function(node, data){
			$.ajax({
				  type: "POST",
				  url: "/contact/role/getMenusByRole",
				  data: {roleId:currentNode.id},
				  dataType:'json',
				  success:function(data, textStatus){
					  if (data && data.length > 0){
						  for (var d in data){
							  var node = $('#menu').tree('find', data[d].menuId);
							  $('#menu').tree('check',node.target);
						  }
					  }
				  }
				});
		}
	});
	
	//用来存放已经选择的菜单节点
	var s = '';
    function getChecked(){
        var nodes = $('#menu').tree('getChecked');
        s = '';
        for(var i=0; i<nodes.length; i++){
            if (s != '') s += '-';
            s += nodes[i].id;
        }
    }
    
    $('#btn').bind('click',function(){
    	getChecked();
		$.ajax({
			  type: "POST",
			  url: "/contact/role/addRoleMenu",
			  data: { menuIds:s,roleId:currentNode.id},
			  dataType:'json',
			  success:function(data, textStatus){
				  $.messager.alert('提示', "权限分配成功!", 'info');
			  }
			});
    });
});
</script>
</body>
</html>