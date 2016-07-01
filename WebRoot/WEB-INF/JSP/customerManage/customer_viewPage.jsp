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

<title>查看客户信息</title>

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
			<span>查看客户信息</span>
		</div>
			<ul class="forminfo">
				<li>
					<label>客户编号</label>
					<label class="viewLabel">${identify }</label>
				</li>
				<li>
					<label>客户姓名</label>
					<label class="viewLabel">${name }</label>
				</li>
				<li>
					<label>客户类型</label>
					<label class="viewLabel">${curType }</label>
				</li>
				<li>
				<label>是否VIP</label>
					<label class="viewLabel">${leaguer }</label>
				</li>

				<li>
					<label>列入时间</label>
					<label class="viewLabel">${entryTime }</label>
				</li>
				<li>
					<label>联系人</label>
					<label class="viewLabel">${linkMan }</label>
				</li>
				<li>
					<label>联系人职务</label>
					<label class="viewLabel">${linkManPosition }</label>
				</li>
				<li>
					<label>E-Mail</label>
					<label class="viewLabel">${email }</label>
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
					<label>客户住址</label>
					<label class="viewLabel">${address }</label>
				</li>
			</ul>
	</div>
</body>
</html>
