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
	Project entity = (Project) ActionContext
	.getContext().get("entity");
	TrafficContract traffic=entity.gettContractId();
	ProjectBook pb=entity.getProjectBook();
	SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
	NumberFormat formater = NumberFormat
	.getCurrencyInstance(Locale.CHINA);
	//给数据区域赋值
	doc.openDataRegion("PO_identify").setValue(entity.getContractId());
	if(traffic!=null){
		//业务合同任务书
	doc.openDataRegion("PO_client").setValue(traffic.getCustomerName());
	doc.openDataRegion("PO_projectName").setValue(traffic.getProjectName());
	doc.openDataRegion("PO_aim").setValue(traffic.getProjectAim());
	doc.openDataRegion("PO_address").setValue(traffic.getCustomerAddress());
	doc.openDataRegion("PO_code").setValue(traffic.getCustomerCode());
	doc.openDataRegion("PO_contractor").setValue(traffic.getCustomerPeople());
	doc.openDataRegion("PO_tel").setValue(traffic.getCustomerTel());
	if(traffic.getProjectWay()==0){
		doc.openDataRegion("PO_clientType1").setValue("√");
	}else{
		doc.openDataRegion("PO_clientType2").setValue("√");
	}
	doc.openDataRegion("PO_customerText").setValue(traffic.getProjectWayText());
	doc.openDataRegion("PO_taskUnder").setValue(pb.getTaskUnder() != null?pb.getTaskUnder().getName():"");
	doc.openDataRegion("PO_taskUnderDate").setValue(pb.getTaskUnderDate() != null ? formatDate.format(pb.getTaskUnderDate()):"");
	doc.openDataRegion("PO_undertake").setValue(pb.getUndertake()!=null?pb.getUndertake().getName():"");
	doc.openDataRegion("PO_projectCharge").setValue(pb.getProjectCharge()!=null?pb.getProjectCharge().getName():"");
	doc.openDataRegion("PO_reportWriter").setValue(pb.getReportWriter()!=null?pb.getReportWriter().getName():"");
	doc.openDataRegion("PO_reportDate").setValue(pb.getReportDate() != null ? formatDate.format(pb.getReportDate()):"");
	doc.openDataRegion("PO_reportFirstInstance").setValue(pb.getReportFirstInstance()!=null?pb.getReportFirstInstance().getName():"");
	doc.openDataRegion("PO_reportFirstDate").setValue(pb.getReportFirstDate() != null ? formatDate.format(pb.getReportFirstDate()):"");
	doc.openDataRegion("PO_reportSecondInstance").setValue(pb.getReportSecondInstance()!=null?pb.getReportSecondInstance().getName():"");
	doc.openDataRegion("PO_reportSecondDate").setValue(pb.getReportSecondDate() != null ? formatDate.format(pb.getReportSecondDate()):"");
	doc.openDataRegion("PO_reportSign").setValue(pb.getReportSign()!=null?pb.getReportSign().getName():"");
	doc.openDataRegion("PO_reportSignDate").setValue(pb.getReportSignDate() != null ? formatDate.format(pb.getReportSignDate()):"");
	doc.openDataRegion("PO_salesmanSign").setValue(pb.getSalesmanSign()!=null?pb.getSalesmanSign().getName():"");
	doc.openDataRegion("PO_salesmanSignDate").setValue(pb.getSalesmanSignDate() != null ? formatDate.format(pb.getSalesmanSignDate()):"");
	doc.openDataRegion("PO_fileClerk").setValue(pb.getFileClerk()!=null?pb.getFileClerk().getName():"");
	doc.openDataRegion("PO_fileClerkDate").setValue(pb.getFileClerkDate() != null ? formatDate.format(pb.getFileClerkDate()):"");
	doc.openDataRegion("PO_other").setValue(pb.getOther());
	DataRegion dataRegion = doc.openDataRegion("PO_table");
	
		Table table = dataRegion.openTable(1);
		Iterator<ContractMonitoringItem> itemIterator = traffic.getItems()
		.iterator();
		int i = 0;
		while (itemIterator.hasNext()) {
	ContractMonitoringItem item = itemIterator.next();
	table.openCellRC(7 + i, 2).setValue(
	item.getAnalysisCategory().getName());
	table.openCellRC(7 + i, 3).setValue(item.getSiteNum() + "");
	table.openCellRC(7 + i, 4).setValue(
	item.getAnalysisProject().getName());
	table.openCellRC(7 + i, 5).setValue(
	item.getAnalysisFrequency().getName());
	table.openCellRC(7 + i, 6).setValue(item.getOther());
	i++;
		}
	}else{
		//服务合同任务书
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
	poCtrl.webOpen("doc/projectBook.doc",
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
