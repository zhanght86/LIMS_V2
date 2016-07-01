<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

<title>修改部门信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/module/validCheck.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>修改部门信息</span>
		</div>
		<form action="departmentManage_department_change.action" id="departmentAdd">
			<ul class="forminfo">
				<li><label>部门编号</label>
					<s:textfield name="identify" cssClass="dfinput required"  disabled="true" id="identity" placeholder="请输入部门编号" ></s:textfield><i>部门编号无法被修改</i>
				</li>
				<li>
				<li><label>部门名称</label> 
					<s:textfield cssClass="dfinput required" placeholder="必填项" id="name" name="name"></s:textfield>
				</li>
				<li><label>部门描述</label>
						<s:textarea name="desp" placeholder="描述该部门，不超过100个字符" cssClass="textinput" id="desp" ></s:textarea>
			</ul>
			<s:hidden name="identify"/>
			<s:hidden name="id"/>
		</form>
	</div>
	
</body>
</html>
