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
	<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="js/validCheck.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>新增检测分类</span>
		</div>
		<form action="analysisType_analysisType_add.action" id="analysisProjectAdd">
			<ul class="forminfo">
				<li><label>分类编号</label> <input name="identify" type="text "
					class="dfinput required" id="identity" data-alert="分类编号" placeholder="必填项，提交之后无法被修改"/>&nbsp;&nbsp;&nbsp;<input name=""
					type="button" class="scbtn" value="自动生成" id="autoCreate" /></li>
				<li><label>分类名称</label> <input name="name" id="name"
					type="text " class="dfinput required" placeholder="必填项，请输入分类名称" data-alert="分类名称" /></li>
				<li><label>分类描述</label> <textarea name="desp"
						placeholder="描述该分类，不超过100个汉字" class="textinput" style="width: 350px;height:100px " rows="" cols=""></textarea></li>
			</ul>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#autoCreate').click(function() {
				$.ajax({
					url : "analysisType_analysisType_autoCreate.action",
					async : false,
					success : function(data) {
						var json = eval('(' + data + ')');
						$('#identity').prop('value', json.identify);
					}

				});
			});
		});
	</script>
</body>
</html>
