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

<title>更新历史</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>更新补丁 V1.1 ( 2016-03-29)</span>
		</div>
		<ol class="forminfo">
			<li>1.修复合同起草中金额显示大小写的问题，并在生成和导出时保持了一致。</li>
			<li>2.业务合同现在也可以进行合同变更了,在业务变更之后，流程会重新回到合同起草环节。</li>
			<li>3.业务合同和服务合同的年份编号现在可以由管理员设置了。</li>
			<Li>4.修复任务下达界面承接科室显示错误的bug</Li>
			<Li>5.合同列表修改显示列表项，增加业务登记导出功能。</Li>
			<li>6.增加环境要素、监测频次数据字典，现在在合同起草界面可以直接选择预设信息。</li>
			<li>7.自送样登记/现场采样样品登记功能进行迭代，取消实验室属性，新增样品状态一栏，用户可以更直观的进行样品登记。</li>
			<li>8.自送样登记/现场采样样品登记现在只需点击新增即可立即生成样品编号和样品二维码。</li>
			<li>9.业务合同的表单验证功能进行调整。</li>
			<Li>10.废弃原任务下达界面的业务登记功能。</Li>
			<li>11.任务书简化流程，生成界面现在直接显示样品信息，用户现在只需要选择承接科室和项目负责人。</li>
			<li>12.任务书承接科室现在可以从所有科室中选择。</li>
			<Li>13.交联单、送检单现在可以一键生成了，在任务下达界面即可对交联单、送检单进行生成导出。</Li>
			<li>14.质量控制统计现在会根据选择的分析项目自动填充样品数量。</li>
			<li>15.质量控制统计现在不再显示样品名称，统一填充样品编号。</li>
			<Li>16.质量控制统计现在一次可以填充多个样品信息。</Li>
			<li>17.其他细节调整。</li>
		</ol>
	</div>
	<div class="formbody">
		<div class="formtitle">
			<span>版本发布 V1.0 ( 2015-12-21 )</span>
		</div>
		<ol class="forminfo">
			<li>1.实验室信息管理平台V1.0版本发布。</li>
		</ol>
	</div>
</body>
</html>
