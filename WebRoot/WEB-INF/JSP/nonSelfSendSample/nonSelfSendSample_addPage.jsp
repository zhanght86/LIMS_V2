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

<title>选择角色</title>

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
<script type="text/javascript" src="js/jquery.qrcode.js"></script>
<script type="text/javascript" src="js/qrcode.js"></script>
<style type="text/css">

</style>
</head>

<body class="common">
	<div class="formbody">
		<input type="hidden" id="projectId" value="${project.id }">
		<div class="formtitle" style="width: 1000px">
			<span>委托内容</span>
		</div>
		<c:if test="${project.tContractId != null }">
			<table class="tablelist" style="width: 1000px">
				<tr>
					<th style="text-align:center">环境要素</td>
					<th style="text-align:center">监测点（个）</td>
					<th style="text-align:center">监测项目</td>
					<th style="text-align:center">监测频次</td>
					<th style="text-align:center">备注</td>
				</tr>
				<c:forEach var="i" items="${ project.tContractId.items}">
					<tr>
						<td style="text-align: center;"><label>${i.analysisCategory.name }</label></td>
						<td style="text-align: center;"><label>${i.siteNum }</label></td>
						<td style="text-align: center;"><label>${i.analysisProject.name
								}</label></td>
						<td style="text-align: center;"><label>${i.analysisFrequency.name
								}</label></td>
						<td style="text-align: center;"><label>${i.other }</label></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${project.tContractId == null }">
			<label>${project.projectBook.context}</label>
		</c:if>
	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 1000px">
			<span>样品记录</span>
		</div>
		<table class="tablelist" id="departmentTable" style="width: 1000px">
			<thead>
				<tr>
					<th>样品编号</th>
					<th>实验室编号</th>
					<th>样品状态/颜色</th>
					<!-- <th></th> -->
					<th>测试项目</th>
					<th>是否完好</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<form id="sampleAdd">
					<tr id="addColumn">
						<td></td>
						<td><input type="text"
							style="width: 80%; border: solid 1px #ced9df; height: 28px"
							data-name='name' name="sampleName"></td>
						<td><input type="text"
							style="width: 80%; border: solid 1px #ced9df; height: 28px"
							data-name='sampleState' name="sampleState"></td>
						<!-- <td><input type="text"
							style="width: 80%; border: solid 1px #ced9df; height: 28px"
							data-name='samplingPosition' name="samplingPosition"></td> -->
						<td><input type="text"
							style="width: 80%; border: solid 1px #ced9df; height: 28px"
							id="analysisProjectChoose" placeholder="请选择检测项目"> <input
							type="hidden"
							style="width: 80%; border: solid 1px #ced9df; height: 28px"
							data-name="analysisProjectId" id="analysisProjectId"
							name="analysisProjectId"></td>
						<td>
						<!-- <input type="text"
							style="width: 80%; border: solid 1px #ced9df; height: 28px"
							data-name="other" name="other"> -->
							
							<label for="save_good"><input type="radio" name="other" data-name="other" value="+" id="save_good">完好</label>
						<label for="save_bad"><input type="radio" name="other" data-name="other" value="-" id="save_bad">瑕疵</label>
							
						</td>
						<td><input name="" type="button" class="scbtn" id="addBtn"
							value="保存" /></td>
					</tr>
				</form>
				<s:iterator value="#selfSendSampleInfoList" id="s" status="L">
					<tr data-id=${s.id }>
						<td>${s.identify }</td>
						<td>${s.sampleName }</td>
						<td>${s.sampleState }</td>
						<%-- <td>${s.samplingPosition }</td> --%>
						<td><s:iterator
								value="#s.analysisProjectSet" id="it">
									${it.name },
							</s:iterator></td>
						<td>${s.other }</td>
						<td><a href="javascript:;" data-id="${s.id }"
							class="delItem">删除</a>&nbsp;<a href="javascript:;"
							data-id="${s.id }" class="printItem">二维码</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 1000px">
			<span>二维码导出</span>
		</div>
		<input name="" type="button" class="scbtn" id="printQR" value="打印" /><br>
		<br>
		<div id="qrcode"></div>

	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 1000px">
			<span>采样信息</span>
		</div>

		<ul class="forminfo">
			<li><label>采样日期</label> <input name="dateTime" type="text"
				class="dfinput required" id="date" value="${nowDate }"
				placeholder="必填项，点击选择时间"
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></li>
		</ul>


	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 150
			});
			
			$('.delItem').unbind(
															'click');
													$('.delItem')
															.bind(
																	'click',
																	function() {
																		var id = $(
																				this)
																				.data(
																						"id");
																		var me = $(this);
																		asyncbox
																				.confirm(
																						'是否删除当前样品信息？删除之后该样品编号将废弃！',
																						'警告',
																						function(
																								action) {
																							if (action == 'ok') {
																								$
																										.ajax({
																											url : "nonSelfSendSample_nonSelfSendSample_delSample.action",
																											data : {
																												'viewId' : id
																											},
																											async : false,
																											success : function(
																													data) {
																												var json = eval('('
																														+ data
																														+ ')');
																												if (json.info == "success") {
																													asyncbox
																															.alert(
																																	"删除成功！",
																																	'结果',
																																	function() {
																																		me
																																				.parents(
																																						'tr')
																																				.remove();
																																	});
																												}
																												if (json.info == "failed") {
																													asyncbox
																															.error(
																																	"删除失败，请刷新之后重新尝试！",
																																	'结果');
																												}
																												return false;
																											}
																										});
																							}
																						});
																	});
													$('.printItem').unbind(
															'click');
													$('.printItem')
															.bind(
																	'click',
																	function() {
																		var id = $(
																				this)
																				.data(
																						"id");
																		var me = $(this);
																		var tr = me
																				.parents('tr');
																		var str = "样品编号:"
																				+ tr
																						.find(
																								'td:eq(0)')
																						.html()
																				+ "，样品名称："
																				+ tr
																						.find(
																								'td:eq(1)')
																						.html()
																				+ "，样品状态："
																				+ tr
																						.find(
																								'td:eq(2)')
																						.html()
																				/* + "，采样地点："
																				+ tr
																						.find(
																								'td:eq(3)')
																						.html() */
																				+ "，测试项目："
																				+ tr
																						.find(
																								'td:eq(4)')
																						.html()
																				+ "，备注："
																				+ tr
																						.find(
																								'td:eq(5)')
																						.html();
																		$(
																				'#qrcode')
																				.empty();
																		$(
																				'#qrcode')
																				.qrcode(
																						toUtf8(str)); //任意字符串 

																	});
			
			
			$('#analysisProjectChoose')
					.on(
							'focus',
							function() {
								var id = $("#projectId").val();
								asyncbox
										.open({
											title : '选择样品检测项目',
											top : 0,
											url : 'analysisProject_analysisProject_chooseByContract.action?viewId='
													+ id,
											width : 500,
											height : 400,
											btnsbar : [ {
												text : '确    定',
												action : 'ok'
											} ].concat($.btn.CANCEL),
											callback : function(action, opt) {
												if (action == 'ok') {
													var doc = $(opt.document.body);
													var oCheckList = doc
															.find('input[type="checkbox"]:checked');
													var ids = "";
													var names = "";
													for (var i = 0; i < oCheckList.length; i++) {
														names += $(
																oCheckList[i])
																.data("name")
																+ ",";
														ids += $(oCheckList[i])
																.data("id")
																+ ",";
													}

													$('#analysisProjectChoose')
															.attr("value",
																	names);
													$('#analysisProjectId')
															.attr("value", ids);
												}
											}
										});
							});
			$('#addBtn')
					.on(
							'click',
							function() {
								var oForm = document
										.getElementById("sampleAdd");
								var $_oForm = $(oForm);
								if ($('#analysisProjectId').val() == "") {
									asyncbox.error("添加失败，请先选择检测项目！", "添加失败");
								}
								$
										.ajax({
											url : "nonSelfSendSample_nonSelfSendSample_addSample.action",
											data : $_oForm.serialize()
													+ "&viewId="
													+ $('#projectId').val(),
											async : false,
											success : function(data) {
												var json = eval('(' + data
														+ ')');
												if (json.info == 'success') {
													var tr = $("<tr data-id='"+json.sampleId+"'>");
													var name = $(
															'input[name=sampleName]')
															.val();
													var sampleState = $(
															'input[name=sampleState]')
															.val();
													var analysisProject = $(
															'#analysisProjectChoose')
															.val();
													var other = $(
													'input[name=other]:checked')
													.val();
													/* var samplingPosition = $(
															'input[name=samplingPosition]')
															.val(); */
													$(
															"<td>"
																	+ json.sampleIdentify
																	+ "</td><td>"
																	+ name
																	+ "</td><td>"
																	+ sampleState
																	+ "</td><td>"
																	/* + samplingPosition
																	+ "</td><td>" */
																	+ analysisProject
																	+ "</td><td>"
																	+ other
																	+ "</td><td><a href='javascript:;' class='delItem' data-id='"+json.sampleId+"'>删除</a>&nbsp;&nbsp;<a href='javascript:;' class='printItem' data-id='"+json.sampleIdentify+"'>二维码</a></td>")
															.appendTo(tr);
													tr.appendTo($('#tbody'));
													$('#sampleAdd')[0].reset();
													$('#analysisProjectId')
															.attr("value", "");
													$('#analysisProjectChoose')
															.attr("value", "");
													$('.delItem').unbind(
															'click');
													$('.delItem')
															.bind(
																	'click',
																	function() {
																		var id = $(
																				this)
																				.data(
																						"id");
																		var me = $(this);
																		asyncbox
																				.confirm(
																						'是否删除当前样品信息？删除之后该样品编号将废弃！',
																						'警告',
																						function(
																								action) {
																							if (action == 'ok') {
																								$
																										.ajax({
																											url : "nonSelfSendSample_nonSelfSendSample_delSample.action",
																											data : {
																												'viewId' : id
																											},
																											async : false,
																											success : function(
																													data) {
																												var json = eval('('
																														+ data
																														+ ')');
																												if (json.info == "success") {
																													asyncbox
																															.alert(
																																	"删除成功！",
																																	'结果',
																																	function() {
																																		me
																																				.parents(
																																						'tr')
																																				.remove();
																																	});
																												}
																												if (json.info == "failed") {
																													asyncbox
																															.error(
																																	"删除失败，请刷新之后重新尝试！",
																																	'结果');
																												}
																												return false;
																											}
																										});
																							}
																						});
																	});
													$('.printItem').unbind(
															'click');
													$('.printItem')
															.bind(
																	'click',
																	function() {
																		var id = $(
																				this)
																				.data(
																						"id");
																		var me = $(this);
																		var tr = me
																				.parents('tr');
																		var str = "样品编号:"
																				+ tr
																						.find(
																								'td:eq(0)')
																						.html()
																				+ "，样品名称："
																				+ tr
																						.find(
																								'td:eq(1)')
																						.html()
																				+ "，样品状态："
																				+ tr
																						.find(
																								'td:eq(2)')
																						.html()
																				+ "，采样地点："
																				+ tr
																						.find(
																								'td:eq(3)')
																						.html()
																				+ "，测试项目："
																				+ tr
																						.find(
																								'td:eq(4)')
																						.html()
																				+ "，备注："
																				+ tr
																						.find(
																								'td:eq(5)')
																						.html();
																		$(
																				'#qrcode')
																				.empty();
																		$(
																				'#qrcode')
																				.qrcode(
																						toUtf8(str)); //任意字符串 

																	});
												} else {
													asyncbox.error(
															'样品保存失败，请刷新后重新尝试！',
															'通知');
												}
												return false;
											}
										});
								return false;
							});
			function toUtf8(str) {
				var out, i, len, c;
				out = "";
				len = str.length;
				for (i = 0; i < len; i++) {
					c = str.charCodeAt(i);
					if ((c >= 0x0001) && (c <= 0x007F)) {
						out += str.charAt(i);
					} else if (c > 0x07FF) {
						out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
						out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
						out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
					} else {
						out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
						out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
					}
				}
				return out;
			}
			$('#printQR').on('click', function() {
				var canvas = $('#qrcode').children()[0];
				var img = canvas.toDataURL("image/png");
				//document.write('<img src="'+img+'"/>'); 
				asyncbox.open({
					html : '<img src="'+img+'"/>',
				});
			});
		});
	</script>
</body>
</html>
