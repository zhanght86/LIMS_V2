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

<title>检测结果填写</title>

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
<%-- <script src="js/module/detectionResult.js" type="text/javascript"
	charset="utf-8"></script> --%>

</head>

<body>
	<div class="common" style="width: 750px;">
		<div class="formbody">
			<div class="formtitle" style="width: 700px">
				<span>送检单与原始记录表</span>
			</div>
			<table class="tablelist" id="auditTable" style="width: 700px;">
				<thead>
					<tr>
						<th>送检类型</th>
						<th style="text-align: center;">分析项目</th>

						<th style="text-align: center;">原始记录</th>
						<th style="text-align: center;">送检单</th>

					</tr>
				</thead>
				<tbody>
					<s:iterator value="#inspectionSheets" id="i">
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
							<td style="text-align: center;"><a href="javascript:;"
								class="tablelink downRecord" data-id="${i.id }">查看</a></td>
							<td style="text-align: center;"><a href="javascript:;"
								class="tablelink viewInspectionSheet"
								data-type="${i.sheetType }" data-id="${i.analysisProject.id }"
								data-projectId="${projectId }">查看</a></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('.viewInspectionSheet')
					.click(
							function() {
								var typeNum = $(this).data("type");// 送检单的类型
								var itemId = $(this).data("id");// 监测项目的id
								var viewId = $(this).data("projectid");
								if (typeNum == 0) {
									asyncbox
											.open({// 水质
												title : '水质样品送检单',
												top : 0,
												url : 'selfSendSampleInfo_inspectionSheet_viewWaterDetailPage.action?viewId='
														+ viewId
														+ '&itemId='
														+ itemId,
												width : 700,
												height : 500,
												btnsbar : $.btn.CANCEL,
											});
								}
								if (typeNum == 1) {
									asyncbox
											.open({// 土壤
												title : '土壤、底质样品送检单',
												top : 0,
												url : 'selfSendSampleInfo_inspectionSheet_viewSoilDetailPage.action?viewId='
														+ viewId
														+ '&itemId='
														+ itemId,
												width : 700,
												height : 500,
												btnsbar : $.btn.CANCEL,
											});
								}
								if (typeNum == 2) {
									asyncbox
											.open({// 固定污染源
												title : '固定污染源有组织废气样品送检单',
												top : 0,
												url : 'selfSendSampleInfo_inspectionSheet_viewSolidDetailPage.action?viewId='
														+ viewId
														+ '&itemId='
														+ itemId,
												width : 700,
												height : 500,
												btnsbar : $.btn.CANCEL,
											});
								}
								if (typeNum == 3) {// 环境空气
									asyncbox
											.open({
												title : '环境空气和无组织废气样品送检单',
												top : 0,
												url : 'selfSendSampleInfo_inspectionSheet_viewAirDetailPage.action?viewId='
														+ viewId
														+ '&itemId='
														+ itemId,
												width : 700,
												height : 500,
												btnsbar : $.btn.CANCEL,
											});
								}
							});
			$('.downRecord')
					.click(
							function() {
								var id = $(this).attr("data-id");
								asyncbox
										.open({
											title : '查看原始记录表',
											url : 'detectionResult_detectionResult_viewPage.action?viewId='
													+ id,
											width : 700,
											height : 500,
											btnsbar : $.btn.CANCEL,
											callback : function(action, opt) {
											}
										});
							});
		})
	</script>
</body>
</html>
