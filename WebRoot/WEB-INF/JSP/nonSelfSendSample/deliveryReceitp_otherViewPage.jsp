<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<script src="js/validCheck.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle" style="width: 950px">
			<span>交联单列表</span>
		</div>
		<table class="tablelist" id="deliveryReceitpTable" style="width: 950px">
			<thead>
				<tr>
					<th>交联单类型</th>
					<th>监测类别</th>
					<th>项目总数</th>
					<th>分析项目</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#deliveryReceitpList" id="s" status="L">
					<tr>
						<td>${s.samplesType }</td>
						<td>${s.monitoringType }</td>
						<td>${s.itemNum }</td>
						<td>${s.item }</td>
						<td><a href="javascript:;" data-id="${s.id }" class="tablelink viewDeliveryReceitp">查看</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
	$(function(){
		$('.viewDeliveryReceitp').click(function(){
			var id = $(this).attr("data-id");
			asyncbox.open({
				title : '查看交联单信息',
				url : 'selfSendSampleInfo_deliveryReceitp_viewDetailPage.action?viewId=' + id,
				width : 500,
				height : 500,
				btnsbar : $.btn.CANCEL,
				callback : function(action, opt) {
				}
			});
		});
	});
	</script>
</body>
</html>
