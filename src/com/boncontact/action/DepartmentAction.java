package com.boncontact.action;

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

@Component("department")
public class DepartmentAction extends BaseAction<Department> {
	private static final long serialVersionUID = 1L;
	/* 部门实体 */
	private Department entity;
	/* 批量删除的id */
	private String ids;
	/* 当前页码 */
	private int pageNum;
	/* 用来存放查询的条件 */
	private String queryStr;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 部门主管角色Id */
	private Long managerId;

	/**
	 * 部门管理主界面Action，“全部”按钮Action
	 * 
	 * @return
	 */
	public String main() {
		List<Department> departmentList = departmentService.findAll("");
		ActionContext.getContext().put("departmentList", departmentList);
		ActionContext.getContext().put("totalRecord", departmentList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(departmentList.size() / (double) pageRowCount));
		return "main";
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<Department> departmentList = new ArrayList<Department>();
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
				departmentList = departmentService.findAll("");
			} else {
				departmentList = departmentService.findAll(condition + query);
			}
		}
		ActionContext.getContext().put("departmentList", departmentList);
		ActionContext.getContext().put("totalRecord", departmentList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(departmentList.size() / (double) pageRowCount));
		return "main";
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
		return "addPage";
	}

	/**
	 * 打开修改角色界面Action
	 * 
	 * @return
	 */
	public String changePage() {
		Department department = departmentService.getById(entity.getId());
		if (department != null) {
			ActionContext.getContext().getValueStack().push(department);
		}
		return "changePage";
	}

	/**
	 * 自动生成编号Action
	 * 
	 * @return
	 */
	public String autoCreate() {
		String value = PropertiesUtlis.getValue("/identifier.properties",
				"department");
		int index = 10;
		Encode temp = encodeService.getEncode();
		if (temp != null) {
			index = (int) (temp.getDepartment() + 1);
			temp.setDepartment(index);
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
		if (departmentService.getByIndetify(entity.getIdentify()) != null) {
			jsonResult = "{'info':'对不起，该部门编号已经存在！'}";
			return SUCCESS;
		}
		try {
			System.out.println(entity);
			departmentService.save(entity);
			jsonResult = "{'info':'部门添加成功！'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'部门添加失败！请刷新后重新尝试'}";
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
			departmentService.update(entity);
			jsonResult = "{'info':'部门修改成功！'}";
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	/**
	 * 设置部门主管
	 * 
	 * @return
	 */
	public String giveManager() {
		try {
			entity = departmentService.getById(entity.getId());
			Role temp = roleService.getById(managerId);
			entity.setManager(temp);
			departmentService.update(entity);
			jsonResult = "{'info':'SUCCESS'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'ERROR'}";
		}
		return SUCCESS;
	}

	public String choosePage() {
		List<Department> departmentList = departmentService.findAll("");
		ActionContext.getContext().put("departmentList", departmentList);
		return "choosePage";
	}

	/**
	 * 删除Action
	 * 
	 * @return
	 */
	public String delete() {
		try {
			if (entity.getId() != null) {
				departmentService.delete(entity.getId());
				jsonResult = "{'info':'deleteSuccess'}";
			} else {
				jsonResult = "{'info':'deleteFailed'}";
			}
		} catch (Exception e) {
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
			departmentService.delete(id);
			jsonResult = "{'info':'deleteSuccess'}";
		}
		return SUCCESS;
	}

	@Override
	public Department getModel() {
		if (entity == null) {
			entity = new Department();
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

	public Long getManagerId() {
		return managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}

}
