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

<title>新增用户信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/module/validCheck.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="css/My97DatePicker/WdatePicker.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>修改客户信息</span>
		</div>
		<form action="customerManage_customer_change.action" id="customerAdd">
			<ul class="forminfo">
				<li>
					<label>客户编号</label>
					<s:textfield name="identify" id="identify"  cssClass="dfinput required" disabled="true"></s:textfield>
				</li>
				<li>
					<label>客户姓名</label>
					<s:textfield name="name" cssClass="dfinput required" placeholder="姓名不能超过10个字符"></s:textfield>
				</li>
				<li>
					<label>客户类型</label>
					<div class="vocation">
						<s:select list="{'设备供应商','备品供应商','咨询供应商','服务购买者'}" cssClass="dfinput select3" name="curType"></s:select>
					</div>
				</li>
				<li>
				<label>是否VIP</label>
					<div class="vocation">
						<s:select list="{'是','否'}" cssClass="dfinput select3" name="leaguer"></s:select>
					</div>
				</li>

				<li>
					<label>列入时间</label>
					<s:textfield name="entryTime" cssClass="dfinput" placeholder="必填项，客户资料登记时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></s:textfield>
				</li>
				<li>
					<label>联系人</label>
					<s:textfield name="linkMan" cssClass="dfinput" placeholder="姓名不能超过10个字符"></s:textfield>
				</li>
				<li>
					<label>联系人职务</label>
					<s:textfield name="linkManPosition" cssClass="dfinput"></s:textfield>
				</li>
				<li>
					<label>E-Mail</label>
					<s:textfield name="email" cssClass="dfinput" placeholder="请输入电子邮件" ></s:textfield>
				</li>
				<li>
					<label>联系电话</label>
					<s:textfield name="tel" cssClass="dfinput" placeholder="11位手机号码" ></s:textfield>
				</li>
				<li>
					<label>工作电话</label>
					<s:textfield name="workTel" cssClass="dfinput" placeholder="11位手机号码" ></s:textfield>
				</li>
				<li>
					<label>客户住址</label>
					<s:textfield name="address" cssClass="dfinput" placeholder="住址不能超过50个字符" ></s:textfield>
				</li>
			</ul>
			<s:hidden name="id"></s:hidden>
			<s:hidden name="password"></s:hidden>
			<s:hidden name="identify"></s:hidden>
			<s:hidden name="role.id"></s:hidden>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 350
			});
		});
	</script>
</body>
</html>
