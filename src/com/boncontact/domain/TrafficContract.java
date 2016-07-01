package com.boncontact.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 业务合同实体
 * 
 * @author 瞿龙俊
 * 
 */
public class TrafficContract {
	// 主键
	private Long id;
	// 业务主键，合同编号
	private String identify;
	// 委托单位
	private String customerName;
	// 客户邮编
	private String customerCode;
	// 客户地址
	private String customerAddress;
	// 客户联系电话
	private String customerTel;
	// 客户联系人
	private String customerPeople;
	// 客户传真
	private String customerFax;
	// 项目名称
	private String projectName;
	// 监测目的
	private String projectAim;
	// 监测类别
	private String projectType;
	// 监测项
	private Set<ContractMonitoringItem> items = new HashSet<ContractMonitoringItem>();
	// 监测方法：0：以我公司方法为准，1：客户指定方法
	private int projectWay;
	// 客户指定的方法
	private String projectWayText;
	// 分包单位
	private String subpackageName;
	// 分包项目
	private String subProject;
	// 交付方式
	private String paymentWay;
	// 完成时间
	private Date deadLine;
	// 监测费用
	private double cost;
	// 客户是否进入实验室 0：不进入，1：进入
	private int inRoom;
	// 是否需要保密，0：不保密，1保密
	private int secrecy;
	// 其他内容
	private String other;
	// 受委托单位
	private String entrusted;
	// 受委托单位邮编
	private String entrustedCode;
	// 受委托单位地址
	private String entrustedAddress;
	// 受委托单位电话
	private String entrustedTel;
	// 受委托单位承办人
	private User Contractors;
	// 受委托单位传真
	private String entrustedFax;
	// 分配项目
	private Project project;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerTel() {
		return customerTel;
	}

	public void setCustomerTel(String customerTel) {
		this.customerTel = customerTel;
	}

	public String getCustomerFax() {
		return customerFax;
	}

	public void setCustomerFax(String customerFax) {
		this.customerFax = customerFax;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectAim() {
		return projectAim;
	}

	public void setProjectAim(String projectAim) {
		this.projectAim = projectAim;
	}

	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public Set<ContractMonitoringItem> getItems() {
		return items;
	}

	public void setItems(Set<ContractMonitoringItem> items) {
		this.items = items;
	}

	public int getProjectWay() {
		return projectWay;
	}

	public void setProjectWay(int projectWay) {
		this.projectWay = projectWay;
	}

	public String getSubpackageName() {
		return subpackageName;
	}

	public void setSubpackageName(String subpackageName) {
		this.subpackageName = subpackageName;
	}

	public String getSubProject() {
		return subProject;
	}

	public void setSubProject(String subProject) {
		this.subProject = subProject;
	}

	public String getPaymentWay() {
		return paymentWay;
	}

	public void setPaymentWay(String paymentWay) {
		this.paymentWay = paymentWay;
	}

	public Date getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(Date deadLine) {
		this.deadLine = deadLine;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public int getInRoom() {
		return inRoom;
	}

	public void setInRoom(int inRoom) {
		this.inRoom = inRoom;
	}

	public int getSecrecy() {
		return secrecy;
	}

	public void setSecrecy(int secrecy) {
		this.secrecy = secrecy;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getEntrusted() {
		return entrusted;
	}

	public void setEntrusted(String entrusted) {
		this.entrusted = entrusted;
	}

	public String getEntrustedCode() {
		return entrustedCode;
	}

	public void setEntrustedCode(String entrustedCode) {
		this.entrustedCode = entrustedCode;
	}

	public String getEntrustedAddress() {
		return entrustedAddress;
	}

	public void setEntrustedAddress(String entrustedAddress) {
		this.entrustedAddress = entrustedAddress;
	}

	public String getEntrustedTel() {
		return entrustedTel;
	}

	public void setEntrustedTel(String entrustedTel) {
		this.entrustedTel = entrustedTel;
	}

	public User getContractors() {
		return Contractors;
	}

	public void setContractors(User contractors) {
		Contractors = contractors;
	}

	public String getEntrustedFax() {
		return entrustedFax;
	}

	public void setEntrustedFax(String entrustedFax) {
		this.entrustedFax = entrustedFax;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getCustomerPeople() {
		return customerPeople;
	}

	public void setCustomerPeople(String customerPeople) {
		this.customerPeople = customerPeople;
	}

	public String getProjectWayText() {
		return projectWayText;
	}

	public void setProjectWayText(String projectWayText) {
		this.projectWayText = projectWayText;
	}

	@Override
	public String toString() {
		return "TrafficContract [id=" + id + ", identify=" + identify
				+ ", customerName=" + customerName + ", customerCode="
				+ customerCode + ", customerAddress=" + customerAddress
				+ ", customerTel=" + customerTel + ", customerPeople="
				+ customerPeople + ", customerFax=" + customerFax
				+ ", projectName=" + projectName + ", projectAim=" + projectAim
				+ ", projectType=" + projectType + ", items=" + items
				+ ", projectWay=" + projectWay + ", projectWayText="
				+ projectWayText + ", subpackageName=" + subpackageName
				+ ", subProject=" + subProject + ", paymentWay=" + paymentWay
				+ ", deadLine=" + deadLine + ", cost=" + cost + ", inRoom="
				+ inRoom + ", secrecy=" + secrecy + ", other=" + other
				+ ", entrusted=" + entrusted + ", entrustedCode="
				+ entrustedCode + ", entrustedAddress=" + entrustedAddress
				+ ", entrustedTel=" + entrustedTel + ", Contractors="
				+ Contractors + ", entrustedFax=" + entrustedFax + ", project="
				+ project + "]";
	}
	

}
