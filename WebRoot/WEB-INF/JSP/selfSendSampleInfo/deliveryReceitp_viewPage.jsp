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

<title>交接联单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<link href="css/serviceContract.css" rel="stylesheet" type="text/css" />
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
	<input type="hidden" id="viewId" value="${project.id}">
	<div class="formbody" style="width: 900px;">
		<div class="formtitle" style="width: 900px">
			<span>水和废水样品交接联单</span>
		</div>
		<ul class="toolbar" style="padding-bottom:10px;">
			<li class="click exportDelivery" data-type="water" id="printWater"><span><img
					src="images/t10.png" /></span>查看</li>
		</ul>
		<table class="tablelist">
			<thead>
				<tr>
					<th style="text-align:center">检测项目</th>
					<th style="text-align:center">样品信息</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#waterProject" id="wp">
					<tr>
						<td style="text-align:center"><label>${wp.name }</label></td>
						<td>
							<table class="tablelist">
								<tr>
									<th style="text-align:center">样品编号</th>
									<th style="text-align:center">样品名称</th>
									<th style="text-align:center">样品状态</th>
									<th style="text-align:center">其他</th>
								</tr>
								<s:iterator value="#water" id="w">
									<s:iterator value="#w.analysisProjectSet" id="set">
										<c:if test="${set.id == wp.id }">
											<tr>
												<td style="text-align:center">${w.identify }</td>
												<td style="text-align:center">${w.sampleName }</td>
												<td style="text-align:center">${w.sampleState }</td>
												<td style="text-align:center">${w.other }</td>
											</tr>
										</c:if>
									</s:iterator>
								</s:iterator>

							</table>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<div class="formbody" style="width: 900px;">
		<div class="formtitle" style="width: 900px">
			<span>空气和废气样品交接联单</span>
		</div>
		<ul class="toolbar" style="padding-bottom:10px;">
			<li class="click exportDelivery" data-type="air" id="printAir"><span><img
					src="images/t10.png" /></span>查看</li>
		</ul>
		<table class="tablelist">
			<thead>
				<tr>
					<th style="text-align:center">检测项目</th>
					<th style="text-align:center">样品信息</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#airProject" id="ap">
					<tr>
						<td style="text-align:center"><label>${ap.name }</label></td>
						<td>
							<table class="tablelist">
								<tr>
									<th style="text-align:center">样品编号</th>
									<th style="text-align:center">样品名称</th>
									<th style="text-align:center">样品状态</th>
									<th style="text-align:center">其他</th>
								</tr>
								<s:iterator value="#air" id="a">
									<s:iterator value="#a.analysisProjectSet" id="set">
										<c:if test="${set.id == ap.id }">
											<tr>
												<td style="text-align:center">${a.identify }</td>
												<td style="text-align:center">${a.sampleName }</td>
												<td style="text-align:center">${a.sampleState }</td>
												<td style="text-align:center">${a.other }</td>
											</tr>
										</c:if>
									</s:iterator>
								</s:iterator>

							</table>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<div class="formbody" style="width: 900px;">
		<div class="formtitle" style="width: 900px">
			<span>土壤样品交接联单</span>
		</div>
		<ul class="toolbar" style="padding-bottom:10px;">
			<li class="click exportDelivery" data-type="solid" id="printSolid"><span><img
					src="images/t10.png" /></span>查看</li>
		</ul>
		<table class="tablelist">
			<thead>
				<tr>
					<th style="text-align:center">检测项目</th>
					<th style="text-align:center">样品信息</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#solidProject" id="sp">
					<tr>
						<td style="text-align:center"><label>${sp.name }</label></td>
						<td>
							<table class="tablelist">
								<tr>
									<th style="text-align:center">样品编号</th>
									<th style="text-align:center">样品名称</th>
									<th style="text-align:center">样品状态</th>
									<th style="text-align:center">其他</th>
								</tr>
								<s:iterator value="#solid" id="solid">
									<s:iterator value="#solid.analysisProjectSet" id="set">
										<c:if test="${set.id == sp.id }">
											<tr>
												<td style="text-align:center">${solid.identify }</td>
												<td style="text-align:center">${solid.sampleName }</td>
												<td style="text-align:center">${solid.sampleState }</td>
												<td style="text-align:center">${solid.other }</td>
											</tr>
										</c:if>
									</s:iterator>
								</s:iterator>

							</table>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 350
			});
			$('.exportDelivery')
					.click(
							function() {
								var type = $(this).data("type");
								var viewId = $('#viewId').attr('value');
								asyncbox
										.open({
											title : '查看交联单详情',
											top:0,
											url : "selfSendSampleInfo_deliveryReceitp_viewDetailPage.action?exportType="
													+ type
													+ "&viewId="
													+ viewId,
											width : 900,
											height : 600,
											btnsbar : $.btn.CANCEL,
											callback : function(action, opt) {
											}
										});
							});
		});
	</script>
</body>
</html>
