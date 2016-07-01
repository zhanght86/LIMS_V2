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
<title>首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script src="js/module/index.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
		</ul>
	</div>
	<div class="mainindex">
		<input type="hidden" id="testHidden" value="测试Hidden">
		<div class="welinfo">
			<span><img src="images/sun.png" alt="天气" /></span> <b>${name }<b
				id="nowTime">早上好</b>，欢迎使用实验室信息管理系统
			</b> <b>（您的身份是：${role.name }）</b>
		</div>
		<div class="welinfo">
			<span><img src="images/time.png" alt="时间" /></span> <i>您上次登录的时间：
				<c:if test="${empty historyLogin}">
			无记录
			</c:if> ${historyLogin.startDate}
			</i> （不是您登录的？<a href="javascript:;" id="changePwd">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;/<a
				href="javascript:;" id="historyLogin">登录历史</a>）
		</div>
		<div class="xline"></div>
		<ul class="iconlist">
			<li><img src="images/ico01.png" />
				<p>
					<a href="javascript:;">基础设置</a>
				</p></li>
			<li><a href="javascript:;" id="newNotice"> <img
					src="images/ico02.png" />
					<p>
						<label>发布公告</label>
					</p></a></li>
			<!-- <li><a href="javascript:;"><img src="images/ico03.png" />
					<p>
						<label>我的绩效</label>
					</p></a></li> -->
			<li><a href="http://localhost:8088/KOd/index.php?user/login"
				target="_blank"><img src="images/ico04.png" />
					<p><label>我的云盘</label></p></a></li>
			<li><a href="commonTemplet_commonTemplet_main.action"><img src="images/ico05.png" />
				<p>
					<label>模板库</label>
				</p></a></li>
		</ul>
		<div class="ibox"></div>
		<div class="xline"></div>
		<div class="box"></div>
		<div class="welinfo">
			<span><img src="images/dp.png" alt="提醒" /></span> <b>系统公告</b>
		</div>
		<ul class="infolist">
			<s:iterator value="#noticeList" id="n">
				<li><c:if test="${n.priority==0 }">
						<span>【普通】</span>
					</c:if> <c:if test="${n.priority==1 }">
						<span style="color:blue;">【重要】</span>
					</c:if> <c:if test="${n.priority==2 }">
						<span style="color:red;">【紧急】</span>
					</c:if> <span><a href="javascript:;" class="tablelink viewNotice"
						data-id="${n.id}">${n.noticeHead }</a></span></li>
			</s:iterator>
		</ul>
		<div class="xline"></div>
		<div class="box"></div>
		<div class="welinfo">
			<span><img src="images/d04.png" alt="提醒" /></span> <b>系统指南（功能尚未开放）</b>
		</div>
		<ul class="umlist">
			<li><a href="javascript:;">如何发布公告</a></li>
			<li><a href="javascript:;">如何访问网站</a></li>
			<li><a href="javascript:;">如何管理项目</a></li>
			<li><a href="javascript:;">后台用户设置(权限)</a></li>
			<li><a href="javascript:;">系统设置</a></li>
		</ul>
		<br> <br>
		<ul class="umlist">
			<li style="font-weight: bold;">当前系统版本：测试版V1.1，有任何疑问，请拨打电话：13816157552（瞿先生）或者联系QQ：154256698</li>
		</ul>
	</div>
</body>
</html>
