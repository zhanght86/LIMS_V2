<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>新增部门信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/module/validCheck.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>新增部门</span>
		</div>
		<form action="departmentManage_department_add.action" id="departmentAdd">
			<ul class="forminfo">
				<li><label>部门编号</label> <input name="identify" type="text "  class="dfinput required" id="identity" placeholder="必填项，提交之后无法被修改" />&nbsp;&nbsp;&nbsp;<input name="" type="button"
						class="scbtn" value="自动生成" id="autoCreate" /></li>
				<li>
				<li><label>部门名称</label> <input name="name" id="name"
					type="text " class="dfinput required" placeholder="必填项" /></li>
				<li><label>部门描述</label> <textarea name="desp"
						placeholder="描述该部门，不超过100个字符" class="textinput" rows="" cols="" id="desp"></textarea>
			</ul>
		</form>
	</div>
	<script type="text/javascript">
		$(function(){
			$('#autoCreate').click(function(){
				$.ajax({url:"departmentManage_department_autoCreate.action",
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						$('#identity').attr('value',json.identify);
					}
					
				});
			});
		});
	</script>
</body>
</html>
