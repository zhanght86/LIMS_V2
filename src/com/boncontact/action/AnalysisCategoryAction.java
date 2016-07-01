package com.boncontact.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.AnalysisCategory;
import com.boncontact.domain.Project;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

@Component("analysisCategory")
public class AnalysisCategoryAction extends BaseAction<AnalysisCategory> {
	private static final long serialVersionUID = 2933515113295177046L;

	private AnalysisCategory entity;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* id */
	private Long viewId;
	/* 编号集 */
	private String ids;
	/* 查询语句 */
	private String queryStr;
	/* 类型 */
	private String type;

	public String main() {
		List<AnalysisCategory> analysisCategorieList=analysisCategoryService.findAll("");
		ActionContext.getContext().put("analysisCategorieList", analysisCategorieList);
		ActionContext.getContext().put("totalRecord", analysisCategorieList.size());
		ActionContext.getContext().put("totalPage", (int) Math.ceil(analysisCategorieList.size()
				/ (double) pageRowCount));
		return "main";
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		/*List<AnalysisProject> analysisProjectList = new ArrayList<AnalysisProject>();
		if (queryStr != null) {
			String[] queryInfo = StringSplitUtils.splite(queryStr, ";");
			String query = "";
			String condition = "where ";
			for (int i = 0; i < queryInfo.length; i++) {
				String key = StringSplitUtils.splite(queryInfo[i], "=")[0];
				String value = StringSplitUtils.splite(queryInfo[i], "=")[1];
				if (i != queryInfo.length - 1) {
					query += (key + " like '%" + value + "%' and ");
				} else {
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
						/ (double) pageRowCount));*/
		return "main";
	}

	public String choosePage() {
		/*List<AnalysisProject> analysisProjectList = analysisProjectService
				.findAll(" WHERE type=" + viewId);
		ActionContext.getContext().put("analysisProjectList", analysisProjectList);*/
		return "choosePage";
	}
	
	public String choosePageByInspection(){
		/*Project pj=projectService.getById(viewId);
		List<AnalysisProject> analysisProjectList=new ArrayList<AnalysisProject>();
		Set<AnalysisProject> analysisProjects=pj.getAnalysisedProject();
		Iterator<AnalysisProject> it=analysisProjects.iterator();
		while(it.hasNext()){
			analysisProjectList.add(it.next());
		}
		ActionContext.getContext().put("analysisProjectList", analysisProjectList);*/
		return "choosePage";
	}

	public String addPage() {
		return "addPage";
	}

	public String changePage() {
		AnalysisCategory ac=analysisCategoryService.getById(viewId);
		ActionContext.getContext().getValueStack().push(ac);
		return "changePage";
	}

	/**
	 * 新增Action
	 * 
	 * @return
	 */
	public String add() {
		try {
			analysisCategoryService.save(entity);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed','info':'"+e+"'}";
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
			analysisCategoryService.update(entity);
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
				analysisCategoryService.delete(id);
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
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
			analysisCategoryService.delete(viewId);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	@Override
	public AnalysisCategory getModel() {
		if (entity == null) {
			entity = new AnalysisCategory();
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
