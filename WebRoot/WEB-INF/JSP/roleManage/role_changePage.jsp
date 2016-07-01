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

<title>修改角色信息</title>

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
			<span>修改角色</span>
		</div>
		<form action="roleManage_role_change.action" id="roleAdd">
			<ul class="forminfo">
				<li><label>角色编号</label> <s:textfield name="identify"
						cssClass="dfinput required" disabled="true" id="identity"
						placeholder="请输入角色编号"></s:textfield><i>角色编号无法被修改</i>
					</li>
				<li>
				<li><label>角色名称</label> <!-- <input name="name" id="name"
					type="text " class="dfinput required" placeholder="必填项" /> --> <s:textfield
						cssClass="dfinput required" placeholder="必填项" id="name"
						name="name"></s:textfield></li>
				<li><label>角色描述</label> <s:textarea name="desp"
						placeholder="描述该角色，不超过100个字符" cssClass="textinput" id="desp"></s:textarea></li>
				<li><label>所属部门</label>
					<div class="vocation">
						<s:select cssClass="select3 dfinput" name="departmentId"
							list="#departmentList" listKey="id" listValue="name" />
					</div></li>
			</ul>
			<s:hidden name="identify"></s:hidden>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 150
			});
		});
	</script>
</body>
</html>
