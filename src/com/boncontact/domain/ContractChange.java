package com.boncontact.domain;

import java.util.Date;

/**
 * 合同变更
 * 
 * @author 瞿龙俊
 * 
 */
public class ContractChange {
	private Long id;
	/* 服务合同 */
	private ServiceContract serviceContract;
	/* 变更日期 */
	private Date changeDate;
	/* 变更原因 */
	private String reason;
	/* 变更的列信息 */
	private String changeColumn;
	/* 变更后内容 */
	private String context;
	/* 是否重新审核 1：不重新审核 0：重新审核 */
	private int reAudit;
	/* 备注 */
	private String other;
	/*合同变更人*/
	private User changer;
	/*项目*/
	private Project project;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ServiceContract getServiceContract() {
		return serviceContract;
	}

	public void setServiceContract(ServiceContract serviceContract) {
		this.serviceContract = serviceContract;
	}

	public Date getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getChangeColumn() {
		return changeColumn;
	}

	public void setChangeColumn(String changeColumn) {
		this.changeColumn = changeColumn;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getReAudit() {
		return reAudit;
	}

	public void setReAudit(int reAudit) {
		this.reAudit = reAudit;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public User getChanger() {
		return changer;
	}

	public void setChanger(User changer) {
		this.changer = changer;
	}

	@Override
	public String toString() {
		return "ContractChange [id=" + id + ", serviceContract="
				+ serviceContract + ", changeDate=" + changeDate + ", reason="
				+ reason + ", changeColumn=" + changeColumn + ", context="
				+ context + ", reAudit=" + reAudit + ", other=" + other
				+ ", changer=" + changer + ", project=" + project + "]";
	}

}
