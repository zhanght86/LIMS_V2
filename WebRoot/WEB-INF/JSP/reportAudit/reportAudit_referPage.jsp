<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<span>监测报告基本信息</span>
			</div>
			<ul class="forminfo" style="width: 700px">
				<li><label>项目名称</label> <label class="viewLabe"
					style="width: 300px">${projectName }</label></li>
				<li><label>报告报表编号</label> <label class="viewLabe"
					style="width: 300px">${identify }</label></li>
				<li><label>编制人</label> <label class="viewLabe"
					style="width: 300px">${maker.name }</label></li>
				<li><label>报告报表名称</label> <label class="viewLabe"
					style="width: 300px">
					<%--  <c:if test="${type==0 }">
				废气测试报告
				</c:if> <c:if test="${type==1 }">
				噪声检测报告
				</c:if> <c:if test="${type==2 }">
				水质检测报告
				</c:if> <c:if test="${type==3 }">
				土壤监测报告
				</c:if> <c:if test="${type==4 }">
				工业废气、烟尘测试报告
				</c:if> --%>
				${projectType }
				</label></li>
				<li></li>
			</ul>
			<div class="formtitle" style="width: 700px">
				<span>报告审核</span>
			</div>
			<ul class="forminfo">
				<li style="line-height: 34px"><label style="width: 300px">1.报告报表及各种记录是否齐全？</label>
					<input type="radio" name="firstInstance1" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance1" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance1" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>

				<li style="line-height: 34px"><label style="width: 300px">2.监测内容与任务书是否一致？</label>
					<input type="radio" name="firstInstance2" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance2" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance2" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>
				<li style="line-height: 34px"><label style="width: 300px">3.监测数据与原始记录是否一致？</label>
					<input type="radio" name="firstInstance3" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance3" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance3" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>
				<li style="line-height: 34px"><label style="width: 300px">4.数据处理和填报是否满足要求？
				</label> <input type="radio" name="firstInstance4" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance4" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance4" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>
				<li style="line-height: 34px"><label style="width: 300px">5.监测分析方法是否现行有效？</label>
					<input type="radio" name="firstInstance5" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance5" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance5" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>
				<li style="line-height: 34px"><label style="width: 300px">6.极端数据是否符合逻辑？</label>
					<input type="radio" name="firstInstance6" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance6" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance6" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>
				<li style="line-height: 34px"><label style="width: 300px">7.标准引用和结论是否准确？</label>
					<input type="radio" name="firstInstance7" value="1"
					checked="checked" />&nbsp;&nbsp;是 <input type="radio"
					name="firstInstance7" value="2" style="margin-left: 50px" />&nbsp;&nbsp;否
					<input type="radio" name="firstInstance7" value="3"
					style="margin-left: 50px" />&nbsp;&nbsp;纠正</li>
				<li>
					<s:hidden  name="viewId"></s:hidden>
				</li>
			</ul>
			<div class="formtitle" style="width: 700px">
				<span>其他方面</span>
			</div>
			<ul class="forminfo" style="width: 700px">
				<li><label style="width:100px">其他方面</label> <textarea
						class="textinput " name="firstOther" placeholder="其他方面内容，不超过1000字"
						style="height:100px"></textarea></li>
			</ul>
		</form>
	</div>
</body>

</html>
