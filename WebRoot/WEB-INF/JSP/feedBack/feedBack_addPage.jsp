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

<title>问题反馈</title>

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
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>问题反馈</span>
		</div>
		<form action="roleManage_role_add.action" id="feedBackAction">
			<ul class="forminfo">
				<li>
				<li><label>问题类型</label>
					<div class="vocation">
						<select class="select3" name="type">
							<option value="1">功能缺失</option>
							<option value="2">系统bug</option>
							<option value="3">个人建议</option>
							<option value="4">其他</option>
						</select>
					</div></li>
				<li><label>问题描述</label> <textarea name="context"
						placeholder="描述问题，不超过1000个汉字" class="textinput required"
						data-alert="问题描述" style="width: 350px;height: 100px;"></textarea></li>
				<li><label>&nbsp;</label> <input name="" type="button"
					class="scbtn" value="提交" id="sumbit" /></li>
			</ul>
		</form>
		<div class="formtitle">
			<span>友情提醒</span>
		</div>
		<div style="width: 600px">
			<ul>
				<li style="padding-bottom: 10px">1.当前版本为：测试版V1.0，系统存在较多的bug和缺陷，请尽量反馈，我们会及时处理。</li>
				<li style="padding-bottom: 10px">2.“功能缺失”是指系统中有遗漏或者需要补充的功能，请在“问题描述”中详细说明该功能的用途、操作方法、与其他功能衔接方式等内容。</li>
				<li style="padding-bottom: 10px">3.“系统bug”是指当前系统中存在的功能但无法完成操作的情况，bug可能会导致流程无法运转或者服务器奔溃，在“问题描述”中需要详细说明如果复现bug，以及bug内容的描述。</li>
				<li style="padding-bottom: 10px">4.在系统测试期间，任何业务流程请做好备份（纸质和电子），防止测试期间不稳定导致数据丢失！</li>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 350
			});
			$('#sumbit').click(
					function() {
						asyncbox.confirm('是否反馈该问题？', '提示', function(action) {
							if (action == 'ok') {
								$.ajax({
									url : "feedBack_feedBack_add.action",
									data : $('#feedBackAction').serialize(),
									async : false,
									success : function(data) {
										var json = eval('(' + data + ')');
										if (json.info == "success") {
											asyncbox.alert(
													"提交成功，感谢您的反馈，我们会尽快处理！",
													"反馈结果");
										}
										if (json.info == "failed") {
											asyncbox.error("提交失败，请刷新之后重新尝试！",
													'反馈失败');
										}
									}
								});
							}
						});
					})
		});
	</script>
</body>
</html>
