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
	ProjectBook pb=entity.getProjectBook();
	Set<SelfSendSampleInfo> samples=entity.getSelfSendSampleInfo();
	SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
	
	String name="";
	String time="";
	Iterator<SelfSendSampleInfo> samplesIterator = samples.iterator();
	if(samplesIterator.hasNext()){
		SelfSendSampleInfo next =samplesIterator.next();
		name=next.getUser().getName();
		time=formatDate.format(next.getDate());
	}
	doc.openDataRegion("PO_identify").setValue(entity.getContractId());
	doc.openDataRegion("PO_client").setValue(pb.getClient());
	doc.openDataRegion("PO_user").setValue(name);
	doc.openDataRegion("PO_time").setValue(time);
	
	DataRegion dataRegion = doc.openDataRegion("PO_table");
	Table table = dataRegion.openTable(1);
	int i = 0;
	for(SelfSendSampleInfo item:samples){
		Set<AnalysisProject> projects=item.getAnalysisProjectSet();
		String names="";
		for(AnalysisProject analysis:projects){
			names+=analysis.getName()+";";
		}
			table.openCellRC(2 + i, 1).setValue((i+1)+"");
			table.openCellRC(2 + i, 2).setValue(item.getIdentify());
			table.openCellRC(2 + i, 3).setValue(item.getSampleName());
			table.openCellRC(2 + i, 4).setValue(names);
			table.openCellRC(2 + i, 5).setValue(
			item.getSampleState());
			table.openCellRC(2 + i, 6).setValue(
					item.getOther());
		i++;
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
	poCtrl.setCaption(entity.getContractId()+"自送样登记表");
	poCtrl.setServerPage("poserver.do");
	poCtrl.setFileTitle(entity.getContractId()+"自送样登记表");
	poCtrl.webOpen("doc/selfSampleInfo.doc",
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



