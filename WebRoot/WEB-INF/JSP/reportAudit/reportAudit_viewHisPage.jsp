<%@page import="com.boncontact.domain.ReportAudit"%>
<%@page import="com.boncontact.domain.Report"%>
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
	Report entity = (Report) ActionContext
	.getContext().get("entity");
	//ReportAudit reportAudit=entity.getReportAudit();

	ReportAudit reportAudit =(ReportAudit)ActionContext.getContext().get("audit");
	
	SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");

	doc.openDataRegion("PO_identify").setValue(entity.getIdentify());
	doc.openDataRegion("PO_maker").setValue(entity.getMaker().getName());
	doc.openDataRegion("PO_name").setValue(entity.getIdentify()+"名字");
	if(reportAudit != null){
		doc.openDataRegion("PO_firstInstance11").setValue(reportAudit.getFirstInstance1()==1?"[√]":"□");
		doc.openDataRegion("PO_firstInstance12").setValue(reportAudit.getFirstInstance1()==2?"[√]":"□");
		doc.openDataRegion("PO_firstInstance13").setValue(reportAudit.getFirstInstance1()==3?"[√]":"□");
		doc.openDataRegion("PO_firstInstance21").setValue(reportAudit.getFirstInstance2()==1?"[√]":"□");
		doc.openDataRegion("PO_firstInstance22").setValue(reportAudit.getFirstInstance2()==2?"[√]":"□");
		doc.openDataRegion("PO_firstInstance23").setValue(reportAudit.getFirstInstance2()==3?"[√]":"□");
		doc.openDataRegion("PO_firstInstance31").setValue(reportAudit.getFirstInstance3()==1?"[√]":"□");
		doc.openDataRegion("PO_firstInstance32").setValue(reportAudit.getFirstInstance3()==2?"[√])":"□");
		doc.openDataRegion("PO_firstInstance33").setValue(reportAudit.getFirstInstance3()==3?"[√]":"□");
		doc.openDataRegion("PO_firstInstance41").setValue(reportAudit.getFirstInstance4()==1?"[√]":"□");
		doc.openDataRegion("PO_firstInstance42").setValue(reportAudit.getFirstInstance4()==2?"[√]":"□");
		doc.openDataRegion("PO_firstInstance43").setValue(reportAudit.getFirstInstance4()==3?"[√]":"□");
		doc.openDataRegion("PO_firstInstance51").setValue(reportAudit.getFirstInstance5()==1?"[√]":"□");
		doc.openDataRegion("PO_firstInstance52").setValue(reportAudit.getFirstInstance5()==2?"[√]":"□");
		doc.openDataRegion("PO_firstInstance53").setValue(reportAudit.getFirstInstance5()==3?"[√]":"□");
		doc.openDataRegion("PO_firstInstance61").setValue(reportAudit.getFirstInstance6()==1?"[√]":"□");
		doc.openDataRegion("PO_firstInstance62").setValue(reportAudit.getFirstInstance6()==2?"[√]":"□");
		doc.openDataRegion("PO_firstInstance63").setValue(reportAudit.getFirstInstance6()==3?"[√]":"□");
		doc.openDataRegion("PO_firstInstance71").setValue(reportAudit.getFirstInstance7()==1?"[√]":"□");
		doc.openDataRegion("PO_firstInstance72").setValue(reportAudit.getFirstInstance7()==2?"[√]":"□");
		doc.openDataRegion("PO_firstInstance73").setValue(reportAudit.getFirstInstance7()==3?"[√]":"□");
		
		doc.openDataRegion("PO_firstOther").setValue(reportAudit.getFirstOther()!=null?reportAudit.getFirstOther():"");
		doc.openDataRegion("PO_firstUser").setValue(reportAudit.getFirstUser()!=null?reportAudit.getFirstUser().getName():"");
		doc.openDataRegion("PO_firstDate").setValue(reportAudit.getFirstDate()==null?"":formatDate.format(reportAudit.getFirstDate()));
		
		doc.openDataRegion("PO_secondInstance11").setValue(reportAudit.getSecondInstance1()==1?"[√]":"□");
		doc.openDataRegion("PO_secondInstance12").setValue(reportAudit.getSecondInstance1()==2?"[√]":"□");
		doc.openDataRegion("PO_secondInstance13").setValue(reportAudit.getSecondInstance1()==3?"[√]":"□");
		doc.openDataRegion("PO_secondInstance21").setValue(reportAudit.getSecondInstance2()==1?"[√]":"□");
		doc.openDataRegion("PO_secondInstance22").setValue(reportAudit.getSecondInstance2()==2?"[√]":"□");
		doc.openDataRegion("PO_secondInstance23").setValue(reportAudit.getSecondInstance2()==3?"[√]":"□");
		doc.openDataRegion("PO_secondInstance31").setValue(reportAudit.getSecondInstance3()==1?"[√]":"□");
		doc.openDataRegion("PO_secondInstance32").setValue(reportAudit.getSecondInstance3()==2?"[√]":"□");
		doc.openDataRegion("PO_secondInstance33").setValue(reportAudit.getSecondInstance3()==3?"[√]":"□");
		doc.openDataRegion("PO_secondInstance41").setValue(reportAudit.getSecondInstance4()==1?"[√]":"□");
		doc.openDataRegion("PO_secondInstance42").setValue(reportAudit.getSecondInstance4()==2?"[√]":"□");
		doc.openDataRegion("PO_secondInstance43").setValue(reportAudit.getSecondInstance4()==3?"[√]":"□");
		doc.openDataRegion("PO_secondInstance51").setValue(reportAudit.getSecondInstance5()==1?"[√]":"□");
		doc.openDataRegion("PO_secondInstance52").setValue(reportAudit.getSecondInstance5()==2?"[√]":"□");
		doc.openDataRegion("PO_secondInstance53").setValue(reportAudit.getSecondInstance5()==3?"[√]":"□");
		doc.openDataRegion("PO_secondInstance61").setValue(reportAudit.getSecondInstance6()==1?"[√]":"□");
		doc.openDataRegion("PO_secondInstance62").setValue(reportAudit.getSecondInstance6()==2?"[√]":"□");
		doc.openDataRegion("PO_secondInstance63").setValue(reportAudit.getSecondInstance6()==3?"[√]":"□");
		doc.openDataRegion("PO_secondOther").setValue(reportAudit.getSecondOhter()!=null?reportAudit.getSecondOhter():"");
		doc.openDataRegion("PO_secondUser").setValue(reportAudit.getSecondUser()!=null?reportAudit.getSecondUser().getName():"");
		doc.openDataRegion("PO_secondDate").setValue(reportAudit.getSecondDate()==null?"":formatDate.format(reportAudit.getSecondDate()));
		
		doc.openDataRegion("PO_issueAudit11").setValue(reportAudit.getIssueAudit1()==1?"[√]":"□");
		doc.openDataRegion("PO_issueAudit12").setValue(reportAudit.getIssueAudit1()==2?"[√]":"□");
		doc.openDataRegion("PO_issueAudit13").setValue(reportAudit.getIssueAudit1()==3?"[√]":"□");
		doc.openDataRegion("PO_issueAudit21").setValue(reportAudit.getIssueAudit2()==1?"[√]":"□");
		doc.openDataRegion("PO_issueAudit22").setValue(reportAudit.getIssueAudit2()==2?"[√]":"□");
		doc.openDataRegion("PO_issueAudit23").setValue(reportAudit.getIssueAudit2()==3?"[√]":"□");
		doc.openDataRegion("PO_issueAudit31").setValue(reportAudit.getIssueAudit3()==1?"[√]":"□");
		doc.openDataRegion("PO_issueAudit32").setValue(reportAudit.getIssueAudit3()==2?"[√]":"□");
		doc.openDataRegion("PO_issueAudit33").setValue(reportAudit.getIssueAudit3()==3?"[√]":"□");
		
		doc.openDataRegion("PO_issueOther").setValue(reportAudit.getIssueOther()!=null?reportAudit.getIssueOther():"");
		doc.openDataRegion("PO_issueUser").setValue(reportAudit.getIssueUser()!=null?reportAudit.getIssueUser().getName():"");
		doc.openDataRegion("PO_issueDate").setValue(reportAudit.getIssueDate()==null?"":formatDate.format(reportAudit.getIssueDate()));
		
		doc.openDataRegion("PO_issueOpinion1").setValue(reportAudit.getIssueAudit3()==1?"[√]":"□");
		doc.openDataRegion("PO_issueOpinion2").setValue(reportAudit.getIssueAudit3()==2?"[√]":"□");
		doc.openDataRegion("PO_issueOpinion3").setValue(reportAudit.getIssueAudit3()==3?"[√]":"□");
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
	poCtrl.setServerPage("poserver.do");
	poCtrl.webOpen("doc/reportAudit.DOC",
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
