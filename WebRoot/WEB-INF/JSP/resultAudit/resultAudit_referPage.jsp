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

<title>My JSP 'contractAudit_auditContract.jsp' starting page</title>

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
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="css/My97DatePicker/WdatePicker.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$(".select3").uedSelect({
			width : 250
		});
	})
</script>

</head>

<body class="common" style="width: 700px; ">
	<div class="formbody">
		<form action="" id="auditForm">
			<div class="formtitle" style="width: 700px">
				<span>服务（合同）项目名称</span>
			</div>
			<ul class="forminfo" style="width: 700px">
				<li><label>项目名称</label> <label class="viewLabel">${projectName
						}</label></li>
				<li></li>
			</ul>
			<div class="formtitle" style="width: 700px">
				<span>评审内容</span>
			</div>
			<ul class="forminfo">
				<li style="line-height: 34px"><label style="width: 300px">1.原始记录是否填写完整？</label>
					<input type="radio" name="firstInstance1" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance1" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance1" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>

				<li style="line-height: 34px"><label style="width: 300px">2.监测数据有效位数是否规范？</label>
					<input type="radio" name="firstInstance2" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance2" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance2" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>
				<li style="line-height: 34px"><label style="width: 300px">3.原始记录修改是否符合规范？</label>
					<input type="radio" name="firstInstance3" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance3" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance3" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>
				<li style="line-height: 34px"><label style="width: 300px">4.送检单结果与记录是否一致？
				</label> <input type="radio" name="firstInstance4" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance4" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance4" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>
				<li style="line-height: 34px"><label style="width: 300px">5.原始记录审核是否完整？</label>
					<input type="radio" name="firstInstance5" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance5" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance5" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>
				<li style="line-height: 34px"><label style="width: 300px">6.标准曲线是否符合规范？</label>
					<input type="radio" name="firstInstance6" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance6" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance6" value="3" style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>
			</ul>
			<div class="formtitle" style="width: 700px">
				<span>其他方面</span>
			</div>
			<ul class="forminfo" style="width: 700px">
				<li><label style="width:100px">其他方面</label> <textarea
						class="textinput " name="firstOther"
						placeholder="其他方面内容，不超过1000字" style="height:100px"></textarea></li>
				<li><label style="width:100px">备注</label> <textarea
						class="textinput " name="remarks"
						placeholder="备注信息，不超过1000字" style="height:100px"></textarea></li>
			</ul>
		</form>
	</div>
</body>

</html>
