<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>合同管理系统</title>
	<%
	    String context = request.getContextPath();
	%>
	<link rel="stylesheet" href="<%=context %>/js/jquery/themes/default/easyui.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<%=context %>/js/jquery/themes/icon.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<%=context %>/css/main.css" type="text/css" media="screen" />
	<script src="<%=context %>/js/jquery/jquery.min.js"></script>
	<script src="<%=context %>/js/jquery/jquery.easyui.min.js"></script>
	<script src="<%=context %>/js/jquery/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	//判断用户是否输入用户名
	function verifyBeforeSbumit(){
		var usernameField = document.loginForm.username;
		var passwordField = document.loginForm.password;
		var username = usernameField.value.trim();
		var password = passwordField.value.trim();
		
		if(username == ""){
			alert("请输入用户名！");
			usernameField.value = '';
			usernameField.focus();
			return false;	
		}
		
		if(password == ""){
			alert("请输入密码！");
			passwordField.value = '';
			passwordField.focus();
			return false;	
		}				
		return true;
	}
	</script>
</head>
<body style="visibility:visible">
	<div class="easyui-dialog" style="width:500px;height:300px;background:#fafafa;overflow:hidden"
			title="用户登录" closable="false" border="false">
		<div class="header" style="height:60px;">
			<div class="toptitle">合同管理系统</div>
		</div>
		<div style="padding:60px 0;">
			<form name="loginForm" action="<%=context %>/home/login" method="post" onsubmit="return verifyBeforeSbumit()">
				<div style="padding-left:150px">
					<table cellpadding="0" cellspacing="3">
						<tr>
							<td>用户角色</td>
							<td>
							<select id="cc" class="easyui-combobox" name="role" style="width:140px;">
							</select>
							</td>
						</tr>
						<tr>
							<td>登录帐号</td>
							<td><input name="username"></input></td>
						</tr>
						<tr>
							<td>登录密码</td>
							<td><input type="password" name="password"></input></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input class="login" type="submit" value="" style="width:74px;height:21px;border:0"></input>
							</td>
						</tr>
					</table>
				</div>
				
			</form>
		</div>
	</div>
</body>
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
	<%
	   Object fromLogin = session.getAttribute("fromLogin");
	   if (null != fromLogin){
	%>
		   alert("用户名或密码不正确!");
	<%
	   }
	%>
</script>
</html>