package com.boncontact.domain;

import java.util.Date;

/**
 * message队列
 * 
 * @author 瞿龙俊
 * 
 */
public class MessageQueue {
	private Long id;
	/* 消息文本 */
	private String message;
	/* 消息类型 */
	private int type;
	/* 编号 */
	private Long itemId;
	/* 接收者 */
	private User receiver;
	/* 推入时间 */
	private Date pushDate;
	/*0:提示，1：隐藏*/
	private int flag;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public Date getPushDate() {
		return pushDate;
	}

	public void setPushDate(Date pushDate) {
		this.pushDate = pushDate;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}



}
