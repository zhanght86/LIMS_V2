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

<title>任务分配下达</title>

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
<script src="js/module/taskDistribution.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">任务管理</a></li>
			<li>任务分配下达</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">任务分配下达</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<s:iterator value="#projectList" id="p">
					<div class="formtitle" style="width: 100%">
						<span>项目（合同）编号:&nbsp; ${p.contractId }</span>
					</div>
					<div class="tools">
						<ul class="toolbar">
							<li class="click flow" data-id="${p.id }"><span><img
									src="images/t09.png" /></span>业务流转</li>
							<li class="click viewProjectBook" data-id="${p.id }"><span><img
									src="images/t10.png" /></span>任务书</li>
							<c:if test="${p.gainSample==0 }">
								<li class="click viewNonDeliveryReceitp" data-id="${p.id }"><span><img
										src="images/t10.png" /></span>交联单</li>
							</c:if>
							<c:if test="${p.gainSample==1 }">
								<li class="click viewDeliveryReceitp" data-id="${p.id }"><span><img
										src="images/t10.png" /></span>交联单</li>
							</c:if>

							<li class="click viewQualityControl" data-id="${p.id }"><span><img
									src="images/t10.png" /></span>质量控制统计表</li>

							<li class="click analystAll" data-id="${p.id }"><span><img
									src="images/t03.png" /></span>设置分析员</li>

							<li class="click reviewAll" data-id="${p.id }"><span><img
									src="images/t03.png" /></span>设置复核员</li>

							<li class="click auditAll" data-id="${p.id }"><span><img
									src="images/t03.png" /></span>设置审核员</li>
						</ul>
					</div>
					<table class="tablelist" id="auditTable">
						<thead>
							<tr>
								<th style="text-align: center;"></th>
								<th style="text-align: center;">分析项目</th>
								<th>送检单类型</th>
								<th style="text-align: center;">送样日期</th>
								<th style="text-align: center;">送检单</th>
								<th style="text-align: center;">设置分析员</th>
								<th style="text-align: center;">分析员</th>
								<th style="text-align: center;">设置复核员</th>
								<th style="text-align: center;">复核员</th>
								<th style="text-align: center;">设置审核员</th>
								<th style="text-align: center;">审核员</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#p.inspectionSheet" id="i">
								<tr>
									<td><input type="checkbox" data-id="${i.id }" data-name="${i.analysisProject.name }"></td>
									<td style="text-align: center;">${i.analysisProject.name }</td>
									<c:if test="${i.sheetType==0 }">
										<td>水质样品送检单</td>
									</c:if>
									<c:if test="${i.sheetType==1 }">
										<td>土壤、底质样品送检单</td>
									</c:if>
									<c:if test="${i.sheetType==2 }">
										<td>固定污染源有组织废气样品送检单</td>
									</c:if>
									<c:if test="${i.sheetType==3 }">
										<td>环境空气和无组织废气样品送检单</td>
									</c:if>

									<td style="text-align: center;">${i.sendSample }</td>
									<td style="text-align: center;"><a href="javascript:;"
										class="tablelink viewInspectionSheet"
										data-type="${i.sheetType }" data-projectid="${p.id }"
										data-id="${i.analysisProject.id }">查看</a></td>
									<c:if test="${not empty i.analyst }">
										<td style="text-align: center;"><a href="javascript:;"
											class="tablelink analyst" data-id="${i.id }">变更</a>&nbsp;<a
											href="javascript:;" class="tablelink delAnalyst"
											data-id="${i.id }">删除</a></td>
										<td style="text-align: center;"><label>${i.analyst.name
												}</label></td>
									</c:if>
									<c:if test="${empty i.analyst }">
										<td style="text-align: center;"><a href="javascript:;"
											class="tablelink analyst" data-id="${i.id }">设置</a></td>
										<td style="text-align: center;">未设置</td>
									</c:if>
									<c:if test="${not empty i.review }">
										<td style="text-align: center;"><a href="javascript:;"
											class="tablelink review" data-id="${i.id }">变更</a>&nbsp;<a
											href="javascript:;" class="tablelink delReview"
											data-id="${i.id }">删除</a></td>
										<td style="text-align: center;"><label>${i.review.name
												}</label></td>
									</c:if>
									<c:if test="${empty i.review }">
										<td style="text-align: center;"><a href="javascript:;"
											class="tablelink review" data-id="${i.id }">设置</a></td>
										<td style="text-align: center;">未设置</td>
									</c:if>
									<c:if test="${not empty i.audit }">
										<td style="text-align: center;"><a href="javascript:;"
											class="tablelink audit" data-id="${i.id }">变更</a>&nbsp;<a
											href="javascript:;" class="tablelink delAudit"
											data-id="${i.id }">删除</a></td>
										<td style="text-align: center;"><label>${i.audit.name
												}</label></td>
									</c:if>
									<c:if test="${empty i.audit }">
										<td style="text-align: center;"><a href="javascript:;"
											class="tablelink audit" data-id="${i.id }">设置</a></td>
										<td style="text-align: center;">未设置</td>
									</c:if>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</s:iterator>

				<div class="pagin">
					<div class="message">
						共<i class="blue">${totalRecord}</i>条记录，当前显示第&nbsp;<i
							class="blue countPage">1&nbsp;</i>/<i class="blue" id="totalPage">
							${totalPage }</i>页
					</div>
					<div class="page" id="page1"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
