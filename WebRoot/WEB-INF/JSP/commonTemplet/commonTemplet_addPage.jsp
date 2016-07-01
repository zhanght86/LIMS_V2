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

<title>新增角色信息</title>

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
</head>

<body style="overflow-x: hidden;">
	<div class="formbody">
		<div class="formtitle">
			<span>新增模板</span>
		</div>
		<form action="fileUploadAction.action" method="post" id="templetAdd"
			enctype="multipart/form-data">
			<ul class="forminfo">
				<li><label>记录表编号</label> <input name="identify" type="text "
					class="dfinput required" id="identify" placeholder="必填项，提交之后无法被修改" /></li>
				<li>
				<li><label>记录表名称</label> <input name="name" id="name"
					type="text " class="dfinput required" placeholder="必填项" /></li>
				<li><label>程序文件</label> <input name="filesId" type="text "
					class="dfinput required" placeholder="必填项，提交之后无法被修改" /></li>
				<li><label>所属部门</label> <textarea placeholder="点击“选择”查找使用部门"
						class="textinput" id="hideDepartmentId"
						style="width: 350px; height: 100px" disabled="disabled"></textarea>&nbsp;&nbsp;&nbsp;<input
					name="" type="button" class="scbtn" value="选  择"
					id="chooseDepartment" /></li>
				<li><label>上传模板</label><input type="file" id="file" name="file" /></li>
			</ul>
			<input type="hidden" id="departmentId" name="departmentId"> <input
				type="hidden" class="dfinput" name="path" id="path">
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#chooseDepartment')
					.click(
							function() {
								asyncbox
										.open({
											title : '选择使用部门',
											url : 'departmentManage_department_choosePage.action',
											width : 500,
											height : 400,
											btnsbar : [ {
												text : '选　择', // 按钮文本
												action : 'choose' // 按钮 action 值，用于按钮事件触发 唯一
											} ].concat($.btn.CANCEL),
											callback : function(action, opt) {
												if (action == 'choose') {
													var table = $(opt.document);
													var oChecks = table
															.find('tbody input[type=checkbox]:checked');
													var ids = '';
													var names = '';
													oChecks.each(function() {
														ids += $(this).attr(
																'data-search')
																+ ';';
														names += $(this).attr(
																'data-name')
																+ ';';
													});
													$('#hideDepartmentId')
															.prop('value',
																	names);
													$('#departmentId').prop(
															'value', ids);
												}
											}
										});
							});
			function uploadFile() {
				$.ajaxFileUpload({
					url : 'fileUploadAction.action?type=0',//用于文件上传的服务器端请求地址
					secureuri : false,//一般设置为false
					fileElementId : 'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
					dataType : 'json',//返回值类型 一般设置为json
					success : function(data, status) //服务器成功响应处理函数
					{
						var json = eval('(' + data + ')');
						if (json.info == 'success') {
							$('#path').prop('value', json.path);
							$.ajax({
								url : "commonTemplet_commonTemplet_add.action",
								data : $('#templetAdd').serialize(),
								async : false,
								enctype : 'multipart/form-data',
								dataType : 'json',
								success : function(data) {
									var json = eval('(' + data + ')');
									if (json.info == "success") {
										asyncbox.alert("模板保存成功！", '保存结果');
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
			window.uploadFile = uploadFile;
		});
	</script>
</body>
</html>
