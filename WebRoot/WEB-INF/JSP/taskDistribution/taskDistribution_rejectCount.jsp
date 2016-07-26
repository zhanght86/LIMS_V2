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

<title>审核拒绝统计</title>

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
	<div class="formbody">
		<div class="formtitle" style="width: 700px">
			<span>审核拒绝统计</span>
		</div>
		
		<table class="tablelist" id="auditTable" style="width: 700px;">
						<thead>
							<tr>
								
								<th style="text-align: center;">分析项目</th>
								<th>送检单类型</th>
								<th>项目复核</th>
								<th>项目审核</th>
								<th>结果一审</th>
								<th>结果二审</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#inspect" id="i">
								<tr>							
									<td style="text-align: center;">${i.analysisProject.name }</td>
									<c:if test="${i.sheetType==0 }">
										<td>水质样品送检单</td>
									</c:if>
									<c:if test="${i.sheetType==1 }">
										<td>土壤、底质样品送检单</td>
									</c:if>
									<c:if test="${i.sheetType==2 }">
										<td>固定污染源有组织废气样品送检单</td>
									</c:if>
									<c:if test="${i.sheetType==3 }">
										<td>环境空气和无组织废气样品送检单</td>
									</c:if>
									<td style="text-align: center;">${i.reviewReject==null?"0":i.reviewReject }</td>
									<td style="text-align: center;">${i.itemReject==null?"0":i.itemReject }</td>
									<td style="text-align: center;">${i.firstReject==null?"0":i.firstReject }</td>
									<td style="text-align: center;">${i.secondReject==null?"0":i.secondReject }</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
		
	</div>
</body>
</html>
