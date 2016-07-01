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
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="js/module/validCheck.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>修改环境要素</span>
		</div>
		<form action="analysisProject_analysisProject_change.action"
			id="analysisProjectAdd">
			<ul class="forminfo">
				<li><label>环境要素</label> <s:textfield name="name"
						cssClass="dfinput required" placeholder="必填项，请输入环境要素"
						data-alert="项目名称"></s:textfield></li>
				<li><label>交接联单</label>
					<div class="vocation">
						<select class="select3" name="deliveryReceitp">
							<option value="1" selected="selected">水和废水样品交接联单</option>
							<option value="2">空气和废气样品交接联单</option>
							<option value="3">土壤样品交接联单</option>
						</select>
					</div></li>
				<li></li>
				<li><label>送检单</label>
					<div class="vocation">
						<select class="select3" name="inspectionSheet">

							<option value="1" selected="selected">水质样品送检单</option>
							<option value="2">环境空气和无组织废气样品送检单</option>
							<option value="3">土壤、底质样品送检单</option>
							<option value="4">固定污染源有组织废气样品送检单</option>
						</select>
					</div></li>
				<li></li>
				<li><label>项目描述</label> <s:textarea cssClass="textinput"
						cssErrorStyle="width: 350px;height:100px"
						placeholder="描述该环境要素，不超过1000个字符" name="other"></s:textarea></li>
			</ul>
			<s:hidden name="id" />
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
