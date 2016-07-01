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

<title>新增授权签字人</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>新增授权签字人</span>
		</div>
		<form action="" id="authSignatorAdd">
			<ul class="forminfo">
				<li><label>选择用户</label>
					<div class="vocation">
						<s:select cssClass="select3" name="userId" list="#userList"
							listKey="id" listValue="name" />
					</div></li>
				<li ><label>授权类型</label>
				<label for="air"><input type="checkbox" id="air" name="typeIds" value="0">废气</label>
				<label for="voice"><input type="checkbox" id="voice" name="typeIds" value="1">噪声</label>
				<label for="water"><input type="checkbox" id="water" name="typeIds" value="2">水质</label>
				<label for="soil"><input type="checkbox" id="soil" name="typeIds" value="3">土壤</label>
				<label for="solid" style="width: 300px;"><input type="checkbox" id="solid" name="typeIds" value="4">工业废气、烟尘</label> </li>
				<li>
			</ul>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 250
			});
			$('#autoCreate').click(function() {
				$.ajax({
					url : "roleManage_role_autoCreate.action",
					async : false,
					success : function(data) {
						var json = eval('(' + data + ')');
						$('#identity').attr('value', json.identify);
					}

				});
			});
		});
	</script>
</body>
</html>
