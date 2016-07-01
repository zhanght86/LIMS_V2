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
<title>用户管理</title>
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
<script src="js/module/userManage.js" type="text/javascript"
	charset="utf-8"></script>

</head>


<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">系统管理</a></li>
			<li>用户管理</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1">用户信息管理</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">

				<ul class="seachform">
					<li><label>用户编号</label> <input name="" placeholder="请输入用户编号"
						type="text" class="scinput" data-search='identify'/></li>
					<li><label>用户姓名</label> <input name="" placeholder="请输入用户姓名"
						type="text" class="scinput" data-search='name'/></li>
					<li><label>身份证号</label> <input name="" placeholder="请输入用户身份证号"
						type="text" class="scinput" data-search='idCard'/></li>
					<li><label>联系电话</label> <input name="" placeholder="请输入用户联系电话"
						type="text" class="scinput" data-search='tel'/></li>
				</ul>
				<ul class="seachform">
					<li><label>用户性别</label>
						<div class="vocation">
							<select class="select3" data-search='sex'>
								<option value="0" selected="selected">不限</option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
						</div></li>

					<li><label>入职时间</label>
						<div class="vocation">
							<input placeholder="入职起始时间" type="text"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
								class="scinput" style="width:150px" id="dataStart" data-search='entryTimeStart'/> 至 <input
								placeholder="入职结束时间" type="text"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
								class="scinput" id="dataEnd" style="width:150px" data-search='entryTimeEnd'/>
						</div></li>

					<li><label>所属角色</label>
						<div class="vocation">
							<select class="select3" data-search='role'>
								<option value="0">不限</option>
								<s:iterator value="#roleList" id="r">
									<option value="${r.id }">${r.name }</option>
								</s:iterator>
							</select>
						</div></li>

					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" value="查询"  id="seachBtn"/></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" value="全部" id="allResult"/></li>
				</ul>
				<div class="tools">
					<ul class="toolbar">
						<li class="click" id="newUser"><span><img
								src="images/t01.png" /></span>新增</li>
								<li class="click" id="resetAllPWD"><span><img
								src="images/t09.png" /></span>批量重置密码</li>
						<li class="click" id="delMoreUser"><span><img
								src="images/t02.png" /></span>批量删除</li>
						<li class="reverse" reverseTo="userTable"><span><img
								src="images/t03.png" /></span>反向选择</li>
						<%-- <li class="export"><span><img src="images/t04.png" /></span>数据导出</li> --%>
					</ul>
					<ul class="toolbar1">
						<li class="help"><a href="help.html" target="_blank"><span><img
									src="images/t08.png" /></span>帮助</a></li>
					</ul>
				</div>
				<table class="tablelist" id="userTable">
					<thead>
						<tr>
							<th><input name="" type="checkbox" value="" /></th>
							<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>用户姓名</th>
							<th>用户性别</th>
							<th>身份证号</th>
							<th>联系电话</th>
							<th>所属角色</th>
							<th>入职时间</th>
							<th>住址</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#userList" id="u">
							<tr>
								<td><input name="" type="checkbox" data-num="${u.id}"
									value="" /></td>
								<td>${u.identify }</td>
								<td>${u.name }</td>
								<td>${u.sex }</td>
								<td>${u.idCard }</td>
								<td>${u.tel }</td>
								<td>${u.role.name }</td>
								<td>${u.entryTime }</td>
								<td>${u.address }</td>
								<c:if test="${u.identify=='admin'}">
									<td>您无法修改该分组</td>
								</c:if>
								<c:if test="${u.identify!='admin'}">
								<td><a href="javascript:;" class="tablelink viewUser"
									data-num="${u.id }">查看</a> <a href="javascript:;"
									class="tablelink changeUser" data-num="${u.id }">修改</a> <a
									href="javascript:;" class="tablelink delUser" data-num="${u.id }"> 删除</a>
									<a href="javascript:;" class="tablelink resetPWD" data-num="${u.id }">
										重置密码 </a></td>
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
