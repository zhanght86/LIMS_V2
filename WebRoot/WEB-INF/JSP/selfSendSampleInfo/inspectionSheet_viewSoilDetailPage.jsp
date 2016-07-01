 <%@page import="com.boncontact.domain.NonSelfSendSample"%>
<%@page import="com.boncontact.domain.InspectionSheet_Soil"%>
<%@page import="com.boncontact.domain.InspectionSheet_Air"%>
<%@page import="com.boncontact.domain.InspectionSheet_Result"%>
<%@page import="com.boncontact.domain.InspectionSheet"%>
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
	InspectionSheet inspectionSheet = (InspectionSheet)ActionContext.getContext().get("sheet");
	SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
	if(inspectionSheet!=null){
		DataRegion dataRegion = doc.openDataRegion("PO_table");
		Table table = dataRegion.openTable(1);
		int i=0;
		Set<InspectionSheet_Result> results=inspectionSheet.getResult();
		if(entity.getGainSample().equals("1")){
			for(InspectionSheet_Result result : results){
				SelfSendSampleInfo info=result.getSampleInfo();
				Set<AnalysisProject> projects=info.getAnalysisProjectSet();
				InspectionSheet_Soil soil=(InspectionSheet_Soil)result;
				String names="";
				for(AnalysisProject analysis:projects){
					names+=analysis.getName()+";";
				}
				table.insertRowAfter(table.openCellRC(1+i, 1));
					table.openCellRC(2 + i, 1).setValue(info.getIdentify());
					table.openCellRC(2 + i, 2).setValue(info.getSampleState());
					table.openCellRC(2 + i, 3).setValue(soil.getSamplingSection()==null?"":soil.getSamplingSection()+"");
					table.openCellRC(2 + i, 4).setValue(soil.getAnalysisResult()==0.0?"":soil.getAnalysisResult()+"");
					table.openCellRC(2 + i, 5).setValue(soil.getRemarks()==null?"":soil.getRemarks()+ "");
				i++;
			}
		}else{
			for(InspectionSheet_Result result : results){
				NonSelfSendSample info=result.getNonSelfSampleInfo();
				Set<AnalysisProject> projects=info.getAnalysisProjectSet();
				InspectionSheet_Soil soil=(InspectionSheet_Soil)result;
				String names="";
				for(AnalysisProject analysis:projects){
					names+=analysis.getName()+";";
				}
				table.insertRowAfter(table.openCellRC(1+i, 1));
					table.openCellRC(2 + i, 1).setValue(info.getIdentify());
					table.openCellRC(2 + i, 2).setValue(info.getSampleName());
					table.openCellRC(2 + i, 3).setValue(soil.getSamplingSection()==null?"":soil.getSamplingSection()+"");
					table.openCellRC(2 + i, 4).setValue(soil.getAnalysisResult()==0.0?"":soil.getAnalysisResult()+"");
					table.openCellRC(2 + i, 5).setValue(soil.getRemarks()==null?"":soil.getRemarks()+ "");
				i++;
			}
		}
		
		int remainder = i%19;
		for(int m=0;m<(19-remainder);m++){
			table.insertRowAfter(table.openCellRC(1+i, 1));
		}
		doc.openDataRegion("PO_analysisProject").setValue(inspectionSheet.getAnalysisProject()!=null?inspectionSheet.getAnalysisProject().getName():""); 
		doc.openDataRegion("PO_sendUser").setValue(inspectionSheet.getSendUser()!=null?inspectionSheet.getSendUser().getName():""); 
		doc.openDataRegion("PO_receiver").setValue(inspectionSheet.getReceiver()!=null?inspectionSheet.getReceiver().getName():"   "); 
		doc.openDataRegion("PO_sendSample").setValue(inspectionSheet.getSendSample()!=null?formatDate.format(inspectionSheet.getSendSample()):""); 
		doc.openDataRegion("PO_analysisDate").setValue(inspectionSheet.getAnalysisDate()!=null?formatDate.format(inspectionSheet.getAnalysisDate()):"      "); 
		doc.openDataRegion("PO_analyst").setValue(inspectionSheet.getAnalyst()!=null?inspectionSheet.getAnalyst().getName():"   "); 
		doc.openDataRegion("PO_audit").setValue(inspectionSheet.getAudit()!=null?inspectionSheet.getAudit().getName():"   "); 
		doc.openDataRegion("PO_review").setValue(inspectionSheet.getReview()!=null?inspectionSheet.getReview().getName():"   "); 
		
	}
	poCtrl.setTitlebar(false); 
	//poCtrl.setMenubar(false); 
	poCtrl.setOfficeToolbars(false);
	//poCtrl.setCustomToolbar(false);
	poCtrl.addCustomToolButton("导出", "exportWord", 1);
	poCtrl.addCustomToolButton("-", "", 0);
	poCtrl.addCustomToolButton("打印预览", "printPreview", 7);
	poCtrl.addCustomToolButton("打印", "printWord", 6);
	poCtrl.setSaveFilePage("savefile.jsp?mod='selfSampleInfo'");
	poCtrl.setWriter(doc);
	poCtrl.setCaption(entity.getContractId() + "土壤、底质样品送检单");
	poCtrl.setServerPage("poserver.do");
	poCtrl.setFileTitle(entity.getContractId() + "土壤、底质样品送检单");
	poCtrl.webOpen("doc/soilInspect.doc",
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




 