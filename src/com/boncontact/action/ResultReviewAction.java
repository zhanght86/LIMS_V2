package com.boncontact.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.Project;
import com.opensymphony.xwork2.ActionContext;

/**
 * 检测结果复核
 * 
 * @author 瞿龙俊
 * 
 */
@Component("resultReview")
public class ResultReviewAction extends BaseAction<InspectionSheet> {
	private static final long serialVersionUID = 5134240059192982621L;
	private InspectionSheet entity;
	private Long viewId;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 复核类型 */
	private int type;

	public String main() {
		Long id = (Long) ActionContext.getContext().getSession().get("userId");
		List<InspectionSheet> inspectionSheetList = inspectionSheetService
				.findAll(" WHERE review=" + id + " and step=2");
		List<Project> projectList = new ArrayList<Project>();
		for (InspectionSheet inspectionSheet : inspectionSheetList) {
			Project temp = inspectionSheet.getProject();
			if (temp.getProcess() == 6 && !projectList.contains(temp)) {
				projectList.add(temp);
			}
		}
		ActionContext.getContext().put("nowId", id);
		ActionContext.getContext().put("projectList", projectList);
		return "main";
	}

	public String refer() {
		try {
			InspectionSheet temp = inspectionSheetService.getById(viewId);
			Project pj = temp.getProject();
			if (type == 0) {
				temp.setStep(3);
			}
			if (type == 1) {
				temp.setStep(0);
				if(temp.getReviewReject() == null){
					temp.setReviewReject("1");
				}else{
					temp.setReviewReject((Integer.parseInt(temp.getReviewReject())+1)+"");
				}
			}
			inspectionSheetService.update(temp);
			Set<InspectionSheet> inspectionSheetSet = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheetSet) {
				if (inspectionSheet.getStep() != 3) {
					jsonResult = "{'info':'errorFlow'}";
					return SUCCESS;
				}
			}
			//pj.setProcess(7);
			projectService.update(pj);
			jsonResult = "{'info':'successFlow'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String referAll() {
		try {
			Project pj = projectService.getById(viewId);
			Long id =(Long) ActionContext.getContext().getSession().get("userId");
			List<InspectionSheet> inspectionSheetSet = inspectionSheetService
					.findAll(" WHERE project=" + viewId
							+ " AND review="+id+" AND step=2");
			for (InspectionSheet inspectionSheet : inspectionSheetSet) {
				if (type == 0) {
					inspectionSheet.setStep(3);
				}
				if (type == 1) {
					inspectionSheet.setStep(0);
					if(inspectionSheet.getReviewReject() == null){
						inspectionSheet.setReviewReject("1");
					}else{
						inspectionSheet.setReviewReject((Integer.parseInt(inspectionSheet.getReviewReject())+1)+"");
					}
				}
				inspectionSheetService.update(inspectionSheet);
			}
			Set<InspectionSheet> inspectionSheetS = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheetS) {
				if (inspectionSheet.getStep() != 3) {
					jsonResult = "{'info':'errorFlow'}";
					return SUCCESS;
				}
			}
			//pj.setProcess(7);
			projectService.update(pj);
			jsonResult = "{'info':'successFlow'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public InspectionSheet getModel() {
		if (entity == null) {
			entity = new InspectionSheet();
		}
		return entity;
	}

}
