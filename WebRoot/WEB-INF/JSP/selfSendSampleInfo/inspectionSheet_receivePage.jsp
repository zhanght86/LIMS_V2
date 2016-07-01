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

<title>送检单填写</title>

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
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script src="js/paging-V1.3-final.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="css/My97DatePicker/WdatePicker.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/module/inspectionSheet_receivePage.js"
	type="text/javascript" charset="utf-8"></script>

</head>

<body class="common">
<input type="text" value="${project.id }" id="pId">
	<div class="formbody">
		<div class="formtitle" style="width: 600px">
			<span>水质样品送检单</span>
		</div>
		<input name="" type="button" class="scbtn analyst" id="seachBtn"
			value="分析员" data-id="0" /> <input name="" type="button" class="scbtn checkMember"
			id="seachBtn" value="复核员"  data-id="0"/>
		<s:iterator value="#inspection" id="in">
			<c:if test="${in.sheetType==0 }">
				<p style="padding: 10px;">${in.analysisProject.name }分析员：
				<c:if test="${not empty in.analyst }">
				${in.analyst.name }
				</c:if>
				<c:if test="${empty  in.analyst}">
					未设置
				</c:if>
				&nbsp;&nbsp; ${in.analysisProject.name }复核员：
				<c:if test="${not empty in.review }">
				${in.review.name }
				</c:if>
				<c:if test="${empty  in.review}">
					未设置
				</c:if>
				</p>
			</c:if>
		</s:iterator>
		<s:iterator value="#waterProject" id="wp">
			<div class="formbody" style="width: 600px;">
				<div class="formtitle" style="width: 600px">
					<span>${wp.name }</span>
				</div>

				<table class="tablelist">
					<tr>
						<th style="text-align:center">样品编号</th>
						<th style="text-align:center">样品名称</th>
						<th style="text-align:center">样品状态</th>
						<th style="text-align:center">其他</th>
					</tr>
					<s:iterator value="#waterInspect" id="w">
						<c:if test="${w.analysisProject.id == wp.id }">
							<tr>
								<td style="text-align:center">${w.identify }</td>
								<td style="text-align:center">${w.sampleName }</td>
								<td style="text-align:center">${w.sampleState }</td>
								<td style="text-align:center">${w.other }</td>
							</tr>
						</c:if>
					</s:iterator>
				</table>
			</div>
		</s:iterator>

	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 600px">
			<span>土壤、底质样品送检单</span>
		</div>
		<input name="" type="button" class="scbtn analyst" id="seachBtn"
			value="分析员"  data-id="1"/> <input name="" type="button" class="scbtn checkMember"
			id="seachBtn" value="复核员"  data-id="1"/>
		<s:iterator value="#inspection" id="in">
			<c:if test="${in.sheetType==1 }">
				<p style="padding: 10px;">${in.analysisProject.name }分析员：
				<c:if test="${not empty in.analyst }">
				${in.analyst.name }
				</c:if>
				<c:if test="${empty  in.analyst}">
					未设置
				</c:if>
				&nbsp;&nbsp; ${in.analysisProject.name }复核员：
				<c:if test="${not empty in.review }">
				${in.review.name }
				</c:if>
				<c:if test="${empty  in.review}">
					未设置
				</c:if>
				</p>
			</c:if>
		</s:iterator>
		<s:iterator value="#solidProject" id="sp">
			<div class="formbody" style="width: 600px">
				<div class="formtitle" style="width: 600px">
					<span>${sp.name }</span>
				</div>

				<table class="tablelist">
					<tr>
						<th style="text-align:center">样品编号</th>
						<th style="text-align:center">样品名称</th>
						<th style="text-align:center">样品状态</th>
						<th style="text-align:center">其他</th>
					</tr>
					<s:iterator value="#solidInspect" id="w">
						<c:if test="${w.analysisProject.id == sp.id }">
							<tr>
								<td style="text-align:center">${w.identify }</td>
								<td style="text-align:center">${w.sampleName }</td>
								<td style="text-align:center">${w.sampleState }</td>
								<td style="text-align:center">${w.other }</td>
							</tr>
						</c:if>
					</s:iterator>
				</table>
			</div>
		</s:iterator>


	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 600px">
			<span>固定污染源有组织废气样品送检单</span>
		</div>
		<input name="" type="button" class="scbtn analyst" id="seachBtn"
			value="分析员"  data-id="2"/> <input name="" type="button" class="scbtn checkMember"
			id="seachBtn" value="复核员"  data-id="2"/>
		<s:iterator value="#inspection" id="in">
			<c:if test="${in.sheetType==2 }">
				<p style="padding: 10px;">${in.analysisProject.name }分析员：
				<c:if test="${not empty in.analyst }">
				${in.analyst.name }
				</c:if>
				<c:if test="${empty  in.analyst}">
					未设置
				</c:if>
				&nbsp;&nbsp; ${in.analysisProject.name }复核员：
				<c:if test="${not empty in.review }">
				${in.review.name }
				</c:if>
				<c:if test="${empty  in.review}">
					未设置
				</c:if>
				</p>
			</c:if>
		</s:iterator>
		<s:iterator value="#fixedProject" id="fp">
			<div class="formbody" style="width: 600px">
				<div class="formtitle" style="width: 600px">
					<span>${fp.name }</span>
				</div>

				<table class="tablelist">
					<tr>
						<th style="text-align:center">样品编号</th>
						<th style="text-align:center">样品名称</th>
						<th style="text-align:center">样品状态</th>
						<th style="text-align:center">其他</th>
					</tr>
					<s:iterator value="#fixedInspect" id="w">
						<c:if test="${w.analysisProject.id == fp.id }">
							<tr>
								<td style="text-align:center">${w.identify }</td>
								<td style="text-align:center">${w.sampleName }</td>
								<td style="text-align:center">${w.sampleState }</td>
								<td style="text-align:center">${w.other }</td>
							</tr>
						</c:if>
					</s:iterator>
				</table>
			</div>
		</s:iterator>
	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 600px">
			<span>环境空气和无组织废气样品送检单</span>
		</div>
		<input name="" type="button" class="scbtn analyst" id="seachBtn"
			value="分析员"  data-id="3"/> <input name="" type="button" class="scbtn checkMember"
			id="seachBtn" value="复核员"  data-id="3"/>
			<s:iterator value="#inspection" id="in">
			<c:if test="${in.sheetType==3 }">
				<p style="padding: 10px;">${in.analysisProject.name }分析员：
				<c:if test="${not empty in.analyst }">
				${in.analyst.name }
				</c:if>
				<c:if test="${empty  in.analyst}">
					未设置
				</c:if>
				&nbsp;&nbsp; ${in.analysisProject.name }复核员：
				<c:if test="${not empty in.review }">
				${in.review.name }
				</c:if>
				<c:if test="${empty  in.review}">
					未设置
				</c:if>
				</p>
			</c:if>
		</s:iterator>
		<s:iterator value="#airProject" id="ap">
			<div class="formbody" style="width: 600px">
				<div class="formtitle" style="width: 600px">
					<span>${ap.name }</span>
				</div>
				<table class="tablelist">
					<tr>
						<th style="text-align:center">样品编号</th>
						<th style="text-align:center">样品名称</th>
						<th style="text-align:center">样品状态</th>
						<th style="text-align:center">其他</th>
					</tr>
					<s:iterator value="#airInspect" id="w">
						<c:if test="${w.analysisProject.id == ap.id }">
							<tr>
								<td style="text-align:center">${w.identify }</td>
								<td style="text-align:center">${w.sampleName }</td>
								<td style="text-align:center">${w.sampleState }</td>
								<td style="text-align:center">${w.other }</td>
							</tr>
						</c:if>
					</s:iterator>
				</table>
			</div>
		</s:iterator>
	</div>
</body>
</html>
