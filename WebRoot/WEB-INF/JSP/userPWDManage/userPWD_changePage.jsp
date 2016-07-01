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

<title>密码修改</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.form.js" charset="utf-8"></script>
<script src="js/module/userPWDManage.js" type="text/javascript"
	charset="utf-8"></script>
</head>
<body class="common">

	<div class="formbody">

		<div id="usual1" class="usual">
			<div id="tab1" class="tabson">
				<div class="formbody">
					<form action="userPWDManage_userPWD_change.action"
						id="userPWDChange">
						<ul class="forminfo">
							<li><label>当前账号</label> <input name="" type="text"
								class="dfinput" value="${identify }" disabled="disabled" /></li>
							<li><label>当前密码</label> <input id="oldPWD" type="password"
								class="dfinput required" name="oldPWD" placeholder="请输入当前密码" /></li>
							<li><label>新密码</label> <input id="newPWD" type="password"
								class="dfinput required" name="password" placeholder="请输入新密码，长度为6到16位的字母、数字类型" /></li>
							<li><label>重复密码</label> <input id="newRepeatPWD"
								type="password" class="dfinput required" placeholder="请再次输入新密码" /></li>
							<li><label>&nbsp;</label><input name="" type="button"
								class="btn" id="changePwd" value="修改" /></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
