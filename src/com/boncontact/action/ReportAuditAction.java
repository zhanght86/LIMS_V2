package com.boncontact.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.Project;
import com.boncontact.domain.ProjectBook;
import com.boncontact.domain.Report;
import com.boncontact.domain.ReportAudit;
import com.boncontact.domain.User;
import com.opensymphony.xwork2.ActionContext;

/**
 * 报告一审
 * 
 * @author 瞿龙俊
 * 
 */
@Component("reportAudit")
public class ReportAuditAction extends BaseAction<ReportAudit> {
	private static final long serialVersionUID = 5664303433080397651L;
	private ReportAudit entity;
	private int resultType;
	private Long viewId;
	private String jsonResult;

	public String main() {
		List<Project> projectList = projectService
				.findAll(" WHERE process=9  or process = 10");
		List<Project> levelPj = new ArrayList<Project>(); 
		for (Project project : projectList) {
			int flag = 0;
			Set<Report> rp = project.getReportSet();
			for (Report report : rp) {
				if (report.getResult() >= 1) {
					flag = 1;
				}
			}
			if (flag == 1) {
				levelPj.add(project);
			}
		}
		ActionContext.getContext().put("projectList", levelPj);
		return "main";
	}

	public String referPage() {
		Report report = reportService.getById(viewId);
		Project pj = report.getProject();
		String projectName = pj.gettContractId() == null ? pj.getsContractId()
				.getName() : pj.gettContractId().getProjectName();
		String projectType = pj.getDeliveryReceitpInfo().iterator().next()
				.getMonitoringType();
		ActionContext.getContext().put("projectType", projectType);
		ActionContext.getContext().put("projectName", projectName);
		ActionContext.getContext().getValueStack().push(report);
		return "referPage";
	}

	public String viewPage() {
		if (viewId != null) {
			ActionContext.getContext().put("entity",
					reportService.getById(viewId));
		}
		return "viewPage";
	}

	public String add() {
		try {
			Report temp = reportService.getById(viewId);
			Project pj = temp.getProject();
			ReportAudit ra = temp.getReportAudit();
			ra.setFirstInstance1(entity.getFirstInstance1());
			ra.setFirstInstance2(entity.getFirstInstance2());
			ra.setFirstInstance3(entity.getFirstInstance3());
			ra.setFirstInstance4(entity.getFirstInstance4());
			ra.setFirstInstance5(entity.getFirstInstance5());
			ra.setFirstInstance6(entity.getFirstInstance6());
			ra.setFirstInstance7(entity.getFirstInstance7());
			/*entity.setReport(temp);
			entity.setId(null);
			entity.setFirstDate(new Date());*/
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			User user = userService.getById(id);
			//entity.setFirstUser(user);
			
			ra.setFirstOther(entity.getFirstOther());
			ra.setFirstUser(user);
			ra.setFirstDate(new Date());
			
			temp.setReportAudit(ra);
			if (resultType == 1) {
				//审核通过
				temp.setResult(2);
				int flag=0;
				Set<Report> reportSet=pj.getReportSet();
				for (Report report : reportSet) {
					if(report.getResult()<2){
						flag=1;
					}
				}
				if(flag==0){
					ProjectBook pb=pj.getProjectBook();
					pb.setReportFirstInstance(user);
					pb.setReportFirstDate(new Date());
					pj.setProjectBook(pb);
					projectService.update(pj);
				}
			
			} else {
				temp.setResult(0);
				if (temp.getFirstRejectNum() == null) {
					temp.setFirstRejectNum("1");
				} else {
					temp.setFirstRejectNum(Integer.parseInt(temp
							.getFirstRejectNum()) + 1 + "");
				}
			}
			reportService.update(temp);
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

	public int getResultType() {
		return resultType;
	}

	public void setResultType(int resultType) {
		this.resultType = resultType;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	@Override
	public ReportAudit getModel() {
		if (entity == null) {
			entity = new ReportAudit();
		}
		return entity;
	}

}
