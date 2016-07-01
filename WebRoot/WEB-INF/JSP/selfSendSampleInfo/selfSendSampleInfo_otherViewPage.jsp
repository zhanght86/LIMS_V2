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

<title>自送样登记表</title>

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

</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>样品记录</span>
		</div>
		<c:if test="${gainType==1 }">
			<table class="tablelist" id="departmentTable" style="width: 900px">
				<thead>
					<tr>
						<th>序号</th>
						<th>样品名称</th>
						<th>实验室名称</th>
						<th>测试项目</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>

					<s:iterator value="#selfSendSampleInfoList" id="s" status="L">
						<tr>
							<td data-id="${s.id }">${L.index+1 }</td>
							<td>${s.sampleName }</td>
							<td data-depart="${s.department.id }">${s.department.name }</td>
							<td>${s.projectName }</td>
							<td>${s.other }</td>
						</tr>
					</s:iterator>

				</tbody>
			</table>
		</c:if>
		
		<c:if test="${gainType==0 }">
			<table class="tablelist" id="departmentTable" style="width: 900px">
				<thead>
					<tr>
						<th>序号</th>
						<th>样品名称</th>
						<th>采样地点</th>
						<th>测试项目</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>

					<s:iterator value="#selfSendSampleInfoList" id="s" status="L">
						<tr>
							<td data-id="${s.id }">${L.index+1 }</td>
							<td>${s.sampleName }</td>
							<td>${s.samplingPosition}</td>
							<td>${s.projectName }</td>
							<td>${s.other }</td>
						</tr>
					</s:iterator>

				</tbody>
			</table>
		</c:if>
	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>样品信息</span>
		</div>

		<ul class="forminfo">
			<c:if test="${gainType==1 }">
				<li><label>送样单位</label><label class="viewLabel">${client
						}</label></li>
			</c:if>
			<li><label>送样日期</label><label class="viewLabel">${nowDate
					}</label></li>
			<li><label>记录人</label><label class="viewLabel">${userName
					}</label></li>
		</ul>


	</div>
</body>
</html>
