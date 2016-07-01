package com.boncontact.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.ContractChange;
import com.boncontact.domain.Department;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.Project;
import com.boncontact.domain.RecordAudit;
import com.boncontact.domain.TrafficContract;
import com.boncontact.domain.User;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 绩效管理
 * 
 * @author 瞿龙俊
 * 
 */
@Component("performance")
public class PerformanceAction extends BaseAction<Project> {
	private static final long serialVersionUID = 8302916608823749901L;
	/* 用来存放查询的条件 */
	private String queryStr;

	public String main() {
		List<User> userList = userService.findAll("");
		ActionContext.getContext().put("userList", userList);
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
				if (key.equalsIgnoreCase("model")) {
					type = value;
				}
			}
			ActionContext.getContext().put("username", userService.getByIndetify(userId));
			switch (type) {
			case "1":// 合同起草
				projectList = projectService
						.findAll(" WHERE draftsMan.identify ='" + userId
								+ "' AND createTime BETWEEN '" + startTime
								+ "' AND '" + endTime + "'");
				break;
			case "2":// 质量控制
				projectList = projectService
						.findAll(" WHERE QualityControlUser.identify ='"
								+ userId + "' AND QualityControlDate BETWEEN '"
								+ startTime + "' AND '" + endTime + "'");
				System.out.println("质量控制数量：" + projectList.size());
				break;
			case "3":// 任务下达
				projectList = projectService
						.findAll(" WHERE projectBook.taskUnder.identify ='"
								+ userId
								+ "' AND projectBook.taskUnderDate BETWEEN '"
								+ startTime + "' AND '" + endTime + "'");
				System.out.println("任务下达数量：" + projectList.size());
				break;
			case "4":// 原始记录登记
				projectList = projectService
						.findAll(" WHERE projectBook.taskUnder.identify ='"
								+ userId
								+ "' AND projectBook.taskUnderDate BETWEEN '"
								+ startTime + "' AND '" + endTime + "'");
				System.out.println("任务下达数量：" + projectList.size());
				break;
			case "5":// 合同变更
				List<ContractChange> contractChangeList = contractChangeService
						.findAll(" WHERE changer.identify ='" + userId
								+ "' AND changeDate BETWEEN '" + startTime
								+ "' AND '" + endTime + "'");
				for (ContractChange contractChange : contractChangeList) {
					if (!projectList.contains(contractChange.getProject())) {
						projectList.add(contractChange.getProject());
					}
				}
				System.out.println("合同变更数量：" + projectList.size());
				break;
			case "6":// 样品分析
				List<InspectionSheet> inspectionSheetList = inspectionSheetService
						.findAll(" WHERE analyst.identify ='" + userId
								+ "' AND analysisDate BETWEEN '" + startTime
								+ "' AND '" + endTime + "'");
				for (InspectionSheet inspectionSheet : inspectionSheetList) {
					if (!projectList.contains(inspectionSheet.getProject())) {
						projectList.add(inspectionSheet.getProject());
					}
				}
				System.out.println("样品分析数量：" + projectList.size());
				break;
			case "7":// 样品复核
				List<InspectionSheet> inspectionSheetReviewList = inspectionSheetService
						.findAll(" WHERE review.identify ='" + userId
								+ "' AND analysisDate BETWEEN '" + startTime
								+ "' AND '" + endTime + "'");
				for (InspectionSheet inspectionSheet : inspectionSheetReviewList) {
					if (!projectList.contains(inspectionSheet.getProject())) {
						projectList.add(inspectionSheet.getProject());
					}
				}
				System.out.println("样品复核数量：" + projectList.size());
				break;
			case "8":// 样品一审
				projectList = projectService
						.findAll(" WHERE recordAudit.firstAudit.identify ='"
								+ userId
								+ "' AND recordAudit.firstAuditDate BETWEEN '"
								+ startTime + "' AND '" + endTime + "'");
				System.out.println("样品一审：" + projectList.size());
				break;
			case "9":// 样品二审
				projectList = projectService
						.findAll(" WHERE recordAudit.secondAudit.identify ='"
								+ userId
								+ "' AND recordAudit.secondAuditDate BETWEEN '"
								+ startTime + "' AND '" + endTime + "'");
				System.out.println("样品二审：" + projectList.size());
				break;
			case "10":// 合同编制
				projectList = projectService
						.findAll(" WHERE recordAudit.secondAudit.identify ='"
								+ userId
								+ "' AND recordAudit.secondAuditDate BETWEEN '"
								+ startTime + "' AND '" + endTime + "'");
				System.out.println("样品二审：" + projectList.size());
				break;
			default:
				break;
			}
		}
		System.out.println(projectList.size());
		ActionContext.getContext().put("projectList", projectList);
		ActionContext.getContext().put("totalRecord", projectList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(projectList.size() / (double) pageRowCount));
		return "main";
	}

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

}
