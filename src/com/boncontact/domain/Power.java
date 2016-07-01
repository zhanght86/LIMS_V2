package com.boncontact.domain;

import java.io.Serializable;

/**
 * 权限表
 * 
 * @author 瞿龙俊
 * 
 */
public class Power implements Serializable {
	private Long id;
	/* 权限编号 */
	private String identify;
	/* 权限Action */
	private String powerAction;

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
	public String getPowerAction() {
		return powerAction;
	}

	public void setPowerAction(String powerAction) {
		this.powerAction = powerAction;
	}

	@Override
	public String toString() {
		return "Power [id=" + id + ", identify=" + identify + ", powerAction="
				+ powerAction + "]";
	}
	
	
	
	
}
