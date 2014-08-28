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
                url: 'treegrid_data2.json',
                method: 'get',
                idField: 'id',
                treeField: 'name',
                onContextMenu: onContextMenu
            ">
        <thead>
            <tr>
                <th data-options="field:'name',width:180">产品类型名称</th>
                <th data-options="field:'persons',width:60,align:'right'">类型描述</th>
                <th data-options="field:'begin',width:80">图片</th>
            </tr>
        </thead>
    </table>
    <div id="mm" class="easyui-menu" style="width:120px;">
        <div onclick="append()" data-options="iconCls:'icon-add'">Append</div>
        <div onclick="removeIt()" data-options="iconCls:'icon-remove'">Remove</div>
        <div class="menu-sep"></div>
        <div onclick="collapse()">Collapse</div>
        <div onclick="expand()">Expand</div>
    </div>
    <script type="text/javascript">
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
        var idIndex = 100;
        function append(){
            idIndex++;
            var d1 = new Date();
            var d2 = new Date();
            d2.setMonth(d2.getMonth()+1);
            var node = $('#tg').treegrid('getSelected');
            $('#tg').treegrid('append',{
                parent: node.id,
                data: [{
                    id: idIndex,
                    name: 'New Task'+idIndex,
                    persons: parseInt(Math.random()*10),
                    begin: $.fn.datebox.defaults.formatter(d1),
                    end: $.fn.datebox.defaults.formatter(d2),
                    progress: parseInt(Math.random()*100)
                }]
            })
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
</body>
</html>