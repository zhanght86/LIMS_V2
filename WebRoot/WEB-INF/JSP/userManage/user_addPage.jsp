<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
			<span>新增用户</span>
		</div>
		<form action="userManage_user_add.action" id="userAdd">
			<ul class="forminfo">
				<li><label>用户编号</label> <input name="identify" type="text "
					class="dfinput required" id="identity" placeholder="必填项，提交之后无法被修改"/>&nbsp;&nbsp;&nbsp;<input name=""
					type="button" class="scbtn" value="自动生成" id="autoCreate" /></li>

				<li><label>用户姓名</label> <input name="name" type="text "
					class="dfinput required" placeholder="必填项，请输入用户姓名" /></li>
				<li><label id="sexSS">性别</label> <div class="vocation">
						<select class="select3" name="sex">
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</div></li>
				<li><label>身份证号</label> <input name="idCard" type="text "
					class="dfinput required idCard" data-alert="身份证号" placeholder="必填项，请输入18位身份证号" /></li>
				<li><label>联系电话</label> <input name="tel" type="text"
					class="dfinput required tel" data-alert="联系电话" placeholder="请输入11位手机号" /></li>
				<li><label>工作电话</label> <input name="workTel" type="text"
					class="dfinput" data-alert="工作电话" placeholder="请输入填写11位手机号" /></li>
				<li><label>入职日期</label> <input name="entryTime" type="text"
					class="dfinput" placeholder="点击选择时间"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></li>
				<li><label>家庭住址</label> <input name="address" type="text"
					class="dfinput " placeholder="请填写家庭住址" /></li>
				<li><label>联系人</label> <input name="contacts" type="text"
					class="dfinput " placeholder="请填写联系人姓名" /></li>
				<li><label>紧急电话</label> <input name="contactsTel" type="text"
					class="dfinput " placeholder="请填写联系人11位手机号" /></li>
				<li><label>设置角色</label>
					<div class="vocation">
						<select class="select3" name="roleId">
							<s:iterator value="#roleList" id="r">
									<option value="${r.id }">${r.name }</option>
							</s:iterator>
						</select>
					</div></li>
			</ul>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 350
			});
			$('#autoCreate').click(function() {
				$.ajax({
					url : "userManage_user_autoCreate.action",
					async : false,
					success : function(data) {
						var json = eval('(' + data + ')');
						$('#identity').prop('value', json.identify);
					}

				});
			});
		});
	</script>
</body>
</html>
