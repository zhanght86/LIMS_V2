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
 * 原始记录审核 二审
 * 
 * @author 瞿龙俊
 * 
 */
@Component("resultAuditSecond")
public class ResultAuditSecondAction extends BaseAction<RecordAudit> {
	private static final long serialVersionUID = -5078361082264235651L;
	private RecordAudit entity;
	private Long viewId;
	private int resultType;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;

	public String main() {
		List<Project> projectList = projectService.findAll("WHERE process=8");
		ActionContext.getContext().put("projectList", projectList);
		return "main";
	}

	public String referPage() {
		Project pj = projectService.getById(viewId);
		String projectName = pj.gettContractId() == null ? pj.getsContractId()
				.getName() : pj.gettContractId().getProjectName();
		ActionContext.getContext().put("projectName", projectName);
		ActionContext.getContext().put("firstOther",
				pj.getRecordAudit().getRemarks());
		return "referPage";
	}

	public String add() {
		try {
			Project pj = projectService.getById(viewId);
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			RecordAudit recordAudit = pj.getRecordAudit();
			if (recordAudit != null) {
				recordAudit.setSecondAudit(userService.getById(id));
				recordAudit.setSecondAuditDate(new Date());
				recordAudit.setSecondOther(entity.getSecondOther());
				recordAudit.setRemarks("一审员："+recordAudit.getRemarks()+"。二审员："
						+ entity.getRemarks());
				recordAudit.setSecondInstance1(entity.getSecondInstance1());
				recordAudit.setSecondInstance2(entity.getSecondInstance2());
				recordAudit.setSecondInstance3(entity.getSecondInstance3());
				recordAudit.setSecondInstance4(entity.getSecondInstance4());
				recordAudit.setSecondInstance5(entity.getSecondInstance5());
				recordAudit.setSecondInstance6(entity.getSecondInstance6());

				if (resultType == 0) {
					// 审核通过
					pj.setProcess(9);
				}
				if (resultType == 1) {
					// 审核不通过
					pj.setProcess(6);
					Set<InspectionSheet> inspectionSheetSet = pj
							.getInspectionSheet();
					for (InspectionSheet inspectionSheet : inspectionSheetSet) {
						inspectionSheet.setStep(0);
						if(inspectionSheet.getSecondReject() == null){
							inspectionSheet.setSecondReject("1");
						}else{
							inspectionSheet.setSecondReject((Integer.parseInt(inspectionSheet.getSecondReject())+1)+"");
						}
						inspectionSheetService.update(inspectionSheet);
					}
				}
				pj.setRecordAudit(recordAudit);
				projectService.update(pj);
				jsonResult = "{'info':'success'}";
			} else {
				jsonResult = "{'info':'error'}";
			}
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
	public RecordAudit getModel() {
		if (entity == null) {
			entity = new RecordAudit();
		}
		return entity;
	}

}
