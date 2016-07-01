<%@page import="com.boncontact.util.StringSplitUtils"%>
<%@page import="com.boncontact.domain.Report"%>
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
	Report entity = (Report) ActionContext.getContext().get("entity");
	Project project=entity.getProject();
	String path = StringSplitUtils.splite(entity.getCoverPath(), "/")[1];
	String identify = entity.getIdentify();
	String[] ids = StringSplitUtils.splite(identify, "-");
	String year = ids[0];
	String id = ids[1];
	int reportType = entity.getType();
	String type = "";
	String fileName = "";
	if (reportType == 0) {
		fileName = project.getContractId() + "废气测试报告封面";
		type = "气";
	}
	if (reportType == 1) {
		fileName = project.getContractId() + "噪声检测报告封面";
		type = "声";
	}
	if (reportType == 2) {
		fileName = project.getContractId() + "水质检测报告封面";
		type = "水";
	}
	if (reportType == 3) {
		fileName = project.getContractId() + "土壤监测报封面";
		type = "土壤";
	}
	if (reportType == 4) {
		fileName = project.getContractId() + "工业废气、烟尘测试报告封面";
		type = "烟气";
	}
	if (year != null) {
		doc.openDataRegion("PO_year").setValue(year);
		doc.openDataRegion("PO_identify").setValue(id);
		doc.openDataRegion("PO_type").setValue(type);
	}
	
	//poCtrl.setTitlebar(false); //隐藏标题栏
	poCtrl.setMenubar(false); //隐藏菜单栏
	//poCtrl.setOfficeToolbars(false);//隐藏Office工具条
	//poCtrl.setCustomToolbar(false);//隐藏自定义工具栏
	poCtrl.addCustomToolButton("导出", "exportWord", 1);
	poCtrl.addCustomToolButton("-", "", 0);
	poCtrl.addCustomToolButton("打印预览", "printPreview", 7);
	poCtrl.addCustomToolButton("打印", "printWord", 6);
	poCtrl.setSaveFilePage("savefile.jsp?id=1&&title=" + path);
	poCtrl.setWriter(doc);
	if (entity.getType() == 0) {
		poCtrl.setCaption(entity.getIdentify() + "废气测试报告封面");
		poCtrl.setFileTitle(entity.getIdentify() + "废气测试报告封面");
	}
	if (entity.getType() == 1) {
		poCtrl.setCaption(entity.getIdentify() + "噪声检测报告封面");
		poCtrl.setFileTitle(entity.getIdentify() + "噪声检测报告封面");
	}
	if (entity.getType() == 2) {
		poCtrl.setCaption(entity.getIdentify() + "水质检测报告封面");
		poCtrl.setFileTitle(entity.getIdentify() + "水质检测报告封面");
	}
	if (entity.getType() == 3) {
		poCtrl.setCaption(entity.getIdentify() + "土壤监测报告封面");
		poCtrl.setFileTitle(entity.getIdentify() + "土壤监测报告封面");
	}
	if (entity.getType() == 4) {
		poCtrl.setCaption(entity.getIdentify() + "工业废气、烟尘测试报告封面");
		poCtrl.setFileTitle(entity.getIdentify() + "工业废气、烟尘测试报告封面");
	}
	
	poCtrl.setServerPage("poserver.do");
	poCtrl.webOpen(entity.getCoverPath(), OpenModeType.docReadOnly, "");
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
		<input type="hidden" name="reportId" id="reportId">
		<div style="width: 100%; height: 100%; float: left;" id="report">
			<po:PageOfficeCtrl id="PageOfficeCtrl1">
			</po:PageOfficeCtrl>
		</div>
	</form>
</body>
</html>
