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

<title>填写原始记录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/paging-V1.3-final.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body style="overflow-x: hidden;">
	<div class="formbody" style="width: 1000px;">
		<s:hidden name="projectId" id="projectId"></s:hidden>
		<div class="formtitle" style="width: 1000px;">
			<span>选择原始记录表</span>
		</div>
		<!-- <div id="tab1" class="tabson">
			<ul class="seachform">
				<li><label>记录名称</label> <input name="" placeholder="请输入名称关键字"
					type="text" class="scinput" data-search="c.name" /></li>
				<li><label>&nbsp;</label> <input name="" type="button"
					class="scbtn" id="seachBtn" value="查询" /></li>
				<li><label>&nbsp;</label> <input name="" type="button"
					class="scbtn" id="allResult" value="全部" /></li>

			</ul>
		</div> -->
		<table class="tablelist" id="auditTable">
			<thead>
				<tr>
					<th>记录表名称</th>
					<th style="text-align: center;">环境要素</th>
					<th style="text-align: center;">操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#originalRecord" id="o">
					<tr>
						<td>${o.name }</td>
						<td style="text-align: center;">${o.category.name }</td>
						<td style="text-align: center;"><a href="javascript:;"
							class="tablelink useRecord" data-id="${o.id }">使用</a>&nbsp;<a
							href="javascript:;" class="tablelink viewRecord"
							data-id="${o.id }">查看</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="pagin">
			<div class="message">
				共<i class="blue">${totalRecord}</i>条记录，当前显示第&nbsp;<i
					class="blue countPage">1&nbsp;</i>/<i class="blue" id="totalPage">${totalPage
							}</i>页
			</div>
			<div class="page" id="page1"></div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('.viewRecord')
					.on(
							'click',
							function() {
								var id = $(this).attr("data-id");
								asyncbox
										.open({
											title : '查看原始记录表',
											url : 'originalRecord_originalRecord_viewPage.action?viewId='
													+ id,
											width : 1100,
											height : 600,
											btnsbar : $.btn.CANCEL,
											callback : function(action, opt) {
											}
										});
							});
			$('.useRecord')
					.on(
							'click',
							function() {
								var id = $(this).attr("data-id");
								var projectId = $('#projectId').val();
								window.location.href = "detectionResult_detectionResult_recordPage.action?viewId="
										+ id + "&projectId=" + projectId;
							});
			$('#page1')
					.paging(
							{
								'pageCount' : $('#totalPage').html(),
								'initPage' : 1,
								'showCount' : 10,
								'fn' : function(pageNum) {
									$('.countPage').html(pageNum);
									$
											.ajax({
												url : "departmentManage_department_page.action?pageNum="
														+ pageNum,
												async : false,
												success : function(data) {
													var json = eval('(' + data
															+ ')');
													$('#auditTable').find(
															'tbody tr').hide();
													$('#auditTable')
															.find('tbody tr')
															.slice(
																	(pageNum - 1)
																			* (json.pageNum),
																	pageNum
																			* (json.pageNum))
															.each(function() {
																$(this).show();
															})
												}

											});
								},
								'liCss' : {
									'display' : 'inline-block',
									'border' : '#8db5d7 1px solid',
									'padding' : '2px 8px',
									'cursor' : 'pointer',
									'margin' : '0 2px',
									'color' : '#000',
									'border-radius' : '5px',
									'pointer-events' : 'auto'
								},
								'liActive' : {
									'border' : '#ccc 1px solid',
									'font-weight' : 'bold',
									'background' : '#f5f5f5',
									'cursor' : 'default',
									'pointer-events' : 'none'
								},
								'liForbid' : {
									'border' : '#ccc 1px solid',
									'color' : '#ccc',
									'cursor' : 'default',
									'pointer-events' : 'none'
								}
							});

			$('#seachBtn')
					.click(
							function() {
								var str = "";
								$('.seachform')
										.find('input.scinput')
										.each(
												function() {
													if ($(this).prop("value")) {
														str += ($(this).attr(
																"data-search")
																+ "="
																+ $(this)
																		.prop(
																				"value") + ";");
													}
													;
												})
								if (str == "") {
									asyncbox.alert('请输入查询条件！', '查询结果');
									return false;
								}
								window.location.href = "detectionResult_detectionResult_query.action?queryStr="
										+ str;
							});

			$('#allResult')
					.click(
							function() {
								window.location.href = "detectionResult_detectionResult_addPage.action";
							});
		});
	</script>
</body>
</html>
