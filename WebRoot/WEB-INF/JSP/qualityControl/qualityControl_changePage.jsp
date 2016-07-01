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

<title>质量控制统计表登记</title>

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
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>统计记录表</span>
		</div>
		<form action="qualityControl_qualityControl_change.action" id="qualityForm">
			<ul class="forminfo">
				<li><label style="width: 120px">分析项目名称</label>
					<s:textfield name="analysisProject.name" cssClass="dfinput" id="item" placeholder="点击选择分析项目"></s:textfield>
					<s:hidden id="itemId" name="itemId" cssClass="required"  data-alert="分析项目名称"/>
				</li>
				<li><label style="width: 120px">样品数</label>
				<s:textfield cssClass="dfinput required integer" data-alert="样品数" placeholder="请输入样品数量，整数类型" name="SampleNum"></s:textfield>
				</li>
				<li><label style="width: 120px">现场平行样个数</label>
					<s:textfield cssClass="dfinput integer"  name="parallelSample"  placeholder="请输入现场平行样数量，整数类型"  data-alert="现场平行样个数"></s:textfield>
				</li>
				<li><label style="width: 120px">实验室平行样个数</label>
					<s:textfield cssClass="dfinput integer"  name="laboratorySampleNum"  placeholder="请输入实验室平行样数量，整数类型"  data-alert="实验室平行样个数"></s:textfield>
				</li>
				<li><label style="width: 120px">实验室平行样编号</label>
				<c:if test="${gainSample==0 }">
				<s:textfield cssClass="dfinput" id="sysSampleName" placeholder="点击选择样品编号" name="nonLaboratorySample.sampleName"></s:textfield>
				</c:if>
				<c:if test="${gainSample==1 }">
				<s:textfield cssClass="dfinput" id="sysSampleName" placeholder="点击选择样品编号" name="laboratorySample.sampleName"></s:textfield>
				</c:if>
				
				<s:hidden id="sysSampleId" name="sysSampleId"></s:hidden>
				<li><label style="width: 120px">加标回收样个数</label>
					<s:textfield cssClass="dfinput integer"  name="spikedRecoverySampleNum"  placeholder="请输入加标回收样数量，整数类型"  data-alert="加标回收样个数"></s:textfield>
				</li>
				<li><label style="width: 120px">加标回收样编号</label>
				<c:if test="${gainSample==0 }">
				<s:textfield cssClass="dfinput" id="backSampleName" placeholder="点击选择样品编号" name="nonSpikedRecoverySample.sampleName"></s:textfield>
				</c:if>
				<c:if test="${gainSample==1 }">
				<s:textfield cssClass="dfinput" id="backSampleName" placeholder="点击选择样品编号" name="nonSpikedRecoverySample.sampleName"></s:textfield>
				</c:if>
					<s:hidden cssClass="dfinput" id="backSampleId" name="backSampleId" ></s:hidden></li>
				<li><label style="width: 120px">盲样个数</label>
					<s:textfield cssClass="dfinput integer"  name="blindSample"  placeholder="请输入盲样数量，整数类型"  data-alert="盲样个数"></s:textfield>
				</li>
			</ul>
			<s:hidden name="projectId" id="viewId" />
			<s:hidden name="id"/>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 150
			});
			$('#item')
					.focus(
							function() {
								var id = $('#viewId').prop('value');
								
								asyncbox
										.open({
											title : '选择分析项目',
											url : 'analysisProject_analysisProject_choosePageByInspection.action?viewId='
													+ id,
											width : 700,
											height : 400,
											btnsbar : [ {
												text : '选　择',
												action : 'ok'
											} ].concat($.btn.CANCEL),
											callback : function(action, opt) {// 判断 action 值。
												if (action == 'ok') {
													var table = $(opt.document);
													var oChecks = table
															.find('tbody input[type=radio]:checked');
													$('#item').prop(
															'value',
															oChecks.parents(
																	'td')
																	.next()
																	.html());
													$('#itemId').prop(
															'value',
															oChecks.parents(
																	'td').attr(
																	'data-id'));
												}
											}

										});
							});
			$('#sysSampleName')
					.focus(
							function() {
								var id = $('#viewId').prop('value');
								asyncbox
										.open({
											title : '选择样品',
											url : 'selfSendSampleInfo_selfSendSampleInfo_choosePageQuality.action?viewId='
													+ id,
											width : 700,
											height : 400,
											btnsbar : [ {
												text : '选　择',
												action : 'ok'
											} ].concat($.btn.CANCEL),
											callback : function(action, opt) {// 判断 action 值。
												if (action == 'ok') {
													var table = $(opt.document);
													var oChecks = table
															.find('tbody input[type=radio]:checked');
													$('#sysSampleName').prop(
															'value',
															oChecks.parents(
																	'td')
																	.next()
																	.next()
																	.html());
													$('#sysSampleId').prop(
															'value',
															oChecks.parents(
																	'td').attr(
																	'data-id'));
												}
											}

										});
							});

			$('#backSampleName')
					.focus(
							function() {
								var id = $('#viewId').prop('value');
								asyncbox
										.open({
											title : '选择样品',
											url : 'selfSendSampleInfo_selfSendSampleInfo_choosePageQuality.action?viewId='
													+ id,
											width : 700,
											height : 400,
											btnsbar : [ {
												text : '选　择',
												action : 'ok'
											} ].concat($.btn.CANCEL),
											callback : function(action, opt) {// 判断 action 值。
												if (action == 'ok') {
													var table = $(opt.document);
													var oChecks = table
															.find('tbody input[type=radio]:checked');
													$('#backSampleName	').prop(
															'value',
															oChecks.parents(
																	'td')
																	.next()
																	.next()
																	.html());
													$('#backSampleId').prop(
															'value',
															oChecks.parents(
																	'td').attr(
																	'data-id'));
												}
											}

										});
							});
		});
	</script>
</body>
</html>
