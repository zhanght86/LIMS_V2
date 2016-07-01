<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>查看公告</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>	
<script src="module/notice_viewPage.js" type="text/javascript"
	charset="utf-8"></script>
</head>
<body class="common" style="width: 500px">
	<div class="formbody" >
		<div class="formtitle" style="width: 500px">
			<span>数据库配置</span>
		</div>
		<form action="" id="databaseInfo">
			<ul class="forminfo">
				<li><label>数据库类型</label>
					<div class="vocation">
						<select class="select3" name="databaseType" id="databaseType">
							<option value="MySQL">MySQL</option>
						</select>
					</div></li>
					<li></li>
				<li><label>数据库驱动</label>
					<div class="vocation">
						<select class="select3" name="driverClass" id="driverClass">
							<option value="com.mysql.jdbc.Driver">com.mysql.jdbc.Driver</option>
						</select>
					</div></li>
				<li></li>
				<li><label>数据库名称</label> <input name="name" id="name"
					type="text " class="dfinput required" value="bdc_LIMS" placeholder="必填项，请输入您的数据库名称，默认为bdc_LIMS" data-alert="数据库名称" /></li>
				<li><label>数据库账户</label> <input name="user" id="user"
					type="text " class="dfinput required" value="root" placeholder="必填项，请输入您的数据库账户，默认root" data-alert="数据库账户" /></li>
				<li><label>数据库密码</label> <input name="password" id="password"
					type="text " class="dfinput required"  placeholder="必填项，请输入您的数据库密码" data-alert="数据库密码" /></li>
				
			</ul>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 350
			});
		});
	</script>
</body>
</html>
