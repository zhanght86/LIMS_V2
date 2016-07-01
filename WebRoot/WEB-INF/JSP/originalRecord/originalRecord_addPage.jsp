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

<title>新增原始记录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/module/validCheck.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"
	charset="utf-8"></script>
<script type="text/javascript">
		$(".select3").uedSelect({
			width : 150
		});
		function uploadFile() {
			$.ajaxFileUpload({
				url : 'fileUploadAction.action?type=1',//用于文件上传的服务器端请求地址
				secureuri : false,//一般设置为false
				fileElementId : 'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
				dataType : 'json',//返回值类型 一般设置为json
				success : function(data, status) //服务器成功响应处理函数
				{
					var json = eval('(' + data + ')');
					if (json.info == 'success') {
						$('#path').prop('value', json.path);
						$.ajax({
							url : "originalRecord_originalRecord_add.action",
							data : $('#templetAdd').serialize(),
							async : false,
							enctype : 'multipart/form-data',
							dataType : 'json',
							success : function(data) {
								var json = eval('(' + data + ')');
								if (json.info == "success") {
									asyncbox.alert("模板保存成功！", '保存结果',function(){
										 $('#templetAdd')[0].reset();
									});
								}
								if (json.info == "failed") {
									asyncbox.error("模板保存失败，请刷新之后重新尝试！",
											'保存结果');
								}
							}
						});
					} else {
						asyncbox.error("模板文档上传失败，请重新尝试！", '保存结果');
					}
					return false;
				}
			});
		}
	</script>
</head>

<body style="overflow-x: hidden;">
	<div class="formbody">
		<div class="formtitle">
			<span>新增原始记录表</span>
		</div>
		<form action="fileUploadAction.action" method="post" id="templetAdd"
			enctype="multipart/form-data">
			<ul class="forminfo">
				<li>
				<li><label>记录表名称</label> <input name="name" id="name"
					type="text " class="dfinput required" placeholder="必填项" /></li>
				<li><label>环境要素</label>
					<div class="vocation">
						<s:select cssClass="select3 dfinput"
							list="#categories" listKey="id" listValue="name" headerKey="-1"
							headerValue="所有环境要素" name="categoryId"/>
					</div></li>
				<li><label>上传模板</label><input type="file" id="file" name="file" /></li>
			</ul>
			<input type="hidden" class="dfinput" name="path" id="path">
			<input type="button" onclick="uploadFile()" id="sumbitBtn">
		</form>
	</div>
	
</body>
</html>
