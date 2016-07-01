package com.boncontact.action;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.jws.soap.SOAPBinding.Use;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.Department;
import com.boncontact.domain.HistoryLogin;
import com.boncontact.domain.MessageListen;
import com.boncontact.domain.MessageQueue;
import com.boncontact.domain.Notice;
import com.boncontact.domain.Power;
import com.boncontact.domain.User;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 主界面Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("mainPage")
public class MainAction extends BaseAction<User> {
	private static final long serialVersionUID = -497410458646569800L;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private String listenObj;

	public String main() {

		return "main";
	}

	public String left() {
		Long id = (Long) ActionContext.getContext().getSession().get("userId");
		if (id != null) {
			User user = userService.getById(id);
			Set<Power> powerSet = user.getRole().getPowers();
			String identifyList = "";
			for (Power power : powerSet) {
				identifyList += power.getIdentify() + ",";
			}
			ActionContext.getContext().put("user", user);
			ActionContext.getContext().put("identifyList", identifyList);
		}
		return "left";
	}

	public String top() {
		Long id = (Long) ActionContext.getContext().getSession().get("userId");
		if (id != null) {
			User user = userService.getById(id);
			ActionContext.getContext().put("user", user);
		}
		return "top";
	}

	public String outLogin() {
		try {
			ActionContext.getContext().getSession().remove("userId");
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String login() {
		return "login";
	}

	public String highEdit() {
		return "highEdit";
	}

	public String limitPower() {
		return "limitPower";
	}

	public String listen() {
		return "listen";
	}

	public String showMessageQueue() {
		Long id = (Long) ActionContext.getContext().getSession().get("userId");
		List<MessageQueue> messageQueueList = messageQueueService
				.findAll(" WHERE flag=0 AND receiver = " + id + " ORDER BY id DESC");
		ActionContext.getContext().put("messageQueueList", messageQueueList);
		return "showMessageQueue";
	}

	public String index() {
		Long id = (Long) ActionContext.getContext().getSession().get("userId");
		if (id != null) {
			User user = userService.getById(id);

			List<Notice> noticeList = noticeService
					.findAll(" ORDER BY id DESC");
			Department department = user.getRole().getDepartment();
			Set<Notice> delNotice = new LinkedHashSet<Notice>();
			for (Notice notice : noticeList) {
				if (notice.getDepartment().size() != 0
						&& !notice.getDepartment().contains(department)) {
					delNotice.add(notice);
				}
				if (notice.getReceive().size() != 0
						&& !notice.getReceive().contains(user)) {
					delNotice.add(notice);
				}
			}
			if (delNotice.size() != 0) {
				noticeList.removeAll(delNotice);
			}
			List<Notice> viewNotice = new ArrayList<Notice>();
			viewNotice = noticeList;
			if (noticeList.size() >= 8) {
				viewNotice = noticeList.subList(0, 8);
			}
			ActionContext.getContext().put("user", user);
			ActionContext.getContext().getValueStack().push(user);
			ActionContext.getContext().put("noticeList", viewNotice);
			HistoryLogin historyLogin = historyLoginService.getLastLogin(id);
			if (historyLogin != null) {
				ActionContext.getContext().put("historyLogin", historyLogin);
			}
		}
		return "index";
	}

	public String listenSetting() {
		try {
			Long userId = (Long) ActionContext.getContext().getSession()
					.get("userId");
			User user = userService.getById(userId);
			listenObj = listenObj + ",";
			String[] ids = StringSplitUtils.splite(listenObj.replace(" ", "")
					.trim(), ",");
			for (String id : ids) {
				MessageListen ml = new MessageListen();
				ml.setReceiver(user);
				ml.setType(Long.parseLong(id));
				messageListenService.save(ml);
			}
			jsonResult = "{'info':'success'}";
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

	public String getListenObj() {
		return listenObj;
	}

	public void setListenObj(String listenObj) {
		this.listenObj = listenObj;
	}

}
