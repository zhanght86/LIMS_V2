package com.boncontact.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.AnalysisCategory;
import com.boncontact.domain.AnalysisProject;
import com.boncontact.domain.ContractMonitoringItem;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.InspectionSheet_Result;
import com.boncontact.domain.NonSelfSendSample;
import com.boncontact.domain.Project;
import com.boncontact.domain.SelfSendSampleInfo;
import com.boncontact.domain.TrafficContract;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

@Component("analysisProject")
public class AnalysisProjectAction extends BaseAction<AnalysisProject> {
	private static final long serialVersionUID = -6087140142133337748L;
	private AnalysisProject entity;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* id */
	private Long viewId;
	/* 编号集 */
	private String ids;
	/* 查询语句 */
	private String queryStr;
	/* 类型 */
	private String categoryId;

	public String main() {
		List<AnalysisProject> analysisProjectList = analysisProjectService
				.findAll("");
		List<AnalysisCategory> analysisCategoryList = analysisCategoryService
				.findAll("");
		ActionContext.getContext().put("analysisProjectList",
				analysisProjectList);
		ActionContext.getContext().put("analysisCategoryList",
				analysisCategoryList);
		ActionContext.getContext().put("totalRecord",
				analysisProjectList.size());
		ActionContext.getContext().put(
				"totalPage",
				(int) Math.ceil(analysisProjectList.size()
						/ (double) pageRowCount));
		return "main";
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<AnalysisProject> analysisProjectList = new ArrayList<AnalysisProject>();
		if (queryStr != null) {
			String[] queryInfo = StringSplitUtils.splite(queryStr, ";");
			String query = "";
			String condition = "where ";
			for (int i = 0; i < queryInfo.length; i++) {
				String key = StringSplitUtils.splite(queryInfo[i], "=")[0];
				String value = StringSplitUtils.splite(queryInfo[i], "=")[1];
				if (i != queryInfo.length - 1) {
					if (key == "analysisCategory") {
						query += (key + " = " + value + " and ");
						break;
					}
					query += (key + " like '%" + value + "%' and ");
				} else {
					if (key == "analysisCategory") {
						query += (key + " = " + value + " and ");
						break;
					}
					query += (key + " like '%" + value + "%'");
				}
			}
			if (query == "") {
				analysisProjectList = analysisProjectService.findAll("");
			} else {
				analysisProjectList = analysisProjectService.findAll(condition
						+ query);
			}
		}
		ActionContext.getContext().put("analysisProjectList",
				analysisProjectList);
		ActionContext.getContext().put("totalRecord",
				analysisProjectList.size());
		ActionContext.getContext().put(
				"totalPage",
				(int) Math.ceil(analysisProjectList.size()
						/ (double) pageRowCount));
		return "main";
	}

	public String choosePage() {
		List<AnalysisProject> analysisProjectList = analysisProjectService
				.findAll(" WHERE type=" + viewId);
		ActionContext.getContext().put("analysisProjectList",
				analysisProjectList);
		return "choosePage";
	}

	public String choosePageByInspection() {
		Project pj = projectService.getById(viewId);
		List<AnalysisProject> analysisProjectList = new ArrayList<AnalysisProject>();
		Set<InspectionSheet> inspectionSheets = pj.getInspectionSheet();
		List<SelfSendSampleInfo> selfSendSampleInfos = new ArrayList<SelfSendSampleInfo>();
		List<NonSelfSendSample> nonSelfSendSamples = new ArrayList<NonSelfSendSample>();
		for (InspectionSheet inspectionSheet : inspectionSheets) {
			analysisProjectList.add(inspectionSheet.getAnalysisProject());

		}
		ActionContext.getContext().put("analysisProjectList",
				analysisProjectList);
		return "choosePage";
	}

	public String addPage() {
		List<AnalysisCategory> analysisCategoryList = analysisCategoryService
				.findAll("");
		ActionContext.getContext().put("analysisCategoryList",
				analysisCategoryList);
		return "addPage";
	}

	public String changePage() {
		List<AnalysisCategory> analysisCategoryList = analysisCategoryService
				.findAll("");
		ActionContext.getContext().put("analysisCategoryList",
				analysisCategoryList);
		AnalysisProject ap = analysisProjectService.getById(viewId);
		ActionContext.getContext().getValueStack().push(ap);
		ActionContext.getContext().put("categoryId",
				ap.getAnalysisCategory().getId());
		return "changePage";
	}
	
	public String chooseByContract(){
		Project project=projectService.getById(viewId);
		if(project != null){
			if(project.gettContractId()!=null){
				//业务合同
				Set<ContractMonitoringItem> items=project.gettContractId().getItems();
				ActionContext.getContext().put("items", items);
			}else{
				//服务合同
			}
		}
		return "chooseByContract";
	}

	/**
	 * 新增Action
	 * 
	 * @return
	 */
	public String add() {
		try {
			if (categoryId != null) {
				entity.setAnalysisCategory(analysisCategoryService.getById(Long
						.parseLong(categoryId)));
				analysisProjectService.save(entity);
				jsonResult = "{'info':'success'}";
			} else {
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 修改Action
	 * 
	 * @return
	 */
	public String change() {
		try {
			analysisProjectService.update(entity);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 批量删除
	 * 
	 * @return
	 */
	public String deleteAll() {
		try {
			String[] idList = StringSplitUtils.splite(ids, ";");
			for (int i = 0; i < idList.length; i++) {
				Long id = Long.parseLong(idList[i]);
				analysisProjectService.delete(id);
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 删除Action
	 * 
	 * @return
	 */
	public String delete() {
		try {
			System.out.println(viewId);
			analysisProjectService.delete(viewId);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	@Override
	public AnalysisProject getModel() {
		if (entity == null) {
			entity = new AnalysisProject();
		}
		return entity;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	public Long getViewId() {
		return viewId;
	}

	public void setViewId(Long viewId) {
		this.viewId = viewId;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

}
