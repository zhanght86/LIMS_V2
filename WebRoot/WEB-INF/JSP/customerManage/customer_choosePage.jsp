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

<title>选择客户</title>

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
<script src="js/module/customerManage.js" type="text/javascript"
	charset="utf-8"></script>


</head>

<body class="common" style="widows: 500px">
	<div class="formbody">
		<div class="formtitle">
			<span>客户查询</span>
		</div>
		<ul class="seachform">
			<li><label>客户姓名</label> <input name="" placeholder="请输入客户姓名"
				type="text" class="scinput" data-search='name' /></li>
			<li><label>客户类型</label>
				<div class="vocation">
					<select class="select3" data-search='curType'>
						<option value="0">不限</option>
						<option value="设备供应商">设备供应商</option>
						<option value="备品供应商">备品供应商</option>
						<option value="咨询供应商">咨询供应商</option>
						<option value="服务购买者">服务购买者</option>
					</select>
				</div></li>
			<li><input type="hidden" id="searchChoose" value="choose">
			</li>
			<li><label>&nbsp;</label> <input name="" type="button"
				class="scbtn" value="查询" id="seachBtn" /> <input name="" type="button"
				class="scbtn" value="全部" id="allResultChoose" /></li>
		</ul>

		<table class="tablelist" id="userTable" style="width: 600px">
			<thead>
				<tr>
					<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
					<th>客户姓名</th>
					<th>客户类型</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#customerList" id="c">
					<tr>
						<td><input type="radio" data-search="${c.id }" name="choose" /></td>
						<td>${c.identify }</td>
						<td>${c.name }</td>
						<td>${c.curType }</td>
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
			<div class="page" id="page2"></div>
		</div>
	</div>
</body>
</html>
