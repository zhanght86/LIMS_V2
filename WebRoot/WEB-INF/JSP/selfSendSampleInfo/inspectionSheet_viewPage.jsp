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
	<input type="hidden" id="viewId" value="${project.id}">
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>水质样品送检单</span>
		</div>
		<s:iterator value="#waterProject" id="wp">
			<div class="formbody" style="width: 900px;">
				<div class="formtitle" style="width: 900px">
					<span>${wp.name }</span>
				</div>
				<ul class="toolbar" style="padding-bottom:10px;">
					<li class="click exportSheet" data-type="water" data-id="${wp.id }"><span><img
							src="images/t10.png" /></span>查看</li>
				</ul>
				<table class="tablelist">
					<tr>
						<th style="text-align:center">样品编号</th>
						<th style="text-align:center">样品名称</th>
						<th style="text-align:center">样品状态</th>
						<th style="text-align:center">其他</th>
					</tr>
					<s:iterator value="#waterInspect" id="w">
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
			</div>
		</s:iterator>

	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>土壤、底质样品送检单</span>
		</div>
		<s:iterator value="#solidProject" id="sp">
			<div class="formbody" style="width: 900px">
				<div class="formtitle" style="width: 900px">
					<span>${sp.name }</span>
				</div>
				<ul class="toolbar" style="padding-bottom:10px;">
					<li class="click exportSheet" data-type="solid" data-id="${sp.id }"><span><img
							src="images/t10.png" /></span>查看</li>
				</ul>
				<table class="tablelist">
					<tr>
						<th style="text-align:center">样品编号</th>
						<th style="text-align:center">样品名称</th>
						<th style="text-align:center">样品状态</th>
						<th style="text-align:center">其他</th>
					</tr>
					<s:iterator value="#solidInspect" id="w">
						<s:iterator value="#w.analysisProjectSet" id="set">
							<c:if test="${set.id == sp.id }">
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
			</div>
		</s:iterator>


	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>固定污染源有组织废气样品送检单</span>
		</div>
		<s:iterator value="#fixedProject" id="fp">
			<div class="formbody" style="width: 900px">
				<div class="formtitle" style="width: 900px">
					<span>${fp.name }</span>
				</div>
				<ul class="toolbar" style="padding-bottom:10px;">
					<li class="click exportSheet" data-type="fixed" data-id="${fp.id }"><span><img
							src="images/t10.png" /></span>查看</li>
				</ul>
				<table class="tablelist">
					<tr>
						<th style="text-align:center">样品编号</th>
						<th style="text-align:center">样品名称</th>
						<th style="text-align:center">样品状态</th>
						<th style="text-align:center">其他</th>
					</tr>
					<s:iterator value="#fixedInspect" id="w">
						<s:iterator value="#w.analysisProjectSet" id="set">
							<c:if test="${set.id == fp.id }">
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
			</div>
		</s:iterator>
	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>环境空气和无组织废气样品送检单</span>
		</div>
		<s:iterator value="#airProject" id="ap">
			<div class="formbody" style="width: 900px">
				<div class="formtitle" style="width: 900px">
					<span>${ap.name }</span>
				</div>
				<ul class="toolbar" style="padding-bottom:10px;">
					<li class="click exportSheet" data-type="air" data-id="${ap.id }"><span><img
							src="images/t10.png" /></span>查看</li>
				</ul>
				<table class="tablelist">
					<tr>
						<th style="text-align:center">样品编号</th>
						<th style="text-align:center">样品名称</th>
						<th style="text-align:center">样品状态</th>
						<th style="text-align:center">其他</th>
					</tr>
					<s:iterator value="#airInspect" id="w">
						<s:iterator value="#w.analysisProjectSet" id="set">
							<c:if test="${set.id == ap.id }">
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
			</div>
		</s:iterator>


	</div>

	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 350
			});
			checkFun('analysisProjectTable');
			$('.exportSheet')
					.on(
							'click',
							function() {
								var type = $(this).data("type");//送检单的类型
								var itemId = $(this).data("id");//监测项目的id
								var viewId = $('#viewId').val();
								if (type == "water") {
									asyncbox
											.open({// 水质
												title : '水质样品送检单',
												top:0,
												url : 'selfSendSampleInfo_inspectionSheet_viewWaterDetailPage.action?viewId='
														+ viewId
														+ '&itemId='
														+ itemId,
												width : 900,
												height : 600,
												btnsbar : $.btn.CANCEL,
											});
								}
								if (type == "solid") {
									asyncbox
											.open({// 土壤
												title : '土壤、底质样品送检单',
												top:0,
												url : 'selfSendSampleInfo_inspectionSheet_viewSoilDetailPage.action?viewId='
														+ viewId
														+ '&itemId='
														+ itemId,
												width : 900,
												height : 600,
												btnsbar : $.btn.CANCEL,
											});
								}
								if (type == "fixed") {
									asyncbox
											.open({// 固定污染源
												title : '固定污染源有组织废气样品送检单',
												top:0,
												url : 'selfSendSampleInfo_inspectionSheet_viewSolidDetailPage.action?viewId='
														+ viewId
														+ '&itemId='
														+ itemId,
												width : 900,
												height : 600,
												btnsbar : $.btn.CANCEL,
											});
								}
								if (type == "air") {// 环境空气
									asyncbox
											.open({
												title : '环境空气和无组织废气样品送检单',
												top:0,
												url : 'selfSendSampleInfo_inspectionSheet_viewAirDetailPage.action?viewId='
														+ viewId
														+ '&itemId='
														+ itemId,
												width : 900,
												height : 600,
												btnsbar : $.btn.CANCEL,
											});
								}
							});
		});
	</script>
</body>
</html>
