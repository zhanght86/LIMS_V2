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

<title>业务登记</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>合同变更记录</span>
		</div>
		<form action="" id="changeForm">
			<ul class="forminfo" style="width: 1000px">
				<li><label>变更原因</label><label class="viewLabel">${cc.reason
						}</label></li>
				<li><label>变更项</label><label class="viewLabel">${cc.changeColumn
						}</label></li>
				<li><label>变更内容</label> <label class="viewLabel">${cc.context
						}</label></li>
				<li style="line-height: 34px"><label>重新评审</label> <label
					class="viewLabel"> <c:if test="${cc.reAudit==1 }">
				否
				</c:if> <c:if test="${cc.reAudit==0 }">
				是
				</c:if>
				</label></li>
				<li><label>备注</label> <label class="viewLabel">${cc.other }</label></li>
			</ul>
			<s:hidden name="viewId" />
		</form>
	</div>
</body>
</html>
