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
#contractTable {
	border: 1px solid #000;
	width: 100%;
}

#contractTable td {
	border: 1px solid #000;
	height: 30px;
	vertical-align: middle;
	font-size: 14px;
}
</style>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>委托内容</span>
		</div>
		<c:if test="${project.tContractId != null }">
			<table id="contractTable">
				<tr>
					<td width="73" style="text-align:center">环境要素</td>
					<td colspan="2" width="156" style="text-align:center">监测点（个）</td>
					<td colspan="3" width="151" style="text-align:center">监测项目</td>
					<td colspan="3" width="117" style="text-align:center">监测频次</td>
					<td width="169" style="text-align:center">备注</td>
				</tr>
				<c:forEach var="i" items="${ project.tContractId.items}">
					<tr>
						<td width="73"><label>${i.analysisCategory.name }</label></td>
						<td colspan="2" width="156"><label>${i.siteNum }</label></td>
						<td colspan="3" width="151"><label>${i.analysisProject.name
								}</label></td>
						<td colspan="3" width="117"><label>${i.analysisFrequency.name
								}</label></td>
						<td width="169"><label>${i.other }</label></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${project.tContractId == null }">
			<label>${project.projectBook.context}</label>
		</c:if>
	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>样品记录</span>
		</div>
		<table class="tablelist" id="departmentTable" style="width: 1050px">
			<thead>
				<tr>
					<th>样品编号</th>
					<th>样品名称</th>
					<th>样品状态</th>
					<th>采样地点</th>
					<th>测试项目</th>
					<th>备注</th>
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
						<td><input type="text"
							style="width: 80%; border: solid 1px #ced9df; height: 28px"
							data-name='samplingPosition' name="samplingPosition"></td>
						<td>
							<div class="vocation">
								<select class="select3" name="analysisProjectId"
									id="analysisProjectId">
									<s:iterator value="#items" id="item">
										<option value="${item.id }">${item.name}</option>
									</s:iterator>
								</select>
							</div>
						</td>
						<td><input type="text"
							style="width: 80%; border: solid 1px #ced9df; height: 28px"
							data-name="other" name="other"></td>
						<td><input name="" type="button" class="scbtn" id="addBtn"
							value="保存" /></td>
					</tr>
				</form>
				<s:iterator value="#selfSendSampleInfoList" id="s" status="L">
					<tr data-id=${s.id }>
						<td>${s.identify }</td>
						<td>${s.sampleName }</td>
						<td>${s.sampleState }</td>
						<td>${s.samplingPosition }</td>
						<td>
							<s:iterator
								value="#s.analysisProjectSet" id="it">
								${it.name },
							</s:iterator>
						</td>
						<td>${s.other }</td>
						<td><a href="javascript:;" data-id="${s.id }"
							class="tablelink deleteColumn">删除</a>&nbsp;<a href="javascript:;"
							data-id="${s.id }" class="tablelink printItem">二维码</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>二维码导出</span>
		</div>
		<input name="" type="button" class="scbtn" id="printQR" value="打印" /><br>
		<br>
		<div id="qrcode"></div>

	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
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
			$('.deleteColumn')
					.click(
							function() {
								var id = $(this).data("id");
								var me = $(this);
								asyncbox
										.confirm(
												'是否删除当前样品信息？删除之后该样品编号将废弃！',
												'警告',
												function(action) {
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
			$('#addBtn')
					.on(
							'click',
							function() {
								var oForm = document
										.getElementById("sampleAdd");
								var $_oForm = $(oForm);
								alert($_oForm.serialize()
										+ "&analysisProjectId="
										+ $('#analysisProjectId').val());
								$
										.ajax({
											url : "nonSelfSendSample_nonSelfSendSample_addSample.action",
											data : $_oForm.serialize()
													+ "&analysisProjectId="
													+ $('#analysisProjectId')
															.val(),
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
															'#analysisProjectId')
															.find(
																	'option:selected')
															.html();
													var other = $(
															'input[name=other]')
															.val();
													var samplingPosition = $(
															'input[name=samplingPosition]')
															.val();
													$(
															"<td>"
																	+ json.sampleIdentify
																	+ "</td><td>"
																	+ name
																	+ "</td><td>"
																	+ sampleState
																	+ "</td><td>"
																	+ samplingPosition
																	+ "</td><td>"
																	+ analysisProject
																	+ "</td><td>"
																	+ other
																	+ "</td><td><a href='javascript:;' class='tablelink delItem' data-id='"+json.sampleId+"'>删除</a>&nbsp;&nbsp;<a href='javascript:;' class='tablelink printItem' data-id='"+json.sampleIdentify+"'>二维码</a></td>")
															.appendTo(tr);
													tr.appendTo($('#tbody'));
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
			$('.printItem').bind(
					'click',
					function() {
						var id = $(this).data("id");
						var me = $(this);
						var tr = me.parents('tr');
						var str = "样品编号:" + tr.find('td:eq(0)').html()
								+ "，样品名称：" + tr.find('td:eq(1)').html()
								+ "，样品状态：" + tr.find('td:eq(2)').html()
								+ "，采样地点：" + tr.find('td:eq(3)').html()
								+ "，测试项目：" + tr.find('td:eq(4)').html()
								+ "，备注：" + tr.find('td:eq(5)').html();
						$('#qrcode').qrcode(toUtf8(str)); //任意字符串 

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
