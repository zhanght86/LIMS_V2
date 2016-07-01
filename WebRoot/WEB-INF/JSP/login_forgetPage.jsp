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

<title>密码找回界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>密码找回</span>
		</div>
		<form action="" id="userAdd">
			<ul class="forminfo">
				<li><label>用户名</label> <input name="identify" type="text "
					class="dfinput required" id="identify" data-alert="用户名" placeholder="请输入用户编号" /></li>
				<li>
				<li><label>用户姓名</label> <input name="name" id="name"
					type="text" class="dfinput required" data-alert="用户姓名" placeholder="请输入用户姓名" /></li>
				<li><label>身份证号</label> <input name="idCard" id="name"
					type="text" class="dfinput required idCard" data-alert="身份证号" placeholder="请输入18位证件号" /></li>
				<li><label>新密码</label> <input name="password" id="name"
					type="password" class="dfinput required pwd" data-alert="新密码" placeholder="请输入新密码，长度为6到16位的字母、数字类型" /></li>
				<li><label>重复新密码</label> <input name="newPassword" id="name" data-alert="重复新密码"
					type="password" class="dfinput required pwd" placeholder="请再次输入新密码" /></li>
			</ul>
		</form>
	</div>
</body>
</html>
