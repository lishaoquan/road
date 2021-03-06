<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品类型管理</title>
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
    <table id="tg" class="easyui-treegrid" title="产品类型管理" style="width:100%;height:550px"
            data-options="
                iconCls: 'icon-ok',
                rownumbers: true,
                animate: true,
                collapsible: true,
                fitColumns: true,
                url: '/contact/category',
                method: 'get',
                idField: 'id',
                treeField: 'name',
                onContextMenu: onContextMenu
            ">
        <thead>
            <tr>
                <th data-options="field:'name',width:80">产品类型名称</th>
                <th data-options="field:'description',width:200,align:'center'">类型描述</th>
                <th data-options="field:'imageurl',width:100">图片</th>
            </tr>
        </thead>
    </table>
    <div id="mm" class="easyui-menu" style="width:120px;">
        <div onclick="append()" data-options="iconCls:'icon-add'">新增</div>
        <div onclick="modify()" data-options="iconCls:'icon-edit'">修改</div>
        <div onclick="removeIt()" data-options="iconCls:'icon-remove'">删除</div>
        <div class="menu-sep"></div>
        <div onclick="collapse()">收缩</div>
        <div onclick="expand()">展开</div>
    </div>
    
       <div id="dlg" class="easyui-dialog" style="width:450px;height:300px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">产品类型信息</div>
        <form id="fm" method="post">
            <input name="parentId" id="parentId" type="hidden">
            <div class="fitem">
                <label>类型名称:</label>
                <input name="name" class="easyui-textbox" required="true" width="200">
            </div>
            <div class="fitem">
                <label>类型图片:</label>
                <input id="imageUrl" name="imageUrl" class="easyui-filebox" style="width:200px">
            </div>
            <div class="fitem">
                <label>类型说明:</label>
                <input id="description" name="description" class="easyui-textbox">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="#" class="easyui-linkbutton" iconCls="icon-save" onclick="saveUser()" style="width:90px">保存</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>
    <script type="text/javascript">
        $(function(){
        	$('#description').textbox({
        		multiline:true,
        		height:80,
        		width:200
        	});
        	$('#imageUrl').filebox({
        	    buttonText: '选择图片'
        	});
        });
        
        function formatProgress(value){
            if (value){
                var s = '<div style="width:100%;border:1px solid #ccc">' +
                        '<div style="width:' + value + '%;background:#cc0000;color:#fff">' + value + '%' + '</div>'
                        '</div>';
                return s;
            } else {
                return '';
            }
        }
        function onContextMenu(e,row){
            e.preventDefault();
            $(this).treegrid('select', row.id);
            $('#mm').menu('show',{
                left: e.pageX,
                top: e.pageY
            });
        }
        function append(){
            $('#dlg').dialog('open').dialog('setTitle','新增产品类型');
            $('#fm').form('clear');
            var node = $('#tg').treegrid('getSelected');
            $("#parentId").val(node.id);
/*             $('#tg').treegrid('append',{
                parent: node.id,
                data: [{
                    id: idIndex,
                    name: 'New Task'+idIndex,
                    persons: parseInt(Math.random()*10),
                    begin: $.fn.datebox.defaults.formatter(d1),
                    end: $.fn.datebox.defaults.formatter(d2),
                    progress: parseInt(Math.random()*100)
                }]
            }) */
        }
        
        function saveUser(){
            $('#fm').form('submit',{
                url:'/contact/category/save',
                onSubmit: function(){
                	var isValid = $(this).form('validate');
            		if (!isValid){
            			$.messager.alert('info','必要字段未填写完整!');
            			return false;
            		}
            		return true;
                },
                success:function(data){
                	$.messager.alert('info','新增成功!');
                	$("parentId").val('');
                	$('#dlg').dialog('close');
                }
            });
        }
        
        function modify(){
            var row = $('#tg').treegrid('getSelected');
            if (row){
            	$('#dlg').dialog('open').dialog('setTitle','修改产品类型');
                $('#fm').form('load',row);
            }
        }
        function removeIt(){
            var node = $('#tg').treegrid('getSelected');
            if (node){
                $('#tg').treegrid('remove', node.id);
            }
        }
        function collapse(){
            var node = $('#tg').treegrid('getSelected');
            if (node){
                $('#tg').treegrid('collapse', node.id);
            }
        }
        function expand(){
            var node = $('#tg').treegrid('getSelected');
            if (node){
                $('#tg').treegrid('expand', node.id);
            }
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