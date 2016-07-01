package com.boncontact.util;


import com.boncontact.base.BaseAction;
import com.boncontact.domain.Encode;
import com.boncontact.domain.User;

/**
 * 初始化的时候使用
 * 
 * @author 瞿龙俊
 * @param <T>
 * 
 */
public class InitExecute extends BaseAction<User> {
	private static final long serialVersionUID = 6995346711356078905L;

	public static void main(String[] args) {
		InitExecute init=new InitExecute();
		init.encode();
	}

	/**
	 * 初始化流水号
	 * 
	 * @return
	 */
	public void encode() {
		Encode ecode = new Encode();
		ecode.setUserId(0);
		ecode.setContracId(0);
		ecode.setSelfSendSample(0);
		ecode.setNonSelfSendSample(0);
		ecode.setAirReport(0);
		ecode.setVoiceReport(0);
		ecode.setWaterReport(0);
		ecode.setSoilReport(0);
		ecode.setSmokeReport(0);
		ecode.setNonSelfSendSamplePre("A");
		ecode.setDepartment(0);
		ecode.setRole(0);
		encodeService.save(ecode);
	}
}
