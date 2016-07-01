package com.boncontact.domain;

import java.util.Date;

/**
 * 问题反馈
 * 
 * @author 瞿龙俊
 * 
 */
public class Feedback {
	private Long id;
	private int type;
	private String context;
	private Date date;
	private int refer;
	private String referContext;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getRefer() {
		return refer;
	}

	public void setRefer(int refer) {
		this.refer = refer;
	}

	public String getReferContext() {
		return referContext;
	}

	public void setReferContext(String referContext) {
		this.referContext = referContext;
	}

	@Override
	public String toString() {
		return "Feedback [id=" + id + ", type=" + type + ", context=" + context
				+ ", date=" + date + ", refer=" + refer + ", referContext="
				+ referContext + "]";
	}

}
