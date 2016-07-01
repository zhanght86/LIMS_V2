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

<title>新增角色信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>新增角色</span>
		</div>
		<form action="roleManage_role_add.action" id="roleAdd">
			<ul class="forminfo">
				<li><label>角色编号</label> <input name="identify" type="text "
					class="dfinput required" id="identity" placeholder="必填项，提交之后无法被修改" />&nbsp;&nbsp;&nbsp;<input
					name="" type="button" class="scbtn" value="自动生成" id="autoCreate" /></li>
				<li>
				<li><label>角色名称</label> <input name="name" id="name"
					type="text " class="dfinput required" placeholder="必填项" /></li>
				<li><label>角色描述</label> <textarea name="desp"
						placeholder="描述该角色，不超过100个字符" class="textinput" rows="" cols=""
						id="desp"></textarea></li>
				<li><label>所属部门</label>
					<div class="vocation">
						<s:select cssClass="select3" name="departmentId" list="#departmentList" listKey="id"
							listValue="name" />
					</div></li>
			</ul>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width: 150
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
