<%@page import="com.contact.menu.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head id="Head1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
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
    <link href="<%=context %>/css/default.css" rel="stylesheet" type="text/css" />
    
	<link rel="stylesheet" href="<%=context %>/js/jquery/themes/default/easyui.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<%=context %>/js/jquery/themes/icon.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<%=context%>/css/style.css" type="text/css" />
	<script src="<%=context %>/js/jquery/jquery.min.js"></script>
	<script src="<%=context %>/js/jquery/jquery.easyui.min.js"></script>
	<script src="<%=context %>/js/jquery/locale/easyui-lang-zh_CN.js"></script>

	<script type="text/javascript" src='<%=context %>/js/common/outlook.js'> </script>

    <script type="text/javascript">
    var basePath = '<%=basePath %>';
    var contextPath = '<%=context %>';
	 var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"系统管理",
							"menus":[{"menuname":"菜单管理","icon":"icon-nav","url":"http://www.16sucai.com"},
									{"menuname":"添加用户","icon":"icon-add","url":"demo.html"},
									{"menuname":"用户管理","icon":"icon-users","url":"demo2.html"},
									{"menuname":"角色管理","icon":"icon-role","url":"demo2.html"},
									{"menuname":"权限设置","icon":"icon-set","url":"demo.html"},
									{"menuname":"系统日志","icon":"icon-log","url":"demo.html"}
								]
						},{"menuid":"8","icon":"icon-sys","menuname":"员工管理",
							"menus":[{"menuname":"员工列表","icon":"icon-nav","url":"demo.html"},
									{"menuname":"视频监控","icon":"icon-nav","url":"demo1.html"}
								]
						},{"menuid":"56","icon":"icon-sys","menuname":"部门管理",
							"menus":[{"menuname":"添加部门","icon":"icon-nav","url":"demo1.html"},
									{"menuname":"部门列表","icon":"icon-nav","url":"demo2.html"}
								]
						},{"menuid":"28","icon":"icon-sys","menuname":"财务管理",
							"menus":[{"menuname":"收支分类","icon":"icon-nav","url":"demo.html"},
									{"menuname":"报表统计","icon":"icon-nav","url":"demo1.html"},
									{"menuname":"添加支出","icon":"icon-nav","url":"demo.html"}
								]
						},{"menuid":"39","icon":"icon-sys","menuname":"商城管理",
							"menus":[{"menuname":"商品分","icon":"icon-nav","url":"/shop/productcatagory.aspx"},
									{"menuname":"商品列表","icon":"icon-nav","url":"/shop/product.aspx"},
									{"menuname":"商品订单","icon":"icon-nav","url":"/shop/orders.aspx"}
								]
						}
				]};
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 200,
                resizable:false
            });
        }
        //关闭登录窗口
        function close() {
            $('#w').window('close');
        }

        function closeLogin(){
        	close();
        }

        //修改密码
        function serverLogin() {
        	var $oldpass = $('#txtOldPass');
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($oldpass.val() == '') {
                msgShow('系统提示', '请输入旧密码！', 'warning');
                return false;
            }
            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入新密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请输入确认密码！', 'warning');
                return false;
            }

            $.post("/contact/home/verifyPwd?oldPassword=" + $oldpass.val(), function(msg) {
            	if (msg.code == '1'){
            		msgShow('系统提示', '旧密码和系统的不一致，请重新输入!', 'info');
            		$oldpass.val('');
            		return false;
            	}
                if ($newpass.val() != $rePass.val()) {
                    msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                    return false;
                }

                $.post("/contact/home/modifyPwd?newPassword=" + $newpass.val(), function(msg) {
                    msgShow('系统提示', '恭喜，密码修改成功！', 'info');
                    $oldpass.val('');
                    $newpass.val('');
                    $rePass.val('');
                    close();
                })
            })
        }
        $(function() {
            openPwd();
            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {
                    if (r) {
                        location.href = '<%=context%>/loginOut';
                    }
                });

            })
			$(".menuItem").each(function() {
				$(this).bind("click", function() {
		
				});
			});
        });
    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="<%=context %>/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>
    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(../images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">${userInfo.userName},欢迎您！ <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; "><img src="<%=context %>/images/blocks.gif" width="20" height="20" align="absmiddle" /></span>
    </div>
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">By lsq</div>
    </div>
    <div region="west" split="true" title="导航菜单" style="width:180px;" id="west">
<!-- <div class="easyui-accordion" fit="true" border="false"> -->
		<!--  导航内容 start-->
	<div id="leftMenu" style="width:180px;height:auto;padding:0;">
	<c:forEach items="${menuInfo}" var="menu" varStatus="status">
	   <c:if test="${status.index eq 0}">
	     <div class="easyui-panel" title="${menu.menuName}" collapsible="true" style="width:180px;height:auto;padding:0;">
		    <ul>
		    <c:forEach items="${menu.childrenMenu}" var="secondMenu">
				<li><div><a target="mainFrame" link="${secondMenu.url}">${secondMenu.menuName}</a></div></li>
			</c:forEach>
			</ul>
		</div>
	   </c:if>
	   <c:if test="${status.index gt 0}">
	     <div class="easyui-panel" title="${menu.menuName}" collapsible="true" collapsed="true" style="width:180px;height:auto;padding:0;">
		    <ul>
		    <c:forEach items="${menu.childrenMenu}" var="secondMenu">
				<li><div><a target="mainFrame" link="${secondMenu.url}">${secondMenu.menuName}</a></div></li>
			</c:forEach>
			</ul>
		</div>
	   </c:if>
	</c:forEach>
	</div>
		<!--  导航内容 end-->
			<!-- </div> -->
    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">

<div class="mainMenus">
					<h1>销售管理</h1>
					<hr />
					<div class="mainMenus">
						<div class="menuItem" id="genFromList" action="genContactFromList">
							<div class="itemImg">
								<img alt="从列表中生成合同" src="<%=basePath%>/images/genFromList.png">
							</div>
							<div class="itemTitle">从列表中生成合同</div>
						</div>
						<div class="menuItem" id="genFromNo" action="genContactFromNo">
							<div class="itemImg">
								<img alt="从编码中生成合同" src="<%=basePath%>/images/genFromNo.png">
							</div>
							<div class="itemTitle">从编码中生成合同</div>
						</div>
						<div class="menuItem" id="contactManager"
							action="doContactManager">
							<div class="itemImg">
								<img alt="合同管理" src="<%=basePath%>/images/contactManager.png">
							</div>
							<div class="itemTitle">合同管理</div>
						</div>
					</div>
				</div>
				<div class="mainMenus">
					<h1>生产管理</h1>
					<hr />
					<div>
						<div class="menuItem" id="newOrder" action="createNewOrder">
							<div class="itemImg">
								<img alt="新订单生产安排" src="<%=basePath%>/images/newOrder.png">
							</div>
							<div class="itemTitle">新订单生产安排</div>
						</div>
					</div>
				</div>
				<div class="mainMenus">
					<h1>采购管理</h1>
					<hr />
					<div>
						<div class="menuItem" id="purchaseManager"
							action="doPurchaseManager">
							<div class="itemImg">
								<img alt="采购管理" src="<%=basePath%>/images/contactManager.png">
							</div>
							<div class="itemTitle">采购管理</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
    
    
    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>旧密码：</td>
                        <td><input id="txtOldPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)"
                        onclick="closeLogin()">取消</a>
            </div>
        </div>
    </div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>


</body>
</html>