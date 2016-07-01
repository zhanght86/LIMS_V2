package com.boncontact.domain;

/**
 * 合同审核实体：记录审核结果
 * 
 * @author 瞿龙俊
 * 
 */
public class ContractAudit {
	private Long id;
	// 委托单位
	private String client;
	// 承接单位，包括合作单位
	private String service;
	// 合同内容
	private String contractContext;
	// 1:是，0：否，以下都一样
	// 客户要求与合同内容相符
	private int contractSame;
	// 人力、物力、信息资源等条件均可以满足合同中的要求
	private int resourceSatisfaction;
	// 确定的监测方案与测试方法是否可以满足客户的要求
	private int custSatisfaction;
	// 本项目是否有分包内容
	private int subpackage;
	// 分包单位评审是否合格
	private int subcontractUnit;
	// 合同额是否满足工作量要求
	private int paymentSatisfaction;
	// 提交报告时间是否合适
	private int timeSatisfaction;
	// 其他评审内容及有关说明
	private String other;
	// 评审结论
	private String auditResult;
	// 项目id
	private Project project;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getContractContext() {
		return contractContext;
	}

	public void setContractContext(String contractContext) {
		this.contractContext = contractContext;
	}

	public String getAuditResult() {
		return auditResult;
	}

	public void setAuditResult(String auditResult) {
		this.auditResult = auditResult;
	}

	public int getContractSame() {
		return contractSame;
	}

	public void setContractSame(int contractSame) {
		this.contractSame = contractSame;
	}

	public int getResourceSatisfaction() {
		return resourceSatisfaction;
	}

	public void setResourceSatisfaction(int resourceSatisfaction) {
		this.resourceSatisfaction = resourceSatisfaction;
	}

	public int getCustSatisfaction() {
		return custSatisfaction;
	}

	public void setCustSatisfaction(int custSatisfaction) {
		this.custSatisfaction = custSatisfaction;
	}

	public int getSubpackage() {
		return subpackage;
	}

	public void setSubpackage(int subpackage) {
		this.subpackage = subpackage;
	}

	public int getSubcontractUnit() {
		return subcontractUnit;
	}

	public void setSubcontractUnit(int subcontractUnit) {
		this.subcontractUnit = subcontractUnit;
	}

	public int getPaymentSatisfaction() {
		return paymentSatisfaction;
	}

	public void setPaymentSatisfaction(int paymentSatisfaction) {
		this.paymentSatisfaction = paymentSatisfaction;
	}

	public int getTimeSatisfaction() {
		return timeSatisfaction;
	}

	public void setTimeSatisfaction(int timeSatisfaction) {
		this.timeSatisfaction = timeSatisfaction;
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

	@Override
	public String toString() {
		return "ContractAudit [id=" + id + ", client=" + client + ", service="
				+ service + ", contractContext=" + contractContext
				+ ", contractSame=" + contractSame + ", resourceSatisfaction="
				+ resourceSatisfaction + ", custSatisfaction="
				+ custSatisfaction + ", subpackage=" + subpackage
				+ ", subcontractUnit=" + subcontractUnit
				+ ", paymentSatisfaction=" + paymentSatisfaction
				+ ", timeSatisfaction=" + timeSatisfaction + ", other=" + other
				+ ", auditResult=" + auditResult + ", project=" + project + "]";
	}
	


}
