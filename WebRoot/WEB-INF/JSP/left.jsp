
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

<title>导航栏</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".menuson li").click(function() {
			$(".menuson li.active").removeClass("active")
			$(this).addClass("active");
		});
		$('.title').click(function() {
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('ul').slideUp();
			} else {
				$(this).next('ul').slideDown();
			}
		});
		function powerLimit() {
			var str = "${identifyList }";
			var strArray = new Array();
			strArray = str.split(",");
			var aLi = $('.menuson').find('li');
			aLi.each(function() {
				var id = $(this).attr("data-id");
				if (strArray.indexOf(id) == -1) {
					$(this).hide();
				}
			});
		}
		powerLimit();
	});
</script>
</head>

<body style="background:#f0f9fd;">
	<div class="lefttop">
		<span></span>欢迎您，${user.name }
	</div>
	<dl class="leftmenu">
		<dd>
			<div class="title">
				<span><img src="images/leftico01.png" /></span>首页
			</div>
			<ul class="menuson">
				<li class="active" data-id="11"><cite></cite><a
					href="mainPage_main.action" target="_top">首页</a><i></i></li>
				<li data-id="12"><cite></cite><a
					href="notice_notice_main.action" target="rightFrame">系统公告</a><i></i></li>
				<li data-id="13"><cite></cite><a
					href="commonTemplet_commonTemplet_main.action" target="rightFrame">模版库</a><i></i></li>
			</ul>
		</dd>
		<dd>
			<div class="title">
				<span><img src="images/leftico03.png" /></span>绩效管理
			</div>
			<ul class="menuson">
				<li data-id="21"><cite></cite><a
					href="analystPerform_analystPerform_main.action" target="rightFrame">实验分析绩效</a><i></i></li>
				<%-- <li data-id="21"><cite></cite><a
					href="http://localhost:8088/KOd/index.php?user/login"
					target="_blank">我的云盘</a><i></i></li> --%>
			</ul>
		</dd>

		<dd>
			<div class="title">
				<span><img src="images/leftico07.png" /></span>任务管理
			</div>
			<ul class="menuson">
				<!-- <li><cite></cite><a href="#">员工任务清单</a><i></i></li> -->
				<li data-id="31"><cite></cite><a
					href="sampleTransfer_sampleTransfer_main.action"
					target="rightFrame">项目样品交接</a><i></i></li>
				<li data-id="32"><cite></cite><a
					href="taskDistribution_taskDistribution_main.action"
					target="rightFrame">任务分配下达</a><i></i></li>
				<li data-id="33"><cite></cite><a
					href="detectionResult_detectionResult_main.action"
					target="rightFrame">检测项目填写</a><i></i></li>
				<li data-id="34"><cite></cite><a
					href="resultReview_resultReview_main.action" target="rightFrame">检测项目复核</a><i></i></li>
				<li data-id="34"><cite></cite><a
					href="resultItemAudit_resultItemAudit_main.action" target="rightFrame">检测项目审核</a><i></i></li>
				<li data-id="35"><cite></cite><a
					href="resultAudit_resultAudit_main.action" target="rightFrame">检测结果审核</a><i></i></li>
				<!-- <li><cite></cite><a href="#">合同任务查询</a><i></i></li> -->
			</ul>
		</dd>
		<dd>
			<div class="title">
				<span><img src="images/report.png" /></span>报告管理
			</div>
			<ul class="menuson">
				<li data-id="41"><cite></cite><a
					href="report_report_main.action" target="rightFrame">合同报告编制</a><i></i></li>
				<li data-id="42"><cite></cite><a
					href="reportAudit_reportAudit_main.action" target="rightFrame">报告编制审核</a><i></i></li>
				<li data-id="43"><cite></cite><a
					href="reportIssued_reportIssued_main.action" target="rightFrame">报告签发审核</a><i></i></li>
				<li data-id="44"><cite></cite><a
					href="reportReceipt_reportReceipt_main.action" target="rightFrame">报告签收发放</a><i></i></li>
			</ul>
		</dd>
		<dd>
			<div class="title">
				<span><img = src="images/quality.png" /></span>质量控制
			</div>
			<ul class="menuson">
				<li data-id="51"><cite></cite><a
					href="qualityControl_qualityControl_main.action"
					target="rightFrame">质量控制统计</a><i></i></li>
				<li data-id="52"><cite></cite><a
					href="resultAuditSecond_resultAuditSecond_main.action"
					target="rightFrame">实验分析审核</a><i></i></li>
				<li data-id="53"><cite></cite><a
					href="reportAuditSecond_reportAuditSecond_main.action"
					target="rightFrame">监测报告审核</a><i></i></li>
			</ul>
		</dd>
		<dd>
			<div class="title">
				<span><img src="images/leftico06.png" /></span>合同管理
			</div>
			<ul class="menuson">
				<li data-id="61"><cite></cite><a
					href="contractManage_contractList_main.action" target="rightFrame">业务合同列表</a><i></i></li>
				<li data-id="62"><cite></cite><a
					href="contractManage_contractList_contractSList.action"
					target="rightFrame">服务合同列表</a><i></i></li>
				<li data-id="63"><cite></cite><a
					href="contractManage_contract_addPage.action" target="rightFrame">合同起草</a><i></i></li>
				<li data-id="64"><cite></cite><a
					href="contractManage_contractChange_main.action"
					target="rightFrame">服务合同变更</a><i></i></li>
				<li data-id="65"><cite></cite><a
					href="contractManage_trafficContractChange_main.action"
					target="rightFrame">业务合同变更</a><i></i></li>
				<li data-id="66"><cite></cite><a
					href="contractManage_contractAudit_main.action" target="rightFrame">合同评审</a><i></i></li>
				<li data-id="67"><cite></cite><a
					href="contractManage_projectPlan_main.action" target="rightFrame">任务下达</a><i></i></li>
				<li data-id="68"><cite></cite><a
					href="selfSendSampleInfo_selfSendSampleInfo_main.action"
					target="rightFrame">自送样登记</a><i></i></li>
				<li data-id="69"><cite></cite><a
					href="nonSelfSendSample_nonSelfSendSample_main.action"
					target="rightFrame">现场采样登记</a><i></i></li>
			</ul>
		</dd>
		<dd>
			<div class="title">
				<span><img src="images/leftico05.png" /></span>系统管理
			</div>
			<ul class="menuson">
				<!-- <li><cite></cite><a href="customerManage_customer_main.action"
					target="rightFrame">客户管理</a><i></i></li> -->
				<li data-id="71"><cite></cite><a
					href="userPWDManage_userPWD_main.action" target="rightFrame">修改密码</a><i></i></li>
				<li data-id="72"><cite></cite><a
					href="departmentManage_department_main.action" target="rightFrame">部门管理</a><i></i></li>
				<li data-id="73"><cite></cite><a
					href="roleManage_role_main.action" target="rightFrame">角色管理</a><i></i></li>
				<li data-id="74"><cite></cite><a
					href="userManage_user_main.action" target="rightFrame">用户管理</a><i></i></li>
				<li data-id="75"><cite></cite><a
					href="noticeManage_noticeManage_main.action" target="rightFrame">公告管理</a><i></i></li>
				<li data-id="76"><cite></cite><a
					href="analysisFrequency_analysisFrequency_main.action"
					target="rightFrame">监测频次</a><i></i></li>
				<li data-id="77"><cite></cite><a
					href="analysisCategory_analysisCategory_main.action"
					target="rightFrame">环境要素管理</a><i></i></li>
				<li data-id="78"><cite></cite><a
					href="analysisProject_analysisProject_main.action"
					target="rightFrame">检测项目管理</a><i></i></li>
				<li data-id="78"><cite></cite><a
					href="originalRecord_originalRecord_main.action"
					target="rightFrame">原始记录管理</a><i></i></li>
				<li data-id="78"><cite></cite><a
					href="authSignator_authSignator_main.action"
					target="rightFrame">授权签字人</a><i></i></li>

				<li data-id="79"><cite></cite><a
					href="basicSetting_basicSetting_main.action" target="rightFrame">基础设置</a><i></i></li>

			</ul>
		</dd>
	</dl>
</body>
</html>
