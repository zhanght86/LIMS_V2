package com.boncontact.action;

import java.util.List;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.AnalysisFrequency;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

@Component("analysisFrequency")
public class AnalysisFrequencyAction extends BaseAction<AnalysisFrequency>{
	private static final long serialVersionUID = 9051945520440765958L;
	private AnalysisFrequency entity;
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
		List<AnalysisFrequency> analysisFrequencyList=analysisFrequencyService.findAll("");
		ActionContext.getContext().put("analysisFrequencyList", analysisFrequencyList);
		ActionContext.getContext().put("totalRecord", analysisFrequencyList.size());
		ActionContext.getContext().put("totalPage", (int) Math.ceil(analysisFrequencyList.size()
				/ (double) pageRowCount));
		return "main";
	}


	public String addPage() {
		return "addPage";
	}

	public String changePage() {
		AnalysisFrequency ac=analysisFrequencyService.getById(viewId);
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
			analysisFrequencyService.save(entity);
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
			analysisFrequencyService.update(entity);
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
				analysisFrequencyService.delete(id);
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
			analysisFrequencyService.delete(viewId);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	@Override
	public AnalysisFrequency getModel() {
		if (entity == null) {
			entity = new AnalysisFrequency();
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
