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

<title>新增检测项目</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
	<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="js/validCheck.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>新增检测项目</span>
		</div>
		<form action="analysisProject_analysisProject_add.action" id="analysisProjectAdd">
			<ul class="forminfo">
				<li><label>项目名称</label> <input name="name" id="name"
					type="text " class="dfinput required" placeholder="必填项，请输入项目名称" data-alert="项目名称" /></li>
				<li><label>检测类型</label>
					<div class="vocation">
						<s:select list="#analysisCategoryList" name="categoryId"  listKey="id" listValue="name" cssClass="select3" id="type"></s:select>
					</div></li>
				<li><label>项目描述</label> <textarea name="other"
						placeholder="描述该检测项目，不超过100个汉字" class="textinput" style="width: 350px;height:100px " rows="" cols=""></textarea></li>
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
