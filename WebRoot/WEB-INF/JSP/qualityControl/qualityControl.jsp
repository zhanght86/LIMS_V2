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

<title>质量控制统计</title>

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
<script src="js/module/qualityControl.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">质量控制</a></li>
			<li>质量控制统计</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">质量控制统计表</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<table class="tablelist" id="auditTable">
					<thead>
						<tr>
							<th style="text-align: center;">项目编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>项目名称</th>
							<th style="text-align: center;">任务下达时间</th>
							<th style="text-align: center;">任务书</th>
							<th style="text-align: center;">样品列表</th>
							<th style="text-align: center;">交联单</th>
							<th style="text-align: center;">送检单</th>
							<th style="text-align: center;">质控</th>
							<th style="text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#projectList" id="p">
							<tr>
								<td style="text-align: center;">${p.contractId }</td>
								<c:if test="${not empty p.tContractId }">
									<td>${p.tContractId.projectName }</td>
									<td style="text-align: center;">${p.projectBook.taskUnderDate }</td>
								</c:if>
								<c:if test="${not empty p.sContractId }">
									<td>${p.sContractId.name }</td>
									<td style="text-align: center;">${p.projectBook.taskUnderDate }</td>
								</c:if>
								<td style="text-align: center;"><a href="javascript:;"
									class="tablelink viewProjectBook" data-id="${p.id }">查看</a></td>
								<c:if test="${p.gainSample==1 }">
									<td style="text-align: center;"><a href="javascript:;"
										class="tablelink viewSelfSendInfo"
										data-gain="${p.gainSample }" data-id="${p.id }">查看</a></td>
								</c:if>
								<c:if test="${p.gainSample==0 }">
									<td style="text-align: center;"><a href="javascript:;"
										class="tablelink viewNonSelfSendInfo"
										data-gain="${p.gainSample }" data-id="${p.id }">查看</a></td>
								</c:if>

								<c:if test="${p.gainSample==1 }">
									<td style="text-align: center;"><a href="javascript:;"
										class="tablelink viewDeliveryReceitp" data-id="${p.id }">查看</a></td>
								</c:if>
								<c:if test="${p.gainSample==0 }">
								<td style="text-align: center;"><a href="javascript:;"
										class="tablelink viewNonDeliveryReceitp" data-id="${p.id }">查看</a></td>
								</c:if>
								<td style="text-align: center;"><a href="javascript:;"
									class="tablelink viewInspectionSheet" data-id="${p.id }">查看</a></td>
								<c:if test="${empty p.qualityControlSet }">
									<td style="text-align: center;"><a href="javascript:;"
										class="tablelink addQualityControl" data-id="${p.id }">生成</a></td>
								</c:if>
								<c:if test="${not empty p.qualityControlSet }">
									<td style="text-align: center;"><a href="javascript:;"
										class="tablelink exportQualityControl" data-id="${p.id }">查看</a>&nbsp;&nbsp;<a href="javascript:;"
										class="tablelink addQualityControl" data-id="${p.id }">修改</a>&nbsp;&nbsp;<a
										href="javascript:;" class="tablelink delQualityControl"
										data-id="${p.id }">删除</a></td>
								</c:if>
								<td style="text-align: center;"><a href="javascript:;" class="tablelink flow"
									data-id="${p.id }">业务流转</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<div class="pagin">
					<div class="message">
						共<i class="blue">${totalRecord}</i>条记录，当前显示第&nbsp;<i
							class="blue countPage">1&nbsp;</i>/<i class="blue" id="totalPage">
							${totalPage }</i>页
					</div>
					<div class="page" id="page1"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
