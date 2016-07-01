package com.boncontact.domain;

import java.util.Date;
import java.util.Set;

/**
 * 系统通知1-1，1-N
 * 
 * @author 瞿龙俊
 * 
 */
public class Notice {
	private Long id;
	/* 优先级 :0:普通 1：重要 2：紧急 */
	private int priority;
	/* 公告标题 */
	private String noticeHead;
	/* 公告内容 */
	private String context;
	/* 公告开始日期 */
	private Date startDate;
	/* 公告结束日期 */
	private Date endDate;
	/* 发布人 */
	private User user;
	/*消息送达方式：0：全部员工 1：部门 2：固定人员*/
	private int sendWay;
	private Set<Department> department;
	/* 接收者：对于1-1来说，接收者是一个User,对于1-Depart来说，接收者是该部门的所有用户 */
	private Set<User> receive;
	/* 附件路径 */
	private String path;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getNoticeHead() {
		return noticeHead;
	}

	public void setNoticeHead(String noticeHead) {
		this.noticeHead = noticeHead;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<User> getReceive() {
		return receive;
	}

	public void setReceive(Set<User> receive) {
		this.receive = receive;
	}
	

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Set<Department> getDepartment() {
		return department;
	}

	public void setDepartment(Set<Department> department) {
		this.department = department;
	}

	
	public int getSendWay() {
		return sendWay;
	}

	public void setSendWay(int sendWay) {
		this.sendWay = sendWay;
	}

	@Override
	public String toString() {
		return "Notice [id=" + id + ", priority=" + priority + ", noticeHead="
				+ noticeHead + ", context=" + context + ", startDate="
				+ startDate + ", endDate=" + endDate + ", user=" + user
				+ ", sendWay=" + sendWay + ", department=" + department
				+ ", receive=" + receive + ", path=" + path + "]";
	}


}
