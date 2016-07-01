package com.boncontact.domain;

import java.util.Date;

/**
 * 客户实体类
 * 
 * @author 瞿龙俊
 * 
 */
public class Customer {
	// 客户主键
	private Long id;
	// 业务主键，编号
	private String identify;
	// 客户姓名
	private String name;
	// 客户类型 ，
	private String curType;
	// 是否VIP，
	private String leaguer;
	// 加入时间
	private Date entryTime;
	// 联系人姓名
	private String linkMan;
	// 联系人职务
	private String linkManPosition;
	// 电子邮件
	private String email;
	// 联系电话
	private String tel;
	// 工作电话
	private String workTel;
	// 住址
	private String address;
	// 登录密码
	private String password;
	// 角色，对应着客户角色
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCurType() {
		return curType;
	}
	public void setCurType(String curType) {
		this.curType = curType;
	}
	public String getLeaguer() {
		return leaguer;
	}
	public void setLeaguer(String leaguer) {
		this.leaguer = leaguer;
	}
	public Date getEntryTime() {
		return entryTime;
	}
	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}
	public String getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}
	public String getLinkManPosition() {
		return linkManPosition;
	}
	public void setLinkManPosition(String linkManPosition) {
		this.linkManPosition = linkManPosition;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}


	
}
