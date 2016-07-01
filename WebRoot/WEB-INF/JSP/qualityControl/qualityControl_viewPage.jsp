<%@page import="com.boncontact.domain.NonSelfSendSample"%>
<%@page import="com.boncontact.domain.QualityControl"%>
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
	if(entity!=null){
		ProjectBook pb=entity.getProjectBook();
		Set<QualityControl> qualityControls=entity.getQualityControlSet();
		Set<SelfSendSampleInfo> selfSendSampleInfos=entity.getSelfSendSampleInfo();
		Set<NonSelfSendSample> nonSelfSendSamples=entity.getNonSelfSendSampleInfo();
		String createUser="";
		String createDate="";
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
		DataRegion dataRegion = doc.openDataRegion("PO_table");
		Table table = dataRegion.openTable(1);
		int i = 0;
		for(QualityControl qualityControl:qualityControls){
			createDate=qualityControl.getCreateDate()==null?"":formatDate.format(qualityControl.getCreateDate());
			createUser=qualityControl.getCreateUser()==null?"":qualityControl.getCreateUser().getName();
			table.openCellRC(3 + i, 1).setValue((i+1)+"");
			table.openCellRC(3 + i, 2).setValue(qualityControl.getAnalysisProject().getName());
			table.openCellRC(3 + i, 3).setValue(qualityControl.getSampleNum()+"");
			table.openCellRC(3 + i, 4).setValue(qualityControl.getParallelSample()+"");
			table.openCellRC(3 + i, 5).setValue(qualityControl.getLaboratorySampleNum()+"");
			table.openCellRC(3 + i, 6).setValue(qualityControl.getLaboratorySampleIdentifys());
			table.openCellRC(3 + i, 7).setValue(qualityControl.getSpikedRecoverySampleNum()+"");
			table.openCellRC(3 + i, 8).setValue(qualityControl.getSpikedSampleIdentifys());
			table.openCellRC(3 + i, 9).setValue(qualityControl.getBlindSample()+"");
			table.insertRowAfter(table.openCellRC(3+i, 1));
			i++;
		}
		int remainder = i%10;
		for(int m=0;m<(10-remainder);m++){
			table.insertRowAfter(table.openCellRC(2+i, 1));
		}
		doc.openDataRegion("PO_createUser").setValue(createUser);
		doc.openDataRegion("PO_createDate").setValue(createDate);
		doc.openDataRegion("PO_projectName").setValue(pb.getProjectName());
		if(selfSendSampleInfos!=null&&selfSendSampleInfos.iterator().hasNext()){
			doc.openDataRegion("PO_samplingDate").setValue(formatDate.format(selfSendSampleInfos.iterator().next().getDate()));
		}
		if(nonSelfSendSamples!=null&&nonSelfSendSamples.iterator().hasNext()){
			doc.openDataRegion("PO_samplingDate").setValue(formatDate.format(nonSelfSendSamples.iterator().next().getDate()));
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
	poCtrl.setCaption(entity.getContractId()+"质量控制统计表");
	poCtrl.setServerPage("poserver.do");
	poCtrl.setFileTitle(entity.getContractId()+"质量控制统计表");
	poCtrl.webOpen("doc/qualityControl.doc",
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
	function printPreview(){
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



