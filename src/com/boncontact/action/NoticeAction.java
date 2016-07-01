package com.boncontact.action;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.Department;
import com.boncontact.domain.Notice;
import com.boncontact.domain.User;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * @author 瞿龙俊
 * 
 */
@Component("notice")
public class NoticeAction extends BaseAction<Notice> {
	private static final long serialVersionUID = 2219959895391908980L;
	private Notice entity;
	/* 查询SQL */
	private String queryStr;
	/**
	 * 获取当前用户可查看的公告
	 */
	public String main() {
		List<Notice> noticeList = noticeService.findAll(" ORDER BY id DESC");
		Long id = (Long) ActionContext.getContext().getSession().get("userId");
		User user =userService.getById(id);
		Department department=user.getRole().getDepartment();
		Set<Notice> delNotice=new LinkedHashSet<Notice>();
		for (Notice notice : noticeList) {
			if(notice.getDepartment().size()!=0&&!notice.getDepartment().contains(department)){
				delNotice.add(notice);
			}
			if(notice.getReceive().size()!=0&&!notice.getReceive().contains(user)){
				delNotice.add(notice);
			}
		}
		if(delNotice.size()!=0){
			noticeList.removeAll(delNotice);
		}
		ActionContext.getContext().put("noticeList", noticeList);
		ActionContext.getContext().put("totalRecord", noticeList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(noticeList.size() / (double) pageRowCount));
		return "main";
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<Notice> noticeList = new ArrayList<Notice>();
		if (queryStr != null) {
			String[] queryInfo = StringSplitUtils.splite(queryStr, ";");
			String query = "";
			String condition = "where ";
			for (int i = 0; i < queryInfo.length; i++) {
				String key = StringSplitUtils.splite(queryInfo[i], "=")[0];
				String value = StringSplitUtils.splite(queryInfo[i], "=")[1];
				if (i != queryInfo.length - 1) {
					query += (key + " like '%" + value + "%' and ");
				} else {
					query += (key + " like '%" + value + "%'");
				}
			}
			query += " ORDER BY id DESC";
			if (query == "") {
				noticeList = noticeService.findAll(" ORDER BY id DESC");
				
			} else {
				noticeList = noticeService.findAll(condition + query);
			}
			Long id = (Long) ActionContext.getContext().getSession().get("userId");
			User user =userService.getById(id);
			Department department=user.getRole().getDepartment();
			Set<Notice> delNotice=new LinkedHashSet<Notice>();
			for (Notice notice : noticeList) {
				if(notice.getDepartment().size()!=0&&!notice.getDepartment().contains(department)){
					delNotice.add(notice);
				}
				if(notice.getReceive().size()!=0&&!notice.getReceive().contains(user)){
					delNotice.add(notice);
				}
			}
			if(delNotice.size()!=0){
				noticeList.removeAll(delNotice);
			}
		}
		ActionContext.getContext().put("noticeList", noticeList);
		ActionContext.getContext().put("totalRecord", noticeList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(noticeList.size() / (double) pageRowCount));
		return "main";
	}

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	@Override
	public Notice getModel() {
		if (entity == null) {
			entity = new Notice();
		}
		return entity;
	}

}
