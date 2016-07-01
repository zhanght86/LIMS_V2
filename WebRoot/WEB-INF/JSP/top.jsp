<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>顶部导航栏</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/module/top.js" type="text/javascript"
	charset="utf-8"></script>

</head>
<body style="background:url(images/topbg.gif) repeat-x;">
	<div class="topleft">
		<a href="main.html" target="_parent"><img
			src="images/loginlogo.png" title="系统首页" /></a>
	</div>
	<ul class="nav">
		<li><a href="mainPage_main.action" target="_parent"
			class="selected"><img src="images/icon01.png" title="工作台" />
				<h2>首页</h2></a></li>
		<li><a href="contractManage_contract_addPage.action"
			target="rightFrame"><img src="images/icon02.png" title="模型管理" />
				<h2>合同起草</h2></a></li>
		<li><a href="javascript:;" target="rightFrame"><img
				src="images/icon03.png" title="模块设计" />
				<h2>绩效管理</h2></a></li>
		<li><a href="commonTemplet_commonTemplet_main.action"
			target="rightFrame"><img src="images/icon05.png" title="文件管理" />
				<h2>模板库</h2></a></li>
		<li><a href="basicSetting_basicSetting_main.action"
			target="rightFrame"><img src="images/icon06.png" title="系统设置" />
				<h2>系统设置</h2></a></li>
	</ul>
	<div class="topright">
		<ul>
			<li><span><img src="images/help.png" title="帮助"
					class="helpimg" /></span><a href="javascript:;">帮助</a></li>
			<li><a href="javascript:;">关于</a></li>
			<li><a href="mainPage_listen.action" target="rightFrame">设置监听</a></li>
			<li><a href="javascript:;" id="outLogin" target="_parent">退出</a></li>
		</ul>
		<div class="user">
			<span>${user.name }</span> <i class="newInfo"
				style="cursor: pointer;">消息</i> <b id="messageNum"
				style="cursor: pointer;" class="newInfo">0</b>
		</div>
	</div>
</body>
</html>
