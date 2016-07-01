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

<title>新增用户信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>查看用户信息</span>
		</div>
			<ul class="forminfo">
				<li>
					<label>用户编号</label>
					<label class="viewLabel">${identify }</label>
				</li>
				<li>
					<label>用户姓名</label>
					<label class="viewLabel">${name }</label>
				</li>
				<li>
					<label id="sexSS">性别</label>
					<label class="viewLabel">${sex }</label>
				</li>
				<li>
					<label>身份证号</label>
					<label class="viewLabel">${idCard }</label>
				</li>
				<li>
					<label>联系电话</label>
					<label class="viewLabel">${tel }</label>
				</li>
				<li>
					<label>工作电话</label>
					<label class="viewLabel">${workTel }</label>
				</li>
				<li>
					<label>入职时间</label>
					<label class="viewLabel">${entryTime }</label>
				</li>
				<li>
					<label>家庭住址</label>
					<label class="viewLabel">${address }</label>
				</li>
				<li>
					<label>联系人</label>
					<label class="viewLabel">${contacts }</label>
				</li>
				<li>
					<label>紧急电话</label>
					<label class="viewLabel">${contactsTel }</label>
				</li>
				<li>
					<label>设置角色</label>
					<label class="viewLabel">${role.name }</label>
				</li>
			</ul>
	</div>
</body>
</html>
