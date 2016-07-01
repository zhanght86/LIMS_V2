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

<title>修改监测频次</title>

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
			<span>修改监测频次</span>
		</div>
		<form action="analysisProject_analysisProject_change.action" id="analysisProjectAdd">
			<ul class="forminfo">
				<li><label>监测频次</label>
					<s:textfield name="name" cssClass="dfinput required" placeholder="必填项，请输入监测频次" data-alert="监测频次不能为空"></s:textfield>
				</li>
				<li><label>频次描述</label>
					<s:textarea cssClass="textinput" cssErrorStyle="width: 350px;height:100px" placeholder="描述该监测频次，不超过500个汉字" name="other"></s:textarea>
				</li>
			</ul>
			<s:hidden name="id"/>
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
