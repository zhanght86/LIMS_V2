package com.boncontact.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.Customer;
import com.boncontact.domain.Device;
import com.boncontact.domain.Role;
import com.boncontact.domain.User;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 设备管理Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("device")
public class DeviceAction extends BaseAction<Device> {
	/* 设备实体 */
	private static final long serialVersionUID = 1L;
	private Device entity;
	/* 批量删除的id */
	private String ids;
	/* 当前页码 */
	private int pageNum;
	/* 用来存放查询的条件 */
	private String queryStr;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 管理员编号 */
	private String adminId;
	/* 供应商编号 */
	private String supplierId;
	/* 保管员编号 */
	private String custodianId;

	public String main() {
		List<Device> deviceList = deviceService.findAll("");
		ActionContext.getContext().put("deviceList", deviceList);
		ActionContext.getContext().put("totalRecord", deviceList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(deviceList.size() / (double) pageRowCount));
		return "main";
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<Device> deviceList = new ArrayList<Device>();
		if (queryStr != null) {
			String[] queryInfo = StringSplitUtils.splite(queryStr, ";");
			String query = "";
			String condition = "where ";
			for (int i = 0; i < queryInfo.length; i++) {
				String key = StringSplitUtils.splite(queryInfo[i], "=")[0];
				String value = StringSplitUtils.splite(queryInfo[i], "=")[1];
				if (key.equals("admin")) {
					value = userService.getByIndetify(value).getId().toString();
				}
				if (key.equals("supplier")) {
					value = customerService.getByIndetify(value).getId()
							.toString();
				}
				if (i != queryInfo.length - 1) {
					query += (key + " like '%" + value + "%' and ");
				} else {
					query += (key + " like '%" + value + "%'");
				}
			}
			if (query == "") {
				deviceList = deviceService.findAll("");
			} else {
				deviceList = deviceService.findAll(condition + query);
			}
		}
		ActionContext.getContext().put("deviceList", deviceList);
		ActionContext.getContext().put("totalRecord", deviceList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(deviceList.size() / (double) pageRowCount));
		/*
		 * if (chooseBtn != null && chooseBtn.equals("1")) { return "choose"; }
		 */
		return "main";
	}

	/**
	 * 查看详情Action
	 * 
	 * @return
	 */
	public String viewPage() {
		System.out.println("执行到这了");
		ActionContext.getContext().getValueStack()
				.push(deviceService.getById(entity.getId()));
		return "viewPage";
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

	public String addPage() {
		return "addPage";
	}

	public String add() {
		if (deviceService.getByIndetify(entity.getIdentify()) != null) {
			jsonResult = "{'info':'idError'}";
			return SUCCESS;
		}
		if (userService.getByIndetify(adminId) == null) {
			jsonResult = "{'info':'adminError'}";
			return SUCCESS;
		}
		if (customerService.getByIndetify(supplierId) == null) {
			jsonResult = "{'info':'supplierError'}";
			return SUCCESS;
		}
		if (userService.getByIndetify(custodianId) == null) {
			jsonResult = "{'info':'custodianError'}";
			return SUCCESS;
		}
		try {
			entity.setAdmin(userService.getByIndetify(adminId));
			entity.setCustodian(userService.getByIndetify(custodianId));
			entity.setSupplier(customerService.getByIndetify(supplierId));
			deviceService.save(entity);
			jsonResult = "{'info':'SUCCESS'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'ERROR'}";
		}
		return SUCCESS;
	}

	/**
	 * 打开修改设备界面Action
	 * 
	 * @return
	 */
	public String changePage() {
		Device device = deviceService.getById(entity.getId());
		ActionContext.getContext().getValueStack().push(device);
		ActionContext.getContext().put("adminId", device.getAdmin().getId());
		ActionContext.getContext().put("supplierId",
				device.getSupplier().getId());
		ActionContext.getContext().put("custodianId",
				device.getCustodian().getId());
		return "changePage";
	}

	/**
	 * 修改Action
	 * 
	 * @return
	 */
	public String change() {
		try {
			System.out.println("adminId" + adminId);
			System.out.println("custodianId" + custodianId);
			System.out.println("supplier" + supplierId);
			entity.setAdmin(userService.getById(Long.parseLong(adminId)));
			entity.setCustodian(userService.getById(Long.parseLong(custodianId)));
			entity.setSupplier(customerService.getById(Long
					.parseLong(supplierId)));
			System.out.println(entity);
			deviceService.update(entity);
			System.out.println(entity);
			jsonResult = "{'info':'设备信息修改成功！'}";
		} catch (Exception e) {
			jsonResult = "{'info':'设备信息修改失败，请刷新后重新尝试！'}";
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
		try {
			deviceService.delete(entity.getId());
			jsonResult = "{'info':'deleteSuccess'}";
		} catch (Exception e) {
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
		try {
			String[] idList = StringSplitUtils.splite(ids, ";");
			for (int i = 0; i < idList.length; i++) {
				Long id = Long.parseLong(idList[i]);
				deviceService.delete(id);
				jsonResult = "{'info':'deleteSuccess'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'deleteSuccess'}";
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
				"device");
		int index = 1;
		Device temp = deviceService.getAmount("");
		if (temp != null) {
			index = (int) (temp.getId() + 1);
		}
		String indexString = value + String.format("%04d", index);
		jsonResult = "{'identify':'" + indexString + "'}";
		return SUCCESS;
	}

	@Override
	public Device getModel() {
		if (entity == null) {
			entity = new Device();
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

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getCustodianId() {
		return custodianId;
	}

	public void setCustodianId(String custodianId) {
		this.custodianId = custodianId;
	}

}
