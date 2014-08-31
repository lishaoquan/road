<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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
    <table id="dg" title="用户管理" class="easyui-datagrid" style="width:100%;height:550px"
            url="/contact/user"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="false">
        <thead>
            <tr>
                <th data-options="field:'ck',checkbox:true"></th>
                <th field="userId" width="50">用户名</th>
                <th field="userName" width="50">用户姓名</th>
                <th field="email" width="50">邮箱地址</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">用户信息</div>
        <form id="fm" method="post" novalidate>
            <div class="fitem">
                <label>用户名:</label>
                <input id="userId" name="userId" class="easyui-textbox" required="true">
            </div>
            <div class="fitem">
                <label>用户姓名:</label>
                <input id="userName" class="easyui-textbox" name="userName">
            </div>
            <div class="fitem">
                <label>邮箱:</label>
                <input id="email" name="email" class="easyui-validatebox" data-options="validType:'email'">
            </div>
            <div class="fitem">
                <label>角色:</label>
                <select id="cc" class="easyui-combobox" name="role" style="width:160px;" required="true">
				</select>
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>
    <script type="text/javascript">
        $(function(){
        	$('#cc').combobox({
        	    url:'/contact/role/roleCombo',
        	    valueField:'id',
        	    textField:'roleName',
        	    onLoadSuccess:function(){
        	    	$('#cc').combobox('select','--请选择--');
        	    }
        	});
        });
        var url;
        function newUser(){
        	$('#userId').textbox('enable');
            $('#dlg').dialog('open').dialog('setTitle','新增用户');
            $('#fm').form('clear');
            url = '/contact/user/add';
        }
        function editUser(){
            var rows = $('#dg').datagrid('getSelections');
            if (!rows || rows.length == 0){
            	$.messager.alert('提示','请选择你要修改的记录','info');
            	return;
            }
           	if (rows.length > 1){
           		$.messager.alert('提示','只能选择一行进行修改！','info');
           	}
           	else{
           		   $('#userId').textbox('disable');
                   $('#dlg').dialog('open').dialog('setTitle','修改用户');
                   $('#fm').form('load',rows[0]);
                   url = '/contact/user/update?id='+rows[0].id;
           	}
        }
        function saveUser(){
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.code == '1'){
                        $.messager.show({
                            title: 'Error',
                            msg: result.msg
                        });
                    } else {
                    	$.messager.alert('提示',result.msg,'info');
                        $('#dlg').dialog('close');        // close the dialog
                        $('#dg').datagrid('reload');    // reload the user data
                    }
                }
            });
        }
        function destroyUser(){
            var row = $('#dg').datagrid('getSelections');
            if (!row || row.length == 0){
            	$.messager.alert('提示','请选择你要删除的记录','info');
            	return;
            }
            $.messager.confirm('确认','确定删除该行记录吗?',function(r){
                if (r){
                	var ids = '';
                	for (var i in row){
                		ids += row[i].id + '-';
                	}
                	ids = ids.substr(0,ids.lastIndexOf('-'));
                    $.post('/contact/user/remove',{id:ids},function(result){
                        if (result.code == '0'){
                        	$.messager.alert('提示',result.msg,'info');
                            $('#dg').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: 'Error',
                                msg: result.msg
                            });
                        }
                    },'json');
                }
            });
        }
    </script>
    <style type="text/css">
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
        .fitem input{
            width:160px;
        }
    </style>
</body>
</html>