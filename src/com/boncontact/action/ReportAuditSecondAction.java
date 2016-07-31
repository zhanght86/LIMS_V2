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
 * 报告二审
 * 
 * @author 瞿龙俊
 * 
 */
@Component("reportAuditSecond")
public class ReportAuditSecondAction extends BaseAction<ReportAudit> {
	private static final long serialVersionUID = 5664303433080397651L;
	private ReportAudit entity;
	private int resultType;
	private Long viewId;
	private String jsonResult;

	public String main() {
		List<Project> projectList = projectService.findAll(" WHERE process=9  or process = 10");
		List<Project> levelPj = new ArrayList<Project>();
		for (Project project : projectList) {
			int flag = 0;
			Set<Report> rp = project.getReportSet();
			for (Report report : rp) {
				if (report.getResult() >= 2) {
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
		ActionContext.getContext().put("projectName", projectName);
		String projectType=pj.getDeliveryReceitpInfo().iterator().next().getMonitoringType();
		ActionContext.getContext().put("projectType", projectType);
		ActionContext.getContext().getValueStack().push(report);
		return "referPage";
	}

	public String add() {
		try {
			Report temp = reportService.getById(viewId);
			Project pj=temp.getProject();
			ReportAudit ra = temp.getReportAudit();
			ra.setSecondInstance1(entity.getSecondInstance1());
			ra.setSecondInstance2(entity.getSecondInstance2());
			ra.setSecondInstance3(entity.getSecondInstance3());
			ra.setSecondInstance4(entity.getSecondInstance4());
			ra.setSecondInstance5(entity.getSecondInstance5());
			ra.setSecondInstance6(entity.getSecondInstance6());
			ra.setSecondDate(new Date());
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			User user=userService.getById(id);
			ra.setSecondOhter(entity.getSecondOhter());
			ra.setSecondUser(user);
			temp.setReportAudit(ra);
			if(resultType==1){
				//审核通过
				temp.setResult(3);
				int flag=0;
				Set<Report> reportSet=pj.getReportSet();
				for (Report report : reportSet) {
					if(report.getResult()<3){
						flag=1;
					}
				}
				if(flag==0){
					ProjectBook pb=pj.getProjectBook();
					pb.setReportSecondInstance(user);
					pb.setReportSecondDate(new Date());
					pj.setProjectBook(pb);
					projectService.update(pj);
				}
			}else{
				//审核不通过
				temp.setResult(0);
				if (temp.getSecondRejectNum() == null) {
					temp.setSecondRejectNum("1");
				} else {
					temp.setSecondRejectNum(Integer.parseInt(temp
							.getSecondRejectNum()) + 1 + "");
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
