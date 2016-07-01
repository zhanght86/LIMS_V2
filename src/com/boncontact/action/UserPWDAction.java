package com.boncontact.action;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.User;
import com.boncontact.util.MD5Utils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 用户密码管理Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("userPWD")
public class UserPWDAction extends BaseAction<User> {
	private static final long serialVersionUID = 1L;
	/* 用户实体 */
	private User entity;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private String oldPWD;

	public String main() {
		Long id = (Long) ActionContext.getContext().getSession().get("userId");
		User user = userService.getById(id);
		ActionContext.getContext().put("identify", user.getIdentify());
		return "main";
	}
	
	public String changePage() {
		Long id = (Long) ActionContext.getContext().getSession().get("userId");
		User user = userService.getById(id);
		ActionContext.getContext().put("identify", user.getIdentify());
		return "changePage";
	}

	public String changePWD() {
		User user = userService.getById((Long) ActionContext.getContext()
				.getSession().get("userId"));
		if (MD5Utils.GetMD5Code(oldPWD).equals(user.getPassword())) {
			user.setPassword(MD5Utils.GetMD5Code(entity.getPassword()));
			userService.update(user);
			jsonResult = "{'info':'success'}";
		} else {
			jsonResult = "{'info':'pwdError'}";
		}
		return SUCCESS;
	}


	public String getOldPWD() {
		return oldPWD;
	}

	public void setOldPWD(String oldPWD) {
		this.oldPWD = oldPWD;
	}

	@Override
	public User getModel() {
		if (entity == null) {
			entity = new User();
		}
		return entity;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

}
