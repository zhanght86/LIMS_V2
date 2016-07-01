package com.boncontact.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.ContractChange;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.Project;
import com.boncontact.domain.User;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

@Component("analystPerform")
public class AnalystPerformAction extends BaseAction<Project> {
	private static final long serialVersionUID = -7902436484857991921L;
	private String queryStr;

	public String main() {
		ActionContext.getContext().put("selfSampleInfoNum", 0);
		ActionContext.getContext().put("nonSelfSampleInfoNum", 0);
		String value = PropertiesUtlis.getValue("/setting.properties", "syfxy");
		List<User> users = userService.findAll(" WHERE role=" + value);
		ActionContext.getContext().put("userList", users);
		return "main";
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<Project> projectList = new ArrayList<Project>();
		if (queryStr != null) {
			String[] queryInfo = StringSplitUtils.splite(queryStr, ";");
			String query = "";
			String condition = "where ";
			String startTime = "";
			String endTime = "";
			String type = "";
			String userId = "";
			for (int i = 0; i < queryInfo.length; i++) {
				String key = StringSplitUtils.splite(queryInfo[i], "=")[0];
				String value = StringSplitUtils.splite(queryInfo[i], "=")[1];
				if (key.equalsIgnoreCase("entryTimeStart")) {
					startTime = value;
					continue;
				}
				if (key.equalsIgnoreCase("entryTimeEnd")) {
					endTime = value;
					continue;
				}
				if (key.equalsIgnoreCase("identify")) {
					userId = value;
				}
			}
			String queryv = " WHERE analyst ='" + userId
					+ "' AND analysisDate BETWEEN '" + startTime + "' AND '"
					+ endTime + "'";
			System.out.println(queryv);
			List<InspectionSheet> inspectionSheetList = new ArrayList<InspectionSheet>();
			if (startTime == "" && endTime == "") {
				inspectionSheetList = inspectionSheetService
						.findAll(" WHERE analyst='" + userId + "'");
			}
			if (startTime != "" && endTime == "") {
				inspectionSheetList = inspectionSheetService
						.findAll(" WHERE analyst='" + userId
								+ "' AND analysisDate> '" + startTime + "'");
			}
			if (startTime == "" && endTime != "") {
				inspectionSheetList = inspectionSheetService
						.findAll(" WHERE analyst='" + userId
								+ "' AND analysisDate < '" + endTime + "'");
			}
			if (startTime != "" && endTime != "") {
				inspectionSheetList = inspectionSheetService
						.findAll(" WHERE analyst='" + userId
								+ "' AND analysisDate BETWEEN '" + startTime
								+ "' AND '" + endTime + "'");
			}
			int selfSampleInfoNum = 0;
			int nonSelfSampleInfoNum = 0;
			for (InspectionSheet inspectionSheet : inspectionSheetList) {
				if (!projectList.contains(inspectionSheet.getProject())) {
					projectList.add(inspectionSheet.getProject());
				}
				if (inspectionSheet.getProject().getGainSample().equals("1")) {
					selfSampleInfoNum = selfSampleInfoNum
							+ inspectionSheet.getResult().size();
				}
				if (inspectionSheet.getProject().getGainSample().equals("0")) {
					nonSelfSampleInfoNum = nonSelfSampleInfoNum
							+ inspectionSheet.getResult().size();
				}
			}
			ActionContext.getContext().put("selfSampleInfoNum", selfSampleInfoNum);
			ActionContext.getContext().put("nonSelfSampleInfoNum", nonSelfSampleInfoNum);
			ActionContext.getContext().put("inspectionSheetList",
					inspectionSheetList);
			ActionContext.getContext().put("analystId", userId);
		}

		String value = PropertiesUtlis.getValue("/setting.properties", "syfxy");
		List<User> users = userService.findAll(" WHERE role=" + value);
		ActionContext.getContext().put("userList", users);
		System.out.println(projectList.size());
		ActionContext.getContext().put("projectList", projectList);
		ActionContext.getContext().put("totalRecord", projectList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(projectList.size() / (double) pageRowCount));
		if (projectList.size() != 0) {
			ActionContext.getContext().put("flag", 2);
		} else {
			ActionContext.getContext().put("flag", 1);
		}
		return "main";
	}

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

}
