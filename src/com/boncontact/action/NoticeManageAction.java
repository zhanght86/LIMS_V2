package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;
import com.boncontact.base.BaseAction;
import com.boncontact.domain.Department;
import com.boncontact.domain.MessageQueue;
import com.boncontact.domain.Notice;
import com.boncontact.domain.User;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 公告管理（非系统公告界面）
 * 
 * @author 瞿龙俊
 * 
 */
@Component("noticeManage")
public class NoticeManageAction extends BaseAction<Notice> {
	private static final long serialVersionUID = -8126953590283149278L;
	private Notice entity;
	/* 新增时部门List */
	private String departmentId;
	/* 新增时用户List */
	private String userId;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* id */
	private Long viewId;
	/* 文件名，包括路径 */
	private String fileName;
	/* 真实文件名，不包括路径 */
	private String realFileName;
	/* 多选 */
	private String ids;
	/* 查询SQL */
	private String queryStr;

	public String main() {
		Long id = (Long) ActionContext.getContext().getSession().get("userId");
		List<Notice> noticeList = noticeService.findAll(" WHERE user=" + id
				+ " ORDER BY id DESC");
		ActionContext.getContext().put("noticeList", noticeList);
		ActionContext.getContext().put("totalRecord", noticeList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(noticeList.size() / (double) pageRowCount));
		return "main";
	}

	public String addPage() {
		return "addPage";
	}

	public String add() {
		try {
			List<User> messageUser = new ArrayList<User>();
			if (entity.getSendWay() == 0) {
				messageUser = userService.findAll("");
			}
			if (entity.getSendWay() == 1) {
				if (departmentId != "") {
					String[] departIds = StringSplitUtils.splite(departmentId,
							";");
					Set<Department> depSet = new LinkedHashSet<Department>();
					for (String id : departIds) {
						Department temp = departmentService.getById(Long
								.parseLong(id));
						List<User> users = userService
								.findAll(" WHERE c.role.department=" + id);
						messageUser.addAll(users);
						depSet.add(temp);
					}
					entity.setDepartment(depSet);

				}
			}
			if (entity.getSendWay() == 2) {
				if (userId != "") {
					String[] userIds = StringSplitUtils.splite(userId, ";");
					Set<User> userSet = new LinkedHashSet<User>();
					for (String id : userIds) {
						User temp = userService.getById(Long.parseLong(id));
						userSet.add(temp);
						messageUser.add(temp);
					}
					entity.setReceive(userSet);
				}

			}
			entity.setId(null);
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			entity.setUser(userService.getById(id));
			noticeService.save(entity);
			// 消息队列
			for (User user : messageUser) {
				MessageQueue queue = new MessageQueue();
				queue.setReceiver(user);
				queue.setType(0);
				queue.setMessage("您有一条新公告,请及时查看！");
				queue.setItemId(entity.getId());
				queue.setPushDate(new Date());
				queue.setFlag(0);
				messageQueueService.save(queue);
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
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
				query += (key + " like '%" + value + "%' and ");
			}

			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			query += " user =" + id + " ORDER BY id DESC";
			System.out.println(query);
			if (query == "") {
				noticeList = noticeService.findAll(" WHERE user=" + id
						+ " ORDER BY id DESC");
			} else {
				noticeList = noticeService.findAll(condition + query);
			}
		}
		ActionContext.getContext().put("noticeList", noticeList);
		ActionContext.getContext().put("totalRecord", noticeList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(noticeList.size() / (double) pageRowCount));
		return "main";
	}

	public String viewPage() {
		System.out.println(viewId);
		Notice notice = noticeService.getById(viewId);
		ActionContext.getContext().getValueStack().push(notice);
		return "viewPage";
	}

	public String deleteAll() {
		try {
			String[] idList = StringSplitUtils.splite(ids, ";");
			for (String id : idList) {
				noticeService.delete(Long.parseLong(id));
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	/**
	 * 下载附件Action
	 * 
	 * @return
	 */
	public String export() {
		try {
			Notice notice = noticeService.getById(viewId);
			fileName =ServletActionContext.getRequest().getRealPath(
					"/noticeFile") + notice.getPath();
			String[] paths = notice.getPath().split("/");
			realFileName = paths[paths.length - 1];
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "export";
	}

	/**
	 * Struts2需要提供的输入流
	 * 
	 * @return
	 * @throws Exception
	 */
	public InputStream getInputStream() throws Exception {
		File f = new File(fileName);
		return new FileInputStream(f);
	}

	public String delete() {
		try {
			if (viewId != null) {
				noticeService.delete(viewId);
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

	/**
	 * 下载的文档的名称
	 * 
	 * @return
	 */
	public String getDownloadFileName() {
		String downFileName = realFileName;
		try {
			downFileName = new String(downFileName.getBytes(), "ISO8859-1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return downFileName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRealFileName() {
		return realFileName;
	}

	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
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
