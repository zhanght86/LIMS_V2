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
			<span>修改用户信息</span>
		</div>
		<form action="userManage_user_change.action" id="userAdd">
			<ul class="forminfo">
				<li><label>用户编号</label> 
				<s:textfield
						cssClass="dfinput required" placeholder="必填项，请填写编号或者自动生成"
						name="identify" id="identity" disabled="true"></s:textfield><i>用户编号无法被修改</i></li>
				<s:hidden name="identify"></s:hidden>
				<li><label>用户姓名</label> <s:textfield name="name"
						cssClass="dfinput required" placeholder="必填项，请输入用户姓名"></s:textfield>
				</li>
				<li><label id="sexSS">性别</label>
					<div class="vocation">
						<s:select list="{'男','女'}" cssClass="dfinput select3" name="sex"></s:select>
					</div></li>
				<li><label>身份证号</label> <s:textfield
						cssClass="dfinput required" placeholder="必填项，请输入18位身份证号"
						name="idCard"></s:textfield></li>
				<li><label>联系电话</label> <s:textfield cssClass="dfinput"
						placeholder="请输入11位手机号" name="tel"></s:textfield></li>
				<li><label>工作电话</label> <s:textfield cssClass="dfinput"
						placeholder="请输入11位手机号" name="workTel"></s:textfield></li>
				<li><label>入职日期</label> 
				<s:textfield cssClass="dfinput"  placeholder="必填项，点击选择时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="entryTime"></s:textfield>
					</li>
				<li><label>家庭住址</label>
					<s:textarea cssClass="dfinput" name="address" placeholder="请填写家庭住址"></s:textarea>
				</li>
				<li><label>联系人</label>
					<s:textarea cssClass="dfinput" placeholder="请填写联系人姓名" name="contacts"></s:textarea>
				</li>
				<li><label>紧急电话</label> <s:textfield cssClass="dfinput"
						placeholder="请输入11位手机号" name="contactsTel"></s:textfield></li>
				<li><label>设置角色</label>
					<div class="vocation">
						<s:select list="#roleList" cssClass="dfinput select3" name="roleId" listKey="id" listValue="name"></s:select>
					</div></li>
				<li><s:hidden name="password"></s:hidden></li>
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
						$('#identity').attr('value', json.identify);
					}

				});
			});
		});
	</script>
</body>
</html>
