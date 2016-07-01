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

<title>公告管理</title>

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
<script src="js/module/noticeManage.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">系统管理</a></li>
			<li>公告管理</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">公告管理</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="seachform">
					<li><label>公告标题</label> <input name="" 
						placeholder="标题关键字" type="text" class="scinput"
						data-search="noticeHead" /></li>
					<li><label>公告内容</label> <input  name=""
						placeholder="内容关键字" type="text" class="scinput"
						data-search="context" /></li>
					<li><label>公告优先级</label>
						<div class="vocation">
							<select class="select3" data-search='priority'>
								<option value="-1" selected="selected">全部</option>
								<option value="2">紧急</option>
								<option value="1">重要</option>
								<option value="0">普通</option>
							</select>
						</div></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="seachBtn" value="查询" /></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="allResult" value="全部" /></li>
					
				</ul>
				<div class="tools">
					<ul class="toolbar">
						<li class="click" id="newNotice"><span><img
								src="images/t01.png" /></span>新增</li>
						<li class="click" id="delNoticeAll"><span><img
								src="images/t02.png" /></span>批量删除</li>
						<li class="click reverse" reverseTo="roleTable"><span><img
								src="images/t03.png" /></span>反向选择</li>
					</ul>
					<ul class="toolbar1">
						<li class="help"><a href="help.html" target="_blank"><span><img
									src="images/t08.png" /></span>帮助</a></li>
					</ul>
				</div>
				<table class="tablelist" id="roleTable">
					<thead>
						<tr>
							<th><input name="" type="checkbox" value="" /></th>
							<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>优先级</th>
							<th>公告标题</th>
							<th>发布日期</th>
							<th>结束日期</th>
							<th>附件</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#noticeList" id="n" status="L">
							<tr>
								<td><input name="" data-id="${n.id}" type="checkbox"
									value="" /></td>
								<td>${L.index+1 }</td>
								<td><c:if test="${n.priority==0 }">
								普通
								</c:if> <c:if test="${n.priority==1 }">
								重要
								</c:if> <c:if test="${n.priority==2 }">
								紧急
								</c:if></td>
								<c:if test="${n.priority==0 }">
									<td>${n.noticeHead }</td>
								</c:if>
								<c:if test="${n.priority==1 }">
									<td style="color: blue;">${n.noticeHead }</td>
								</c:if>
								<c:if test="${n.priority==2 }">
									<td style="color: red;">${n.noticeHead }</td>
								</c:if>
								<td>${n.startDate }</td>
								<td>${n.endDate }</td>
								<td><c:if test="${not empty n.path }">
										<a href="javascript:;" class="tablelink download" data-id="${n.id }">下载</a>
									</c:if> <c:if test="${ empty n.path }">
										无
									</c:if></td>
								<td><a href="javascript:;" class="tablelink viewNotice"
									data-id="${n.id}">查看</a><a
									href="javascript:;" class="tablelink delNotice" data-id="${n.id}">
										删除 </a></td>
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
