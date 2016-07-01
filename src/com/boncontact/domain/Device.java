package com.boncontact.domain;

import java.util.Date;

/**
 * 设备管理
 * 
 * @author 瞿龙俊
 * 
 */
public class Device {
	// 主键
	private Long id;
	// 业务主键，设备编号
	private String identify;
	// 设备名称
	private String name;
	// 设备管理员
	private User admin;
	// 供应商
	private Customer supplier;
	// 购买时间
	private Date timeBuying;
	// 核心参数描述
	private String coreDesp;
	// 常用备品列表
	private String commonlyUserdParts;
	// 技术文档名称
	private String technicalDocument;
	// 文档保管员
	private User custodian;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User getAdmin() {
		return admin;
	}

	public void setAdmin(User admin) {
		this.admin = admin;
	}

	public Customer getSupplier() {
		return supplier;
	}

	public void setSupplier(Customer supplier) {
		this.supplier = supplier;
	}

	public Date getTimeBuying() {
		return timeBuying;
	}

	public void setTimeBuying(Date timeBuying) {
		this.timeBuying = timeBuying;
	}

	public String getCoreDesp() {
		return coreDesp;
	}

	public void setCoreDesp(String coreDesp) {
		this.coreDesp = coreDesp;
	}

	public String getCommonlyUserdParts() {
		return commonlyUserdParts;
	}

	public void setCommonlyUserdParts(String commonlyUserdParts) {
		this.commonlyUserdParts = commonlyUserdParts;
	}

	public String getTechnicalDocument() {
		return technicalDocument;
	}

	public void setTechnicalDocument(String technicalDocument) {
		this.technicalDocument = technicalDocument;
	}

	public User getCustodian() {
		return custodian;
	}

	public void setCustodian(User custodian) {
		this.custodian = custodian;
	}


	

}
