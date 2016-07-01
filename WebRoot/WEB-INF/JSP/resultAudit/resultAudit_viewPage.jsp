<%@page import="com.boncontact.domain.RecordAudit"%>
<%@page import="com.boncontact.domain.Project"%>
<%@page import="com.boncontact.domain.ProjectBook"%>
<%@page import="com.boncontact.domain.ContractMonitoringItem"%>
<%@page import="com.boncontact.util.moneyUtils"%>
<%@page import="com.boncontact.domain.TrafficContract"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.wordwriter.*,com.zhuozhengsoft.pageoffice.*,java.sql.*,java.text.NumberFormat,java.util.Locale,java.text.SimpleDateFormat,java.util.Date"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<%
	String err = "";
	PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
	//创建WordDocment对象
	WordDocument doc = new WordDocument();
	//打开数据区域
	Project entity = (Project) ActionContext
	.getContext().get("entity");
	RecordAudit recordAudit=entity.getRecordAudit();
	SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");

	doc.openDataRegion("PO_projectName").setValue(entity.getProjectBook().getProjectName());
	if(recordAudit!=null && recordAudit.getFirstAudit() != null){
		doc.openDataRegion("PO_firstInstance11").setValue(recordAudit.getFirstInstance1()==1?"☑":"□");
		doc.openDataRegion("PO_firstInstance12").setValue(recordAudit.getFirstInstance1()==2?"☑":"□");
		doc.openDataRegion("PO_firstInstance13").setValue(recordAudit.getFirstInstance1()==3?"☑":"□");
		doc.openDataRegion("PO_firstInstance21").setValue(recordAudit.getFirstInstance2()==1?"☑":"□");
		doc.openDataRegion("PO_firstInstance22").setValue(recordAudit.getFirstInstance2()==2?"☑":"□");
		doc.openDataRegion("PO_firstInstance23").setValue(recordAudit.getFirstInstance2()==3?"☑":"□");
		doc.openDataRegion("PO_firstInstance31").setValue(recordAudit.getFirstInstance3()==1?"☑":"□");
		doc.openDataRegion("PO_firstInstance32").setValue(recordAudit.getFirstInstance3()==2?"☑":"□");
		doc.openDataRegion("PO_firstInstance33").setValue(recordAudit.getFirstInstance3()==3?"☑":"□");
		doc.openDataRegion("PO_firstInstance41").setValue(recordAudit.getFirstInstance4()==1?"☑":"□");
		doc.openDataRegion("PO_firstInstance42").setValue(recordAudit.getFirstInstance4()==2?"☑":"□");
		doc.openDataRegion("PO_firstInstance43").setValue(recordAudit.getFirstInstance4()==3?"☑":"□");
		doc.openDataRegion("PO_firstInstance51").setValue(recordAudit.getFirstInstance5()==1?"☑":"□");
		doc.openDataRegion("PO_firstInstance52").setValue(recordAudit.getFirstInstance5()==2?"☑":"□");
		doc.openDataRegion("PO_firstInstance53").setValue(recordAudit.getFirstInstance5()==3?"☑":"□");
		doc.openDataRegion("PO_firstInstance61").setValue(recordAudit.getFirstInstance6()==1?"☑":"□");
		doc.openDataRegion("PO_firstInstance62").setValue(recordAudit.getFirstInstance6()==2?"☑":"□");
		doc.openDataRegion("PO_firstInstance63").setValue(recordAudit.getFirstInstance6()==3?"☑":"□");
		doc.openDataRegion("PO_remarks").setValue(recordAudit.getRemarks());
		doc.openDataRegion("PO_firstOther").setValue(recordAudit.getFirstOther());
		doc.openDataRegion("PO_firstAudit").setValue(recordAudit.getFirstAudit().getName());
		doc.openDataRegion("PO_firstAuditDate").setValue(recordAudit.getFirstAuditDate()==null?"":formatDate.format(recordAudit.getFirstAuditDate()));
	}
	if(recordAudit!=null &&recordAudit.getSecondAudit() != null){
		doc.openDataRegion("PO_secondInstance11").setValue(recordAudit.getSecondInstance1()==1?"☑":"□");
		doc.openDataRegion("PO_secondInstance12").setValue(recordAudit.getSecondInstance1()==2?"☑":"□");
		doc.openDataRegion("PO_secondInstance13").setValue(recordAudit.getSecondInstance1()==3?"☑":"□");
		doc.openDataRegion("PO_secondInstance21").setValue(recordAudit.getSecondInstance2()==1?"☑":"□");
		doc.openDataRegion("PO_secondInstance22").setValue(recordAudit.getSecondInstance2()==2?"☑":"□");
		doc.openDataRegion("PO_secondInstance23").setValue(recordAudit.getSecondInstance2()==3?"☑":"□");
		doc.openDataRegion("PO_secondInstance31").setValue(recordAudit.getSecondInstance3()==1?"☑":"□");
		doc.openDataRegion("PO_secondInstance32").setValue(recordAudit.getSecondInstance3()==2?"☑":"□");
		doc.openDataRegion("PO_secondInstance33").setValue(recordAudit.getSecondInstance3()==3?"☑":"□");
		doc.openDataRegion("PO_secondInstance41").setValue(recordAudit.getSecondInstance4()==1?"☑":"□");
		doc.openDataRegion("PO_secondInstance42").setValue(recordAudit.getSecondInstance4()==2?"☑":"□");
		doc.openDataRegion("PO_secondInstance43").setValue(recordAudit.getSecondInstance4()==3?"☑":"□");
		doc.openDataRegion("PO_secondInstance51").setValue(recordAudit.getSecondInstance5()==1?"☑":"□");
		doc.openDataRegion("PO_secondInstance52").setValue(recordAudit.getSecondInstance5()==2?"☑":"□");
		doc.openDataRegion("PO_secondInstance53").setValue(recordAudit.getSecondInstance5()==3?"☑":"□");
		doc.openDataRegion("PO_secondInstance61").setValue(recordAudit.getSecondInstance6()==1?"☑":"□");
		doc.openDataRegion("PO_secondInstance62").setValue(recordAudit.getSecondInstance6()==2?"☑":"□");
		doc.openDataRegion("PO_secondInstance63").setValue(recordAudit.getSecondInstance6()==3?"☑":"□");
		doc.openDataRegion("PO_remarks").setValue(recordAudit.getRemarks());
		
		doc.openDataRegion("PO_secondOther").setValue(recordAudit.getSecondOther());
		doc.openDataRegion("PO_secondAudit").setValue(recordAudit.getSecondAudit().getName());
		doc.openDataRegion("PO_secondAuditDate").setValue(recordAudit.getSecondAuditDate()==null?"":formatDate.format(recordAudit.getSecondAuditDate()));
	}
	
	
	poCtrl.setTitlebar(false); //隐藏标题栏
	//poCtrl.setMenubar(false); //隐藏菜单栏
	poCtrl.setOfficeToolbars(false);//隐藏Office工具条
	//poCtrl.setCustomToolbar(false);//隐藏自定义工具栏
	poCtrl.addCustomToolButton("导出", "exportWord", 1);
	poCtrl.addCustomToolButton("-", "", 0);
	poCtrl.addCustomToolButton("打印预览", "printPreview", 7);
	poCtrl.addCustomToolButton("打印", "printWord", 6);
	poCtrl.setSaveFilePage("savefile.jsp?mod='projectBook'");
	poCtrl.setWriter(doc);
	poCtrl.setCaption(entity.getContractId() +"任务书");
	poCtrl.setFileTitle(entity.getContractId() + "任务书");
	poCtrl.setServerPage("poserver.do");
	poCtrl.webOpen("doc/recordAudit.doc",
	OpenModeType.docReadOnly, "someBody");
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
