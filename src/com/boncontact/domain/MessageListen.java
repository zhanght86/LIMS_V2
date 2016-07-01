package com.boncontact.domain;

/**
 * 消息监听类
 * 
 * @author 瞿龙俊
 * 
 */
public class MessageListen {
	/* 编号 */
	private Long id;
	/* 监听类型 */
	private Long type;
	/* 接收者 */
	private User receiver;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

}
