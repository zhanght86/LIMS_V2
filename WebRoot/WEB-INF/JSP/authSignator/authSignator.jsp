<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

<title>授权签字人</title>

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
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="css/My97DatePicker/WdatePicker.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/paging-V1.3-final.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.form.js" charset="utf-8"></script>
<script src="js/module/authSignator.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">系统管理</a></li>
			<li>授权签字人</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">授权签字人</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<div class="tools">
					<ul class="toolbar">
						<li class="click" id="newSignator"><span><img
								src="images/t01.png" /></span>新增</li>
					</ul>
					<ul class="toolbar1">
						<li class="help"><a href="help.html" target="_blank"><span><img
									src="images/t08.png" /></span>帮助</a></li>
					</ul>
				</div>
				<table class="tablelist" id="roleTable">
					<thead>
						<tr>
							<th style="text-align: center;">用户姓名</th>
							<th style="text-align: center;">废气报告</th>
							<th style="text-align: center;">噪声报告</th>
							<th style="text-align: center;">水质报告</th>
							<th style="text-align: center;">土壤报告</th>
							<th style="text-align: center;">工业废气、烟尘测试报告</th>
							<th style="text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#signatorList" id="s">
							<tr>
								<td style="text-align: center;">${s.user.name}</td>
								<c:set var="theString" value="${s.reportType }"/>
								<c:if test="${fn:contains(theString,'0')}">
									<td style="text-align: center;">√</td>
								</c:if>
								<c:if test="${!fn:contains(theString,'0')}">
									<td style="text-align: center;">×</td>
								</c:if>
								<c:if test="${fn:contains(theString,'1')}">
									<td style="text-align: center;">√</td>
								</c:if>
								<c:if test="${!fn:contains(theString,'1')}">
									<td style="text-align: center;">×</td>
								</c:if>
								<c:if test="${fn:contains(theString,'2')}">
									<td style="text-align: center;">√</td>
								</c:if>
								<c:if test="${!fn:contains(theString,'2')}">
									<td style="text-align: center;">×</td>
								</c:if>
								<c:if test="${fn:contains(theString,'3')}">
									<td style="text-align: center;">√</td>
								</c:if>
								<c:if test="${!fn:contains(theString,'3')}">
									<td style="text-align: center;">×</td>
								</c:if>
								<c:if test="${fn:contains(theString,'4')}">
									<td style="text-align: center;">√</td>
								</c:if>
								<c:if test="${!fn:contains(theString,'4')}">
									<td style="text-align: center;">×</td>
								</c:if>
								<c:if test="${role.identify!='JS0000'}">
									<td style="text-align: center;"><a href="javascript:;"
										class="tablelink delSignator" data-id="${s.id}"> 删除 </a></td>
								</c:if>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<div class="pagin">
					<div class="message">
						共<i class="blue">${totalRecord}</i>条记录，当前显示第&nbsp;<i
							class="blue countPage">1&nbsp;</i>/<i class="blue" id="totalPage">${totalPage
							}</i>页
					</div>
					<div class="page" id="page1"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
