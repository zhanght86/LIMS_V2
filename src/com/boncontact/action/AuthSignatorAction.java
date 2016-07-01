package com.boncontact.action;

import java.util.List;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.AuthSignator;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

@Component("authSignator")
public class AuthSignatorAction extends BaseAction<AuthSignator> {
	private static final long serialVersionUID = -7833701496479093559L;
	private AuthSignator entity;
	private String jsonResult;
	private Long viewId;
	private String typeIds;
	private Long userId;

	public String main() {
		List<AuthSignator> signatorList = authSignatorService.findAll("");
		ActionContext.getContext().put("signatorList", signatorList);
		ActionContext.getContext().put("totalRecord", signatorList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(signatorList.size() / (double) pageRowCount));
		return "main";
	}

	public String addPage() {
		ActionContext.getContext().put("userList", userService.findAll(""));
		return "addPage";
	}

	public String add() {
		try {

			if (userId != null) {
				entity.setReportType(typeIds);
				entity.setUser(userService.getById(userId));
				authSignatorService.save(entity);
				jsonResult = "{'info':'success'}";
			} else {
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String delete() {
		try {
			if (viewId != null) {
				authSignatorService.delete(viewId);
				jsonResult = "{'info':'success'}";
			} else {
				jsonResult = "{'info':'failed'}";
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

	public Long getViewId() {
		return viewId;
	}

	public void setViewId(Long viewId) {
		this.viewId = viewId;
	}

	public String getTypeIds() {
		return typeIds;
	}

	public void setTypeIds(String typeIds) {
		this.typeIds = typeIds;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Override
	public AuthSignator getModel() {
		if (entity == null) {
			entity = new AuthSignator();
		}
		return entity;
	}
}
