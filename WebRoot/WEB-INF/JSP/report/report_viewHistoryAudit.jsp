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

<title>选择用户</title>

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
</head>

<body class="common" style="widows: 700px">
	<div class="formbody">
		<div class="formtitle">
			<span>历史审核记录</span>
		</div>
		<%-- <ul class="seachform">
			<li><label>用户姓名</label> <input name="" placeholder="请输入用户姓名"
				type="text" class="scinput" data-search='name' /></li>
			<li><label>所属角色</label>
				<div class="vocation">
					<select class="select3" data-search='role'>
						<option value="0">不限</option>
						<s:iterator value="#roleList" id="r">
							<option value="${r.id }">${r.name }</option>
						</s:iterator>
					</select>
				</div></li>
			<li><input type="hidden" id="searchChoose" value="choose">
			</li>
			<li><label>&nbsp;</label> <input name="" type="button"
				class="scbtn" value="查询" id="seachBtn" /> <input name=""
				type="button" class="scbtn" value="全部" id="allResultChoose" /></li>
		</ul>
 --%>
		<table class="tablelist" id="userTable" style="width: 800px">
			<thead>
				<tr>
					<th>序号</th>
					<th>一审者</th>
					<th>一审时间</th>
					<th>二审者</th>
					<th>二审时间</th>
					<th>签发审核者</th>
					<th>签发审核时间</th>
					<th>查看</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#historyAudit" id="h" status="L">
					<tr>
						<td>${L.index+1 }</td>
						<td>${h.firstUser.name }</td>
						<td>${h.firstDate }</td>
						<td>${h.firstUser.name }</td>
						<td>${h.secondDate }</td>
						<td>${h.firstUser.name }</td>
						<td>${h.issueDate }</td>
						<td><a href="javascript:;" class="tablelink viewHisAudit"
							data-id="${h.id }">查看</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<input type="hidden" id="viewId" value="${viewId }">
	</div>


	<script type="text/javascript">
		$('.viewHisAudit')
				.on(
						'click',
						function() {
							var id = $(this).attr("data-id");
							var viewId = $('#viewId').val();
							asyncbox
									.open({
										title : '查看报告审核记录',
										url : 'reportAudit_reportAudit_viewHisPage.action?viewId='
												+ viewId + "&history_id=" + id,
										width : 900,
										height : 550,
										btnsbar : $.btn.CANCEL
									});
						});
	</script>
</body>
</html>
