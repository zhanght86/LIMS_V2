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

<title>新增设备信息</title>

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
			<span>查看设备信息</span>
		</div>
			<ul class="forminfo">
				<li>
					<label>设备编号</label>
					<label class="viewLabel">${identify }</label>
				</li>
				<li>
					<label>设备名称</label>
					<label class="viewLabel">${name }</label>
				</li>
				<li>
					<label>设备管理员</label>
					<label class="viewLabel">${admin.name }</label>
				</li>
				<li>
					<label>供应商</label>
					<label class="viewLabel">${supplier.name }</label>
				</li>
				<li>
					<label>购买日期</label>
					<label class="viewLabel">${timeBuying }</label>
				</li>
				<li>
					<label>核心参数描述</label>
					<label class="viewLabel">${coreDesp }</label>
				</li>
				<li>
					<label>常用备品</label>
					<label class="viewLabel">${commonlyUserdParts }</label>
				</li>
				<li>
					<label>技术文档名称</label>
					<label class="viewLabel">${technicalDocument }</label>
				</li>
				<li>
					<label>文档管理员</label>
					<label class="viewLabel">${custodian.name }</label>
				</li>
			</ul>
	</div>
</body>
</html>
