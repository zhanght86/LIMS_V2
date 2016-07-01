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

<title>登录历史</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script src="js/paging-V1.3-final.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/module/historyLogin.js"></script>

</head>

<body class="common" style="width: 500px">
	<div class="formbody">
		<div class="formtitle">
			<span>登录历史记录</span>
		</div>
		<table class="tablelist" id="userTable" style="width: 600px">
			<thead>
				<tr>
					<th>用户编号</th>
					<th>登录IP</th>
					<th>登录时间</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#hisList" id="h">
					<tr>
						<td>${h.user.identify }</td>
						<td>${h.ip }</td>
						<td>${h.startDate }</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="pagin" style="width: 600px">
			<div class="message">
				共<i class="blue">${totalRecord}</i>条记录，当前显示第&nbsp;<i
					class="blue countPage">1&nbsp;</i>/<i class="blue" id="totalPage">${totalPage
					}</i>页
			</div>
			<div class="page" id="page1"></div>
		</div>
	</div>
</body>
</html>
