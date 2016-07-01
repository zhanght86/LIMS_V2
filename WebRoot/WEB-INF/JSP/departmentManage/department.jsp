<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>角色管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
<script src="js/module/departmentManage.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">系统管理</a></li>
			<li>部门管理</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">部门管理</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="seachform">
					<li><label>部门编号</label> <input name="" placeholder="请输入编号"
						type="text" class="scinput" data-search="identify" /></li>
					<li><label>部门名称</label> <input name="" placeholder="请输入名称"
						type="text" class="scinput" data-search="name" /></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="seachBtn" value="查询" /></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="allResult" value="全部" /></li>
				</ul>
				<div class="tools">
					<ul class="toolbar">
						<li class="click" id="newDepartment"><span><img
								src="images/t01.png" /></span>新增</li>
						<li class="click" id="delMoreDepartment"><span><img
								src="images/t02.png" /></span>批量删除</li>
						<li class="click reverse" reverseTo="departmentTable"><span><img
								src="images/t03.png" /></span>反向选择</li>
					</ul>
					<ul class="toolbar1">
						<li class="help"><a href="help.html" target="_blank"><span><img
									src="images/t08.png" /></span>帮助</a></li>
					</ul>
				</div>
				<table class="tablelist" id="departmentTable">
					<thead>
						<tr>
							<th><input name="" type="checkbox" value="" /></th>
							<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>部门名称</th>
							<th>部门描述</th>
							<th>部门主管</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#departmentList" id="d">


							<tr>
								<td><input name="" data-num="${d.id}" type="checkbox"
									value="" /></td>
								<td>${d.identify}</td>
								<td>${d.name}</td>
								<td>${d.desp}</td>
								<td>${d.manager.name }</td>
								<c:if test="${d.identify=='BM0000'}">
									<td>您无法修改该分组</td>
								</c:if>
								<c:if test="${d.identify!='BM0000'}">
								<td><%-- <a href="javascript:;" class="tablelink searchAdmin" data-depart="${d.id }">设置部门主管</a> --%> <a
									href="javascript:;" class="tablelink changeDepartment"
									data-num="${d.id}">修改</a> <a href="javascript:;"
									class="tablelink delDepartment" data-num="${d.id}"> 删除 </a></td>
								</c:if>
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
