<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>从列表生成合同</title>
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
	 <script type="text/javascript" src="<%=context %>/pages/sale/listcontract/datagrid-detailview.js"></script>
</head>
<body>
    <div style="margin:20px 0;"></div>
    <div class="easyui-layout" style="width:100%;height:600px;">
<!--         <div data-options="region:'north'" style="height:50px"></div>
        <div data-options="region:'south',split:true" style="height:50px;"></div> -->
        <div data-options="region:'west',split:true" title="产品分类类型" style="width:180px;">
            <ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,dnd:true"></ul>
        </div>
        <div data-options="region:'center',title:'分类说明和产品列表',iconCls:'icon-ok'">
        <div title="About" data-options="href:'_content.html'" style="padding:10px">说明</div>
                <div title="DataGrid" style="padding:5px">
					<table id="dg" style="width:650px;height:250px"
					            url="datagrid_data1.json" 
					            title="DataGrid - SubGrid"
					            singleSelect="true" fitColumns="true">
					        <thead>
					            <tr>
					                <th data-options="field:'ck',checkbox:true"></th>
					                <th field="itemid" width="80">Item ID</th>
					                <th field="productid" width="100">Product ID</th>
					                <th field="listprice" align="right" width="80">List Price</th>
					                <th field="unitcost" align="right" width="80">Unit Cost</th>
					                <th field="attr1" width="220">Attribute</th>
					                <th field="status" width="60" align="center">Status</th>
					            </tr>
					        </thead>
					    </table>
                </div>
        </div>
    </div>
</body>
    <script type="text/javascript">
        $(function(){
            $('#dg').datagrid({
                view: detailview,
                singleSelect:false,
                rownumbers:true,
                detailFormatter:function(index,row){
                    return '<div style="padding:2px"><table class="ddv"></table></div>';
                },
                onExpandRow: function(index,row){
                    var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
                    ddv.datagrid({
                        url:'datagrid_data2.json',
                        fitColumns:true,
                        singleSelect:false,
                        rownumbers:true,
                        loadMsg:'',
                        height:'auto',
                        columns:[[
                            {field:'ck',checkbox:true},
                            {field:'orderid',title:'Order ID',width:200},
                            {field:'quantity',title:'Quantity',width:100,align:'right'},
                            {field:'unitprice',title:'Unit Price',width:100,align:'right'}
                        ]],
                        onResize:function(){
                            $('#dg').datagrid('fixDetailRowHeight',index);
                        },
                        onLoadSuccess:function(){
                            setTimeout(function(){
                                $('#dg').datagrid('fixDetailRowHeight',index);
                            },0);
                        }
                    });
                    $('#dg').datagrid('fixDetailRowHeight',index);
                }
            });
        });
    </script>
    
</html>