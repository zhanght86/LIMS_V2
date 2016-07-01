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

<title>新增客户信息</title>

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
			<span>新增客户</span>
		</div>
		<form action="customerManage_customer_add.action" id="customerAdd">
			<ul class="forminfo">
				<li>
					<label>客户编号</label>
					<input name="identify" id="identity" type="text " class="dfinput required"  placeholder="必填项，请输入客户编号" />&nbsp;&nbsp;&nbsp;<input name="" type="button"
						class="scbtn" value="自动生成" id="autoCreate" />
				</li>
				<li>
					<label>客户姓名</label>
					<input name="name" type="text " class="dfinput required" placeholder="姓名不能超过10个字符" />
				</li>
				<li>
					<label>客户类型</label>
					<div class="vocation">
						<select class="select3" name="curType">
							<option value="设备供应商">设备供应商</option>
							<option value="备品供应商">备品供应商</option>
							<option value="咨询供应商" >咨询供应商</option>
							<option value="服务购买者">服务购买者</option>
						</select>
					</div>
				</li>
				<li>
				<label>是否VIP</label>
					<div class="vocation">
						<select class="select3" name="leaguer">
							<option value="是">是</option>
							<option value="否">否</option>
						</select>
					</div>
				</li>

				<li>
					<label>列入时间</label>
					<input name="entryTime" type="text" class="dfinput " placeholder="必填项，客户资料登记时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /><i></i>
				</li>
				<li>
					<label>联系人</label>
					<input name="linkMan" type="text" class="dfinput" placeholder="姓名不能超过10个字符" />
				</li>
				<li>
					<label>联系人职务</label>
					<input name="linkManPosition" type="text" class="dfinput " />
				</li>
				<li>
					<label>E-Mail</label>
					<input name="email" type="text" class="dfinput " placeholder="请输入电子邮件" />
				</li>
				<li>
					<label>联系电话</label>
					<input name="tel" type="text" class="dfinput " placeholder="11位手机号码" />
				</li>
				<li>
					<label>工作电话</label>
					<input name="workTel" type="text" class="dfinput " placeholder="11位手机号码" />
				</li>
				<li>
					<label>客户住址</label>
					<input name="address" type="text" class="dfinput " placeholder="住址不能超过50个字符" />
				</li>
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
					url : "customerManage_customer_autoCreate.action",
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
