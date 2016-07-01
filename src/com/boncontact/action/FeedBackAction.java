package com.boncontact.action;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.Feedback;

@Component("feedBack")
public class FeedBackAction extends BaseAction<Feedback> {
	private static final long serialVersionUID = -4629007417656864359L;
	private Feedback entity;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;

	public String main() {

		return "main";
	}

	public String addPage() {
		return "addPage";
	}

	public String add() {
		try {
			entity.setId(null);
			entity.setDate(new Date());
			entity.setRefer(0);
			feedBackService.save(entity);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
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
	public Feedback getModel() {
		if (entity == null) {
			entity = new Feedback();
		}
		return entity;
	}
}
