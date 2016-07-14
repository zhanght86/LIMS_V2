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
		<div class="formtitle" style="width: 1100px">
			<span>样品信息</span>
		</div>
		<c:if test="${project.gainSample=='1' }">
			<table class="tablelist" id="departmentTable" style="width: 1100px">
				<thead>
					<tr>
						<th style="text-align: center;">样品编号</th>
						<th style="text-align: center;">实验室编号</th>
						<th style="text-align: center;">样品状态/颜色</th>
						<th>测试项目</th>
						<th style="text-align: center;">是否完好</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#selfSendSampleInfoList" id="s" status="L">
						<tr>
							<td style="text-align: center;">${s.identify }</td>
							<td style="text-align: center;">${s.sampleName }</td>
							<td style="text-align: center;">${s.sampleState }</td>
							<td>${s.analysisProject.name } <s:iterator
								value="#s.analysisProjectSet" id="it">
								${it.name },
							</s:iterator>
						</td>
							<td style="text-align: center;">${s.other }</td>
						</tr>
					</s:iterator>

				</tbody>
			</table>
		</c:if>
		<c:if test="${project.gainSample=='0' }">
			<table class="tablelist" id="departmentTable" style="width: 1100px">
				<thead>
					<tr>
						<th>样品编号</th>
						<th>样品名称</th>
						<th>样品状态</th>
						<th>采样地点</th>
						<th>测试项目</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#nonSelfSendSampleInfoList" id="s" status="L">
						<tr>
							<td>${s.identify }</td>
							<td>${s.sampleName }</td>
							<td>${s.sampleState }</td>
							<td>${s.samplingPosition }</td>
							<td>${s.analysisProject.name }</td>
							<td>${s.other }</td>
						</tr>
					</s:iterator>

				</tbody>
			</table>
		</c:if>
	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>质量控制统计表登记</span>
		</div>
		<table class="tablelist" id="departmentTable" style="width: 1100px">
			<tr style="border: 1px solid black;">
				<td width="47" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>序号 </strong>
					</p></td>
				<td width="136" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>分析项目名称 </strong>
					</p></td>
				<td width="81" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>样品数 </strong>
					</p></td>
				<td width="94" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>现场平行样(个)</strong>
					</p></td>
				<td colspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>实验室平行样 </strong>
					</p></td>
				<td colspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>加标回收样 </strong>
					</p></td>
				<td width="100" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>盲样(个)</strong>
					</p></td>
				<td width="100" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>操作</strong>
					</p></td>
			</tr>
			<tr style="border: 1px solid black">
				<td width="130" style="border: 1px solid black"><p
						align="center">
						<strong>个数 </strong>
					</p></td>
				<td width="132" style="border: 1px solid black"><p
						align="center">
						<strong>样品编号 </strong>
					</p></td>
				<td width="102" style="border: 1px solid black"><p
						align="center">
						<strong>个数 </strong>
					</p></td>
				<td width="118" style="border: 1px solid black"><p
						align="center">
						<strong>样品编号 </strong>
					</p></td>
			</tr>
			<s:iterator value="#qualityControlList" id="q" status="L">
				<tr style="border: 1px solid black">
					<td width="47" valign="top" style="border: 1px solid black"><p
							align="center">${L.index+1 }</p></td>
					<td width="136" valign="top" style="border: 1px solid black"><p
							align="center">${q.analysisProject.name }</p></td>
					<td width="81" valign="top" style="border: 1px solid black"><p
							align="center">${q.sampleNum }</p></td>
					<td width="94" valign="top" style="border: 1px solid black"><p
							align="center">${q.parallelSample }</p></td>
					<td width="130" valign="top" style="border: 1px solid black"><p
							align="center">${q.laboratorySampleNum }</p></td>
					<c:if test="${not empty laboratorySampleIdentifys }">
						<td width="132" valign="top" style="border: 1px solid black"><p
								align="center">${q.laboratorySampleIdentifys }</p></td>
					</c:if>
					<c:if test="${empty laboratorySampleIdentifys}">
					<td width="132" valign="top" style="border: 1px solid black"><p
								align="center"></p></td>
					</c:if>
					<td width="102" valign="top" style="border: 1px solid black"><p
							align="center">${q.spikedRecoverySampleNum }</p></td>

					<c:if test="${not empty spikedSampleIdentifys }">
						<td width="132" valign="top" style="border: 1px solid black"><p
								align="center">${q.spikedSampleIdentifys }</p></td>
					</c:if>
					<c:if test="${ empty spikedSampleIdentifys }">
						<td width="132" valign="top" style="border: 1px solid black"><p
								align="center"></p></td>
					</c:if>

					<td width="100" valign="top" style="border: 1px solid black"><p
							align="center">${q.blindSample }</p></td>
					<td width="100" valign="top" style="border: 1px solid black"><p
							align="center">
							 <a
								href="javascript:;" data-id="${q.id }"
								class="tablelink delQualityControl">删除</a>
						</p></td>
				</tr>
			</s:iterator>
		</table>
	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>统计记录表</span>
		</div>
		<form action="" id="qualityForm">
			<ul class="forminfo">
				<li><label style="width: 120px">分析项目名称</label><input
					type="text" id="item" class="dfinput" placeholder="点击选择分析项目">
					<input type="hidden" id="itemId" name="itemId" class="required"
					data-alert="分析项目名称"></li>
				<li><label style="width: 120px">样品数</label><input type="text"
					class="dfinput required integer" data-alert="样品数"
					placeholder="请输入样品数量，整数类型" name="SampleNum" id="sampleNum"></li>
				<li><label style="width: 120px">现场平行样个数</label><input
					type="text" class="dfinput integer" name="parallelSample"
					data-alert="现场平行样个数" value="0" placeholder="请输入现场平行样数量，整数类型"></li>
				<li><label style="width: 120px">实验室平行样个数</label><input
					type="text" class="dfinput integer" name="laboratorySampleNum"  id="laboratorySampleNum"
					placeholder="请输入实验室平行样数量，整数类型" value="0" data-alert="实验室平行样个数"></li>
				<li><label style="width: 120px">实验室平行样编号</label><input
					type="text" name="laboratorySampleIdentifys" class="dfinput" id="sysSampleName"
					placeholder="点击选择样品编号"> <input type="hidden"
					id="sysSampleId" name="sysSampleId" /></li>
				<li><label style="width: 120px">加标回收样个数</label><input
					type="text" class="dfinput integer" name="spikedRecoverySampleNum" id="spikedRecoverySampleNum"
					placeholder="请输入加标回收样数量，整数类型" value="0" data-alert="加标回收样个数"></li>
				<li><label style="width: 120px">加标回收样编号</label><input
					type="text" class="dfinput" id="backSampleName" name="spikedSampleIdentifys"
					placeholder="点击选择样品编号"> <input type="hidden"
					id="backSampleId" name="backSampleId"></li>
				<li><label style="width: 120px">盲样个数</label><input type="text"
					class="dfinput integer" name="blindSample"
					placeholder="请输入盲样数量，整数类型" value="0" data-alert="盲样个数"></li>
				<li><label style="width: 120px">&nbsp;</label> <input name=""
					type="button" class="scbtn" id="sumbit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="" type="reset" class="scbtn" id="allResult" value="重置" /></li>
			</ul>
			<s:hidden name="viewId" id="viewId" />
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 150
			});
			$('#sumbit')
					.click(
							function() {
								var result = FieldValidation
										.validate3($('#qualityForm'));
								if (!result) {
									return false;
								}
								asyncbox
										.confirm(
												'是否添加该条质量控制统计记录？',
												'警告',
												function(action) {
													if (action == 'ok') {
														$
																.ajax({
																	url : "qualityControl_qualityControl_add.action",
																	data : $(
																			'#qualityForm')
																			.serialize(),
																	async : false,
																	success : function(
																			data) {
																		var json = eval('('
																				+ data
																				+ ')');
																		if (json.info == "success") {
																			asyncbox
																					.alert(
																							'添加成功 !',
																							'添加结果',
																							function() {
																								window.location
																										.reload();
																								$('#qualityForm')[0].reset();
																							});
																		}
																		if (json.info == "failed") {
																			asyncbox
																					.error(
																							'添加失败，请刷新页面之后重新尝试！',
																							'添加结果');
																		}
																	}
																});
													}
												});
							});
			$('.delQualityControl')
					.click(
							function() {
								var id = $(this).attr('data-id');
								asyncbox
										.confirm(
												"是否删除该条质量控制统计记录？",
												"警告",
												function(action) {
													if (action == 'ok') {
														$
																.ajax({
																	url : "qualityControl_qualityControl_delete.action?viewId="
																			+ id,
																	async : false,
																	success : function(
																			data) {
																		var json = eval('('
																				+ data
																				+ ')');
																		if (json.info == "success") {
																			asyncbox
																					.alert(
																							'删除成功 !',
																							'删除结果',
																							function() {
																								window.location
																										.reload();
																							});
																		}
																		if (json.info == "failed") {
																			asyncbox
																					.error(
																							'删除失败，请刷新页面之后重新尝试！',
																							'删除结果');
																		}
																	}
																});

													}
												})
							});
			$('.changeQualityControl')
					.click(
							function() {
								var id = $(this).attr("data-id");
								asyncbox
										.open({
											title : '修改质量控制统计信息',
											top:0,
											url : 'qualityControl_qualityControl_changePage.action?viewId='
													+ id,
											width : 800,
											height : 500,
											btnsbar : [ {
												text : '修　改', // 按钮文本
												action : 'change' // 按钮 action 值，用于按钮事件触发 唯一
											} ].concat($.btn.CANCEL),
											callback : function(action, opt) {// 判断 action 值。
												if (action == 'change') {// 在回调函数中 this.id 可以得到该窗口
													var oForm = opt.document
															.getElementById("qualityForm");
													var $_oForm = $(oForm);
													var result = FieldValidation
															.validate3($_oForm);
													if (!result) {
														return false;
													}
													asyncbox
															.confirm(
																	'是否修改该条质量统计记录？',
																	'提示',
																	function(
																			action) {
																		if (action == 'ok') {
																			$
																					.ajax({
																						url : "qualityControl_qualityControl_change.action",
																						data : $_oForm
																								.serialize(),
																						async : false,
																						success : function(
																								data) {
																							var json = eval('('
																									+ data
																									+ ')');
																							if (json.info == 'success') {
																								asyncbox
																										.alert(
																												'记录修改成功！',
																												'结果',
																												function() {
																													window.location
																															.reload();
																												});
																							}
																							if (json.info == 'error') {
																								asyncbox
																										.error(
																												'记录修改失败！请刷新后重新尝试',
																												'结果');
																							}
																						}
																					});
																		}
																	});
													return false;
												}
											}
										});

							});
			$('#item')
					.focus(
							function() {
								var id = $('#viewId').prop('value');
								asyncbox
										.open({
											title : '选择分析项目',
											top:0,
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

													if (oChecks.parents('td')
															.attr('data-id') != "") {
														$
																.ajax({
																	url : "qualityControl_qualityControl_projectToSampleNum.action",
																	data : {
																		'itemId' : oChecks
																				.parents(
																						'td')
																				.attr(
																						'data-id'),
																		'viewId' : id
																	},
																	async : false,
																	success : function(
																			data) {
																		var json = eval('('
																				+ data
																				+ ')');
																		if (json.info == "success") {
																			$(
																					'#sampleNum')
																					.attr(
																							"value",
																							json.sampleNum);
																		}
																	}
																});
													}

												}
											}

										});
							});

			$('#sysSampleName')
					.focus(
							function() {
								var id = $('#viewId').prop('value');
								var analysisId=$('#itemId').attr("value");
								if($('#itemId').val()==""){
									asyncbox.error("请先选择分析项目！","错误");
									return false;
								}
								var itemId=$('#itemId').val();
								asyncbox
										.open({
											title : '选择样品',
											top:0,
											url : 'selfSendSampleInfo_selfSendSampleInfo_choosePageQuality.action?viewId='
													+ id+"&itemId="+itemId,
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
															.find('tbody input[type=checkbox]:checked');
													var ids="";
													var identifys="";
													for(var i=0;i<oChecks.length;i++){
														ids+=$(oChecks[i]).data("id")+",";
														identifys+=$(oChecks[i]).data("identify")+",";
													}
													
													 $('#sysSampleName').prop(
															'value',identifys);
													$('#sysSampleId').prop(
															'value',ids); 
													$('#laboratorySampleNum').prop('value',oChecks.length);

												}
											}

										});
							});

			$('#backSampleName')
					.focus(
							function() {
								var id = $('#viewId').prop('value');
								if($('#itemId').val()==""){
									asyncbox.error("请先选择分析项目！","错误");
									return false;
								}
								var itemId=$('#itemId').val();
								asyncbox
										.open({
											title : '选择样品',
											top:0,
											url : 'selfSendSampleInfo_selfSendSampleInfo_choosePageQuality.action?viewId='
													+ id+'&itemId='+itemId,
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
															.find('tbody input[type=checkbox]:checked');
													var ids="";
													var identifys="";
													for(var i=0;i<oChecks.length;i++){
														ids+=$(oChecks[i]).data("id")+",";
														identifys+=$(oChecks[i]).data("identify")+",";
													}
													 $('#backSampleName').prop(
															'value',identifys);
													$('#backSampleId').prop(
															'value',ids); 
													$('#spikedRecoverySampleNum').prop('value',oChecks.length);
												}
											}
										});
							});
		});
	</script>
</body>
</html>
