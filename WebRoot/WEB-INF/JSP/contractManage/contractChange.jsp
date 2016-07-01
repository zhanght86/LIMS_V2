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

<title>服务合同变更</title>

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
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="css/My97DatePicker/WdatePicker.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/paging-V1.3-final.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.form.js" charset="utf-8"></script>
<script src="js/module/contractChange.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">合同管理</a></li>
			<li>服务合同变更</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">服务合同变更</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<table class="tablelist" id="auditTable">
					<thead>
						<tr>
							<th>合同编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>合同类型</th>
							<th>项目名称</th>
							<th>委托单位</th>
							<th>交付时间</th>
							<th>合同承办人</th>
							<th>草案创建时间</th>
							<th>合同原本</th>
							<th>评审记录</th>
							<th>变更登记</th>

						</tr>
					</thead>
					<tbody>
						<s:iterator value="#projectList" id="p">
							<tr>
								<td>${p.contractId }</td>
								<c:if test="${not empty p.sContractId }">
									<td>服务合同</td>
									<td style="text-align: left;">${p.sContractId.name }</td>
									<td>${p.sContractId.client }</td>
									<td>${p.sContractId.deadLine }</td>
									<td>${p.draftsMan.name }</td>
									<td>${p.createTime }</td>
									<td><a href="javascript:;" class="tablelink viewContract"
										data-id="${p.id }" data-type="1">查看</a></td>
									<td><a href="javascript:;" class="tablelink viewAudit"
										data-id="${p.id }">查看</a></td>
								</c:if>
								<td><a href="javascript:;" class="tablelink changeContract"
									data-id="${p.id }">合同变更</a>&nbsp;&nbsp; <a href="javascript:;" class="tablelink changeHistory"
									data-id="${p.id }">变更历史</a></td>
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
		</div>
	</div>
</body>
</html>
