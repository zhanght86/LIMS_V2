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

<title>实验分析审核</title>

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
<script src="js/module/resultAuditSecond.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">质量控制</a></li>
			<li>实验分析审核</li>
		</ul>
	</div>
	<div class="formbody">
		<div class="itab">
			<ul>
				<li><a href="#tab1" class="selected">实验分析审核</a></li>
			</ul>
		</div>
		<s:iterator value="#projectList" id="p">
			<div class="formtitle" style="width: 100%">
				<span>项目（合同）编号:&nbsp; ${p.contractId }</span>
			</div>
			<div class="tools">
				<ul class="toolbar">
					<li class="click referAll" data-id="${p.id }"><span><img
							src="images/t09.png" /></span>项目审核</li>
					<%-- <c:if test="${not empty p.recordAudit.secondAudit}">
						<li class="click flow" data-id="${p.id }"><span><img
								src="images/t09.png" /></span>业务流转</li>
					</c:if> --%>
					<li class="click viewProjectBook" data-id="${p.id }"><span><img
							src="images/t10.png" /></span>任务书</li>
					<c:if test="${p.gainSample==0 }">
						<li class="click viewNonDeliveryReceitp" data-id="${p.id }"><span><img
								src="images/t10.png" /></span>交联单</li>
					</c:if>
					<c:if test="${p.gainSample==1 }">
						<li class="click viewDeliveryReceitp" data-id="${p.id }"><span><img
								src="images/t10.png" /></span>交联单</li>
					</c:if>
					<li class="click viewQualityControl" data-id="${p.id }"><span><img
							src="images/t10.png" /></span>质量控制统计</li>
					<li class="click viewRecordAudit" data-projectId="${p.id }"><span><img
							src="images/t10.png" /></span>一审记录</li>
				</ul>
			</div>
			<table class="tablelist" id="auditTable">
				<thead>
					<tr>
						<th>送检类型</th>
						<th style="text-align: center;">分析项目</th>
						<th style="text-align: center;">分析员</th>
						<th style="text-align: center;">复核员</th>
						<th style="text-align: center;">审核员</th>
						<th style="text-align: center;">原始记录</th>
						<th style="text-align: center;">送检单</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#p.inspectionSheet" id="i">
						<tr>
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
							<td style="text-align: center;">${i.analysisProject.name }</td>
							<td style="text-align: center;">${i.analyst.name }</td>
							<td style="text-align: center;">${i.review.name }</td>
							<td style="text-align: center;">${i.audit.name }</td>
							<td style="text-align: center;"><a href="javascript:;"
								class="tablelink downRecord" data-id="${i.id }">查看</a></td>
							<td style="text-align: center;"><a href="javascript:;"
								class="tablelink viewInspectionSheet"
								data-type="${i.sheetType }" data-id="${i.analysisProject.id }"
								data-projectId="${p.id }">查看</a></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</s:iterator>
	</div>
</body>
</html>
