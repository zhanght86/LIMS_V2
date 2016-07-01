package com.boncontact.action;

import java.util.List;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.BusinessRegistration;
import com.boncontact.domain.ContractAudit;
import com.boncontact.domain.Project;
import com.opensymphony.xwork2.ActionContext;

/**
 * 项目安排Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("projectPlan")
public class ProjectPlanAction extends BaseAction<BusinessRegistration> {
	private static final long serialVersionUID = -71245487799564072L;
	/* 业务实体 */
	private BusinessRegistration entity;
	/* 合同id */
	private Long viewId;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;

	public String main() {
		List<Project> projectList = projectService
				.findAll(" WHERE process=1 ORDER BY contractId DESC");
		ActionContext.getContext().put("projectList", projectList);
		ActionContext.getContext().put("totalRecord", projectList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(projectList.size() / (double) pageRowCount));
		return "main";
	}

	/**
	 * 查看评审记录
	 * 
	 * @return
	 */
	public String viewAudit() {
		try {
			ContractAudit audit = projectService.getById(viewId)
					.getContractAudit();
			ActionContext.getContext().getValueStack().push(audit);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "viewAudit";
	}

	/**
	 * 业务登记Action
	 * 
	 * @return
	 */
	public String registration() {
		try {
			Project project = projectService.getById(viewId);
			if (project.getsContractId() != null) {
				ActionContext.getContext().put("client",
						project.getsContractId().getClient());
				ActionContext.getContext().put("address",
						project.getsContractId().getClientAddress());
				ActionContext.getContext().put("tel",
						project.getsContractId().getClientTel());
				ActionContext.getContext().put("cost",
						project.getsContractId().getCost() / 10000.0);
			} else {
				ActionContext.getContext().put("client",
						project.gettContractId().getCustomerName());
				ActionContext.getContext().put("people",
						project.gettContractId().getCustomerPeople());
				ActionContext.getContext().put("address",
						project.gettContractId().getCustomerAddress());
				ActionContext.getContext().put("tel",
						project.gettContractId().getCustomerTel());
				ActionContext.getContext().put("cost",
						project.gettContractId().getCost() / 10000.0);
			}
			ActionContext.getContext().getValueStack().push(project);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "registration";
	}

	/**
	 * 保存业务合同
	 * 
	 * @return
	 */
	public String save() {
		try {
			Project pj = projectService.getById(viewId);
			BusinessRegistration br = new BusinessRegistration();
			br.setAddress(entity.getAddress());
			br.setContacts(entity.getAddress());
			br.setItem(entity.getItem());
			br.setProject(pj);
			br.setTel(entity.getTel());
			br.setTime(pj.getCreateTime());
			if (pj.getsContractId() != null) {
				br.setPayment(pj.getsContractId().getCost());
			} else {
				br.setPayment(pj.gettContractId().getCost());
			}
			pj.setBusinessRegistration(br);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 查看业务信息
	 * 
	 * @return
	 */
	public String viewRegistration() {
		Project pj = projectService.getById(viewId);
		if (pj.getsContractId() != null) {
			ActionContext.getContext().put("client",
					pj.getsContractId().getClient());
		} else {
			ActionContext.getContext().put("client",
					pj.gettContractId().getCustomerName());
		}
		ActionContext.getContext().getValueStack().push(pj);
		BusinessRegistration br = pj.getBusinessRegistration();
		ActionContext.getContext().getValueStack().push(br);
		ActionContext.getContext().put("costUpper", br.getPayment() / 10000);
		return "viewRegistration";
	}

	/**
	 * 修改业务信息
	 * 
	 * @return
	 */
	public String changeRegistration() {
		Project pj = projectService.getById(viewId);
		if (pj.getsContractId() != null) {
			ActionContext.getContext().put("client",
					pj.getsContractId().getClient());
		} else {
			ActionContext.getContext().put("client",
					pj.gettContractId().getCustomerName());
		}
		ActionContext.getContext().getValueStack().push(pj);
		BusinessRegistration br = pj.getBusinessRegistration();
		ActionContext.getContext().getValueStack().push(br);
		ActionContext.getContext().put("costUpper", br.getPayment() / 10000);
		return "changeRegistration";
	}

	/**
	 * 修改业务登记信息
	 * 
	 * @return
	 */
	public String change() {
		try {
			Project pj = projectService.getById(viewId);
			BusinessRegistration br = pj.getBusinessRegistration();
			br.setItem(entity.getItem());
			br.setAddress(entity.getAddress());
			br.setContacts(entity.getContacts());
			br.setTel(entity.getTel());
			pj.setBusinessRegistration(br);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	/**
	 * 删除业务登记表
	 * 
	 * @return
	 */
	public String delete() {
		try {
			Project pj = projectService.getById(viewId);
			BusinessRegistration br = pj.getBusinessRegistration();
			pj.setBusinessRegistration(null);
			projectService.update(pj);
			businessRegistrationService.delete(br.getId());
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	@Override
	public BusinessRegistration getModel() {
		if (entity == null) {
			entity = new BusinessRegistration();
		}
		return entity;
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

}
