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
<script type="text/javascript"
	src="<%=context%>/pages/sale/listcontract/datagrid-detailview.js"></script>
</head>
<body>
    <div class="easyui-layout" style="width:100%;height:600px;">
        <div data-options="region:'west',split:true" title="产品类型" style="width:180px;">
            <ul class="easyui-tree" data-options="url:'productType.json',method:'get',animate:true,dnd:true"></ul>
        </div>
        <div data-options="region:'center',title:'采购管理',iconCls:'icon-ok'">
			<div id="tb" style="padding:5px;height:auto">
						<div class="easyui-panel" title="检索条件" 
			        style="width:100%;height:auto;padding:10px;background:#fafafa;"
			        data-options="collapsible:true">
			  <table cellpadding="2">
				<tr>
					<td>产品编码:</td>
					<td><input class="easyui-textbox" type="text" name="productCode"/></td>
					<td style="padding-left:50px;">
            			<a id="search" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
					</td>
				</tr>
			</table>  
			</div>
		        <div style="margin:5px">
		            <a href="#" id="showPurchase" class="easyui-linkbutton" iconCls="icon-tip" plain="true">查看产品采购状态</a>
		        </div>
           </div>
                <div title="DataGrid" style="padding:5px;">
					<table id="dg" url="datagrid_data1.json" title="产品列表"
					            singleSelect="true" fitColumns="true"
					            style="height:500px;">
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
        	var ddvArry = [];
            $('#dg').datagrid({
                view: detailview,
                singleSelect:true,
                checkOnSelect:true,
                autoRowHeight:true,
                rownumbers:true,
                detailFormatter:function(index,row){
                    return '<div style="padding:2px"><table class="ddv"></table></div>';
                },
                toolbar:'#tb',
                onExpandRow: function(index,row){
                    ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
                    ddv.datagrid({
                        url:'datagrid_data2.json',
                        fitColumns:true,
                        singleSelect:true,
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
                        	$('#dg').datagrid('unselectAll');
                        	if (ddvArry && ddvArry.length>0){
                        		$.each(ddvArry, function(i, dd){
	                            		setTimeout(function(){
	                            			dd.datagrid('unselectAll');
	                                    },1000);
                        		});
                        	}
                        	this.datagrid('onSelect');
                        },
                        onUnselect:function(rowIndex,rowData){
                        },
                        onSelectAll:function(rows){
                        	return false;
                        },
                        onUnselectAll:function(rows){
                        	return false;
                        }
                    });
                    ddvArry.push(ddv);
                    $('#dg').datagrid('fixDetailRowHeight',index);
                },
                onSelect:function(rowIndex,rowData){
                	$('#dg').datagrid('expandRow',rowIndex);
                	if (ddv){
                		setTimeout(function(){
                			ddv.datagrid('unselectAll');
                        },200);
                	}
                },
                onUnselect:function(rowIndex,rowData){
                	$('#dg').datagrid('expandRow',rowIndex);
                	if (ddv){
                		setTimeout(function(){
                			ddv.datagrid('unselectAll');
                        },200);
                	}
                	$('#dg').datagrid('collapseRow',rowIndex);
                },
                onSelectAll:function(rows){
                	return false;
                },
                onUnselectAll:function(rows){
                	return false;
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
            $('#showPurchase').bind('click', function(){
            	var record = $('#dg').datagrid('getSelected');
            	if (null == record){
            		$.messager.alert('提示','请选择一条记录再操作!','info');
            		return;
            	}
            	location.href="/contact/pages/purchase/purchaseDetail.jsp";
            });
        });
    </script>
    
</html>