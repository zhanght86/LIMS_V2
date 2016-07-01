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

<title>业务合同列表</title>

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
<script type="text/javascript" src="js/jquery.form.js" charset="utf-8"></script>
<script src="js/module/contractList.js" type="text/javascript"
	charset="utf-8"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">合同管理</a></li>
			<li>合同列表</li>
		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">业务合同</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="seachform trafficSerachForm">
					<li><label>合同编号</label> <input name="" placeholder="请输入合同编号"
						type="text" class="scinput" data-search="identify" /></li>
					<li><label>委托单位</label> <input name="" placeholder="请输入委托单位名称"
						type="text" class="scinput" data-search="customerName" /></li>
					<li><label>客户联系人</label> <input name="" placeholder="请输入联系人姓名"
						type="text" class="scinput" data-search="customerPeople" /></li>
					<li><label>合同经办人</label> <input name="" placeholder="请输入经办人编号"
						type="text" class="scinput" data-search="contractors" /></li>
				</ul>
				<ul class="seachform trafficSerachForm">
					<li><label>交付时间</label>
						<div class="vocation">
							<input placeholder="交付起始时间" type="text"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="scinput"
								style="width:150px" data-search='entryTimeStart'
								id="finishStratTime" /> 至 <input placeholder="交付结束时间"
								type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
								class="scinput" style="width:150px" data-search='entryTimeEnd'
								id="finishEndTime" />
						</div></li>
					<li><label>监测类别</label>
						<div class="vocation">
							<select class="select3" data-search='projectType'>
								<option value="3" selected="selected">不限</option>
								<option value="委托监测">委托监测</option>
								<option value="验收监测">验收监测</option>
								<option value="委托分析">委托分析</option>
								<option value="其他">其他</option>
							</select>
						</div></li>
					<li><label>合同状态</label>
						<div class="vocation">
							<select class="select3" data-search='process'>
								<option value="3" selected="selected">不限</option>
								<option value="-2">已中止</option>
								<option value="11">已结束</option>
								<option value="0">已草拟</option>
							</select>
						</div></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" value="查询" id="seachBtn" /></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="allResult" value="全部" /></li>
						<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="exportList" value="列表导出" /></li>
				</ul>
				<table class="tablelist" id="auditTable">
					<thead>
						<tr>
							<th style="text-align: center;"><input name="" type="checkbox" value="" /></th>
							<th style="text-align: center;">合同编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>委托单位</th>
							<th>监测项目</th>
							<th style="text-align: center;">监测类别</th>
							<th style="text-align: center;">联系人</th>
							<th style="text-align: center;">联系电话</th>
							<th>地址</th>
							<th style="text-align: center;">项目创建时间</th>
							<th style="text-align: center;">当前状态</th>
							<th style="text-align: center;">合同原本</th>
							<th style="text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#trafficList" id="t">
							<tr>
								<td style="text-align: center;"><input type="checkbox" data-search="${t.id }" data-name="${t.id }" name="choose" /></td>
								<td style="text-align: center;">${t.identify }</td>
								<td>${t.customerName }</td>
								<td>
								<s:iterator value="#t.items" id="i">
									${i.analysisProject.name }(${i.analysisCategory.name}),
								</s:iterator>
								</td>
								<td style="text-align: center;">${t.projectType }</td>
								<td style="text-align: center;">${t.customerPeople }</td>
								<td style="text-align: center;">${t.customerTel }</td>
								<td>${t.customerAddress }</td>
								<c:if test="${empty t.project.createTime }">
									<td style="color: red;text-align: center;">尚未进入流程！</td>
								</c:if>
								<c:if test="${not empty t.project.createTime }">
									<td style="text-align: center;">${t.project.createTime }</td>
								</c:if>
								<c:choose>
									<c:when test="${t.project.process == -2 }">
										<td style="color: red;text-align: center;"><a href="javascript:;" class="tablelink viewProject"
									data-id="${t.id }">已中止</a></td>
									</c:when>
									<c:when test="${t.project.process == 11 }">
										<td style="color: green;text-align: center;"><a href="javascript:;" class="tablelink viewProject"
									data-id="${t.project.id }">已结束</a></td>
									</c:when>
									<c:when test="${t.project.process == 0 }">
										<td style="color: blue;text-align: center;">已草拟</td>
									</c:when>
									<c:when test="${empty t.project.process  }">
										<td style="text-align: center;">未开始</td>
									</c:when>
									<c:otherwise>
										<td style="color: purple;text-align: center;"><a href="javascript:;" class="tablelink viewProject"
									data-id="${t.project.id}">流程中</a></td>
									</c:otherwise>
								</c:choose>

								<td><a href="javascript:;" class="tablelink viewTContract"
									data-id="${t.project.id }">查看</a>&nbsp;&nbsp;<a href="javascript:;" class="tablelink export"
									data-id="${t.id }">导出</a></td>
								<c:choose>
									<c:when test="${t.project.process == -2}">
										<td>无操作</td>
									</c:when>
									<c:when test="${t.project.process == 11}">
										<td><a href="javascript:;" class="tablelink viewProject"
											data-id="${t.project.id }" data-opt="view">查看项目</a></td>
									</c:when>
									<c:when test="${empty t.project.process}">
										<td><a href="javascript:;" class="tablelink stopContract"
											data-id="${t.id }" data-opt="delete">删除</a>&nbsp;&nbsp; <a
											href="javascript:;" class="tablelink into" data-id="${t.id }">进入流程</a></td>
									</c:when>
									<c:otherwise>
										<td><a href="javascript:;" class="tablelink stopContract"
											data-id="${t.id }" data-opt="stop">中止合同</a></td>
									</c:otherwise>
								</c:choose>
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
