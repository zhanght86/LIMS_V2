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

<title>业务登记</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>查看业务登记信息</span>
		</div>
		<form action="" id="registForm">
			<ul class="forminfo" style="width: 1000px">
				<li><label>合同编号</label> <label class="viewLabel">${contractId
						}</label></li>
				<li><label>委托单位</label> <label class="viewLabel">${client}</label>
				</li>
				<li><label>监测项目</label> <s:textarea
						cssClass="textinput required" name="item" data-alert="监测项目"
						placeholder="描述监测项目，不超过100字"></s:textarea></li>
				<li><label>地址</label> <s:textfield cssClass="dfinput required"
						data-alert="地址" placeholder="委托方地址，不超过50字" name="address" /></li>
				<li><label>委托人</label> <s:textfield cssClass="dfinput required"
						data-alert="委托人" placeholder="委托方联系人姓名" name="contacts"></s:textfield>
				</li>
				<li><label>电话</label> <s:textfield cssClass="dfinput required"
						data-alert="电话" placeholder="委托方电话，11位手机号" name="tel"></s:textfield>
				</li>
				<li><label>合同时间</label> <label class="viewLabel">${time
						}</label></li>
				<li><label>费用（万元）</label> <label class="viewLabel">${costUpper
						}</label></li>
				<li><s:hidden cssClass="dfinput" name="viewId"></s:hidden></li>	
				
			</ul>
		</form>
	</div>
</body>
</html>
