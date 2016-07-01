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
<base href="<%=basePath%>">
<title>欢迎使用实验室信息管理平台</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="<%=basePath%>images/lims.ico" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script src="js/module/login.js" type="text/javascript" charset="utf-8"></script>
</head>

<body
	style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>

	<div class="logintop">
		<span>欢迎登录邦达诚实验室信息管理平台</span>
		<ul>
			<li><a href="javascript:;" class="updateDetail">更新历史</a></li>
			<li><a href="javascript:;" class="helpPage">帮助</a></li>
			<li><a href="javascript:;" class="about">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<span class="systemlogo"></span>
		<form action="" id="loginForm">
			<div class="loginbox">
				<ul>
					<li><input name="identify" type="text" class="loginuser"
						style="font-weight: normal;"  /></li>
					<li><input name="password" type="password" class="loginpwd"
						style="color: black;" onclick="JavaScript:this.value=''"
						 /></li>
					<li><input type="button" id="login" class="loginbtn"
						value="登录" /> <label><a href="javascript:;" id="forget">忘记密码？</a></label></li>
				</ul>
			</div>
		</form>
	</div>
	<div class="loginbm">
		<label style="text-align: center; font-weight: bold;">
			版权所有&nbsp;&copy;&nbsp;2015&nbsp;&nbsp;常州邦达诚科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</label> <label style="position: absolute; right: 30px">公司地址：江苏省常州市新北区环保工业园环保一路2号&nbsp;&nbsp;&nbsp;&nbsp;联系电话：0519-89802620</label>
	</div>
</body>
</html>
