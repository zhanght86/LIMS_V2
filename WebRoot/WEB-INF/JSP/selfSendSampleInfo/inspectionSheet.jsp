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
<%-- <style type="text/css">
table {
	border: 1px solid #000;
	width: 100%;
}

table td {
	border: 1px solid #000;
	height: 30px;
	vertical-align: middle;
	font-size: 14px;
}
</style> --%>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle" style="width: 600px">
			<span>水质样品送检单</span>
		</div>
		<s:iterator value="#waterProject" id="wp">
			<div class="formbody" style="width: 600px;">
				<div class="formtitle" style="width: 600px">
					<span>${wp.name }</span>
				</div>
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
		<div class="formtitle" style="width: 600px">
			<span>土壤、底质样品送检单</span>
		</div>
		<s:iterator value="#solidProject" id="sp">
			<div class="formbody" style="width: 600px">
				<div class="formtitle" style="width: 600px">
					<span>${sp.name }</span>
				</div>
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
		<div class="formtitle" style="width: 600px">
			<span>固定污染源有组织废气样品送检单</span>
		</div>
		<s:iterator value="#fixedProject" id="fp">
			<div class="formbody" style="width: 600px">
				<div class="formtitle" style="width: 600px">
					<span>${fp.name }</span>
				</div>
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
		<div class="formtitle" style="width: 600px">
			<span>环境空气和无组织废气样品送检单</span>
		</div>
		<s:iterator value="#airProject" id="ap">
			<div class="formbody" style="width: 600px">
				<div class="formtitle" style="width: 600px">
					<span>${ap.name }</span>
				</div>
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
		});
	</script>
</body>
</html>
