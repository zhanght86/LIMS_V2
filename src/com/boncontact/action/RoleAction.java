package com.boncontact.action;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;
import com.boncontact.base.BaseAction;
import com.boncontact.domain.Department;
import com.boncontact.domain.Encode;
import com.boncontact.domain.Role;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 角色管理Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("role")
public class RoleAction extends BaseAction<Role> implements Serializable {
	private static final long serialVersionUID = 1L;
	/* 角色实体 */
	private Role entity = null;
	/* 批量删除的id */
	private String ids;
	/* 当前页码 */
	private int pageNum;
	/* 用来存放查询的条件 */
	private String queryStr;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 部门主管编号 */
	private Long departmentId;
	/* 是否为选择界面 */
	private String chooseBtn;

	/**
	 * 角色管理主界面Action，“全部”按钮Action
	 * 
	 * @return
	 */
	public String main() {
		List<Role> roleList = roleService.findAll("");
		ActionContext.getContext().put("roleList", roleList);
		ActionContext.getContext().put("totalRecord", roleList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(roleList.size() / (double) pageRowCount));
		return "main";
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<Role> roleList = new ArrayList<Role>();
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

			if (query == "") {
				roleList = roleService.findAll("");
			} else {
				roleList = roleService.findAll(condition + query);
			}
		}
		ActionContext.getContext().put("roleList", roleList);
		ActionContext.getContext().put("totalRecord", roleList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(roleList.size() / (double) pageRowCount));
		return "main";
	}

	public String choosePage() {
		List<Role> roleList = roleService.findAll(" WHERE department = "
				+ departmentId);
		ActionContext.getContext().put("roleList", roleList);
		ActionContext.getContext().put("totalRecord", roleList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(roleList.size() / (double) pageRowCount));
		return "choosePage";
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

	/**
	 * 打开新增角色界面Action
	 * 
	 * @return
	 */
	public String addPage() {
		List<Department> departmentList = departmentService.findAll("");
		ActionContext.getContext().put("departmentList", departmentList);
		return "addPage";
	}

	/**
	 * 打开修改角色界面Action
	 * 
	 * @return
	 */
	public String changePage() {
		Role role = roleService.getById(entity.getId());
		if (role != null) {
			ActionContext.getContext().getValueStack().push(role);
			ActionContext.getContext().put("departmentId",
					role.getDepartment().getId());
		}
		List<Department> departmentList = departmentService.findAll("");
		ActionContext.getContext().put("departmentList", departmentList);
		return "changePage";
	}

	/**
	 * 自动生成编号Action
	 * 
	 * @return
	 */
	public String autoCreate() {
		String value = PropertiesUtlis.getValue("/identifier.properties",
				"role");
		int index = 0;
		Encode temp = encodeService.getEncode();
		if (temp != null) {
			index = (int) (temp.getRole() + 1);
			temp.setRole(index);
			encodeService.update(temp);
		} else {
			index += 1;
		}
		String indexString = value + String.format("%04d", index);
		jsonResult = "{'identify':'" + indexString + "'}";
		return SUCCESS;
	}

	/**
	 * 新增Action
	 * 
	 * @return
	 */
	public String add() {
		if (roleService.getByIndetify(entity.getIdentify()) != null) {
			jsonResult = "{'info':'对不起，该角色编号已经存在！'}";
			return SUCCESS;
		}
		try {
			entity.setDepartment(departmentService.getById(departmentId));
			roleService.save(entity);
			jsonResult = "{'info':'角色添加成功！'}";
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return SUCCESS;
	}

	/**
	 * 修改Action
	 * 
	 * @return
	 */
	public String change() {
		try {
			entity.setDepartment(departmentService.getById(departmentId));
			roleService.update(entity);
			jsonResult = "{'info':'角色修改成功！'}";
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	/**
	 * 删除Action
	 * 
	 * @return
	 */
	public String delete() {
		if (entity.getId() != null) {
			roleService.delete(entity.getId());
			jsonResult = "{'info':'deleteSuccess'}";
		} else {
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
			roleService.delete(id);
			jsonResult = "{'info':'deleteSuccess'}";
		}
		return SUCCESS;
	}

	// =========================================GET/SET方法=======================================
	@Override
	public Role getModel() {
		if (entity == null) {
			entity = new Role();
		}
		return entity;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
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

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

	public String getChooseBtn() {
		return chooseBtn;
	}

	public void setChooseBtn(String chooseBtn) {
		this.chooseBtn = chooseBtn;
	}

}
