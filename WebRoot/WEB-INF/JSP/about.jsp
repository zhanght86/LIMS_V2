<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>关于本系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
</head>

<body class="common" style="width: 550px;">
	<div class="formbody" style="width: 540px;">
		<div class="formtitle" style="width: 540px;">
			<span>关于</span>
		</div>
		<ol class="forminfo">
			<li>软件名称：邦达诚实验室信息管理平台</li>
			<li>版本：V1.2</li>
			<li>开发者：瞿龙俊</li>
			<li>使用者：江苏省常州市邦达城科技有限公司</li>
		</ol>
		<p style="text-align: center; margin-top: 30px;">Copyright © 2015 - 2016 BonContact Inc. All Rights Reserved</p>
	</div>
</body>
</html>
