<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<title>实验分析绩效</title>

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
<script type="text/javascript" src="js/Chart.min.js"></script>
<script src="js/module/analystPerform.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">绩效管理</a></li>
			<li>实验分析绩效</li>
		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">实验分析绩效</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="seachform" id="perform">
					<li><label>用户编号</label>
						<div class="vocation">
							<s:select id="analyst" data-search="identify" cssClass="select3"
								list="#userList" listKey="id" listValue="name" headerKey="-1"
								headerValue="请选择分析人员"></s:select>
						</div></li>
					<li><label>统计区间</label>
						<div class="vocation">
							<input placeholder="统计起始时间" type="text"
								onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"
								class="scinput" style="width:150px" id="finishStratTime"
								data-search='entryTimeStart' /> 至 <input placeholder="统计结束时间"
								type="text"
								onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"
								class="scinput" id="finishEndTime" style="width:150px"
								data-search='entryTimeEnd' />
						</div></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="seachBtn" value="查询" /></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="projectShow" value="项目模式" /></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="sheetShow" value="送检模式" /></li>
				</ul>
				<p style="margin: 10px; font-weight: bolder;">当前查询的用户在当前统计时间段内共为
					<i style="color:red;">${fn:length(projectList)}</i> 个合同项目进行过样品检查，共完成<i style="color:red;"> ${fn:length(inspectionSheetList) }</i> 个送检单，其中完成自送样 <i style="color:red;">${selfSampleInfoNum }</i> 个，完成现场采样 <i style="color:red;">${nonSelfSampleInfoNum }</i> 个，总计 <i style="color:red;">${selfSampleInfoNum+nonSelfSampleInfoNum }</i>个,以下为项目详情：</p>
				<div id="showSheet" style="display: none;">
					<table class="tablelist" id="auditTable">
						<thead>
							<tr>
								<th style="text-align: center;">合同项目</th>
								<th style="text-align: center;">送检类型</th>
								<th style="text-align: center;">分析项目</th>
								<th style="text-align: center;">分析员</th>
								<th style="text-align: center;">分析日期</th>
								<th style="text-align: center;">样品数</th>
								<th style="text-align: center;">原始记录</th>
								<th style="text-align: center;">送检单</th>
								<th style="text-align: center;">查看项目</th>

							</tr>
						</thead>
						<tbody>
							<s:iterator value="#inspectionSheetList" id="i">
								<c:if test="${i.analyst.id == analystId }">
									<tr>
										<td style="text-align: center;">${i.project.contractId}</td>
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
										<td style="text-align: center;">${i.analysisProject.name
											}</td>
										<td style="text-align: center;">${i.analyst.name }</td>
										<td style="text-align: center;">${i.analysisDate }</td>
										<td style="text-align: center;">${fn:length(i.result)}</td>
										<td style="text-align: center;"><c:if
												test="${empty i.resultPath }">
												<label>未编写</label>
											</c:if> <c:if test="${not empty i.resultPath }">
												<a href="javascript:;" class="tablelink downRecord"
													data-id="${i.id }">查看</a>
											</c:if></td>
										<td style="text-align: center;"><a href="javascript:;"
											class="tablelink viewInspectionSheet"
											data-type="${i.sheetType }"
											data-id="${i.analysisProject.id }" data-projectId="${p.id }">查看</a></td>
										<td style="text-align: center;"><a href="javascript:;"
											class="tablelink viewProject" 
											data-id="${i.project.id }">查看</a></td>
									</tr>
								</c:if>
							</s:iterator>
						</tbody>
					</table>
				</div>
				<div id="showProject">
					<s:iterator value="#projectList" id="p">
						<div class="formtitle" style="width: 100%">
							<span>项目（合同）编号:&nbsp; ${p.contractId } </span>
						</div>
						<div class="tools">
							<ul class="toolbar">
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
										src="images/t10.png" /></span>质量控制统计</li>
							</ul>
						</div>
						<table class="tablelist" id="auditTable">
							<thead>
								<tr>
									<th style="text-align: center;">送检类型</th>
									<th style="text-align: center;">分析项目</th>
									<th style="text-align: center;">分析员</th>
									<th style="text-align: center;">分析日期</th>
									<th style="text-align: center;">样品数</th>
									<th style="text-align: center;">原始记录</th>
									<th style="text-align: center;">送检单</th>
									<th style="text-align: center;">查看项目</th>

								</tr>
							</thead>
							<tbody>
								<s:iterator value="#p.inspectionSheet" id="i">
									<c:if test="${i.analyst.id == analystId }">
										<tr>
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
											<td style="text-align: center;">${i.analysisProject.name
												}</td>
											<td style="text-align: center;">${i.analyst.name }</td>
											<td style="text-align: center;">${i.analysisDate }</td>
											<td style="text-align: center;">${fn:length(i.result)}</td>
											<td style="text-align: center;"><c:if
													test="${empty i.resultPath }">
													<label>未编写</label>
												</c:if> <c:if test="${not empty i.resultPath }">
													<a href="javascript:;" class="tablelink downRecord"
														data-id="${i.id }">查看</a>
												</c:if></td>
											<td style="text-align: center;"><a href="javascript:;"
												class="tablelink viewInspectionSheet"
												data-type="${i.sheetType }"
												data-id="${i.analysisProject.id }" data-projectId="${p.id }">查看</a></td>
											<td style="text-align: center;"><a href="javascript:;"
											class="tablelink viewProject" 
											data-id="${i.project.id }">查看</a></td>

										</tr>
									</c:if>
								</s:iterator>
							</tbody>
						</table>
					</s:iterator>
				</div>

				<c:if test="${empty flag }">
					<p style="font-weight: bolder; margin:20px;color: red">请选择统计区间与实验分析人员，并点击"查询"按钮进行查询。</p>
				</c:if>
				<c:if test="${flag == 1 }">
					<p style="font-weight: bolder; margin:20px; color: green;">当前查询的用户在当前统计时间段内未进行过样品实验分析。</p>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
