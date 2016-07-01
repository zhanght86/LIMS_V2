<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>合同变更记录</title>

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
<script type="text/javascript">
	$(function() {
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
											url : "contractManage_contractAudit_page.action?pageNum="
													+ pageNum,
											async : false,
											success : function(data) {
												var json = eval('(' + data
														+ ')');
												$('#userTable')
														.find('tbody tr')
														.hide();
												$('#userTable')
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
		$('.viewChangeRecord')
				.click(
						function() {
							var id = $(this).attr("data-id");
							asyncbox
									.open({
										title : '查看合同变更记录',
										url : 'contractManage_contractChange_viewDetailPage.action?viewId='
												+ id,
										width : 500,
										height : 400,
										btnsbar : $.btn.CANCEL,
										callback : function(action, opt) {
										}
									});
						});
		$('.exportChangeRecord').click(function(){
			var id = $(this).attr("data-id");
			asyncbox.confirm('是否下载该合同修改记录？', '警告', function(action) {
				if (action == 'ok') {
					window.location.href="contractManage_contractChange_export.action?viewId="+id;
				}
			});
		});
	});
</script>
</head>

<body class="common" style="widows: 700px">
	<div class="formbody">
		<div class="formtitle">
			<span>合同变更记录</span>
		</div>
		<table class="tablelist" id="userTable" style="width: 700px">
			<thead>
				<tr>
					<th>变更日期</th>
					<th>变更属性</th>
					<th>变更人员</th>
					<th>是否重审</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#contractChangeList" id="u">
					<tr>
						<td>${u.changeDate }</td>
						<td>${u.changeColumn }</td>
						<td>${u.changer.name }</td>
						<td><c:if test="${u.reAudit==1 }">
						否
						</c:if> <c:if test="${u.reAudit==0 }">
						是
						</c:if></td>
						<td><a href="javascript:;" class="tablelink viewChangeRecord"
							data-id="${u.id }">查看</a>&nbsp;&nbsp;&nbsp;<a href="javascript:;"
							class="tablelink exportChangeRecord" data-id="${u.id }">导出</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="pagin" style="width: 700px">
			<div class="message">
				共<i class="blue">${totalRecord}</i>条记录，当前显示第&nbsp;<i
					class="blue countPage">1&nbsp;</i>/<i class="blue" id="totalPage">${totalPage
					}</i>页
			</div>
			<div class="page" id="page1"></div>
		</div>
	</div>
</body>
</html>
