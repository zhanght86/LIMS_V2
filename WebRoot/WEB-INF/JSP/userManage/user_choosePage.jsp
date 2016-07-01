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
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script src="js/paging-V1.3-final.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/module/userManage.js" type="text/javascript"
	charset="utf-8"></script>


</head>

<body class="common" style="widows: 500px">
	<div class="formbody">
		<div class="formtitle">
			<span>用户查询</span>
		</div>
		<ul class="seachform">
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

		<table class="tablelist" id="userTable" style="width: 600px">
			<thead>
				<tr>
					<th>选择</th>
					<th>用户编号<i class="sort"><img src="images/px.gif" /></i></th>
					<th>用户姓名</th>
					<th>所属角色</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#userList" id="u">
					<tr>
						<td><input type="radio" data-search="${u.id }" name="choose" /></td>
						<td>${u.identify }</td>
						<td>${u.name }</td>
						<td>${u.role.name }</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="pagin" style="width: 600px">
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
