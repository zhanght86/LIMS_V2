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

<title>新增系统公告</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script src="css/My97DatePicker/WdatePicker.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/module/noticeManage_addPage.js" type="text/javascript"
	charset="utf-8"></script>
<script charset="utf-8" src="editor/kindeditor.js"></script>
<script charset="utf-8" src="editor/lang/zh_CN.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"
	charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>新增公告</span>
		</div>
		<form action="noticeManage_noticeManage_add.action" id="NoticeForm">
			<ul class="forminfo">
				<li><label>公告标题</label>
					<div class="vocation" style="height:32px">
						<select class="select3" name="priority">
							<option value="2" style="color: red;">紧急</option>
							<option value="1" style="color: blue;">重要</option>
							<option value="0" selected="selected">普通</option>
						</select>
					</div>&nbsp; <input name="noticeHead" type="text "
					class="dfinput required" data-alert="公告标题" placeholder="请输入公告标题"
					style="width: 630px" /></li>
				<li><label>公告内容</label> <textarea id="content7" name=""
						style="width:700px;height:250px;visibility:hidden;"></textarea></li>
				<li><label>开始日期</label> <input name="startDate" type="text"
					class="dfinput required" data-alert="开始时间" placeholder="点击选择开始时间"
					 onfocus="WdatePicker({minDate:'%y-%M-{%d+1}'})" style="width: 700px" />
				</li>
				<li><label>结束日期</label> <input name="endDate" type="text"
					class="dfinput required" data-alert="结束时间" placeholder="点击选择结束时间"
					 onfocus="WdatePicker({minDate:'%y-%M-{%d+1}'})" style="width: 700px" />
				</li>
				<li><label>公告对象</label>
					<div class="vocation">
						<select class="select2" name="sendWay">
							<option value="0" selected="selected">所有人员</option>
							<option value="1">指定部门</option>
							<option value="2">指定人员</option>
						</select>
					</div></li>
				<li id="dep"><label>指定部门</label> <input name="name"
					id="departChose" type="text " class="dfinput " placeholder="请选择部门"
					style="width: 700px" /><input name="departmentId" id="departChoseHide"
					type="hidden" class="dfinput " placeholder="请选择部门"
					style="width: 700px" /></li>
				<li id="user"><label>指定用户</label> <textarea name="desp"
						placeholder="请选择用户" class="textinput"
						style="height: 100px; width: 700px" rows="" cols="" id="userChose"></textarea><input
					name="userId" id="userChoseHide" type="hidden" class="dfinput "
					 style="width: 700px" /></li>
				<li><label>上传附件</label> <input name="file" type="file"
					style="width: 700px" id="file" /> 
					<input name="path" type="hidden" class="dfinput " id="path" style="width: 700px" /></li>
			</ul>
			<input type="hidden" id="hideText" name="context" class="dfinput">
		</form>
	</div>
	<script type="text/javascript">
		var editor;
		KindEditor.ready(function(K) {
			editor = K.create('#content7', {
				resizeType : 2

			});
		});
		$(function() {
			$('#btn').click(function() {
				var a = editor.html();
				alert(a);
			});
		});
		function uploadFile() {
			$('#hideText').prop("value", editor.html());
			if ($("#file").prop("value") != "") {
				$.ajaxFileUpload({
					url : 'fileUploadAction.action?type=2',//用于文件上传的服务器端请求地址
					secureuri : false,//一般设置为false
					fileElementId : 'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
					dataType : 'json',//返回值类型 一般设置为json
					success : function(data, status) //服务器成功响应处理函数
					{
						var json = eval('(' + data + ')');
						if (json.info == 'success') {
							$('#path').prop('value', json.path);
							$.ajax({
								url : "noticeManage_noticeManage_add.action",
								data : $('#NoticeForm').serialize(),
								async : false,
								success : function(data) {
									var json = eval('(' + data + ')');
									if (json.info == "success") {
										asyncbox.alert("发布成功！", '结果', function() {
											window.location.reload();
										});
									}
									if (json.info == "failed") {
										asyncbox.error("发布失败，请刷新之后重新尝试！", '结果');
									}
									return false;
								}
							});
						} else {
							asyncbox.error("附件上传失败，请重新尝试！", '保存结果');
						}
						return false;
					}
				});
			}else{
				$.ajax({
					url : "noticeManage_noticeManage_add.action",
					data : $('#NoticeForm').serialize(),
					async : false,
					success : function(data) {
						var json = eval('(' + data + ')');
						if (json.info == "success") {
							asyncbox.alert("发布成功！", '结果', function() {
								window.location.reload();
							});
						}
						if (json.info == "failed") {
							asyncbox.error("发布失败，请刷新之后重新尝试！", '结果');
						}
						return false;
					}
				});
			}
		}
		window.uploadFile = uploadFile;
	</script>
</body>
</html>
