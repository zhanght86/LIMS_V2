<%@page import="com.boncontact.domain.DeliveryReceitp"%>
<%@page import="com.boncontact.domain.AnalysisProject"%>
<%@page import="java.util.jar.Attributes.Name"%>
<%@page import="com.boncontact.domain.SelfSendSampleInfo"%>
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
	PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
	WordDocument doc = new WordDocument();

	Project entity = (Project) ActionContext
	.getContext().get("entity");
	
	SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
	
	Set<DeliveryReceitp> deliveryReceitps = entity
	.getDeliveryReceitpInfo();
	Set<SelfSendSampleInfo> water = new HashSet<SelfSendSampleInfo>();
	Set<SelfSendSampleInfo> air = new HashSet<SelfSendSampleInfo>();
	Set<SelfSendSampleInfo> solid = new HashSet<SelfSendSampleInfo>();
	List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
	List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
	List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
	String exportType=(String)ActionContext.getContext().get("exportType");
	for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
		if (exportType.equals("water")
		&& deliveryReceitp.getSamplesType() == 1) {
	
	doc.openDataRegion("PO_transferDate").setValue(deliveryReceitp.getTransferDate()==null?"":formatDate.format(deliveryReceitp.getTransferDate()));
	doc.openDataRegion("PO_transferUser").setValue(deliveryReceitp.getTransferUser()==null?"":deliveryReceitp.getTransferUser().getName());
	doc.openDataRegion("PO_receiverUser").setValue(deliveryReceitp.getReceiverUser()==null?"":deliveryReceitp.getReceiverUser().getName());
	doc.openDataRegion("PO_backDate").setValue(deliveryReceitp.getBackDate()==null?"":formatDate.format(deliveryReceitp.getBackDate()));
	doc.openDataRegion("PO_backUser").setValue(deliveryReceitp.getBackUser()==null?"":deliveryReceitp.getBackUser().getName());
	doc.openDataRegion("PO_transferDate2").setValue(deliveryReceitp.getTransferDate()==null?"":formatDate.format(deliveryReceitp.getTransferDate()));
	doc.openDataRegion("PO_transferUser2").setValue(deliveryReceitp.getTransferUser()==null?"":deliveryReceitp.getTransferUser().getName());
	doc.openDataRegion("PO_receiverUser2").setValue(deliveryReceitp.getReceiverUser()==null?"":deliveryReceitp.getReceiverUser().getName());
	doc.openDataRegion("PO_backDate2").setValue(deliveryReceitp.getBackDate()==null?"":formatDate.format(deliveryReceitp.getBackDate()));
	doc.openDataRegion("PO_backUser2").setValue(deliveryReceitp.getBackUser()==null?"":deliveryReceitp.getBackUser().getName());
	
	
	doc.openDataRegion("PO_other").setValue("");
	doc.openDataRegion("PO_other2").setValue("");
	// 水和废水
	doc.openDataRegion("PO_samplingDate").setValue(deliveryReceitp.getSamplingDate()==null?"":formatDate.format(deliveryReceitp.getSamplingDate()));
	doc.openDataRegion("PO_samplesType").setValue(deliveryReceitp.getMonitoringType());
	doc.openDataRegion("PO_samplingDate2").setValue(deliveryReceitp.getSamplingDate()==null?"":formatDate.format(deliveryReceitp.getSamplingDate()));
	doc.openDataRegion("PO_samplesType2").setValue(deliveryReceitp.getMonitoringType());
	Set<SelfSendSampleInfo> selfSendSampleInfos = deliveryReceitp
	.getSelfSendSampleInfo();
	String identifys="";
	String status="";
	for (SelfSendSampleInfo selfSendSampleInfo : selfSendSampleInfos) {
		Set<AnalysisProject> projectList=selfSendSampleInfo.getAnalysisProjectSet();
		for(AnalysisProject analysisProject:projectList){
			if (analysisProject.getAnalysisCategory().getDeliveryReceitp()==1&&!waterProject.contains(analysisProject)) {
				waterProject.add(analysisProject);
			}
		if(!status.contains(selfSendSampleInfo.getSampleState())){
			status+=selfSendSampleInfo.getSampleState()+";";
		}
		if(!identifys.contains(selfSendSampleInfo.getIdentify())){
			identifys+=selfSendSampleInfo.getIdentify()+";";
		}
		
	}
	doc.openDataRegion("PO_sampleIdentify").setValue(identifys);
	doc.openDataRegion("PO_sampleState").setValue(status);
	doc.openDataRegion("PO_sampleIdentify2").setValue(identifys);
	doc.openDataRegion("PO_sampleState2").setValue(status);
		}
	doc.openDataRegion("PO_itemNum").setValue(waterProject.size()+"");
	doc.openDataRegion("PO_itemNum2").setValue(waterProject.size()+"");
	String projectStr="";
	for (AnalysisProject analysisProject : waterProject) {
		projectStr+=analysisProject.getName()+";";
	}
	doc.openDataRegion("PO_analysisProject").setValue(projectStr);
	doc.openDataRegion("PO_analysisProject2").setValue(projectStr);
	}
		
		if (exportType.equals("solid")
				&& deliveryReceitp.getSamplesType() == 0) {
			// 土壤
			doc.openDataRegion("PO_transferDate").setValue(deliveryReceitp.getTransferDate()==null?"":formatDate.format(deliveryReceitp.getTransferDate()));
			doc.openDataRegion("PO_transferUser").setValue(deliveryReceitp.getTransferUser()==null?"":deliveryReceitp.getTransferUser().getName());
			doc.openDataRegion("PO_receiverUser").setValue(deliveryReceitp.getReceiverUser()==null?"":deliveryReceitp.getReceiverUser().getName());
			doc.openDataRegion("PO_backDate").setValue(deliveryReceitp.getBackDate()==null?"":formatDate.format(deliveryReceitp.getBackDate()));
			doc.openDataRegion("PO_backUser").setValue(deliveryReceitp.getBackUser()==null?"":deliveryReceitp.getBackUser().getName());
			doc.openDataRegion("PO_transferDate2").setValue(deliveryReceitp.getTransferDate()==null?"":formatDate.format(deliveryReceitp.getTransferDate()));
			doc.openDataRegion("PO_transferUser2").setValue(deliveryReceitp.getTransferUser()==null?"":deliveryReceitp.getTransferUser().getName());
			doc.openDataRegion("PO_receiverUser2").setValue(deliveryReceitp.getReceiverUser()==null?"":deliveryReceitp.getReceiverUser().getName());
			doc.openDataRegion("PO_backDate2").setValue(deliveryReceitp.getBackDate()==null?"":formatDate.format(deliveryReceitp.getBackDate()));
			doc.openDataRegion("PO_backUser2").setValue(deliveryReceitp.getBackUser()==null?"":deliveryReceitp.getBackUser().getName());
			doc.openDataRegion("PO_other").setValue("");
			doc.openDataRegion("PO_other2").setValue("");
			doc.openDataRegion("PO_samplingDate").setValue(deliveryReceitp.getSamplingDate()==null?"":formatDate.format(deliveryReceitp.getSamplingDate()));
			doc.openDataRegion("PO_samplesType").setValue(deliveryReceitp.getMonitoringType());
			doc.openDataRegion("PO_samplingDate2").setValue(deliveryReceitp.getSamplingDate()==null?"":formatDate.format(deliveryReceitp.getSamplingDate()));
			doc.openDataRegion("PO_samplesType2").setValue(deliveryReceitp.getMonitoringType());
			Set<SelfSendSampleInfo> selfSendSampleInfos = deliveryReceitp
			.getSelfSendSampleInfo();
			String identifys="";
			String status="";
			for (SelfSendSampleInfo selfSendSampleInfo : selfSendSampleInfos) {
				Set<AnalysisProject> projectList=selfSendSampleInfo.getAnalysisProjectSet();
				for(AnalysisProject analysisProject:projectList){
					if (analysisProject.getAnalysisCategory().getDeliveryReceitp()==3&&!solidProject.contains(analysisProject)) {
						solidProject.add(analysisProject);
					}
				if(!status.contains(selfSendSampleInfo.getSampleState())){
			status+=selfSendSampleInfo.getSampleState()+";";
				}
				if(!identifys.contains(selfSendSampleInfo.getIdentify())){
					identifys+=selfSendSampleInfo.getIdentify()+";";
				}
			}
			doc.openDataRegion("PO_sampleIdentify").setValue(identifys);
			doc.openDataRegion("PO_sampleState").setValue(status);
			doc.openDataRegion("PO_sampleIdentify2").setValue(identifys);
			doc.openDataRegion("PO_sampleState2").setValue(status);
				}
			doc.openDataRegion("PO_itemNum").setValue(solidProject.size()+"");
			doc.openDataRegion("PO_itemNum2").setValue(solidProject.size()+"");
			String projectStr="";
			for (AnalysisProject analysisProject : solidProject) {
				projectStr+=analysisProject.getName()+";";
			}
			doc.openDataRegion("PO_analysisProject").setValue(projectStr);
			doc.openDataRegion("PO_analysisProject2").setValue(projectStr);
			}
		
		if (exportType.equals("air")
				&& deliveryReceitp.getSamplesType() ==2) {
			// 空气
			doc.openDataRegion("PO_transferDate").setValue(deliveryReceitp.getTransferDate()==null?"":formatDate.format(deliveryReceitp.getTransferDate()));
			doc.openDataRegion("PO_transferUser").setValue(deliveryReceitp.getTransferUser()==null?"":deliveryReceitp.getTransferUser().getName());
			doc.openDataRegion("PO_receiverUser").setValue(deliveryReceitp.getReceiverUser()==null?"":deliveryReceitp.getReceiverUser().getName());
			doc.openDataRegion("PO_backDate").setValue(deliveryReceitp.getBackDate()==null?"":formatDate.format(deliveryReceitp.getBackDate()));
			doc.openDataRegion("PO_backUser").setValue(deliveryReceitp.getBackUser()==null?"":deliveryReceitp.getBackUser().getName());
			doc.openDataRegion("PO_transferDate2").setValue(deliveryReceitp.getTransferDate()==null?"":formatDate.format(deliveryReceitp.getTransferDate()));
			doc.openDataRegion("PO_transferUser2").setValue(deliveryReceitp.getTransferUser()==null?"":deliveryReceitp.getTransferUser().getName());
			doc.openDataRegion("PO_receiverUser2").setValue(deliveryReceitp.getReceiverUser()==null?"":deliveryReceitp.getReceiverUser().getName());
			doc.openDataRegion("PO_backDate2").setValue(deliveryReceitp.getBackDate()==null?"":formatDate.format(deliveryReceitp.getBackDate()));
			doc.openDataRegion("PO_backUser2").setValue(deliveryReceitp.getBackUser()==null?"":deliveryReceitp.getBackUser().getName());
			doc.openDataRegion("PO_other").setValue("");
			doc.openDataRegion("PO_other2").setValue("");
			doc.openDataRegion("PO_samplingDate").setValue(deliveryReceitp.getSamplingDate()==null?"":formatDate.format(deliveryReceitp.getSamplingDate()));
			doc.openDataRegion("PO_samplesType").setValue(deliveryReceitp.getMonitoringType());
			doc.openDataRegion("PO_samplingDate2").setValue(deliveryReceitp.getSamplingDate()==null?"":formatDate.format(deliveryReceitp.getSamplingDate()));
			doc.openDataRegion("PO_samplesType2").setValue(deliveryReceitp.getMonitoringType());
			Set<SelfSendSampleInfo> selfSendSampleInfos = deliveryReceitp
			.getSelfSendSampleInfo();
			String identifys="";
			String status="";
			for (SelfSendSampleInfo selfSendSampleInfo : selfSendSampleInfos) {
				Set<AnalysisProject> projectList=selfSendSampleInfo.getAnalysisProjectSet();
				for(AnalysisProject analysisProject:projectList){
					if (analysisProject.getAnalysisCategory().getDeliveryReceitp()==2&&!airProject.contains(analysisProject)) {
						airProject.add(analysisProject);
					}
				if(!status.contains(selfSendSampleInfo.getSampleState())){
			status+=selfSendSampleInfo.getSampleState()+";";
				}
				if(!identifys.contains(selfSendSampleInfo.getIdentify())){
					identifys+=selfSendSampleInfo.getIdentify()+";";
				}
			}
			doc.openDataRegion("PO_sampleIdentify").setValue(identifys);
			doc.openDataRegion("PO_sampleState").setValue(status);
			doc.openDataRegion("PO_sampleIdentify2").setValue(identifys);
			doc.openDataRegion("PO_sampleState2").setValue(status);
				}
			doc.openDataRegion("PO_itemNum").setValue(airProject.size()+"");
			doc.openDataRegion("PO_itemNum2").setValue(airProject.size()+"");
			String projectStr="";
			for (AnalysisProject analysisProject : airProject) {
				projectStr+=analysisProject.getName()+";";
			}
			doc.openDataRegion("PO_analysisProject").setValue(projectStr);
			doc.openDataRegion("PO_analysisProject2").setValue(projectStr);
			}
}

	poCtrl.setTitlebar(false); //隐藏标题栏
	//poCtrl.setMenubar(false); //隐藏菜单栏
	poCtrl.setOfficeToolbars(false);//隐藏Office工具条
	//poCtrl.setCustomToolbar(false);//隐藏自定义工具栏
	poCtrl.addCustomToolButton("导出", "exportWord", 1);
	poCtrl.addCustomToolButton("-", "", 0);
	poCtrl.addCustomToolButton("打印预览", "printPreview", 7);
	poCtrl.addCustomToolButton("打印", "printWord", 6);
	poCtrl.setSaveFilePage("savefile.jsp?mod='selfSampleInfo'");
	poCtrl.setWriter(doc);
	poCtrl.setCaption(entity.getContractId() + "交接联单");
	poCtrl.setServerPage("poserver.do");
	poCtrl.setFileTitle(entity.getContractId() + "交接联单");
	poCtrl.webOpen("doc/"+exportType+"Delivery.doc",
	OpenModeType.docSubmitForm, "someBody");
	poCtrl.setTagId("PageOfficeCtrl1");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link href="css/cssReset.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
	function exportWord() {
		document.getElementById("PageOfficeCtrl1").ShowDialog(3);
	}
	function printWord() {
		document.getElementById("PageOfficeCtrl1").ShowDialog(4);
	}
	function printPreview() {
		document.getElementById("PageOfficeCtrl1").PrintPreview();
	}
</script>
</head>
<body>
	<form id="form1">
		<input type="hidden" name="viewId" id="viewId" value="${entity.id }">
		<div style="width: auto; height: 100%;">
			<po:PageOfficeCtrl id="PageOfficeCtrl1">
			</po:PageOfficeCtrl>
		</div>
	</form>
</body>
</html>




