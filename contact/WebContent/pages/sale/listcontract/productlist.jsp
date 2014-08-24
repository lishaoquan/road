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
    <div class="easyui-layout" style="width:100%;height:600px;">
<!--         <div data-options="region:'north'" style="height:50px"></div>
        <div data-options="region:'south',split:true" style="height:50px;"></div> -->
        <div data-options="region:'west',split:true" title="产品分类类型" style="width:180px;">
            <ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,dnd:true"></ul>
        </div>
        <div data-options="region:'center',title:'分类说明和产品列表',iconCls:'icon-ok'">
        <div title="About" data-options="href:'_content.html'" style="padding:10px">说明</div>
                <div title="DataGrid" style="padding:5px">
					<table id="dg" url="datagrid_data1.json" title="产品列表"
					            singleSelect="false" fitColumns="true">
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
                        <div id="pp" style="background:#efefef;border:1px solid #ccc;"></div>
                </div>
        </div>
    </div>
</body>
    <script type="text/javascript">
        $(function(){
        	var ddv = null;
            $('#dg').datagrid({
                view: detailview,
                singleSelect:false,
                checkOnSelect:true,
                rownumbers:true,
                detailFormatter:function(index,row){
                    return '<div style="padding:2px"><table class="ddv"></table></div>';
                },
                toolbar: [{
            		iconCls: 'icon-save',
            		text:'购买',
            		handler: function(){
            			alert('购买');
            			}
            	}],
                onExpandRow: function(index,row){
                    ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
                    ddv.datagrid({
                        url:'datagrid_data2.json',
                        fitColumns:true,
                        singleSelect:false,
                        checkOnSelect:true,
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
                        },
                        onSelect:function(rowIndex,rowData){
                        	alert('你选择了第'+rowIndex+'行，数据为:' + rowData);
                        },
                        onUnselect:function(rowIndex,rowData){
                        	alert('你取消选择了第'+rowIndex+'行，数据为:' + rowData);
                        },
                        onSelectAll:function(rows){
                        	alert('你全选择了当前页行，数据为:' + rows);
                        },
                        onUnselectAll:function(rows){
                        	alert('你取消全选择了当前页行，数据为:' + rows);
                        }
                    });
                    $('#dg').datagrid('fixDetailRowHeight',index);
                },
                onSelect:function(rowIndex,rowData){
                	alert('你选择了第'+rowIndex+'行，数据为:' + rowData);
                	$('#dg').datagrid('expandRow',rowIndex);
                	if (ddv){
                		//ddv.datagrid('selectAll').delay(5000);
                		setTimeout(function(){
                			ddv.datagrid('selectAll');
                        },200);
                	}
                },
                onUnselect:function(rowIndex,rowData){
                	alert('你取消选择了第'+rowIndex+'行，数据为:' + rowData);
                },
                onSelectAll:function(rows){
                	alert('你全选择了当前页行，数据为:' + rows);
                },
                onUnselectAll:function(rows){
                	alert('你取消全选择了当前页行，数据为:' + rows);
                }
            });
            $('#pp').pagination({
                total:30,
                pageSize:10,
                pageNumber:1,
                onSelectPage: function(pageNumber, pageSize){
                	alert("第"+pageNumber+"页，每页显示"+pageSize+"记录");
                	$('#pp').pagination('loading');
                    $('#pp').pagination('refresh', 'show_content.php?page='+pageNumber+'&pageSize='+pageSize);
                    $('#pp').pagination('loaded');
                },
                onChangePageSize:function(pageSize){
                	alert("用户改变每页显示记录数为:"+pageSize);
                }
            });
        });
    </script>
    
</html>