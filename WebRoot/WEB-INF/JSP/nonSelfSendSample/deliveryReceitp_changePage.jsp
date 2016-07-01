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
<script src="js/validCheck.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>选择交接联单</span>
		</div>

		<form action="" id="deliveryAdd">
			<ul class="forminfo">
				<li><input type="hidden" id="projectId" value="${projectId }" />
					<s:hidden name="id" /></li>
				<li data-type="${samplesType }"><label>交联单类型</label> <c:if
						test="${samplesType==0 }">
						<label class="viewLabel">土壤样品交联单</label>
					</c:if> <c:if test="${samplesType==1 }">
						<label class="viewLabel">水和废水样品交接联单</label>
					</c:if> <c:if test="${samplesType==2 }">
						<label class="viewLabel">空气和废气样品交接联单</label>
					</c:if></li>
				<li><label>采样日期</label> <label class="viewLabel">${samplingDate
						}</label></li>
				<li><label id="type">监测类别</label>
					<div class="vocation">
						<s:select list="{'例行','委托','执法','其他' }" name="monitoringType"
							cssClass="select3" />
					</div></li>
				<li><label>项目总数</label> <s:textfield name="itemNum"
						placeholder="必填项，请输入项目总数" cssClass="dfinput required integer"
						data-alert="项目总数"></s:textfield></li>

				<li id="status"><label>样品状态</label> <s:textfield
						name="sampleStatus" placeholder="必填项，请输入项目状态"
						cssClass="dfinput required" data-alert="项目状态"></s:textfield></li>

				<li><label>样品编号</label>
						<label class="viewLabel">${sampleNameList }</label>

					<s:hidden id="sampeHide" cssClass="required" data-alert="样品编号"
						name="sampleList" /></li>

				<li><label>分析项目</label> <s:textarea name="item"
						id="projectItem" data-alert="分析项目"
						cssStyle="width: 350px;height: 100px" placeholder="点击选择分析项目"
						cssClass="textinput required"></s:textarea>
						<s:hidden cssClass="required" id="projectItemHide" data-alert="分析项目" name="projectItemHide"></s:hidden>
					</li>
				<li><label>备注</label> <s:textarea name="other"
						cssStyle="width: 350px;height: 100px"
						placeholder="输入备注信息，不超购100个字" cssClass="textinput"></s:textarea></li>
			</ul>
		</form>
	</div>

	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 350
			});
			$('#type').change(function() {
				var index = $(this).find('option:selected').val();
				if (index == 2) {
					$('#status').hide();
					$('#projectItem').prop('value', "");
					$('#projectItemHide').prop('value', "");
				} else {
					$('#status').show();
					$('#projectItem').prop('value', "");
					$('#projectItemHide').prop('value', "");
				}
			});
			$('#projectItem')
					.click(
							function() {
								var type = $('#deliveryAdd')
										.find('ul li:eq(1)').attr("data-type");
								asyncbox
										.open({
											title : '选择监测项目信息',
											url : 'analysisProject_analysisProject_choosePage.action?viewId='
													+ type,
											width : 650,
											height : 450,
											btnsbar : [ {
												text : '选　择',
												action : 'ok'
											} ].concat($.btn.CANCEL),
											callback : function(action, opt) {
												if (action == 'ok') {
													var oTable = opt.document
															.getElementById("analysisProjectTable");
													var $_oTable = $(oTable);
													var str = "";
													var ids = "";
													var oChecks = $_oTable
															.find('tbody input[type=checkbox]:checked');
													var nowIndex = 0;
													oChecks
															.each(function() {
																var text = $(
																		this)
																		.parents(
																				'td')
																		.next()
																		.html();
																var id = $(this)
																		.parents(
																				'td')
																		.attr(
																				"data-id");
																if (nowIndex == oChecks.length - 1) {
																	str += text;
																} else {
																	str += text
																			+ ",";
																}
																nowIndex++;
																ids += id + ",";
															});
													$('#projectItem').prop(
															'value', str);
													$('#projectItemHide').prop(
															'value', ids);
												}
											}
										});
							});
		});
	</script>
</body>
</html>
