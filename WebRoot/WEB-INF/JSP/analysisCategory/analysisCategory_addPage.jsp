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

<title>新增环境要素</title>

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
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>新增环境要素</span>
		</div>
		<form action="analysisCategory_analysisCategory_add.action"
			id="analysisGategoryAdd">
			<ul class="forminfo">
				<li><label>要素名称</label> <input name="name" id="name"
					type="text " class="dfinput required" placeholder="必填项，请输入环境要素名称"
					data-alert="环境要素名称" /></li>
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
				<li><label>要素描述</label> <textarea name="other"
						placeholder="描述该环境要素，不超过100个汉字" class="textinput"
						style="width: 350px;height:100px " rows="" cols=""></textarea></li>
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
