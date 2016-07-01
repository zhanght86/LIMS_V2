package com.boncontact.domain;

import java.util.Date;

/**
 * 任务书
 * 
 * @author 瞿龙俊
 * 
 */
public class ProjectBook {
	/* 逻辑主键 */
	private Long id;
	/* 委托单位 */
	private String client;
	/* 项目名称 */
	private String projectName;
	/* 项目目的 */
	private String aim;
	/* 地址 */
	private String address;
	/* 邮编 */
	private String code;
	/* 联系人 */
	private String contact;
	/* 电话 */
	private String tel;
	/* 委托内容 */
	private String context;
	/* 检测方法 */
	private int projectWay;
	/* 客户自定义检测方法 */
	private String customerText;
	/* 任务下达人 */
	private User taskUnder;
	/* 任务下达日期 */
	private Date taskUnderDate;
	/*承接科室*/
	private Department undertake;
	/*项目负责人*/
	private User projectCharge;
	/* 报告编制人 */
	private User reportWriter;
	/* 报告编写日期 */
	private Date reportDate;
	/* 报告一审人 */
	private User reportFirstInstance;
	/* 报告一审时间 */
	private Date reportFirstDate;
	/* 报告二审人 */
	private User reportSecondInstance;
	/* 报告二审时间 */
	private Date reportSecondDate;
	/* 报告签发人 */
	private User reportSign;
	/* 报告签发时间 */
	private Date reportSignDate;
	/* 业务员签收 */
	private User salesmanSign;
	/* 业务员签收日期 */
	private Date salesmanSignDate;
	/* 归档员 */
	private User fileClerk;
	/* 归档日期 */
	private Date fileClerkDate;
	/* 其他 */
	private String other;

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

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getAim() {
		return aim;
	}

	public void setAim(String aim) {
		this.aim = aim;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getProjectWay() {
		return projectWay;
	}

	public void setProjectWay(int projectWay) {
		this.projectWay = projectWay;
	}

	public String getCustomerText() {
		return customerText;
	}

	public void setCustomerText(String customerText) {
		this.customerText = customerText;
	}

	public User getTaskUnder() {
		return taskUnder;
	}

	public void setTaskUnder(User taskUnder) {
		this.taskUnder = taskUnder;
	}

	public Date getTaskUnderDate() {
		return taskUnderDate;
	}

	public void setTaskUnderDate(Date taskUnderDate) {
		this.taskUnderDate = taskUnderDate;
	}

	public User getReportWriter() {
		return reportWriter;
	}

	public void setReportWriter(User reportWriter) {
		this.reportWriter = reportWriter;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public User getReportFirstInstance() {
		return reportFirstInstance;
	}

	public void setReportFirstInstance(User reportFirstInstance) {
		this.reportFirstInstance = reportFirstInstance;
	}

	public Date getReportFirstDate() {
		return reportFirstDate;
	}

	public void setReportFirstDate(Date reportFirstDate) {
		this.reportFirstDate = reportFirstDate;
	}

	public User getReportSecondInstance() {
		return reportSecondInstance;
	}

	public void setReportSecondInstance(User reportSecondInstance) {
		this.reportSecondInstance = reportSecondInstance;
	}

	public Date getReportSecondDate() {
		return reportSecondDate;
	}

	public void setReportSecondDate(Date reportSecondDate) {
		this.reportSecondDate = reportSecondDate;
	}

	public User getReportSign() {
		return reportSign;
	}

	public void setReportSign(User reportSign) {
		this.reportSign = reportSign;
	}

	public Date getReportSignDate() {
		return reportSignDate;
	}

	public void setReportSignDate(Date reportSignDate) {
		this.reportSignDate = reportSignDate;
	}

	public User getSalesmanSign() {
		return salesmanSign;
	}

	public void setSalesmanSign(User salesmanSign) {
		this.salesmanSign = salesmanSign;
	}

	public Date getSalesmanSignDate() {
		return salesmanSignDate;
	}

	public void setSalesmanSignDate(Date salesmanSignDate) {
		this.salesmanSignDate = salesmanSignDate;
	}

	public User getFileClerk() {
		return fileClerk;
	}

	public void setFileClerk(User fileClerk) {
		this.fileClerk = fileClerk;
	}

	

	public Date getFileClerkDate() {
		return fileClerkDate;
	}

	public void setFileClerkDate(Date fileClerkDate) {
		this.fileClerkDate = fileClerkDate;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public Department getUndertake() {
		return undertake;
	}

	public void setUndertake(Department undertake) {
		this.undertake = undertake;
	}

	public User getProjectCharge() {
		return projectCharge;
	}

	public void setProjectCharge(User projectCharge) {
		this.projectCharge = projectCharge;
	}

	@Override
	public String toString() {
		return "ProjectBook [id=" + id + ", client=" + client
				+ ", projectName=" + projectName + ", aim=" + aim
				+ ", address=" + address + ", code=" + code + ", contact="
				+ contact + ", tel=" + tel + ", context=" + context
				+ ", projectWay=" + projectWay + ", customerText="
				+ customerText + ", taskUnder=" + taskUnder
				+ ", taskUnderDate=" + taskUnderDate + ", undertake="
				+ undertake + ", projectCharge=" + projectCharge
				+ ", reportWriter=" + reportWriter + ", reportDate="
				+ reportDate + ", reportFirstInstance=" + reportFirstInstance
				+ ", reportFirstDate=" + reportFirstDate
				+ ", reportSecondInstance=" + reportSecondInstance
				+ ", reportSecondDate=" + reportSecondDate + ", reportSign="
				+ reportSign + ", reportSignDate=" + reportSignDate
				+ ", salesmanSign=" + salesmanSign + ", salesmanSignDate="
				+ salesmanSignDate + ", fileClerk=" + fileClerk
				+ ", fileClerkDate=" + fileClerkDate + ", other=" + other + "]";
	}

	

}
