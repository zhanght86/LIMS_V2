package com.boncontact.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.Customer;
import com.boncontact.domain.Role;
import com.boncontact.domain.User;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 客户管理Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("customer")
public class CustomerAction extends BaseAction<Customer> {
	private static final long serialVersionUID = 1L;
	// 客户实体
	private Customer entity;
	/* 批量删除的id */
	private String ids;
	/* 当前页码 */
	private int pageNum;
	/* 用来存放查询的条件 */
	private String queryStr;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 是否为选择界面 */
	private String chooseBtn;

	/**
	 * 客户管理主界面Action，“全部”按钮Action
	 * 
	 * @return
	 */
	public String main() {
		List<Customer> customerList = customerService.findAll("");
		ActionContext.getContext().put("customerList", customerList);
		ActionContext.getContext().put("totalRecord", customerList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(customerList.size() / (double) pageRowCount));
		return "main";
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<Customer> customerList = new ArrayList<Customer>();
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
			try {
				if (query == "") {
					customerList = customerService.findAll("");
				} else {
					customerList = customerService.findAll(condition + query);
				}
				ActionContext.getContext().put("customerList", customerList);
				ActionContext.getContext().put("totalRecord",
						customerList.size());
				ActionContext.getContext().put(
						"totalPage",
						(int) Math.ceil(customerList.size()
								/ (double) pageRowCount));
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		if (chooseBtn != null && chooseBtn.equals("1")) {
			return "choose";
		}
		return "main";
	}

	public String choosePage() {
		List<Customer> customerList = customerService.findAll("");
		ActionContext.getContext().put("customerList", customerList);
		ActionContext.getContext().put("totalRecord", customerList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(customerList.size() / (double) pageRowCount));
		return "choosePage";
	}

	/**
	 * 打开新增页面Action
	 * 
	 * @return
	 */
	public String addPage() {
		return "addPage";
	}

	/**
	 * 打开修改页面Action
	 * 
	 * @return
	 */
	public String changePage() {
		Customer customer = customerService.getById(entity.getId());
		ActionContext.getContext().getValueStack().push(customer);
		return "changePage";
	}

	/**
	 * 新增操作Action
	 * 
	 * @return
	 */
	public String add() {
		if (customerService.getByIndetify(entity.getIdentify()) != null) {
			jsonResult = "{'info':'对不起，该客户编号已经存在！'}";
			return SUCCESS;
		}
		String value = PropertiesUtlis.getValue("/setting.properties",
				"initPassword");
		Role role = roleService.findCustomer();
		System.out.println(role);
		if (role != null) {
			entity.setRole(role);
		} else {
			jsonResult = "{'info':'客户添加失败！原因为：角色列表中尚未有“客户”角色'}";
			return SUCCESS;
		}
		entity.setPassword(value);
		System.out.println(entity);
		entity.setId(1L);
		try {
			customerService.save(entity);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		jsonResult = "{'info':'客户添加成功！'}";
		return SUCCESS;
	}

	/**
	 * 修改客户信息Action
	 * 
	 * @return
	 */
	public String change() {
		try {
			entity.setRole(roleService.getById(entity.getRole().getId()));
			customerService.update(entity);
			jsonResult = "{'info':'用户修改成功！'}";
		} catch (Exception e) {
			jsonResult = "{'info':'用户修改失败，请刷新之后再次尝试！'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	/**
	 * 查看客户信息Action
	 * 
	 * @return
	 */
	public String viewPage() {
		ActionContext.getContext().getValueStack()
				.push(customerService.getById(entity.getId()));
		return "viewPage";
	}

	/**
	 * 删除Action
	 * 
	 * @return
	 */
	public String delete() {
		try {
			customerService.delete(entity.getId());
			jsonResult = "{'info':'deleteSuccess'}";
		} catch (Exception e) {
			jsonResult = "{'info':'deleteFailed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	/**
	 * 批量删除Action
	 * 
	 * @return
	 */
	public String deleteAll() {
		try {
			String[] idList = StringSplitUtils.splite(ids, ";");
			for (int i = 0; i < idList.length; i++) {
				Long id = Long.parseLong(idList[i]);
				customerService.delete(id);
				jsonResult = "{'info':'deleteSuccess'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'deleteFailed'}";
			System.out.println(e.toString());
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
		try {
			entity = customerService.getById(entity.getId());
			entity.setPassword(value);
			customerService.update(entity);
			jsonResult = "{'info':'resetSuccess','pwd':'" + value + "'}";
		} catch (Exception e) {
			jsonResult = "{'info':'resetError'}";
			System.out.println(e.toString());
		}
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
		try {
			for (int i = 0; i < idList.length; i++) {
				Long id = Long.parseLong(idList[i]);
				Customer customer = customerService.getById(id);
				customer.setPassword(value);
				customerService.update(customer);
			}
			jsonResult = "{'info':'resetSuccess','pwd':'" + value + "'}";
		} catch (Exception e) {
			jsonResult = "{'info':'resetError'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	/**
	 * 自动生成编号Action
	 * 
	 * @return
	 */
	public String autoCreate() {
		String value = PropertiesUtlis.getValue("/identifier.properties",
				"customer");
		int index = 1;
		Customer temp = customerService.getAmount("");
		if (temp != null) {
			index = (int) (temp.getId() + 1);
		}
		String indexString = value + String.format("%04d", index);
		jsonResult = "{'identify':'" + indexString + "'}";
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
	public Customer getModel() {
		if (entity == null) {
			entity = new Customer();
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

	public String getChooseBtn() {
		return chooseBtn;
	}

	public void setChooseBtn(String chooseBtn) {
		this.chooseBtn = chooseBtn;
	}

}
