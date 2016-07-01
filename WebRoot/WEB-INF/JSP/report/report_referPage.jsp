<%@page import="com.boncontact.util.UUIDGenerator"%>
<%@page import="com.boncontact.util.MD5Utils"%>
<%@page import="com.boncontact.domain.OriginalRecord"%>
<%@page import="com.boncontact.domain.Project"%>
<%@page import="com.boncontact.domain.ProjectBook"%>
<%@page import="com.boncontact.domain.ContractMonitoringItem"%>
<%@page import="com.boncontact.util.moneyUtils"%>
<%@page import="com.boncontact.domain.TrafficContract"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.wordwriter.*,com.zhuozhengsoft.pageoffice.*,java.sql.*,java.text.NumberFormat,java.util.Locale,java.text.SimpleDateFormat,java.util.Date"
	pageEncoding="gb2312"%>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<%
	String err = "";
	PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
	//创建WordDocment对象
	WordDocument doc = new WordDocument();
	//打开数据区域
	Project entity = (Project) ActionContext.getContext().get("entity");
	/* String username = (String) ActionContext.getContext().get(
			"username");  */
	int reportType = (Integer) ActionContext.getContext().get(
			"reportType");
	String fileName = "";
	if (reportType == 0) {
		fileName = entity.getContractId() + "废气测试报告";
	}
	if (reportType == 1) {
		fileName = entity.getContractId() + "噪声检测报告";
	}
	if (reportType == 2) {
		fileName = entity.getContractId() + "水质检测报告";
	}
	if (reportType == 3) {
		fileName = entity.getContractId() + "土壤监测报告";
	}
	if (reportType == 4) {
		fileName = entity.getContractId() + "工业废气、烟尘测试报告";
	}
	String year=(String)ActionContext.getContext().get("year");
	String identify=(String)ActionContext.getContext().get("identify");
	if(year != null){
		doc.openDataRegion("PO_year").setValue("2016");
		doc.openDataRegion("PO_identify").setValue("006");
	}
	//poCtrl.setTitlebar(false); //隐藏标题栏
	poCtrl.setMenubar(false); //隐藏菜单栏
	//poCtrl.setOfficeToolbars(false);//隐藏Office工具条
	//poCtrl.setCustomToolbar(false);//隐藏自定义工具栏
	poCtrl.addCustomToolButton("保存", "saveWord", 1);
	poCtrl.addCustomToolButton("-", "", 0);
	poCtrl.addCustomToolButton("任务书", "viewProjectBook", 7);
	if (entity.getGainSample().equals("1")) {
		poCtrl.addCustomToolButton("样品信息", "viewSelfSendInfo", 7);
	}
	if (entity.getGainSample().equals("0")) {
		poCtrl.addCustomToolButton("样品信息", "viewNonSelfSendInfo", 7);
	}

	poCtrl.addCustomToolButton("质量控制", "viewQualityControl", 7);
	poCtrl.addCustomToolButton("送检单", "viewInspectionSheet", 7);
	poCtrl.addCustomToolButton("记录审核表", "viewRecordAudit", 7);
	poCtrl.setSaveFilePage("savefile.jsp?id=2&&title="
			+ MD5Utils.GetMD5Code(fileName + UUIDGenerator.getUUID()));
	poCtrl.setWriter(doc);
	poCtrl.setCaption(fileName);
	poCtrl.setFileTitle(fileName);
	poCtrl.setServerPage("poserver.do");
	if (reportType == 0) {
		poCtrl.webOpen("doc/airReport.doc", OpenModeType.docNormalEdit,
				"");
	}
	if (reportType == 1) {
		poCtrl.webOpen("doc/noiceReport.doc",
				OpenModeType.docNormalEdit, "");
	}
	if (reportType == 2) {
		poCtrl.webOpen("doc/waterReport.doc",
				OpenModeType.docNormalEdit, "");
	}
	if (reportType == 3) {
		poCtrl.webOpen("doc/soliReport.doc",
				OpenModeType.docNormalEdit, "");
	}
	if (reportType == 4) {
		poCtrl.webOpen("doc/soildReport.doc",
				OpenModeType.docNormalEdit, "");
	}

	poCtrl.setTagId("PageOfficeCtrl1");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
	function saveWord() {

		document.getElementById("PageOfficeCtrl1").WebSave();
		var year=document.getElementById("PageOfficeCtrl1").DataRegionList.GetDataRegionByName("PO_year").Value;
		var identify=document.getElementById("PageOfficeCtrl1").DataRegionList.GetDataRegionByName("PO_identify").Value
		if($("#reportId").val()&&$("#reportId").val()!=""){
			document.getElementById("PageOfficeCtrl1")
			.Alert("监测报告保存成功！");
			return false;
		}
		var re = confirm("是否保存当前监测报告？系统会为当前报告分配一个流水报告编号。")
		if (re == true) {
			var path = document.getElementById("PageOfficeCtrl1").CustomSaveResult;
			if (path && path != "") {
				$.ajax({
							url : "report_report_saveRecord.action",
							data : {
								'viewId' : $('#projectId').val(),
								'reportPath' : path
							},
							async : false,
							success : function(data) {
								var json = eval('(' + data + ')');
								if (json.info == "success") {
									document.getElementById("PageOfficeCtrl1")
											.Alert("监测报告保存成功！");
									if(json.year && json.identify&&json.id){
										document.getElementById("PageOfficeCtrl1").DataRegionList.GetDataRegionByName("PO_year").Value=json.year;
										document.getElementById("PageOfficeCtrl1").DataRegionList.GetDataRegionByName("PO_identify").Value=json.identify;
										$("#reportId").attr("value",json.id);
									}
									
								}
								if (json.info == "failed") {
									document.getElementById("PageOfficeCtrl1")
											.Alert("监测报告保存失败，请刷新后重新尝试！");
								}
								return false;
							}
						});
			}
		}

	}
	function exportWord() {
		document.getElementById("PageOfficeCtrl1").ShowDialog(3);
		
	}
	function printWord() {
		document.getElementById("PageOfficeCtrl1").ShowDialog(4);
	}
	function printPreview() {
		document.getElementById("PageOfficeCtrl1").PrintPreview();
	}
	function viewQualityControl() {
		var id = $('#projectId').val();
		$('#iframe').attr("src",
				"qualityControl_qualityControl_viewPage.action?viewId=" + id);
	}
	function viewProjectBook() {
		var id = $('#projectId').val();
		$('#iframe').attr(
				"src",
				"contractManage_projectBook_viewProjectBook.action?viewId="
						+ id);
	}
	function viewSelfSendInfo() {
		var id = $('#projectId').val();
		$('#iframe').attr(
				"src",
				"selfSendSampleInfo_selfSendSampleInfo_viewPage.action?viewId="
						+ id);
	}
	function viewNonSelfSendInfo() {
		var id = $('#projectId').val();
		$('#iframe').attr(
				"src",
				"nonSelfSendSample_nonSelfSendSample_viewPage.action?viewId="
						+ id);
	}
	function viewRecordAudit() {
		var id = $('#projectId').val();
		$('#iframe').attr("src",
				"resultAudit_resultAudit_viewPage.action?viewId=" + id);
	}
	function viewInspectionSheet() {
		var id = $('#projectId').val();
		$('#iframe').attr(
				"src",
				"selfSendSampleInfo_inspectionSheet_viewReportPage.action?viewId="
						+ id);
	}
</script>
</head>
<body>
	<form id="form1">
		<input type="hidden" name="projectId" id="projectId"
			value="${projectId }">
		<input type="hidden" name="reportId" id="reportId">
		<div style="width: 50%; height: 100%; float: left;" id="report">
			<po:PageOfficeCtrl id="PageOfficeCtrl1">
			</po:PageOfficeCtrl>
		</div>
		<div style="width:50%;height: 100%;float: left;" id="info">
			<iframe id="iframe" src="" width="100%" scrolling="yes" height="100%">
			</iframe>
		</div>
	</form>
</body>
</html>
