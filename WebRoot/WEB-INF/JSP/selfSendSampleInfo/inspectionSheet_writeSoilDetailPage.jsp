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

<title>土壤、底质样品送检单</title>

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
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle" style="width: 1000px">
			<span>土壤、底质样品送检单</span>
		</div>
		<table class="tablelist" id="departmentTable" style="width: 1000px">
			<thead>
				<tr>
					<th style="text-align: center;">样品编号</th>
					<th style="text-align: center;">样品名称</th>
					<th style="text-align: center;">采样断面（点）</th>
					<th style="text-align: center;">分析结果（mg/kg）</th>
					<th style="text-align: center;">备注</th>
					<th style="text-align: center;">操作</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<s:iterator value="#result" id="r">
					<c:if test="${not empty r.sampleInfo}">
						<tr>
							<td style="text-align: center;">${r.sampleInfo.identify }</td>
							<td style="text-align: center;">${r.sampleInfo.sampleName }</td>
							<td style="text-align: center; text-indent: 0px;"><input
								type="text" class="dfinput" placeholder="请输入采样断面"
								value="${r.samplingSection }" name="samplingSection" style="width: 100%"></td>
							<td style="text-align: center; text-indent: 0px;"><input
								type="number" class="dfinput" placeholder="请输入分析结果"
								value="${r.analysisResult }" name="analysisResult" style="width: 100%"></td>
							<td style="text-align: center; text-indent: 0px;"><input
								type="text" class="dfinput" placeholder="请输入备注"
								value="${r.remarks }" name="remarks" style="width: 100%"></td>
							<td style="text-align: center;">
							<%-- <a href="javascript:;"
								class="tablelink saveItem" data-id="${r.id }">保存</a> --%>
								<c:if test="${not empty r.saveDate }">
							<a href="javascript:;"
								class="tablelink saveItem" style="color: green;" data-id="${r.id }">修改</a>
							</c:if>
							<c:if test="${empty r.saveDate }">
							<a href="javascript:;"
								class="tablelink saveItem" data-id="${r.id }">保存</a>
							</c:if>
								</td>
						</tr>
					</c:if>
					<c:if test="${not empty r.nonSelfSampleInfo}">
						<tr>
							<td style="text-align: center;">${r.nonSelfSampleInfo.identify
								}</td>
							<td style="text-align: center;">${r.nonSelfSampleInfo.sampleName
								}</td>
							<td style="text-align: center; text-indent: 0px;"><input
								type="text" class="dfinput" placeholder="请输入采样断面"
								value="${r.samplingSection }" name="samplingSection" style="width: 100%"></td>
							<td style="text-align: center; text-indent: 0px;"><input
								type="number" class="dfinput" placeholder="请输入分析结果"
								value="${r.analysisResult }" name="analysisResult" style="width: 100%"></td>
							<td style="text-align: center; text-indent: 0px;"><input
								type="text" class="dfinput" placeholder="请输入备注"
								value="${r.remarks }" name="remarks" style="width: 100%"></td>
							<td style="text-align: center;">
							<c:if test="${not empty r.saveDate }">
							<a href="javascript:;"
								class="tablelink saveItem" style="color: green;" data-id="${r.id }">修改</a>
							</c:if>
							<c:if test="${empty r.saveDate }">
							<a href="javascript:;"
								class="tablelink saveItem" data-id="${r.id }">保存</a>
							</c:if>
								</td>
						</tr>
					</c:if>
				</s:iterator>
			</tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$('.saveItem')
				.on(
						'click',
						function() {
							var me=this;
							var id = $(this).data("id");
							var samplingSection = $(this).parent('td').siblings(
									'td:eq(2)').find(
									"input[name=samplingSection]").val();
							var analysisResult = $(this).parent('td').siblings(
									'td:eq(3)').find(
									"input[name=analysisResult]").val();
							var remarks = $(this).parent('td').siblings(
									'td:eq(4)').find(
									"input[name=remarks]").val();
							
							$.ajax({
										url : "detectionResult_detectionResult_writeSoil.action",
										data : {
											"viewId" : id,
											"analysisResult" : analysisResult,
											"samplingSection" : samplingSection,
											"remarks" : remarks
										},
										async : false,
										success : function(data) {
											var json = eval('(' + data + ')');
											if (json.info == "success") {
												asyncbox.alert("保存成功！", '结果');
												$(me).html('修改');
												$(me).css('color','green');
											}
											if (json.info == "failed") {
												asyncbox
														.error(
																"保存失败，请刷新之后重新尝试！",
																'结果');
											}
											return false;
										}
									});
						});
	})
</script>
</html>
