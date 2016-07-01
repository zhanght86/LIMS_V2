package com.boncontact.domain;

import java.util.Date;

/**
 * 用户实体类
 * 
 * @author 瞿龙俊
 * 
 */
public class User {
	// 主键Id
	private Long id;
	// 用户编号，可以用来登录，唯一
	private String identify;
	// 用户姓名
	private String name;
	// 用户密码
	private String password;
	//性别
	private String sex;
	// 身份证号
	private String idCard;
	// 联系电话
	private String tel;
	// 工作电话
	private String workTel;
	// 入职时间
	private Date entryTime;
	// 联系地址
	private String address;
	// 联系人
	private String contacts;
	// 联系人电话
	private String contactsTel;
	// 所属角色
	private Role role;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getWorkTel() {
		return workTel;
	}

	public void setWorkTel(String workTel) {
		this.workTel = workTel;
	}

	public Date getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getContactsTel() {
		return contactsTel;
	}

	public void setContactsTel(String contactsTel) {
		this.contactsTel = contactsTel;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", identify=" + identify + ", name=" + name
				+ ", password=" + password + ", sex=" + sex + ", idCard="
				+ idCard + ", tel=" + tel + ", workTel=" + workTel
				+ ", entryTime=" + entryTime + ", address=" + address
				+ ", contacts=" + contacts + ", contactsTel=" + contactsTel
				+ ", role=" + role + "]";
	}



}
