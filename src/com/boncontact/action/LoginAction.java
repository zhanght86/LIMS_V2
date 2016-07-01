package com.boncontact.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.HistoryLogin;
import com.boncontact.domain.Power;
import com.boncontact.domain.Role;
import com.boncontact.domain.User;
import com.boncontact.util.MD5Utils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 登陆Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("login")
public class LoginAction extends BaseAction<User> {
	private static final long serialVersionUID = -8732722524753989249L;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private User entity;

	public String login() {
		try {
			if (entity.getIdentify() != null) {
				User loginUser = userService
						.getByIndetify(entity.getIdentify());
				if (loginUser == null) {
					jsonResult = "{'info':'noUser'}";
					return SUCCESS;
				} else {
					if (MD5Utils.GetMD5Code(entity.getPassword()).equals(loginUser.getPassword())) {
						ActionContext.getContext().getSession()
								.put("userId", loginUser.getId());
						Role loginRole = loginUser.getRole();
						Set<Power> powerSet = loginRole.getPowers();
						ActionContext.getContext().getSession()
								.put("powerList", powerSet);
						
						List<HistoryLogin> historyLoginList = historyLoginService
								.findAll(" WHERE state=0 AND user="
										+ loginUser.getId());
						for (HistoryLogin historyLogin : historyLoginList) {
							historyLogin.setState(1);
							historyLoginService.update(historyLogin);
						}
						HistoryLogin temp = new HistoryLogin();
						temp.setState(0);
						temp.setUser(loginUser);
						temp.setIp(ServletActionContext.getRequest()
								.getRemoteAddr());
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");
						temp.setStartDate(sdf.format(new Date()));
						historyLoginService.save(temp);
						jsonResult = "{'info':'success'}";
					} else {
						jsonResult = "{'info':'errorPassword'}";
					}
				}
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String forgetPage() {
		return "forgetPage";
	}
	
	public String updateHistory(){
		return "updateHistory";
	}
	
	public String about(){
		return "about";
	}

	public String viewPage() {
		Long id = (Long) ActionContext.getContext().getSession().get("userId");
		List<HistoryLogin> hisList = historyLoginService.findAll(" WHERE user="
				+ id + " AND state=1 ORDER BY id DESC");
		ActionContext.getContext().put("hisList", hisList);
		ActionContext.getContext().put("totalRecord", hisList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(hisList.size() / (double) pageRowCount));
		return "viewPage";
	}

	public String forget() {
		try {
			if (entity.getIdentify() != null) {
				User loginUser = userService
						.getByIndetify(entity.getIdentify());
				if (loginUser == null) {
					jsonResult = "{'info':'noUser'}";
				} else {
					if (entity.getName().equals(loginUser.getName())
							&& entity.getIdCard().equals(loginUser.getIdCard())) {
						loginUser.setPassword(entity.getPassword());
						userService.update(loginUser);
						jsonResult = "{'info':'success'}";
					} else {
						jsonResult = "{'info':'errorInfo'}";
					}
				}
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	@Override
	public User getModel() {
		if (entity == null) {
			entity = new User();
		}
		return entity;
	}

}
