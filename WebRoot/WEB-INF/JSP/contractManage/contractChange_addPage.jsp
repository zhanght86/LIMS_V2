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

<title>业务登记</title>

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
<script type="text/javascript">
	$(function() {
		$(".select3").uedSelect({
			width : 500
		});
		$('#columnChange').change(function() {
			var info = $(this).find("option:selected").attr("data-info");
			$('#changeBox').prop("value", info);
		});
	})
</script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>合同变更</span>
		</div>
		<form action="" id="changeForm">
			<ul class="forminfo" style="width: 1000px">
				<li><label>合同编号</label> <label class="viewLabel">${sc.identify
						}</label></li>
				<li><label>合同名称</label> <label class="viewLabel">${sc.name}</label>
				<li><label>签订日期</label> <label class="viewLabel">${pj.createTime}</label>
				</li>
				<li><label>变更原因</label> <textarea class="textinput required"
						name="reason" data-alert="合同变更原因"
						style="height: 100px" placeholder="详细描述合同变更原因，不超过1000个字"></textarea>
				</li>
				<li><label>变更项</label>
					<div class="vocation">
						<select class="select3" id="columnChange" name="changeColumn">
							<option data-query="name" value="项目名称"  data-info="${sc.name }">项目名称</option>
							<option data-query="context" value="项目内容及技术要求" data-info="${sc.context }">项目内容及技术要求</option>
							<option data-query="clientResp" value="委托方的职责" data-info="${sc.clientResp }">委托方的职责</option>
							<option data-query="serviceResp" value="服务方的职责" data-info="${sc.serviceResp }">服务方的职责</option>
							<option data-query="times" value="项目完成期限" data-info="${sc.times }">项目完成期限</option>
							<option data-query="cost" value="咨询服务费用" data-info="${sc.cost }">咨询服务费用</option>
							<option data-query="client" value="委托方名称" data-info="${sc.client }">委托方名称</option>
							<option data-query="clientAddress" value="委托方地址" data-info="${sc.clientAddress }">委托方地址</option>
							<option data-query="clientTel" value="委托方联系电话" data-info="${sc.clientTel }">委托方联系电话</option>
							<option data-query="service" value="服务方名称" data-info="${sc.service }">服务方名称</option>
							<option data-query="serviceAddress" value="服务方地址" data-info="${sc.serviceAddress }">服务方地址</option>
							<option data-query="serviceTel" value="服务方联系电话" data-info="${sc.serviceTel }">服务方联系电话</option>
							<option data-query="serviceBank" value="服务方开户银行类型" data-info="${sc.serviceBank }">服务方开户银行类型</option>
							<option data-query="serviceCard" value="服务方银行账号" data-info="${sc.serviceCard }">服务方银行账号</option>
							<option data-query="bearUnit" value="项目承担单位" data-info="${sc.bearUnit }">项目承担单位</option>
							<option data-query="bearUnitAddress" value="项目承担单位地址" data-info="${sc.bearUnitAddress }">项目承担单位地址</option>
							<option data-query="bearUnitTel" value="项目承担单位电话" data-info="${sc.bearUnitTel }">项目承担单位电话</option>
						</select>
					</div></li>
				<li><label>变更内容</label> <textarea class="textinput required"
						name="context" data-alert="合同变更内容" 
						style="height: 100px" placeholder="请输入新的合同项内容" id="changeBox">${sc.name }</textarea></li>
				<li style="line-height: 34px"><label>重新评审</label>
					<input type="radio" name="reAudit" value="0" checked="checked" />&nbsp;&nbsp;是 <input
					type="radio" name="reAudit" value="1"
					style="margin-left: 20px" />&nbsp;&nbsp;否</li>
				<li><label>备注</label> <textarea class="textinput"
						name="other" 
						style="height: 100px" placeholder="备注信息，不超过1000个字"></textarea>
				</li>
			</ul>
			<s:hidden name="viewId"/>
		</form>
	</div>
</body>
</html>
