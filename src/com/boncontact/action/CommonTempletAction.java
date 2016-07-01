package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.CommonTemplet;
import com.boncontact.domain.Department;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 通用模板Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("commonTemplet")
public class CommonTempletAction extends BaseAction<CommonTemplet> {
	private static final long serialVersionUID = 7837946734419749382L;
	/* 上传文件存放路径 */
	private final static String UPLOADDIR = "/commonTemplet";
	/* 通用模版实体 */
	private CommonTemplet entity;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 所属部门Ids */
	private String departmentId;
	// 文件名，包括路径
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;
	/* id */
	private Long viewId;
	/* 用来存放查询的条件 */
	private String queryStr;
	/* 批量删除的id */
	private String ids;
	/* 选择的类型 */
	private int type;

	/**
	 * 模板管理主界面
	 * 
	 * @return
	 */
	public String main() {
		List<CommonTemplet> commonTempletList = commonTempletService
				.findAll("");
		List<Department> departmentList = departmentService.findAll("");
		ActionContext.getContext().put("departmentList", departmentList);
		ActionContext.getContext().put("commonTempletList", commonTempletList);
		ActionContext.getContext().put("totalRecord", commonTempletList.size());
		ActionContext.getContext().put(
				"totalPage",
				(int) Math.ceil(commonTempletList.size()
						/ (double) pageRowCount));
		return "main";
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<CommonTemplet> commonTempletList = new ArrayList<CommonTemplet>();
		if (queryStr != null) {
			String[] queryInfo = StringSplitUtils.splite(queryStr, ";");
			String query = "";
			String condition = "where ";
			String middle = " inner join fetch c.useDepartment u ";
			int sign = 0;
			for (int i = 0; i < queryInfo.length; i++) {
				String key = StringSplitUtils.splite(queryInfo[i], "=")[0];
				String value = StringSplitUtils.splite(queryInfo[i], "=")[1];
				if (key == "u.id") {
					sign = 1;
				}
				if (i != queryInfo.length - 1) {
					if (key.equalsIgnoreCase("u.id")) {
						query += (key + " = " + value + " and ");
					} else {
						query += (key + " like '%" + value + "%' and ");
					}
				} else {
					if (key.equalsIgnoreCase("u.id")) {
						query += (key + " = " + value);
					} else {
						query += (key + " like '%" + value + "%'");
					}
				}
			}
			if (query == "") {
				commonTempletList = commonTempletService.findAll("");
			} else {
				commonTempletList = commonTempletService.findAll(middle
						+ condition + query+" Group by c.id");
			}
		}
		List<Department> departmentList = departmentService.findAll("");
		ActionContext.getContext().put("departmentList", departmentList);
		ActionContext.getContext().put("commonTempletList", commonTempletList);
		ActionContext.getContext().put("totalRecord", commonTempletList.size());
		ActionContext.getContext().put(
				"totalPage",
				(int) Math.ceil(commonTempletList.size()
						/ (double) pageRowCount));
		return "main";
	}

	public String choosePage() {
		System.out.println(type);
		if(type==0){
			//原始记录表-->部门：实验分析室
			String value = PropertiesUtlis.getValue("/setting.properties",
					"syfxs");
			List<CommonTemplet> commonTempletList = commonTempletService
					.findAll(" inner join fetch c.useDepartment u where u.id="+value);
			ActionContext.getContext().put("commonTempletList", commonTempletList);
			ActionContext.getContext().put("totalRecord", commonTempletList.size());
			ActionContext.getContext().put(
					"totalPage",
					(int) Math.ceil(commonTempletList.size()
							/ (double) pageRowCount));
		}
		return "choosePage";
	}

	/**
	 * 新增页面Action
	 * 
	 * @return
	 */
	public String addPage() {
		List<Department> departmentList = departmentService.findAll("");
		ActionContext.getContext().put("departmentList", departmentList);
		return "addPage";
	}

	/**
	 * 新增Action
	 * 
	 * @return
	 */
	public String add() {
		Set<Department> department = new LinkedHashSet<Department>();
		try {
			if (departmentId != null) {
				String[] ids = StringSplitUtils.splite(departmentId, ";");
				for (int i = 0; i < ids.length; i++) {
					Long id = Long.parseLong(ids[i]);
					department.add(departmentService.getById(id));
				}
			}
			entity.setUseDepartment(department);
			commonTempletService.save(entity);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
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
			System.out.println(viewId);
			commonTempletService.delete(viewId);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String deleteAll() {
		try {
			String[] idList = StringSplitUtils.splite(ids, ";");
			for (int i = 0; i < idList.length; i++) {
				Long id = Long.parseLong(idList[i]);
				commonTempletService.delete(id);
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
		}
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

	/**
	 * 下载记录表Action
	 * 
	 * @return
	 */
	public String export() {
		try {
			CommonTemplet ct = commonTempletService.getById(viewId);
			fileName = ServletActionContext.getRequest().getRealPath(
					"/commonTemplet")+ct.getPath();
			String[] paths = ct.getPath().split("/");
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

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	@Override
	public CommonTemplet getModel() {
		if (entity == null) {
			entity = new CommonTemplet();
		}
		return entity;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
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

	public Long getViewId() {
		return viewId;
	}

	public void setViewId(Long viewId) {
		this.viewId = viewId;
	}

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
