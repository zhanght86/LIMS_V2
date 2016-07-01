<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>编制报告</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"
	charset="utf-8"></script>
</head>

<body class="common" >
	<div class="formbody">
		<div class="formtitle" style="width: 1200px">
			<span>报告类别</span>
		</div>
		<form action="" id="reportForm">
		<input type="hidden" id="viewId" value="${viewId }">
			<ul class="forminfo" >
				<li><label style="width: 120px">选择报告模板</label> 
					<div class="vocation">
						<select class="select3" id="reportType" name="type">
							<option value="0">废气测试报告</option>
							<option value="1">噪声检测报告</option>
							<option value="2">水质检测报告</option>
							<option value="3">土壤监测报告</option>
							<option value="4">工业废气、烟尘测试报告</option>
						</select>
					</div></li>
				<li></li>
				<li><label style="width: 120px">&nbsp;</label> <input name=""
					type="button" class="scbtn" id="createReport" value="开始创建" /></li></ul>
			<s:hidden name="viewId" id="viewId" />
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 350
			});
			
			$('#createReport').on('click',function(){
				var name=$('#reportType').find('option:selected').html();
				var typeId=$('#reportType').find('option:selected').prop("value");
				var viewId=$('#viewId').val();
				asyncbox.confirm('是否开始创建<b style="color:red">【'+name+'】</b>类型的监测报告，系统会自动为当前报告分配流水编号，请及时保存！','警告', function(action) {
					if (action == 'ok') {
						window.location.href="report_report_referPage.action?reportType="+typeId+"&viewId="+viewId;
					}
				});
			});
		});
	</script>
</body>
</html>
