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

<title>查看公告</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>


</head>

<body class="common" style="width: 600px">
	<div class="formbody">
		<div class="formtitle">
			<c:if test="${priority==0 }">
				<span>${noticeHead }</span>
			</c:if>
			<c:if test="${priority==1 }">
				<span style="color:blue">${noticeHead }</span>
			</c:if>
			<c:if test="${priority==2 }">
				<span style="color:red;">${noticeHead }</span>
			</c:if>
		</div>
		<p style="margin-bottom: 20px;">发布者：${user.name }
			&nbsp;&nbsp;&nbsp;公布日期：${startDate }
			&nbsp;&nbsp;&nbsp;公布截止日期：${endDate }</p>
		<div style="width: 600px">${context }</div>
		<c:if test="${not empty path }">
			<p style="margin-top: 20px;">
				附件：<a href="javascript:;" class="tablelink download"
					data-id="${id}">下载 </a>
			</p>
		</c:if>

	</div>
	<script type="text/javascript">
	$(function(){
		$('.download').click(function(){
			var id = $(this).attr("data-id");
			asyncbox.confirm('是否下载附件？', '警告', function(action) {
				if (action == 'ok') {
					window.location.href="noticeManage_noticeManage_export.action?viewId="+id;
				}
			});
		});
	})
	</script>
</body>
</html>
