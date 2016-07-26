package com.boncontact.action;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.Project;
import com.boncontact.domain.RecordAudit;
import com.opensymphony.xwork2.ActionContext;

/**
 * 检测结果审核
 * 
 * @author 瞿龙俊
 * 
 */
@Component("resultAudit")
public class ResultAuditAction extends BaseAction<RecordAudit> {
	private static final long serialVersionUID = 8788481028334605926L;
	private RecordAudit entity;
	private Long viewId;
	private int resultType;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;

	public String main() {
		List<Project> projectList = projectService.findAll("WHERE process=7");
		ActionContext.getContext().put("projectList", projectList);
		return "main";
	}

	public String referPage() {
		Project pj = projectService.getById(viewId);
		String projectName = pj.gettContractId() == null ? pj.getsContractId()
				.getName() : pj.gettContractId().getProjectName();
		ActionContext.getContext().put("projectName", projectName);
		return "referPage";
	}

	public String add() {
		try {
			Project pj = projectService.getById(viewId);
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			entity.setId(null);
			entity.setFirstAudit(userService.getById(id));
			entity.setFirstAuditDate(new Date());
			entity.setProject(pj);
			if (resultType == 0) {
				// 审核通过
				pj.setProcess(8);
			}
			if (resultType == 1) {
				// 审核不通过
				pj.setProcess(6);
				Set<InspectionSheet> inspectionSheetSet = pj
						.getInspectionSheet();
				for (InspectionSheet inspectionSheet : inspectionSheetSet) {
					inspectionSheet.setStep(0);
					if(inspectionSheet.getFirstReject() == null){
						inspectionSheet.setFirstReject("1");
					}else{
						inspectionSheet.setFirstReject((Integer.parseInt(inspectionSheet.getFirstReject())+1)+"");
					}
					inspectionSheetService.update(inspectionSheet);
				}
			}
			if(pj.getRecordAudit()!=null){
				pj.setRecordAudit(null);
				projectService.update(pj);
			}
			pj.setRecordAudit(entity);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	public String viewPage(){
		if(viewId!=null){
			ActionContext.getContext().put("entity", projectService.getById(viewId));
		}
		return "viewPage";
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

	public int getResultType() {
		return resultType;
	}

	public void setResultType(int resultType) {
		this.resultType = resultType;
	}

	@Override
	public RecordAudit getModel() {
		if (entity == null) {
			entity = new RecordAudit();
		}
		return entity;
	}
}
