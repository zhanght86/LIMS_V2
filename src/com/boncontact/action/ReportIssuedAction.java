package com.boncontact.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.AuthSignator;
import com.boncontact.domain.Project;
import com.boncontact.domain.ProjectBook;
import com.boncontact.domain.Report;
import com.boncontact.domain.ReportAudit;
import com.boncontact.domain.User;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 报告签发审核
 * 
 * @author 瞿龙俊
 * 
 */
@Component("reportIssued")
public class ReportIssuedAction extends BaseAction<ReportAudit> {
	private static final long serialVersionUID = 5664303433080397651L;
	private ReportAudit entity;
	private int resultType;
	private Long viewId;
	private String jsonResult;

	public String main() {
		Long id = (Long) ActionContext.getContext().getSession()
				.get("userId");
		List<Project> projectList = projectService.findAll(" WHERE process = 9 or process = 10");
		List<Project> levelPj = new ArrayList<Project>(); 
		List<AuthSignator> authSignators=authSignatorService.findAll(" WHERE user.id ="+id);
		List<Integer> typeList=new ArrayList<Integer>();
		String typeStr="";
		if(authSignators!=null){
			for (AuthSignator authSignator : authSignators) {
				if(authSignator!=null){
					String reportTypes = authSignator.getReportType();
					String[] types=StringSplitUtils.splite(reportTypes, ",");
					for (String type : types) {
						if(!typeList.contains(Integer.parseInt(type.trim()))){
							typeList.add(Integer.parseInt(type.trim()));
							typeStr+=type.trim();
						}
					}
				}
			}
		}
		ActionContext.getContext().put("typeList", typeList);
		ActionContext.getContext().put("typeStr", typeStr);
		for (Project project : projectList) {
			int flag = 0;
			Set<Report> rp = project.getReportSet();
			for (Report report : rp) {
				if (report.getResult() >= 3&&typeList.contains(report.getType())){
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
			ReportAudit ra = temp.getReportAudit();
			ra.setIssueAudit1(entity.getIssueAudit1());
			ra.setIssueAudit2(entity.getIssueAudit2());
			ra.setIssueAudit3(entity.getIssueAudit3());
			ra.setIssueOther(entity.getIssueOther());
			ra.setIssueOpinion(entity.getIssueOpinion());
			ra.setIssueDate(new Date());
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			User user = userService.getById(id);
			ra.setIssueUser(user);
			temp.setReportAudit(ra);
			if (resultType == 1) {
				// 审核通过
				temp.setResult(4);
				Project pj = temp.getProject();
				if (pj != null) {
					int flag = 0;
					Set<Report> reportSet = pj.getReportSet();
					for (Report report : reportSet) {
						if (report.getResult() != 4) {
							flag = 1;
						}
					}
					if (flag == 0) {
						pj.setProcess(10);
						ProjectBook pb = pj.getProjectBook();
						pb.setReportSign(user);
						pb.setReportSignDate(new Date());
						projectService.update(pj);
					}
				}
			} else {
				// 审核不通过
				temp.setResult(0);
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
