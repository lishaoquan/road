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
    <h2>Tabs with Images</h2>
    <p>The tab strip can display big images.</p>
    <div style="margin:20px 0;"></div>
    <div class="easyui-tabs" data-options="tabWidth:100,tabHeight:60" style="width:700px;height:250px">
        <div title="<span class='tt-inner'><img src='images/modem.png'/><br>Modem</span>" style="padding:10px">
            <p>A modem (modulator-demodulator) is a device that modulates an analog carrier signal to encode digital information, and also demodulates such a carrier signal to decode the transmitted information.</p>
        </div>
        <div title="<span class='tt-inner'><img src='images/scanner.png'/><br>Scanner</span>" style="padding:10px">
            <p>In computing, an image scanner—often abbreviated to just scanner—is a device that optically scans images, printed text, handwriting, or an object, and converts it to a digital image.</p>
        </div>
        <div title="<span class='tt-inner'><img src='images/pda.png'/><br>Pda</span>" style="padding:10px">
            <p>A personal digital assistant (PDA), also known as a palmtop computer, or personal data assistant, is a mobile device that functions as a personal information manager. PDAs are largely considered obsolete with the widespread adoption of smartphones.</p>
        </div>
        <div title="<span class='tt-inner'><img src='images/tablet.png'/><br>Tablet</span>" style="padding:10px">
            <p>A tablet computer, or simply tablet, is a one-piece mobile computer. Devices typically have a touchscreen, with finger or stylus gestures replacing the conventional computer mouse.</p>
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
</body>
</html>