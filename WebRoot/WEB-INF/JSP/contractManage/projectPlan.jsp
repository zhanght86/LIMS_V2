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

<title>项目安排</title>

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
<script src="js/module/projectPlan.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">合同管理</a></li>
			<li>项目安排</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">任务下达</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<table class="tablelist" id="auditTable">
					<thead>
						<tr>
							<th style="text-align: center;">合同编号</th>
							<th style="text-align: center;">合同类型</th>
							<th>项目名称</th>
							<th>委托单位</th>
							<th  style="text-align: center;">交付时间</th>
							<th  style="text-align: center;">合同承办人</th>
							<th  style="text-align: center;">草案创建时间</th>
							<th style="text-align: center;">合同</th>

							<th style="text-align: center;">任务书</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#projectList" id="p">
							<tr>
								<td  style="text-align: center;">${p.contractId }</td>
								<c:if test="${not empty p.tContractId }">
									<td  style="text-align: center;">业务合同</td>
									<td>${p.tContractId.projectName }</td>
									<td>${p.tContractId.customerName }</td>
									<td  style="text-align: center;">${p.tContractId.deadLine }</td>
									<td  style="text-align: center;">${p.draftsMan.name }</td>
									<td  style="text-align: center;">${p.createTime }</td>
									<td style="text-align: center;"><a href="javascript:;"
										class="tablelink viewContract" data-id="${p.id }"
										data-type="0">查看</a></td>
								</c:if>
								<c:if test="${not empty p.sContractId }">
									<td  style="text-align: center;">服务合同</td>
									<td  style="text-align: center;">${p.sContractId.name }</td>
									<td>${p.sContractId.client }</td>
									<td  style="text-align: center;">${p.sContractId.deadLine }</td>
									<td  style="text-align: center;">${p.draftsMan.name }</td>
									<td  style="text-align: center;">${p.createTime }</td>
									<td style="text-align: center;"><a href="javascript:;"
										class="tablelink viewContract" data-id="${p.id }"
										data-type="1">查看</a></td>
								</c:if>
								<c:if test="${empty p.projectBook }">
									<td style="text-align: center;"><a href="javascript:;"
										class="tablelink  assignment" data-id="${p.id }">任务书</a></td>
								</c:if>
								<c:if test="${not empty p.projectBook }">
									<td style="text-align: center;"><a href="javascript:;"
										class="tablelink viewProjectBook" data-id="${p.id }">查看</a>&nbsp;<a
										href="javascript:;" class="tablelink changeProjectBook"
										data-id="${p.id }">修改</a>&nbsp;<a href="javascript:;"
										class="tablelink delProjectBook" data-id="${p.id }">删除</a></td>
								</c:if>
								<td style="text-align: center;"><a href="javascript:;"
									class="tablelink flow" data-id="${p.id }">业务流转</a></td>
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
