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

<title>监测报告审核</title>

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
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="css/My97DatePicker/WdatePicker.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/paging-V1.3-final.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.form.js" charset="utf-8"></script>
<script src="js/module/reportReceipt.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">报告管理</a></li>
			<li>报告签收发放</li>
		</ul>
	</div>
	<div class="formbody">
		<div class="itab">
			<ul>
				<li><a href="#tab1" class="selected">报告签收发放</a></li>
			</ul>
		</div>
		<c:if test="${empty projectList }">
			<p style="font-weight: bolder; margin:20px;">暂无需要您签收报告的合同项目。</p>
		</c:if>
		<s:iterator value="#projectList" id="p">
			<div class="formtitle" style="width: 100%">
				<span>项目（合同）编号:&nbsp; ${p.contractId }</span>
			</div>
			<div class="tools">
				<ul class="toolbar">
					<li class="click viewProjectBook" data-id="${p.id }"><span><img
							src="images/t10.png" /></span>任务书</li>
					<c:if test="${p.gainSample==1 }">
						<li class="click viewSelfSendInfo" data-gain="${p.gainSample }"
							data-id="${p.id }"><span><img src="images/t10.png" /></span>样品信息</li>
					</c:if>

					<c:if test="${p.gainSample==0 }">
						<li class="click viewNonSelfSendInfo" data-gain="${p.gainSample }"
							data-id="${p.id }"><span><img src="images/t10.png" /></span>样品信息</li>
					</c:if>

					<c:if test="${p.gainSample==0 }">
						<li class="click viewNonDeliveryReceitp" data-id="${p.id }"><span><img
								src="images/t10.png" /></span>交联单</li>
					</c:if>
					<c:if test="${p.gainSample==1 }">
						<li class="click viewDeliveryReceitp" data-id="${p.id }"><span><img
								src="images/t10.png" /></span>交联单</li>
					</c:if>
					<li class="click viewQualityControl" data-id="${p.id }"><span><img
							src="images/t10.png" /></span>质量控制统计</li>
					<li class="click viewRecordAudit" data-projectId="${p.id }"><span><img
							src="images/t10.png" /></span>实验审核记录</li>
				</ul>
			</div>

			<table class="tablelist" id="reportTable">
				<thead>
					<tr>
						<th>报告类别</th>
						<th style="text-align: center;">报告编号</th>
						<th style="text-align: center;">编制人</th>
						<th style="text-align: center;">一审员</th>
						<th style="text-align: center;">一审日期</th>
						<th style="text-align: center;">二审员</th>
						<th style="text-align: center;">二审日期</th>
						<th style="text-align: center;">签发员</th>
						<th style="text-align: center;">签发日期</th>
						<th style="text-align: center;">报告原本</th>
						<th style="text-align: center;">报告封面</th>
						<th style="text-align: center;">审核记录</th>
						<th style="text-align: center;">操作</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#p.reportSet" id="r" status="L">
						<c:if test="${r.result >=4 }">
							<tr>
								<td><c:if test="${r.type==0 }">
										废气测试报告
									</c:if> <c:if test="${r.type==1 }">
										噪声检测报告
									</c:if> <c:if test="${r.type==2 }">
										水质检测报告
									</c:if> <c:if test="${r.type==3 }">
										土壤监测报告
									</c:if> <c:if test="${r.type==4 }">
										工业废气、烟尘测试报告
									</c:if></td>
								<td style="text-align: center;">${r.identify }</td>
								<td style="text-align: center;">${r.maker.name }</td>
								<td style="text-align: center;">${r.reportAudit.firstUser.name
									}</td>
								<td style="text-align: center;">${r.reportAudit.firstDate }</td>
								<td style="text-align: center;">${r.reportAudit.secondUser.name
									}</td>
								<td style="text-align: center;">${r.reportAudit.secondDate
									}</td>
								<td style="text-align: center;">${r.reportAudit.issueUser.name
									}</td>
								<td style="text-align: center;">${r.reportAudit.issueDate }</td>
								<td style="text-align: center;"><a href="javascript:;"
									class="tablelink downReport" data-id="${r.id }">查看</a></td>
								<td style="text-align: center;"><a href="javascript:;"
									class="tablelink viewReportCover" data-id="${r.id }">查看</a></td>
								<td style="text-align: center;"><a href="javascript:;"
									class="tablelink downReportAudiit" data-id="${r.id }">查看</a></td>
								<td style="text-align: center;">
									<c:if test="${r.result ==5 }">
										<label>已签收</label>
									</c:if>
									<c:if test="${r.result ==4 }">
										<a href="javascript:;"
									class="tablelink auditReport" data-id="${r.id }">接收</a>
									</c:if>
									
								</td>
							</tr>
						</c:if>
					</s:iterator>
				</tbody>
			</table>
		</s:iterator>
	</div>
</body>
</html>
