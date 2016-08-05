package com.boncontact.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.DeliveryReceitp;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.Project;
import com.boncontact.domain.User;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 任务分发、交联单接收
 * 
 * @author 瞿龙俊
 * 
 */
@Component("taskDistribution")
public class TaskDistributionAction extends BaseAction<DeliveryReceitp> {
	private static final long serialVersionUID = -1750300423533163935L;
	private Long viewId;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private String ids;
	/* 需要删除的类型：check:复核员 analyst:实验分析员 */
	private String delType;

	private String typeId;
	private Long analystId;

	public String main() {
		List<Project> projectList = projectService.findAll(" WHERE process=5 OR process=6 OR process=7 OR process=8");
		System.out.println(projectList.size());
		ActionContext.getContext().put("projectList", projectList);
		ActionContext.getContext().put("totalRecord", projectList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(projectList.size() / (double) pageRowCount));
		return "main";
	}
	/**
	 * 单独设置分析员
	 * @return
	 */
	public String analyst() {
		try {
			if(viewId!=null && analystId != null){
				InspectionSheet inspectionSheet=inspectionSheetService.getById(viewId);
				User user=userService.getById(analystId);
				inspectionSheet.setAnalyst(user);
				inspectionSheetService.update(inspectionSheet);
				jsonResult = "{'info':'success'}";
			}else{
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	public String delAnalyst(){
		try {
			if(viewId!=null){
				InspectionSheet inspectionSheet=inspectionSheetService.getById(viewId);
				inspectionSheet.setAnalyst(null);
				inspectionSheetService.update(inspectionSheet);
				jsonResult = "{'info':'success'}";
			}else{
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	public String rejectCount(){
		try{
			if(viewId!=null){
				Project pj =projectService.getById(viewId);
				if(pj!=null){
					ActionContext.getContext().put("p", pj);
					ActionContext.getContext().put("inspect", pj.getInspectionSheet());
				}
			}
		}catch(Exception e){
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		
		return "rejectCount";
	}
	
	/**
	 * 单独设置复核员
	 * @return
	 */
	public String review() {
		try {
			if(viewId!=null && analystId != null){
				InspectionSheet inspectionSheet=inspectionSheetService.getById(viewId);
				User user=userService.getById(analystId);
				inspectionSheet.setReview(user);
				inspectionSheetService.update(inspectionSheet);
				jsonResult = "{'info':'success'}";
			}else{
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	public String delReview(){
		try {
			if(viewId!=null){
				InspectionSheet inspectionSheet=inspectionSheetService.getById(viewId);
				inspectionSheet.setReview(null);
				inspectionSheetService.update(inspectionSheet);
				jsonResult = "{'info':'success'}";
			}else{
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	/**
	 * 单独设置审核员
	 * @return
	 */
	public String audit() {
		try {
			if(viewId!=null && analystId != null){
				InspectionSheet inspectionSheet=inspectionSheetService.getById(viewId);
				User user=userService.getById(analystId);
				inspectionSheet.setAudit(user);
				inspectionSheetService.update(inspectionSheet);
				jsonResult = "{'info':'success'}";
			}else{
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	public String delAudit(){
		try {
			if(viewId!=null){
				InspectionSheet inspectionSheet=inspectionSheetService.getById(viewId);
				inspectionSheet.setAudit(null);
				inspectionSheetService.update(inspectionSheet);
				jsonResult = "{'info':'success'}";
			}else{
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	public String analystAll(){
		try {
			if(ids!=null && analystId != null){
				User user=userService.getById(analystId);
				String[] idString=StringSplitUtils.splite(ids, ",");
				for (String id : idString) {
					InspectionSheet inspectionSheet=inspectionSheetService.getById(Long.parseLong(id));
					inspectionSheet.setAnalyst(user);
					inspectionSheetService.update(inspectionSheet);
				}
				jsonResult = "{'info':'success'}";
			}else{
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	public String reviewAll(){
		try {
			if(ids!=null && analystId != null){
				User user=userService.getById(analystId);
				String[] idString=StringSplitUtils.splite(ids, ",");
				for (String id : idString) {
					InspectionSheet inspectionSheet=inspectionSheetService.getById(Long.parseLong(id));
					inspectionSheet.setReview(user);
					inspectionSheetService.update(inspectionSheet);
				}
				jsonResult = "{'info':'success'}";
			}else{
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	public String auditAll(){
		try {
			if(ids!=null && analystId != null){
				User user=userService.getById(analystId);
				String[] idString=StringSplitUtils.splite(ids, ",");
				for (String id : idString) {
					InspectionSheet inspectionSheet=inspectionSheetService.getById(Long.parseLong(id));
					inspectionSheet.setAudit(user);
					inspectionSheetService.update(inspectionSheet);
				}
				jsonResult = "{'info':'success'}";
			}else{
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	public String receivePage() {
		Project pj = projectService.getById(viewId);
		Set<DeliveryReceitp> deliveryReceitpSet = pj.getDeliveryReceitpInfo();
		List<DeliveryReceitp> deliveryReceitpList = new ArrayList<DeliveryReceitp>();
		for (DeliveryReceitp deliveryReceitp : deliveryReceitpSet) {
			deliveryReceitpList.add(deliveryReceitp);
		}
		ActionContext.getContext().put("deliveryReceitpList",
				deliveryReceitpList);
		// 样品管理员开发
		// ActionContext.getContext().put("type", 0);
		return "receivePage";
	}

	public String flow() {
		try {
			Project pj = projectService.getById(viewId);
			Set<InspectionSheet> inspectionSheetSet = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheetSet) {
				if (inspectionSheet.getAnalyst() == null
						|| inspectionSheet.getReview() == null || inspectionSheet.getAudit() == null) {
					jsonResult = "{'info':'error'}";
					return SUCCESS;
				}
			}
			pj.setProcess(6);
			projectService.update(pj);
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getDelType() {
		return delType;
	}

	public void setDelType(String delType) {
		this.delType = delType;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public Long getAnalystId() {
		return analystId;
	}

	public void setAnalystId(Long analystId) {
		this.analystId = analystId;
	}

	

}
