package com.boncontact.domain;

import java.util.Date;

/**
 * 服务合同实体
 * 
 * @author 瞿龙俊
 * 
 */
public class ServiceContract {
	// 主键
	private Long id;
	// 合同编号、业务主键
	private String identify;
	// 项目名称
	private String name;
	// 项目内容及技术要求
	private String context;
	// 委托方的职责
	private String clientResp;
	// 服务方的职责
	private String serviceResp;
	// 完成期限
	private Date deadLine;
	// 时间限制
	private int times;
	// 最后期限
	private double cost;
	// 委托方
	private String client;
	// 委托方地址
	private String clientAddress;
	// 委托方电话
	private String clientTel;
	// 服务方
	private String service;
	// 服务方地址
	private String serviceAddress;
	// 服务方电话
	private String serviceTel;
	// 开户银行
	private String serviceBank;
	// 账号
	private String serviceCard;
	// 项目承担单位
	private String bearUnit;
	// 项目承担单位地址
	private String bearUnitAddress;
	// 项目承担单位电话
	private String bearUnitTel;
	// 项目
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

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getClientResp() {
		return clientResp;
	}

	public void setClientResp(String clientResp) {
		this.clientResp = clientResp;
	}

	public String getServiceResp() {
		return serviceResp;
	}

	public void setServiceResp(String serviceResp) {
		this.serviceResp = serviceResp;
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

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public String getClientAddress() {
		return clientAddress;
	}

	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}

	public String getClientTel() {
		return clientTel;
	}

	public void setClientTel(String clientTel) {
		this.clientTel = clientTel;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getServiceAddress() {
		return serviceAddress;
	}

	public void setServiceAddress(String serviceAddress) {
		this.serviceAddress = serviceAddress;
	}

	public String getServiceTel() {
		return serviceTel;
	}

	public void setServiceTel(String serviceTel) {
		this.serviceTel = serviceTel;
	}

	public String getServiceBank() {
		return serviceBank;
	}

	public void setServiceBank(String serviceBank) {
		this.serviceBank = serviceBank;
	}

	public String getServiceCard() {
		return serviceCard;
	}

	public void setServiceCard(String serviceCard) {
		this.serviceCard = serviceCard;
	}

	public String getBearUnit() {
		return bearUnit;
	}

	public void setBearUnit(String bearUnit) {
		this.bearUnit = bearUnit;
	}

	public String getBearUnitAddress() {
		return bearUnitAddress;
	}

	public void setBearUnitAddress(String bearUnitAddress) {
		this.bearUnitAddress = bearUnitAddress;
	}

	public String getBearUnitTel() {
		return bearUnitTel;
	}

	public void setBearUnitTel(String bearUnitTel) {
		this.bearUnitTel = bearUnitTel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

}
