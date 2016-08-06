<%@page import="com.boncontact.domain.Delivery_SampleType"%>
<%@page import="com.boncontact.domain.NonSelfSendSample"%>
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
	Set<NonSelfSendSample> water = new HashSet<NonSelfSendSample>();
	Set<NonSelfSendSample> air = new HashSet<NonSelfSendSample>();
	Set<NonSelfSendSample> solid = new HashSet<NonSelfSendSample>();
	List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
	List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
	List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
	String exportType=(String)ActionContext.getContext().get("exportType");
	for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
		if (exportType.equals("water")
		&& deliveryReceitp.getSamplesType() == 1) {

			if(deliveryReceitp.getReceiverUser()!=null){
				doc.openDataRegion("PO_condition").setValue(deliveryReceitp.getPackage_condition().equalsIgnoreCase("0")?"完好":deliveryReceitp.getPackage_condition().equalsIgnoreCase("1")?"破损":"玷污");
				doc.openDataRegion("PO_tag").setValue(deliveryReceitp.getSample_Tag()==null?"":deliveryReceitp.getSample_Tag());
				doc.openDataRegion("PO_additives").setValue(deliveryReceitp.getSolid_Additives()==null?"":deliveryReceitp.getSolid_Additives());
				doc.openDataRegion("PO_receiver").setValue(deliveryReceitp.getReceiverUser().getName());
			}
			
			doc.openDataRegion("PO_client").setValue(entity.getProjectBook().getClient());
			doc.openDataRegion("PO_come").setValue(entity.gettContractId().getProjectType());
			doc.openDataRegion("PO_identify").setValue(entity.getContractId());

			Set<NonSelfSendSample> selfSendSampleInfos =new TreeSet<NonSelfSendSample>();
			selfSendSampleInfos = deliveryReceitp.getNonSelfSendSampleInfo();

			doc.openDataRegion("PO_totalCount").setValue(selfSendSampleInfos.size()+"");
			
			NonSelfSendSample max_id=null,min_id=null;
			if(selfSendSampleInfos.size()>0){
				NonSelfSendSample first =selfSendSampleInfos.iterator().next();
				max_id=min_id=first;
				doc.openDataRegion("PO_sampleDate").setValue(formatDate.format(first.getDate()));
				doc.openDataRegion("PO_user").setValue(first.getUser().getName());
			}
			DataRegion dataRegion = doc.openDataRegion("PO_table");
			Table table = dataRegion.openTable(1);
			int i = 0;	
			for (NonSelfSendSample selfSendSampleInfo : selfSendSampleInfos) {
				Set<AnalysisProject> analysisProjects = selfSendSampleInfo.getAnalysisProjectSet();
				for(AnalysisProject ap:analysisProjects){
					if(ap.getAnalysisCategory().getDeliveryReceitp() == 1){
						if(selfSendSampleInfo.getId()>max_id.getId()) max_id=selfSendSampleInfo;
						if(selfSendSampleInfo.getId()<min_id.getId()) min_id=selfSendSampleInfo;
					}
				}
			}
			
			
			
			doc.openDataRegion("PO_section").setValue(min_id.getIdentify()+"-"+max_id.getIdentify());
			
			
			
			Set<AnalysisProject> analysisProjects = deliveryReceitp.getAnalysisProject();
			Set<Delivery_SampleType> sampleTypes =entity.getSampleTypeSet();
			System.out.println(analysisProjects.size());
			for(AnalysisProject as : analysisProjects){
				for(Delivery_SampleType sample:sampleTypes){
			if(sample.getAnalysis().getId() == as.getId()){
				table.openCellRC(6 + i, 1).setValue((i+1)+"");
				table.openCellRC(6 + i, 2).setValue(sample.getType());
				table.openCellRC(6 + i, 3).setValue(as.getName());
				if(deliveryReceitp.getReceiverUser()!=null){
					table.openCellRC(6 + i, 5).setValue(sample.getDesp()==null?"":sample.getDesp());
					table.openCellRC(6 + i, 6).setValue(sample.getSaveWay().equalsIgnoreCase("0")?"低温":"常温");
				}
				int count = 0;
				for(NonSelfSendSample selfSendSampleInfo : selfSendSampleInfos){
					Set<AnalysisProject> projectSet = selfSendSampleInfo.getAnalysisProjectSet();
					for(AnalysisProject ap:projectSet){
						if(ap.getId() == as.getId()){
							count++;
						}
					}
				}
				table.openCellRC(6 + i, 4).setValue(count+"");
			i++;	
				
				
			}
				}
			}
			
			
		}

		if (exportType.equals("solid")
				&& deliveryReceitp.getSamplesType() == 0) {

			if(deliveryReceitp.getReceiverUser()!=null){
				doc.openDataRegion("PO_condition").setValue(deliveryReceitp.getPackage_condition().equalsIgnoreCase("0")?"完好":deliveryReceitp.getPackage_condition().equalsIgnoreCase("1")?"破损":"玷污");
				doc.openDataRegion("PO_tag").setValue(deliveryReceitp.getSample_Tag()==null?"":deliveryReceitp.getSample_Tag());
				doc.openDataRegion("PO_additives").setValue(deliveryReceitp.getSolid_Additives()==null?"":deliveryReceitp.getSolid_Additives());
				doc.openDataRegion("PO_receiver").setValue(deliveryReceitp.getReceiverUser().getName());
			}
			
			doc.openDataRegion("PO_client").setValue(entity.getProjectBook().getClient());
			doc.openDataRegion("PO_come").setValue(entity.gettContractId().getProjectType());
			doc.openDataRegion("PO_identify").setValue(entity.getContractId());

			Set<NonSelfSendSample> selfSendSampleInfos =new TreeSet<NonSelfSendSample>();
			selfSendSampleInfos = deliveryReceitp.getNonSelfSendSampleInfo();

			doc.openDataRegion("PO_totalCount").setValue(selfSendSampleInfos.size()+"");
			
			NonSelfSendSample max_id=null,min_id=null;
			if(selfSendSampleInfos.size()>0){
				NonSelfSendSample first =selfSendSampleInfos.iterator().next();
				max_id=min_id=first;
				doc.openDataRegion("PO_sampleDate").setValue(formatDate.format(first.getDate()));
				doc.openDataRegion("PO_user").setValue(first.getUser().getName());
			}
			DataRegion dataRegion = doc.openDataRegion("PO_table");
			Table table = dataRegion.openTable(1);
			int i = 0;	
			for (NonSelfSendSample selfSendSampleInfo : selfSendSampleInfos) {
				Set<AnalysisProject> analysisProjects = selfSendSampleInfo.getAnalysisProjectSet();
				for(AnalysisProject ap:analysisProjects){
					if(ap.getAnalysisCategory().getDeliveryReceitp() == 3){
						if(selfSendSampleInfo.getId()>max_id.getId()) max_id=selfSendSampleInfo;
						if(selfSendSampleInfo.getId()<min_id.getId()) min_id=selfSendSampleInfo;
					}
				}
			}
			
			
			
			doc.openDataRegion("PO_section").setValue(min_id.getIdentify()+"-"+max_id.getIdentify());
			
			
			
			Set<AnalysisProject> analysisProjects = deliveryReceitp.getAnalysisProject();
			Set<Delivery_SampleType> sampleTypes =entity.getSampleTypeSet();
			System.out.println(analysisProjects.size());
			for(AnalysisProject as : analysisProjects){
				for(Delivery_SampleType sample:sampleTypes){
			if(sample.getAnalysis().getId() == as.getId()){
				table.openCellRC(6 + i, 1).setValue((i+1)+"");
				table.openCellRC(6 + i, 2).setValue(sample.getType());
				table.openCellRC(6 + i, 3).setValue(as.getName());
				if(deliveryReceitp.getReceiverUser()!=null){
					table.openCellRC(6 + i, 5).setValue(sample.getDesp()==null?"":sample.getDesp());
					table.openCellRC(6 + i, 6).setValue(sample.getSaveWay().equalsIgnoreCase("0")?"低温":"常温");
				}
				int count = 0;
				for(NonSelfSendSample selfSendSampleInfo : selfSendSampleInfos){
					Set<AnalysisProject> projectSet = selfSendSampleInfo.getAnalysisProjectSet();
					for(AnalysisProject ap:projectSet){
						if(ap.getId() == as.getId()){
							count++;
						}
					}
				}
				table.openCellRC(6 + i, 4).setValue(count+"");
			i++;	
				
				
			}
				}
			}
			
			
		
		}
		
		if (exportType.equals("air")
				&& deliveryReceitp.getSamplesType() ==2) {

			if(deliveryReceitp.getReceiverUser()!=null){
				doc.openDataRegion("PO_condition").setValue(deliveryReceitp.getPackage_condition().equalsIgnoreCase("0")?"完好":deliveryReceitp.getPackage_condition().equalsIgnoreCase("1")?"破损":"玷污");
				doc.openDataRegion("PO_tag").setValue(deliveryReceitp.getSample_Tag()==null?"":deliveryReceitp.getSample_Tag());
				doc.openDataRegion("PO_additives").setValue(deliveryReceitp.getSolid_Additives()==null?"":deliveryReceitp.getSolid_Additives());
				doc.openDataRegion("PO_receiver").setValue(deliveryReceitp.getReceiverUser().getName());
			}
			
			doc.openDataRegion("PO_client").setValue(entity.getProjectBook().getClient());
			doc.openDataRegion("PO_come").setValue(entity.gettContractId().getProjectType());
			doc.openDataRegion("PO_identify").setValue(entity.getContractId());

			Set<NonSelfSendSample> selfSendSampleInfos =new TreeSet<NonSelfSendSample>();
			selfSendSampleInfos = deliveryReceitp.getNonSelfSendSampleInfo();

			doc.openDataRegion("PO_totalCount").setValue(selfSendSampleInfos.size()+"");
			
			NonSelfSendSample max_id=null,min_id=null;
			if(selfSendSampleInfos.size()>0){
				NonSelfSendSample first =selfSendSampleInfos.iterator().next();
				max_id=min_id=first;
				doc.openDataRegion("PO_sampleDate").setValue(formatDate.format(first.getDate()));
				doc.openDataRegion("PO_user").setValue(first.getUser().getName());
			}
			DataRegion dataRegion = doc.openDataRegion("PO_table");
			Table table = dataRegion.openTable(1);
			int i = 0;	
			for (NonSelfSendSample selfSendSampleInfo : selfSendSampleInfos) {
				Set<AnalysisProject> analysisProjects = selfSendSampleInfo.getAnalysisProjectSet();
				for(AnalysisProject ap:analysisProjects){
					if(ap.getAnalysisCategory().getDeliveryReceitp() == 2){
						if(selfSendSampleInfo.getId()>max_id.getId()) max_id=selfSendSampleInfo;
						if(selfSendSampleInfo.getId()<min_id.getId()) min_id=selfSendSampleInfo;
					}
				}
			}
			
			
			
			doc.openDataRegion("PO_section").setValue(min_id.getIdentify()+"-"+max_id.getIdentify());
			
			
			
			Set<AnalysisProject> analysisProjects = deliveryReceitp.getAnalysisProject();
			Set<Delivery_SampleType> sampleTypes =entity.getSampleTypeSet();
			System.out.println(analysisProjects.size());
			for(AnalysisProject as : analysisProjects){
				for(Delivery_SampleType sample:sampleTypes){
			if(sample.getAnalysis().getId() == as.getId()){
				table.openCellRC(6 + i, 1).setValue((i+1)+"");
				table.openCellRC(6 + i, 2).setValue(sample.getType());
				table.openCellRC(6 + i, 3).setValue(as.getName());
				if(deliveryReceitp.getReceiverUser()!=null){
					table.openCellRC(6 + i, 5).setValue(sample.getDesp()==null?"":sample.getDesp());
					table.openCellRC(6 + i, 6).setValue(sample.getSaveWay().equalsIgnoreCase("0")?"低温":"常温");
				}
				int count = 0;
				for(NonSelfSendSample selfSendSampleInfo : selfSendSampleInfos){
					Set<AnalysisProject> projectSet = selfSendSampleInfo.getAnalysisProjectSet();
					for(AnalysisProject ap:projectSet){
						if(ap.getId() == as.getId()){
							count++;
						}
					}
				}
				table.openCellRC(6 + i, 4).setValue(count+"");
			i++;	
				
				
			}
				}
			}
			
			
		
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
	poCtrl.webOpen("doc/deliveryReceitp_v2.doc",
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




