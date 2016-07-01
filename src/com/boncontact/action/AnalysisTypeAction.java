package com.boncontact.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.AnalysisType;
import com.boncontact.domain.Encode;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

@Component("analysisType")
public class AnalysisTypeAction extends BaseAction<AnalysisType> {
	private static final long serialVersionUID = -2117551320678865998L;
	private AnalysisType entity;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private Long viewId;
	private String queryStr;
	private String ids;

	public String main() {
		List<AnalysisType> analysisTypeList = analysisTypeService.findAll("");
		ActionContext.getContext().put("analysisTypeList", analysisTypeList);
		ActionContext.getContext().put("totalRecord", analysisTypeList.size());
		ActionContext.getContext()
				.put("totalPage",
						(int) Math.ceil(analysisTypeList.size()
								/ (double) pageRowCount));
		return "main";
	}

	public String addPage() {
		return "addPage";
	}

	public String add() {
		try {
			System.out.println(entity);
			analysisTypeService.save(entity);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String changePage() {
		ActionContext.getContext().getValueStack()
				.push(analysisTypeService.getById(viewId));
		return "changePage";
	}

	public String change() {
		try {
			analysisTypeService.update(entity);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String delete() {
		try {
			analysisTypeService.delete(viewId);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	/**
	 * 自动生成编号Action
	 * 
	 * @return
	 */
	public String autoCreate() {
		String value = PropertiesUtlis.getValue("/identifier.properties",
				"analysisType");
		int index = 0;
		Encode temp = encodeService.getEncode();
		if (temp != null) {
			index = (int) (temp.getAnalysisType() + 1);
			temp.setAnalysisType(index);
			encodeService.update(temp);
		} else {
			index += 1;
		}
		String indexString = value + String.format("%04d", index);
		jsonResult = "{'identify':'" + indexString + "'}";
		return SUCCESS;
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<AnalysisType> analysisTypeList = new ArrayList<AnalysisType>();
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
				analysisTypeList = analysisTypeService.findAll("");
			} else {
				analysisTypeList = analysisTypeService.findAll(condition
						+ query);
			}
			ActionContext.getContext()
					.put("analysisTypeList", analysisTypeList);
			ActionContext.getContext().put("totalRecord",
					analysisTypeList.size());
			ActionContext.getContext().put(
					"totalPage",
					(int) Math.ceil(analysisTypeList.size()
							/ (double) pageRowCount));
		}

		return "main";
	}

	public String deleteAll() {
		try {
			String[] idList = StringSplitUtils.splite(ids, ";");
			for (int i = 0; i < idList.length; i++) {
				Long id = Long.parseLong(idList[i]);
				analysisTypeService.delete(id);
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
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

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	@Override
	public AnalysisType getModel() {
		if (entity == null) {
			entity = new AnalysisType();
		}
		return entity;
	}
}
