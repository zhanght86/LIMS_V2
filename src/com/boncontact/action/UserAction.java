package com.boncontact.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.Encode;
import com.boncontact.domain.HistoryLogin;
import com.boncontact.domain.Role;
import com.boncontact.domain.User;
import com.boncontact.util.MD5Utils;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 用户管理Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("user")
public class UserAction extends BaseAction<User> {
	private static final long serialVersionUID = 1L;
	/* 用户实体 */
	private User entity;
	/* 批量删除的id */
	private String ids;
	/* 当前页码 */
	private int pageNum;
	/* 用来存放查询的条件 */
	private String queryStr;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 角色编号 */
	private Long roleId;
	/* 是否为选择界面 */
	private String chooseBtn;

	/**
	 * 用户管理主界面Action，“全部”按钮Action
	 * 
	 * @return
	 */
	public String main() {
		List<Role> roleList = roleService.findAll("");
		List<User> userList = userService.findAll("");
		ActionContext.getContext().put("roleList", roleList);
		ActionContext.getContext().put("userList", userList);
		ActionContext.getContext().put("totalRecord", userList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(userList.size() / (double) pageRowCount));
		return "main";
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<User> userList = new ArrayList<User>();
		List<Role> roleList = roleService.findAll("");
		if (queryStr != null) {
			String[] queryInfo = StringSplitUtils.splite(queryStr, ";");
			String query = "";
			String condition = "where ";
			String startTime = "";
			String endTime = "";
			System.out.println(queryStr);
			for (int i = 0; i < queryInfo.length; i++) {
				String key = StringSplitUtils.splite(queryInfo[i], "=")[0];
				String value = StringSplitUtils.splite(queryInfo[i], "=")[1];
				if (key.equalsIgnoreCase("entryTimeStart")) {
					startTime = value;
					continue;
				}
				if (key.equalsIgnoreCase("entryTimeEnd")) {
					endTime = value;
					continue;
				}
				if (i != queryInfo.length - 1) {
					query += (key + " like '%" + value + "%' and ");
				} else {
					if ((startTime != "") && (endTime != "")) {
						query += (key + " like '%" + value + "%' and ");
					} else {
						query += (key + " like '%" + value + "%'");
					}
				}
			}
			if ((startTime != "") && (endTime != "")) {
				query += " entryTime between '" + startTime + "' and '"
						+ endTime + "'";
			}
			if (query == "") {
				userList = userService.findAll("");
			} else {
				userList = userService.findAll(condition + query);
			}
		}
		ActionContext.getContext().put("roleList", roleList);
		ActionContext.getContext().put("userList", userList);
		ActionContext.getContext().put("totalRecord", userList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(userList.size() / (double) pageRowCount));
		if (chooseBtn != null && chooseBtn.equals("1")) {
			return "choose";
		}
		return "main";
	}

	/**
	 * 打开新增角色界面Action
	 * 
	 * @return
	 */
	public String addPage() {
		List<Role> roleList = roleService.findAll("");
		ActionContext.getContext().put("roleList", roleList);
		return "addPage";
	}

