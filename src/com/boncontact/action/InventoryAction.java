package com.boncontact.action;

import java.util.ArrayList;
import java.util.List;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.Inventory;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

@Component("inventory")
public class InventoryAction extends BaseAction<Inventory> {
	private static final long serialVersionUID = 2650845381002139358L;
	/* 库存商品实体 */
	private Inventory entity;
	/* 批量删除的id */
	private String ids;
	/* 当前页码 */
	private int pageNum;
	/* 用来存放查询的条件 */
	private String queryStr;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 预警值修改方式 */
	private int changeWay;
	/* 预警修改值或者函数 */
	private String changeText;

	public String main() {
		List<Inventory> inventoryList = inventoryService.findAll("");
		ActionContext.getContext().put("inventoryList", inventoryList);
		ActionContext.getContext().put("totalRecord", inventoryList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(inventoryList.size() / (double) pageRowCount));
		return "main";
	}

	public String addPage() {
		return "addPage";
	}

	public String add() {
		if (deviceService.getByIndetify(entity.getIdentify()) != null) {
			jsonResult = "{'info':'idError'}";
			return SUCCESS;
		}
		System.out.println(entity);
		try {
			inventoryService.save(entity);
			jsonResult = "{'info':'SUCCESS'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'ERROR'}";
		}
		return SUCCESS;
	}

	/**
	 * 打开修改角色界面Action
	 * 
	 * @return
	 */
	public String changePage() {
		try {
			Inventory inventory = inventoryService.getById(entity.getId());
			ActionContext.getContext().getValueStack().push(inventory);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "changePage";
	}

	/**
	 * 修改Action
	 * 
	 * @return
	 */
	public String change() {
		try {
			inventoryService.update(entity);
			jsonResult = "{'info':'商品信息修改成功！'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'error'}";
		}
		return SUCCESS;
	}

	/**
	 * 修改预警下限值
	 * 
	 * @return
	 */
	public String changeLower() {
		try {
			String[] idList = StringSplitUtils.splite(ids, ";");
			for (int i = 0; i < idList.length; i++) {
				Long id = Long.parseLong(idList[i]);
				Inventory temp = inventoryService.getById(id);
				double oldValue = temp.getLowerValue();
				double result = 0.0;
				if (changeWay == 0) {
					result =Long.parseLong(changeText);
				}
				if (changeWay == 1) {
					ScriptEngineManager manager = new ScriptEngineManager();
					ScriptEngine se = manager.getEngineByName("js");
					String countWay = changeText.replaceAll("x",
							Double.toString(oldValue));
					result = (double) se.eval(countWay);
				}
				temp.setLowerValue(result);
				inventoryService.update(temp);
				jsonResult = "{'info':'SUCCESS'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'ERROR'}";
		}
		return SUCCESS;
	}
	
	
	/**
	 * 查看详情Action
	 * 
	 * @return
	 */
	public String viewPage() {
		ActionContext.getContext().getValueStack()
				.push(inventoryService.getById(entity.getId()));
		return "viewPage";
	}

	/**
	 * 调整警戒值
	 * 
	 * @return
	 */
	public String changeParam() {
		return "changeParam";
	}

	/**
	 * 删除Action
	 * 
	 * @return
	 */
	public String delete() {
		try {
			inventoryService.delete(entity.getId());
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
				inventoryService.delete(id);
				jsonResult = "{'info':'deleteSuccess'}";
			}
		} catch (Exception e) {
			jsonResult = "{'info':'deleteSuccess'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<Inventory> inventoryList = new ArrayList<Inventory>();
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
			System.out.println(query);
			if (query == "") {
				inventoryList = inventoryService.findAll("");
			} else {
				inventoryList = inventoryService.findAll(condition + query);
			}
		}
		ActionContext.getContext().put("inventoryList", inventoryList);
		ActionContext.getContext().put("totalRecord", inventoryList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(inventoryList.size() / (double) pageRowCount));
		return "main";
	}

	/**
	 * 自动生成编号Action
	 * 
	 * @return
	 */
	public String autoCreate() {
		String value = PropertiesUtlis.getValue("/identifier.properties",
				"inventory");
		int index = 1;
		Inventory temp = inventoryService.getAmount("");
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
	public Inventory getModel() {
		if (entity == null) {
			entity = new Inventory();
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

	public int getChangeWay() {
		return changeWay;
	}

	public void setChangeWay(int changeWay) {
		this.changeWay = changeWay;
	}

	public String getChangeText() {
		return changeText;
	}

	public void setChangeText(String changeText) {
		this.changeText = changeText;
	}

}
