<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>合同方案选择</title>
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
<div id="tt" style="margin:0;">
	<a id="showContract" href="#" class="icon-save" onclick="javascript:alert('输出合同')">合同输出</a>
</div>
<div id="p" class="easyui-panel" title="合同方案选择" 
        style="width:100%;height:100%;padding:0;background:#fafafa;">
   <div id="tabss" class="easyui-tabs" data-options="tabHeight:60" style="width:100%;height:550px;">
        <div title="<span class='tt-inner'><img src='../../../images/modem.png'/><br>简易方案</span>" style="padding:10px">
			<table class="easyui-propertygrid" style="width:100%;height:500px" data-options="
			                url: 'propertygrid_data1.json',
			                method: 'get',
			                showGroup: true,
			                scrollbarSize: 0,
			                columns: mycolumns
			            ">
			    </table>
			    <script>
			        var mycolumns = [[
			            {field:'name',title:'MyName',width:100,sortable:true},
			               {field:'value',title:'MyValue',width:100,resizable:false}
			        ]];
			    </script>
        </div>
        <div title="<span class='tt-inner'><img src='../../../images/scanner.png'/><br>完整方案</span>" style="padding:10px">
            			<table class="easyui-propertygrid" style="width:100%;height:500px" data-options="
			                url: 'propertygrid_data1.json',
			                method: 'get',
			                showGroup: true,
			                scrollbarSize: 0,
			                columns: mycolumns
			            ">
			    </table>
			    <script>
			        var mycolumns = [[
			            {field:'name',title:'MyName',width:100,sortable:true},
			               {field:'value',title:'MyValue',width:100,resizable:false}
			        ]];
			    </script>
        </div>
        <div title="<span class='tt-inner'><img src='../../../images/pda.png'/><br>自定义方案</span>" style="padding:10px">
	        <div style="margin-bottom:10px;">                
	                             自定义方案：<select id="cc" style="width:150px;"></select>
	        </div>
		    <div id="sp">
		        <div style="color:#99BBE8;background:#fafafa;padding:5px;">选择一个方案</div>
		        <div style="padding:10px">
		            <input type="radio" name="lang" value="01"><span>Java</span><br/>
		            <input type="radio" name="lang" value="02"><span>C#</span><br/>
		            <input type="radio" name="lang" value="03"><span>Ruby</span><br/>
		            <input type="radio" name="lang" value="04"><span>Basic</span><br/>
		            <input type="radio" name="lang" value="05"><span>Fortran</span>
		        </div>
		    </div>
		    <script type="text/javascript">
		        $(function(){
		            $('#cc').combo({
		                required:true,
		                editable:false
		            });
		            $('#sp').appendTo($('#cc').combo('panel'));
		            $('#sp input').click(function(){
		                var v = $(this).val();
		                var s = $(this).next('span').text();
		                $('#cc').combo('setValue', v).combo('setText', s).combo('hidePanel');
		            });
		        });
		    </script>
				<table id="dg" class="easyui-datagrid" title="表格设置" style="width:100%;height:500px"
					data-options="
						iconCls: 'icon-edit',
						singleSelect: true,
						toolbar: '#tb',
						url: 'datagrid_data1.json',
						method: 'get',
						onClickRow: onClickRow
					">
				<thead>
					<tr>
						<th data-options="field:'itemid',width:80">第一行标题</th>
						<th data-options="field:'status',width:80,align:'center',editor:{type:'checkbox',options:{on:'显示',off:'不显示'}}">显示</th>
						<th data-options="field:'listprice',width:80,align:'right',editor:{type:'numberbox'}">宽度</th>
					</tr>
				</thead>
			</table>
			<div id="tb" style="height:auto">
			           隐藏部件行:<input type="checkbox">
				<a href="javascript:void(0)" style="float: right;" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">保存方案</a>
			</div>
			<script type="text/javascript">
				var editIndex = undefined;
				function endEditing(){
					if (editIndex == undefined){return true}
					if ($('#dg').datagrid('validateRow', editIndex)){
						//var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
						//var productname = $(ed.target).combobox('getText');
						//$('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
						$('#dg').datagrid('endEdit', editIndex);
						editIndex = undefined;
						return true;
					} else {
						return false;
					}
				}
				function onClickRow(index){
					if (editIndex != index){
						if (endEditing()){
							$('#dg').datagrid('selectRow', index)
									.datagrid('beginEdit', index);
							editIndex = index;
						} else {
							$('#dg').datagrid('selectRow', editIndex);
						}
					}
				}
				function append(){
					if (endEditing()){
						$('#dg').datagrid('appendRow',{status:'P'});
						editIndex = $('#dg').datagrid('getRows').length-1;
						$('#dg').datagrid('selectRow', editIndex)
								.datagrid('beginEdit', editIndex);
					}
				}
				function removeit(){
					if (editIndex == undefined){return}
					$('#dg').datagrid('cancelEdit', editIndex)
							.datagrid('deleteRow', editIndex);
					editIndex = undefined;
				}
				function accept(){
					if (endEditing()){
						$('#dg').datagrid('acceptChanges');
					}
				}
				function reject(){
					$('#dg').datagrid('rejectChanges');
					editIndex = undefined;
				}
				function getChanges(){
					var rows = $('#dg').datagrid('getChanges');
					alert(rows.length+' rows are changed!');
				}
			</script>
        </div>
    </div>
    <style scoped="scoped">
        .tt-inner{
            display:inline-block;
            line-height:12px;
            padding-top:5px;
        }
        .tt-inner img{
            border:0;
        }
    </style>
</div>
</body>
<script type="text/javascript">
$('#p').panel({
	tools:'#tt'
});
$('#showContract').tooltip({
    position: 'left',
    content: '输出合同格式'
});
$('#tabss').tabs({
    border:false,
    tabPosition:'left',
    toolPosition:'right',
    onSelect:function(title,index){
    }
});
</script>
</html>