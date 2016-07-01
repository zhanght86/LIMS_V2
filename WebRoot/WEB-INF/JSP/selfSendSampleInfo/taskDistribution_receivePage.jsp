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

<title>修改自送样登记表</title>

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
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$('.viewDeliveryReceitp')
				.click(
						function() {
							var id = $(this).attr("data-id");
							asyncbox
									.open({
										title : '查看交联单信息',
										url : 'selfSendSampleInfo_deliveryReceitp_viewDetailPage.action?viewId='
												+ id,
										width : 700,
										height : 500,
										btnsbar : $.btn.CANCEL,
										callback : function(action, opt) {
										}
									});
						});
		$('.export')
				.click(
						function() {
							var id = $(this).attr("data-id");
							var type = $(this).attr("data-type");
							asyncbox
									.confirm(
											'是否将该交联单导出为Word格式？',
											'警告',
											function(action) {
												if (action == 'ok') {
													window.location.href = "deliveryReceitp_deliveryReceitp_export.action?viewId="
															+ id
															+ "&exportType="
															+ type;
												}
											});
						});
		$('.receiveDeliveryReceitp').click(function(){
			asyncbox.confirm(
					'是否接收该交联单，该操作不可逆！',
					'警告',
					function(action) {
						if (action == 'ok') {
							
						}
					});
		});

	});
</script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>交联单列表</span>
		</div>
		<table class="tablelist" id="deliveryReceitpTable"
			style="width: 900px">
			<thead>
				<tr>
					<th>交联单类型</th>
					<th>项目总数</th>
					<th>分析项目</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#deliveryReceitpList" id="s" status="L">
					<tr>
						<c:if test="${s.samplesType==0}">
							<td>土壤</td>
						</c:if>
						<c:if test="${s.samplesType==1}">
							<td>水和废水</td>
						</c:if>
						<c:if test="${s.samplesType==2}">
							<td>空气和废气</td>
						</c:if>

						<td>${s.itemNum }</td>
						<td>${s.item }</td>
						<td><a href="javascript:;" data-id="${s.id }"
							data-type="${s.samplesType }" class="tablelink export">导出</a>&nbsp;&nbsp;<a
							href="javascript:;" data-id="${s.id }"
							data-type="${s.samplesType }"
							class="tablelink viewDeliveryReceitp">查看</a>&nbsp;&nbsp;
							<c:if test="${type==0 }">
							<a
							href="javascript:;" data-id="${s.id }"
							class="tablelink receiveDeliveryReceitp">接收</a>
							</c:if>
							 </td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</body>
</html>
