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

<title>送检单填写</title>

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
<script src="js/paging-V1.3-final.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="css/My97DatePicker/WdatePicker.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body class="common">
	<form action="" id="deliveryAdd">
		<div class="formbody">
			<div class="formtitle" style="width: 600px">
				<span>送检单列表</span>
			</div>
			<table class="tablelist" id="analysisProjectTable"
				style="width: 600px">
				<thead>
					<tr>
						<th>分析项目名称</th>
						<th>所属分类</th>
						<th>送检单类型</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#inspectionList" id="a">
						<tr>
							<td>${a.analysisProject.name }</td>

							<c:if test="${a.analysisProject.type==0 }">
								<td>土壤</td>
							</c:if>
							<c:if test="${a.analysisProject.type==1 }">
								<td>水和废水</td>
							</c:if>
							<c:if test="${a.analysisProject.type==2 }">
								<td>空气和废气</td>
							</c:if>
							<c:choose>
								<c:when test="${a.sheetType==0 }">
								<td>水质样品送检单</td>
								</c:when>
								<c:when test="${a.sheetType==1 }">
								<td>土壤、底质样品送检单</td>
								</c:when>
								<c:when test="${a.sheetType==2 }">
								<td>固定污染源有组织废气样品送检单</td>
								</c:when>
								<c:when test="${a.sheetType==3 }">
								<td>环境空气和无组织废气样品送检单</td>
								</c:when>
							</c:choose>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>
