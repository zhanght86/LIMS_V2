package com.boncontact.domain;


/**
 * 历史登陆信息
 * 
 * @author 瞿龙俊
 * 
 */
public class HistoryLogin {
	private Long id;
	/* 登陆用户 */
	private User user;
	/* IP地址 */
	private String ip;
	/* 当前状态 */
	private int state;
	/*登录时间*/
	private String startDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	@Override
	public String toString() {
		return "HistoryLogin [id=" + id + ", user=" + user + ", ip=" + ip
				+ ", state=" + state + ", startDate=" + startDate + "]";
	}
	
	
	
}
