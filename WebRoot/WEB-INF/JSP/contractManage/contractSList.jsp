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

<title>服务合同列表</title>

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
<script src="js/module/contractSList.js" type="text/javascript"
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
					<li><a href="#tab1" class="selected">服务合同</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="seachform serviceSearchForm">
					<li><label>合同编号</label> <input name="" placeholder="请输入合同编号"
						type="text" class="scinput" data-search="identify" /></li>
					<li><label>委托单位</label> <input name="" placeholder="请输入委托单位名称"
						type="text" class="scinput" data-search="client" /></li>
					<li><label>项目名称</label> <input name="" placeholder="请输入项目名称关键字"
						type="text" class="scinput" data-search="name" /></li>
					<li><label>合同经办人</label> <input name="" placeholder="请输入经办人编号"
						type="text" class="scinput" data-search="project.draftsMan.identify" /></li>
				</ul>
				<ul class="seachform serviceSearchForm">
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
				</ul>
				<table class="tablelist" id="serviceTable">
					<thead>
						<tr>
							<th>合同编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>项目名称</th>
							<th>合同承办人</th>
							<th>项目创建时间</th>
							<th>当前状态</th>
							<th>合同原本</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#serviceList" id="s">
							<tr>
								<td>${s.identify }</td>
								<td style="text-align: left;">${s.name }</td>
								<td>${s.project.draftsMan.name }</td>
								<c:if test="${empty s.project.createTime }">
									<td style="color: red">未进入流程！</td>
								</c:if>
								<c:if test="${not empty s.project.createTime }">
									<td>${s.project.createTime }</td>
								</c:if>
								<c:choose>
									<c:when test="${s.project.process == -2 }">
										<td style="color: red;">已中止</td>
									</c:when>
									<c:when test="${s.project.process == 11 }">
										<td style="color: green;">已结束</td>
									</c:when>
									<c:when test="${s.project.process == 0 }">
										<td style="color: blue;">已草拟</td>
									</c:when>
									<c:when test="${empty s.project.process  }">
										<td>未开始</td>
									</c:when>
									<c:otherwise>
										<td style="color: purple;"><a href="javascript:;" class="tablelink viewTContract"
									data-id="${s.id }">流程中</a></td>
									</c:otherwise>
								</c:choose>

								<td><a href="javascript:;" class="tablelink viewSContract"
									data-id="${s.project.id }">查看</a>&nbsp;&nbsp;<a href="javascript:;" class="tablelink export"
									data-id="${s.id }">导出</a></td>
								<c:choose>
									<c:when test="${s.project.process == -2}">
										<td>无操作</td>
									</c:when>
									<c:when test="${s.project.process == 11}">
										<td><a href="javascript:;" class="tablelink viewProject"
											data-id="${s.id }" data-opt="view">查看项目</a></td>
									</c:when>
									<c:when test="${empty s.project.process}">
										<td><a href="javascript:;" class="tablelink stopContract"
											data-id="${s.id }" data-opt="delete">删除</a>&nbsp; <a href="javascript:;" class="tablelink into"
											data-id="${s.id }" data-opt="delete">进入流程</a></td>
									</c:when>
									<c:otherwise>
										<td><a href="javascript:;" class="tablelink stopContract"
											data-id="${s.id }" data-opt="stop">中止合同</a></td>
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
