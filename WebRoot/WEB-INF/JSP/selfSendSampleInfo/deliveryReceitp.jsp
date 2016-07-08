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
<style type="text/css">
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
</style>
</head>

<body class="common">
	<s:hidden id="viewId" name="viewId"></s:hidden>
	<div class="formbody" style="width: 600px;">
		<div class="formtitle" style="width: 600px">
			<span>水和废水样品交接联单</span>
		</div>
		<table>
			<thead>
				<tr>
					<td style="text-align:center">检测项目</td>
					<td style="text-align:center">样品信息</td>
					<td style="text-align:center">样品类别</td>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#waterProject" id="wp">
					<tr>
						<td style="text-align:center"><label>${wp.name }</label></td>
						<td>
							<table>
								<tr>
									<td style="text-align:center">样品编号</td>
									<td style="text-align:center">实验室编号</td>
									<td style="text-align:center">样品状态/颜色</td>
									<td style="text-align:center">是否完好</td>
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
						<td>
							<div class="vocation">
								<select class="select3 sampleType"  data-id ="${wp.id }">
									<option value="地表水">地表水</option>
									<option value="地下水">地下水</option>
									<option value="污水">污水</option>
									<option value="海水">海水</option>
									<option value="饮用水">饮用水</option>
									<option value="土壤">土壤</option>
									<option value="污泥">污泥</option>
									<option value="有组织废气">有组织废气</option>
									<option value="无组织废气">无组织废气</option>
									<option value="环境空气">环境空气</option>
								</select>
							</div>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<div class="formbody" style="width: 600px;">
		<div class="formtitle" style="width: 600px">
			<span>空气和废气样品交接联单</span>
		</div>
		<table>
			<thead>
				<tr>
					<td style="text-align:center">检测项目</td>
					<td style="text-align:center">样品信息</td>
					<td style="text-align:center">样品类别</td>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#airProject" id="ap">
					<tr>
						<td style="text-align:center"><label>${ap.name }</label></td>
						<td>
							<table>
								<tr>
									<td style="text-align:center">样品编号</td>
									<td style="text-align:center">实验室编号</td>
									<td style="text-align:center">样品状态/颜色</td>
									<td style="text-align:center">是否完好</td>
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
						<td>
							<div class="vocation">
								<select class="select3 sampleType"  data-id ="${ap.id }">
									<option value="地表水">地表水</option>
									<option value="地下水">地下水</option>
									<option value="污水">污水</option>
									<option value="海水">海水</option>
									<option value="饮用水">饮用水</option>
									<option value="土壤">土壤</option>
									<option value="污泥">污泥</option>
									<option value="有组织废气">有组织废气</option>
									<option value="无组织废气">无组织废气</option>
									<option value="环境空气">环境空气</option>
								</select>
							</div>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<div class="formbody" style="width: 600px;">
		<div class="formtitle" style="width: 600px">
			<span>土壤样品交接联单</span>
		</div>
		<table>
			<thead>
				<tr>
					<td style="text-align:center">检测项目</td>
					<td style="text-align:center">样品信息</td>
					<td style="text-align:center">样品类别</td>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#solidProject" id="sp">
					<tr>
						<td style="text-align:center"><label>${sp.name }</label></td>
						<td>
							<table>
								<tr>
									<td style="text-align:center">样品编号</td>
									<td style="text-align:center">实验室编号</td>
									<td style="text-align:center">样品状态/颜色</td>
									<td style="text-align:center">是否完好</td>
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
						<td>
							<div class="vocation">
								<select class="select3 sampleType" data-id ="${sp.id }">
									<option value="地表水">地表水</option>
									<option value="地下水">地下水</option>
									<option value="污水">污水</option>
									<option value="海水">海水</option>
									<option value="饮用水">饮用水</option>
									<option value="土壤">土壤</option>
									<option value="污泥">污泥</option>
									<option value="有组织废气">有组织废气</option>
									<option value="无组织废气">无组织废气</option>
									<option value="环境空气">环境空气</option>
								</select>
							</div>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : '200%'
			});
			$('.viewDelivery').click(function() {
				alert("aaa");
			});
			$('.exportDelivery')
					.click(
							function() {
								var type = $(this).data("type");
								var viewId = $('#viewId').attr('value');
								alert(type);
								asyncbox
										.confirm(
												'是否将当前环境要素的交接联单导出为Word格式？',
												'警告',
												function(action) {
													if (action == 'ok') {
														window.location.href = "selfSendSampleInfo_deliveryReceitp_export.action?exportType="
																+ type
																+ "&viewId="
																+ viewId;
													}
												});
							});
		});
	</script>
</body>
</html>
