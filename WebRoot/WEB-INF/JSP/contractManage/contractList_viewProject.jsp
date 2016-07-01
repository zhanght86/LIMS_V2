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

<title>查看项目</title>

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
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/module/contractViewProject.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>合同信息</span>
		</div>
		<ul class="forminfo">
			<li><label>合同编号</label> <label class="viewLabel">${contractId
					}</label></li>
			<li><label>项目名称</label> <label class="viewLabel">${pj.tContractId.projectName
					}</label></li>
			<li><label>创建时间</label> <label class="viewLabel">${pj.createTime
					}</label></li>
			<li><label>承办人</label> <label class="viewLabel">${pj.draftsMan.name
					}</label></li>
			<%-- <li><label>修改次数</label> <label class="viewLabel">${pj.rewriteCount
					}</label></li> --%>
			<li><label>合同操作</label> <c:if test="${empty pj.sContractId }">
					<label class="viewLabel"> <a href="javascript:;"
						data-type="0" style="padding-right: 20px"
						class="tablelink viewContract" data-id="${pj.id }">查看合同</a>
					</label>
				</c:if> <c:if test="${not empty pj.sContractId }">
					<label class="viewLabel"> <a href="javascript:;"
						data-type="1" style="padding-right: 20px"
						class="tablelink viewContract" data-id="${pj.id }">查看合同</a>
					</label>
				</c:if></li>

			<li></li>
		</ul>
		<c:if test="${not empty pj.sContractId }">
			<div class="formtitle">
				<span>合同修改记录</span>
			</div>
			<ul class="forminfo">
				<li><label>修改记录</label> <label class="viewLabel"><a
						href="javascript:;" data-type="1" style="padding-right: 20px"
						class="tablelink viewContractChange" data-id="${pj.id }">查看记录</a></label></li>
				<li></li>
			</ul>
		</c:if>
		<c:if test="${not empty pj.sContractId }">
			<div class="formtitle">
				<span>合同评审意见</span>
			</div>
			<ul class="forminfo">
				<li><label>评审意见</label> <label class="viewLabel"> <c:if
							test="${empty pj.contractAudit}">
					尚未评审
				</c:if> <c:if test="${not empty pj.contractAudit}">
					评审通过
				</c:if>
				</label></li>

				<li><label>评审记录</label> <label class="viewLabel"><a
						href="javascript:;" data-type="1" style="padding-right: 20px"
						class="tablelink viewContractAudit" data-id="${p.id }">查看记录</a><a
						href="javascript:;" data-type="1"
						class="tablelink exportContractAudit" data-id="${pj.id }">下载记录</a></label></li>
				<li></li>
			</ul>
		</c:if>
		<div class="formtitle">
			<span>任务书</span>
		</div>
		<ul class="forminfo">
			<li><label>下达时间</label> <label class="viewLabel">${pj.projectBook.taskUnderDate
					}</label></li>
			<li><label>下达人</label> <label class="viewLabel">${pj.projectBook.taskUnder.name
					}</label></li>
			<li><label>承接科室</label> <label class="viewLabel">${pj.projectBook.undertake.name
					}</label></li>
			<li><label>负责人</label> <label class="viewLabel">${pj.projectBook.projectCharge.name
					}</label></li>
			<li><label>报告编制人</label> <label class="viewLabel">${pj.projectBook.reportWriter.name
					}</label></li>
			<li><label>编制日期</label> <label class="viewLabel">${pj.projectBook.reportDate
					}</label></li>
			<li><label>报告一审人</label> <label class="viewLabel">${pj.projectBook.reportFirstInstance.name
					}</label></li>
			<li><label>一审日期</label> <label class="viewLabel">${pj.projectBook.reportFirstDate
					}</label></li>
			<li><label>报告二审人</label> <label class="viewLabel">${pj.projectBook.reportSecondInstance.name
					}</label></li>
			<li><label>二审日期</label> <label class="viewLabel">${pj.projectBook.reportSecondDate
					}</label></li>
			<li><label>报告签发人</label> <label class="viewLabel">${pj.projectBook.reportSign.name
					}</label></li>
			<li><label>签发日期</label> <label class="viewLabel">${pj.projectBook.reportSignDate
					}</label></li>
			<li><label>业务签收人</label> <label class="viewLabel">${pj.projectBook.salesmanSign.name
					}</label></li>
			<li><label>签收日期</label> <label class="viewLabel">${pj.projectBook.salesmanSignDate
					}</label></li>
			<li><label>任务书操作</label> <label class="viewLabel"><a
					href="javascript:;" style="padding-right: 20px"
					class="tablelink viewProjectBook" data-id="${pj.id }">查看任务书</a>
				<%-- <a
					href="javascript:;" class="tablelink exportProjectBook"
					data-id="${pj.id }">下载任务书</a> --%></label></li>
			<li></li>
		</ul>
		<div class="formtitle">
			<span>样品登记</span>
		</div>
		<ul class="forminfo">
			<li><label>样品登记</label> <label class="viewLabel"> <c:if
						test="${pj.gainSample==0 }">
						<a href="javascript:;" data-type="1"
							class="tablelink exportSampling" data-id="${pj.id }">查看样品信息</a>
					</c:if> <c:if test="${pj.gainSample==1 }">
						<a href="javascript:;" data-type="0"
							class="tablelink exportSampling" data-id="${pj.id }">查看样品信息</a>
					</c:if>
			</label></li>
			<li></li>
		</ul>
		<c:if test="${pj.gainSample==0 }">
			<table class="tablelist" style="width: 950px">
				<thead>
					<tr>
						<th>样品编号</th>
						<th>样品名称</th>
						<th>样品状态</th>
						<th>采样地点</th>
						<th>测试项目</th>
						<th>备注</th>

					</tr>
				</thead>
				<tbody>
					<s:iterator value="#pj.nonSelfSendSampleInfo" id="s" status="L">
						<tr>
							<td>${s.identify }</td>
							<td>${s.sampleName }</td>
							<td>${s.sampleState }</td>
							<td>${s.samplingPosition }</td>
							<td><s:iterator value="#s.analysisProjectSet" id="it">
									${it.name },
							</s:iterator></td>
							<td>${s.other }</td>

						</tr>
					</s:iterator>
				</tbody>
			</table>
		</c:if>
		<c:if test="${pj.gainSample==1 }">
			<table class="tablelist" style="width: 900px">
				<thead>
					<tr>
						<th style="text-align: center;">样品编号</th>
						<th>样品名称</th>
						<th>样品状态</th>
						<th>测试项目</th>
						<th>备注</th>

					</tr>
				</thead>
				<tbody>
					<s:iterator value="#pj.selfSendSampleInfo" id="s" status="L">
						<tr>
							<td style="text-align: center;">${s.identify }</td>
							<td>${s.sampleName }</td>
							<td>${s.sampleState }</td>
							<td><s:iterator value="#s.analysisProjectSet" id="it">
									${it.name },
							</s:iterator></td>
							<td>${s.other }</td>

						</tr>
					</s:iterator>

				</tbody>
			</table>
		</c:if>
		<div class="formtitle">
			<span>交接联单</span>
		</div>
		<c:if test="${pj.gainSample==1 }">
			<a href="javascript:;" data-id="${pj.id }"
			class="tablelink viewDeliveryReceitp">查看</a>
		</c:if>
		<c:if test="${pj.gainSample==0 }">
			<a href="javascript:;" data-id="${pj.id }"
			class="tablelink viewNonDeliveryReceitp">查看</a>
		</c:if>
		<ul class="forminfo">
			<li></li>
		</ul>
		<div class="formtitle">
			<span>送检单</span>
		</div>
		<a href="javascript:;" class="tablelink viewInspection"
									data-id="${pj.id }" >查看</a>
		<ul class="forminfo">
			<li></li>
		</ul>
		<div class="formtitle">
			<span>质量控制统计</span>
		</div>
		<%-- <table class="tablelist" id="departmentTable" style="width: 750px">
			<tr style="border: 1px solid black">
				<td width="47" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>序号 </strong>
					</p></td>
				<td width="136" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>分析项目名称 </strong>
					</p></td>
				<td width="81" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>样品数 </strong>
					</p></td>
				<td width="94" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>现场平行样(个)</strong>
					</p></td>
				<td colspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>实验室平行样 </strong>
					</p></td>
				<td colspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>加标回收样 </strong>
					</p></td>
				<td width="100" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>盲样(个)</strong>
					</p></td>
			</tr>
			<tr style="border: 1px solid black">
				<td width="130" style="border: 1px solid black"><p
						align="center">
						<strong>个数 </strong>
					</p></td>
				<td width="132" style="border: 1px solid black"><p
						align="center">
						<strong>样品编号 </strong>
					</p></td>
				<td width="102" style="border: 1px solid black"><p
						align="center">
						<strong>个数 </strong>
					</p></td>
				<td width="118" style="border: 1px solid black"><p
						align="center">
						<strong>样品编号 </strong>
					</p></td>
			</tr>
			<s:iterator value="#pj.qualityControlSet" id="q" status="L">
				<tr style="border: 1px solid black">
					<td width="47" valign="top" style="border: 1px solid black"><p
							align="center">${L.index+1 }</p></td>
					<td width="136" valign="top" style="border: 1px solid black"><p
							align="center">${q.analysisProject.name }</p></td>
					<td width="81" valign="top" style="border: 1px solid black"><p
							align="center">${q.sampleNum }</p></td>
					<td width="94" valign="top" style="border: 1px solid black"><p
							align="center">${q.parallelSample }</p></td>
					<td width="130" valign="top" style="border: 1px solid black"><p
							align="center">${q.laboratorySampleNum }</p></td>
					<c:if test="${not empty laboratorySampleIdentifys }">
						<td width="132" valign="top" style="border: 1px solid black"><p
								align="center">${q.laboratorySampleIdentifys }</p></td>
					</c:if>
					<c:if test="${empty laboratorySampleIdentifys}">
						<td width="132" valign="top" style="border: 1px solid black"><p
								align="center"></p></td>
					</c:if>
					<td width="102" valign="top" style="border: 1px solid black"><p
							align="center">${q.spikedRecoverySampleNum }</p></td>
					<c:if test="${not empty spikedSampleIdentifys }">
						<td width="132" valign="top" style="border: 1px solid black"><p
								align="center">${q.spikedSampleIdentifys }</p></td>
					</c:if>
					<c:if test="${ empty spikedSampleIdentifys }">
						<td width="132" valign="top" style="border: 1px solid black"><p
								align="center"></p></td>
					</c:if>
					<td width="100" valign="top" style="border: 1px solid black"><p
							align="center">${q.blindSample }</p></td>
				</tr>
			</s:iterator>
		</table> --%>
		
		<ul class="forminfo">
			<li></li>
			<li><label>质量控制表</label> <label class="viewLabel"><a
					href="javascript:;" data-type="1"
					class="tablelink exportQualityControl" data-id="${pj.id }">查看质量控制统计</a></label></li>
			<li></li>
		</ul>
		<div class="formtitle">
			<span>原始记录审核</span>
		</div>
		<ul class="forminfo">
			<li></li>
			<li><label>审核进度</label> <label class="viewLabel"> <c:if
						test="${empty pj.recordAudit.firstAudit }">
				未进入审核<br />
					</c:if> <c:if test="${not empty pj.recordAudit.firstAudit }">
				一审通过，通过时间：${pj.recordAudit.firstAuditDate }<br />
					</c:if> <c:if test="${not empty pj.recordAudit.secondAudit }">
			二审通过，通过时间：${pj.recordAudit.secondAuditDate }<br />
					</c:if>
			</label></li>
			<li><label>审核结果</label> <label class="viewLabel"><a
					href="javascript:;" data-type="1"
					class="tablelink exportResultAudit" data-id="${pj.id }">原始记录审核表</a></label></li>
			<li></li>
		</ul>
		<div class="formtitle">
			<span>监测报告</span>
		</div>
		<table class="tablelist" id="reportTable">
			<thead>
				<tr>
					<th style="text-align: center;">报告编号</th>
					<th style="text-align: center;">报告编制人</th>
					<th style="text-align: center;">报告原本</th>
					<th style="text-align: center;">报告封面</th>
					<th style="text-align: center;">报告审核记录表</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#pj.reportSet" id="r" status="L">
					<tr>
						<td style="text-align: center;">${r.identify }</td>
						<td style="text-align: center;">${r.maker.name }</td>
						<td style="text-align: center;"><a href="javascript:;"
							class="tablelink downReport" data-id="${r.id }">查看</a></td>
							<td style="text-align: center;"><a href="javascript:;"
							class="tablelink viewReportCover" data-id="${r.id }">查看</a></td>
						<td style="text-align: center;"><a href="javascript:;"
							class="tablelink downReportAudiit" data-id="${r.id }">查看</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</body>
</html>
