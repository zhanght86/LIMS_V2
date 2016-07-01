package com.boncontact.domain;

import java.util.Set;
import java.util.TreeSet;
/**
 * 授权签字人
 * @author 瞿龙俊
 *
 */
public class AuthSignator {
	/*主键编号*/
	private Long id;
	/*授权签字人用户*/
	private User user;
	/*授权列表*/
	private String reportType;

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

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}


	
}
