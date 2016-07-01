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
<title>系统公告</title>
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
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/paging-V1.3-final.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/module/notice.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li>系统公告</li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">系统公告</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="seachform">
					<li><label>公告标题</label> <input name="" placeholder="标题关键字"
						type="text" class="scinput" data-search="noticeHead" /></li>
					<li><label>公告内容</label> <input name="" placeholder="内容关键字"
						type="text" class="scinput" data-search="context" /></li>
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
				<table class="tablelist" id="roleTable">
					<thead>
						<tr>
							<th>编号</th>
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
								<td>${L.index+1 }</td>
								<c:if test="${n.priority==0 }">
									<td>普通</td>
								</c:if>
								<c:if test="${n.priority==1 }">
									<td>重要</td>
								</c:if>
								<c:if test="${n.priority==2 }">
									<td>紧急</td>
								</c:if>
								<c:if test="${n.priority==0 }">
									<td style="text-align: left;">${n.noticeHead }</td>
								</c:if>
								<c:if test="${n.priority==1 }">
									<td style="color: blue; text-align: left;">${n.noticeHead
										}</td>
								</c:if>
								<c:if test="${n.priority==2 }">
									<td style="color: red; text-align: left;">${n.noticeHead }</td>
								</c:if>
								<td>${n.startDate }</td>
								<td>${n.endDate }</td>
								<td><c:if test="${not empty n.path }">
										<a href="javascript:;" class="tablelink download"
											data-id="${n.id }">下载</a>
									</c:if> <c:if test="${ empty n.path }">
										无
									</c:if></td>
								<td><a href="javascript:;" class="tablelink viewNotice"
									data-id="${n.id}">查看</a></td>
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
