package com.boncontact.domain;

import java.util.Date;

/**
 * 业务登记实体
 * 
 * @author 瞿龙俊
 * 
 */
public class BusinessRegistration {
	private Long id;
	/* 监测项目 */
	private String item;
	/* 地址 */
	private String address;
	/* 委托人 */
	private String contacts;
	/* 电话 */
	private String tel;
	/* 项目id */
	private Project project;
	/* 合同签署时间 */
	private Date time;
	/* 费用 */
	private double payment;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}


	

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}



	public double getPayment() {
		return payment;
	}

	public void setPayment(double payment) {
		this.payment = payment;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "BusinessRegistration [id=" + id + ", item=" + item
				+ ", address=" + address + ", contacts=" + contacts + ", tel="
				+ tel + ", project=" + project + ", time=" + time
				+ ", payment=" + payment + "]";
	}


}