	/**
	 * 新增Action
	 * 
	 * @return
	 */
	public String add() {
		try {
			if (userService.getByIndetify(entity.getIdentify()) != null) {
				jsonResult = "{'info':'idError'}";
				return SUCCESS;
			}
			String value = PropertiesUtlis.getValue("/setting.properties",
					"initPassword");
			entity.setRole(roleService.getById(roleId));
			entity.setPassword(MD5Utils.GetMD5Code(value));
			userService.save(entity);
			jsonResult = "{'info':'success','initPWD':'" + value + "'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 打开修改角色界面Action
	 * 
	 * @return
	 */
	public String changePage() {
		User user = userService.getById(entity.getId());
		ActionContext.getContext().getValueStack().push(user);
		List<Role> roleList = roleService.findAll("");
		ActionContext.getContext().put("roleList", roleList);
		ActionContext.getContext().put("roleId", user.getRole().getId());
		return "changePage";
	}

	/**
	 * 修改Action
	 * 
	 * @return
	 */
	public String change() {
		entity.setRole(roleService.getById(roleId));
		userService.update(entity);
		jsonResult = "{'info':'用户修改成功！'}";
		return SUCCESS;
	}

	/**
	 * 带Radio按钮的查看
	 * 
	 * @return
	 */
	public String choosePage() {
		List<Role> roleList = roleService.findAll("");
		List<User> userList = userService.findAll("");
		ActionContext.getContext().put("roleList", roleList);
		ActionContext.getContext().put("userList", userList);
		ActionContext.getContext().put("totalRecord", userList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(userList.size() / (double) pageRowCount));
		return "choosePage";
	}

	/**
	 * 带CheckBox按钮的查看
	 * 
	 * 
	 * @return
	 */
	public String choosePageCheck() {
		List<Role> roleList = roleService.findAll("");
		List<User> userList = userService.findAll("");
		ActionContext.getContext().put("roleList", roleList);
		ActionContext.getContext().put("userList", userList);
		ActionContext.getContext().put("totalRecord", userList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(userList.size() / (double) pageRowCount));
		return "choosePageCheck";
	}

	/**
	 * 不带任何选择按钮的查看 可以根据角色查看，需要传入角色id:roleId
	 * 
	 * @return
	 */
	public String choosePageNoSelect() {
		System.out.println("执行到zhel");
		List<User> userList = userService.findAll(" WHERE role=" + roleId);
		ActionContext.getContext().put("userList", userList);
		ActionContext.getContext().put("totalRecord", userList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(userList.size() / (double) pageRowCount));
		return "choosePageNoSelect";
	}

	public String chooseAnalysisPage() {
		String value = PropertiesUtlis.getValue("/setting.properties", "syfxy");
		List<User> users = userService.findAll(" WHERE role=" + value);
		ActionContext.getContext().put("userList", users);
		return "chooseAnalysisPage";
	}

	/**
	 * 查看详情Action
	 * 
	 * @return
	 */
	public String viewPage() {
		ActionContext.getContext().getValueStack()
				.push(userService.getById(entity.getId()));
		return "viewPage";
	}

	/**
	 * 自动生成编号Action
	 * 
	 * @return
	 */
	public String autoCreate() {
		String value = PropertiesUtlis.getValue("/identifier.properties",
				"user");
		int index = 0;
		Encode temp = encodeService.getEncode();
		if (temp != null) {
			index = (int) (temp.getUserId() + 1);
			temp.setUserId(index);
			encodeService.update(temp);
		} else {
			index += 1;
		}
		String indexString = value + String.format("%04d", index);
		jsonResult = "{'identify':'" + indexString + "'}";
		return SUCCESS;
	}

	/**
	 * 删除Action
	 * 
	 * @return
	 */
	public String delete() {
		try{
			System.out.println("待删除的id为"+entity.getId());
		if (entity.getId() != null) {
			List<HistoryLogin> historyLoginList=historyLoginService.findAll("WHERE user="+entity.getId());
			for (HistoryLogin historyLogin : historyLoginList) {
				historyLoginService.delete(historyLogin.getId());
			}
			userService.delete(entity.getId());
			jsonResult = "{'info':'deleteSuccess'}";
		} else {
			jsonResult = "{'info':'deleteFailed'}";
		}
		}catch(Exception e){
			System.out.println(e.toString());
			jsonResult = "{'info':'deleteFailed'}";
		}
		return SUCCESS;
	}

	/**
	 * 批量删除Action
	 * 
	 * @return
	 */
	public String deleteAll() {
		String[] idList = StringSplitUtils.splite(ids, ";");
		for (int i = 0; i < idList.length; i++) {
			Long id = Long.parseLong(idList[i]);
			userService.delete(id);
			jsonResult = "{'info':'deleteSuccess'}";
		}
		return SUCCESS;
	}

	/**
	 * 重置密码Action
	 * 
	 * @return
	 */
	public String resetPWD() {
		String value = PropertiesUtlis.getValue("/setting.properties",
				"initPassword");
		if (value == null || entity.getId() == null) {
			jsonResult = "{'info':'resetError'}";
			return SUCCESS;
		}
		entity = userService.getById(entity.getId());
		entity.setPassword(MD5Utils.GetMD5Code(value));
		userService.update(entity);
		jsonResult = "{'info':'resetSuccess','pwd':'" + value + "'}";
		return SUCCESS;
	}

	/**
	 * 批量重置密码Action
	 * 
	 * @return
	 */
	public String resetAllPWD() {
		String value = PropertiesUtlis.getValue("/setting.properties",
				"initPassword");
		String[] idList = StringSplitUtils.splite(ids, ";");
		if (idList == null || value == null) {
			jsonResult = "{'info':'resetError'}";
			return SUCCESS;
		}
		for (int i = 0; i < idList.length; i++) {
			Long id = Long.parseLong(idList[i]);
			User user = userService.getById(id);
			user.setPassword(MD5Utils.GetMD5Code(value));
			userService.update(user);
		}
		jsonResult = "{'info':'resetSuccess','pwd':'" + value + "'}";
		return SUCCESS;
	}

	/**
	 * 分页Action
	 * 
	 * @return
	 */
	public String page() {
		jsonResult = "{'pageNum':'" + pageRowCount + "'}";
		return SUCCESS;
	}

	@Override
	public User getModel() {
		if (entity == null) {
			entity = new User();
		}
		return entity;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getChooseBtn() {
		return chooseBtn;
	}

	public void setChooseBtn(String chooseBtn) {
		this.chooseBtn = chooseBtn;
	}

}
