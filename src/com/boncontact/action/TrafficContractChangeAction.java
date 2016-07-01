package com.boncontact.action;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.AnalysisProject;
import com.boncontact.domain.ContractChange;
import com.boncontact.domain.ContractMonitoringItem;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.Project;
import com.boncontact.domain.Report;
import com.boncontact.domain.ServiceContract;
import com.boncontact.domain.TrafficContract;
import com.boncontact.domain.User;
import com.boncontact.util.StringSplitUtils;
import com.boncontact.util.moneyUtils;
import com.opensymphony.xwork2.ActionContext;
/**
 * 业务合同变更
 * @author 瞿龙俊
 *
 */
@Component("trafficContractChange")
public class TrafficContractChangeAction extends BaseAction<TrafficContract> {
	private static final long serialVersionUID = 2801221302824356513L;
	private TrafficContract entity;
	private Long viewId;
	private String jsonResult;
	private String str;
	private Long userNum;
	private Long projectId;
	public String main(){
		List<TrafficContract> projectList=trafficContractService.findAll("");
		Iterator<TrafficContract> tempIterable=projectList.iterator();
		while(tempIterable.hasNext()){
			TrafficContract trafficContract=tempIterable.next();
			if(trafficContract.getProject()!=null&&(trafficContract.getProject().getProcess()>11||trafficContract.getProject().getProcess()<0)){
				
				tempIterable.remove();
			}
		}
		ActionContext.getContext().put("projectList", projectList);
		return "main";
	}
	
	public String addPage(){
		TrafficContract project=trafficContractService.getById(viewId);
		ActionContext.getContext().put("contract", project);
		Set<ContractMonitoringItem> contractMonitoringItem =project.getItems();
		for (ContractMonitoringItem contractMonitoringItem2 : contractMonitoringItem) {
			System.err.println(contractMonitoringItem2);
		}
		ActionContext.getContext().put("rowSpan", 6 + project.getItems().size());
		ActionContext.getContext().put("analysisCategory", analysisCategoryService.findAll(""));
		ActionContext.getContext().put("analysisFrequency", analysisFrequencyService.findAll(""));
		ActionContext.getContext().put("oldProjectId", project.getProject().getId());
		return "addPage";
	}
	
	public String add() {
		try {
			Set<ContractMonitoringItem> contractItems = new HashSet<ContractMonitoringItem>();
			String[] strList = StringSplitUtils.splite(str, ";");
			for (int i = 0; i < strList.length; i++) {
				String[] items = StringSplitUtils.splite(strList[i], ",");
				ContractMonitoringItem contractItem = new ContractMonitoringItem();
				for (int j = 0; j < items.length; j++) {
					String item = items[j];
					String[] temp = StringSplitUtils.splite(item, ":");
					String key = StringSplitUtils.splite(item, ":")[0];
					String value = "";
					if (temp.length == 2) {
						value = StringSplitUtils.splite(item, ":")[1];
					}
					
					if(key.equalsIgnoreCase("itemId")){
						contractItem=contractMonitoringItemService.getById(Long.parseLong(value));
					}
					
					if (key.equalsIgnoreCase("environmentElement")) {
						contractItem.setAnalysisCategory(analysisCategoryService.getById(Long.parseLong(value)));
					}
					if (key.equalsIgnoreCase("siteNum")) {
						if (value != "") {
							contractItem.setSiteNum(Integer.parseInt(value));
						} else {
							contractItem.setSiteNum(0);
						}
					}
					if (key.equalsIgnoreCase("project")) {
						contractItem.setAnalysisProject(analysisProjectService.getById(Long.parseLong(value)));
					}
					if (key.equalsIgnoreCase("frequency")) {
						contractItem.setAnalysisFrequency(analysisFrequencyService.getById(Long.parseLong(value)));
					}
					if (key.equalsIgnoreCase("other")) {
						contractItem.setOther(value);
					}

				}
				contractItems.add(contractItem);
				entity.setItems(contractItems);
				
			}
			if(userNum != null){
				entity.setContractors(userService.getById(userNum));
			}
			if(projectId!=null){
				entity.setProject(projectService.getById(projectId));
			}
			trafficContractService.update(entity);
			
			//此处需要增加删除project功能--》业务合同变更之后回到合同起草环节
			Project project = entity.getProject();
			project.setProcess(1);
			projectService.update(project);	
			Set<InspectionSheet> sheets=project.getInspectionSheet();
			for (InspectionSheet inspectionSheet : sheets) {
				inspectionSheet.setStep(0L);
				inspectionSheetService.update(inspectionSheet);
			}
			Set<Report> reportSet=project.getReportSet();
			for (Report report : reportSet) {
				report.setResult(0);
				reportService.update(report);
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	@Override
	public TrafficContract getModel() {
		if(entity==null){
			entity=new TrafficContract();
		}
		return entity;
	}

	public Long getViewId() {
		return viewId;
	}

	public void setViewId(Long viewId) {
		this.viewId = viewId;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public Long getUserNum() {
		return userNum;
	}

	public void setUserNum(Long userNum) {
		this.userNum = userNum;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	
	

}
