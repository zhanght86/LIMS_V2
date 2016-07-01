package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.base.DocumentHandler;
import com.boncontact.domain.ContractAudit;
import com.boncontact.domain.Project;
import com.boncontact.domain.Role;
import com.boncontact.domain.ServiceContract;
import com.boncontact.domain.User;
import com.boncontact.util.DateUtils;
import com.boncontact.util.StringSplitUtils;
import com.boncontact.util.moneyUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 合同评审Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("contractAudit")
public class ContractAuditAction extends BaseAction<ContractAudit> {
	private static final long serialVersionUID = -1101127286035135146L;
	private ContractAudit entity;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 批量删除的id */
	private String ids;
	/* 当前页码 */
	private int pageNum;
	/* 预览合同id */
	private Long viewId;
	/* 用来存放查询的条件 */
	private String queryStr;
	// 文件名，包括路径
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;

	/**
	 * 合同审核主界面Action
	 * 
	 * @return
	 */
	public String main() {
		Long id=(Long) ActionContext.getContext().getSession().get("userId");
		Role auditRole = userService.getById(id).getRole();
		System.out.println(auditRole.getId());
		List<Project> projectList = projectService
				.findAll(" WHERE contractAuditRole='" + auditRole.getId()
						+ "' AND sContractId!=null AND process=0");
		ActionContext.getContext().put("projectList", projectList);
		ActionContext.getContext().put("totalRecord", projectList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(projectList.size() / (double) pageRowCount));
		return "main";
	}

	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		Long id=(Long) ActionContext.getContext().getSession().get("userId");
		Role auditRole = userService.getById(id).getRole();
		List<Project> projectList = new ArrayList<Project>();
		if (queryStr != null) {
			String[] queryInfo = StringSplitUtils.splite(queryStr, ";");
			String query = "";
			String condition = "where ";
			String startTime = "";
			String endTime = "";
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
				query += (key + " like '%" + value + "%' and ");

			}
			if ((startTime != "") && (endTime != "")) {
				query += " createTime between '" + startTime + "' and '"
						+ endTime + "' and ";
			}
			if (query == "") {
				projectList = projectService
						.findAll(" WHERE contractAuditRole='"
								+ auditRole.getId()
								+ "'  AND sContractId!=null AND process=0");
			} else {
				projectList = projectService.findAll(condition + query
						+ " contractAuditRole='" + auditRole.getId()
						+ "'  AND sContractId!=null AND process=0");
			}
		}
		ActionContext.getContext().put("projectList", projectList);
		ActionContext.getContext().put("totalRecord", projectList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(projectList.size() / (double) pageRowCount));
		return "main";
	}

	public String viewSContract() {
		ServiceContract serviceContract = projectService.getById(viewId)
				.getsContractId();
		ActionContext.getContext().getValueStack().push(serviceContract);
		ActionContext.getContext().put("costUpper",
				moneyUtils.change(serviceContract.getCost()));

		return "viewSContract";
	}

	public String auditContract() {
		Project pj = projectService.getById(viewId);
		ActionContext.getContext().getValueStack().push(pj);
		ActionContext.getContext().put("wtdw", pj.getsContractId().getClient());
		return "auditContract";
	}

	public String viewPage() {
		Project pj = projectService.getById(viewId);
		if (pj != null) {
			ActionContext.getContext().getValueStack()
					.push(pj.getContractAudit());
		}
		return "viewPage";
	}

	public String delete() {
		try {
			Project pj = projectService.getById(viewId);
			ContractAudit audit = pj.getContractAudit();
			audit.setProject(null);
			contractAuditService.update(audit);
			pj.setContractAudit(null);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String flow() {
		try {
			System.out.println(viewId);
			Project pj = projectService.getById(viewId);
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			User user = userService.getById(id);
			if (pj.getContractAuditRole() == user.getRole()) {
				ContractAudit ca = pj.getContractAudit();
				if (ca != null) {
					if (ca.getContractSame() == 1
							&& ca.getResourceSatisfaction() == 1
							&& ca.getCustSatisfaction() == 1
							&& ca.getSubcontractUnit() == 1
							&& ca.getPaymentSatisfaction() == 1
							&& ca.getTimeSatisfaction() == 1) {
						// 审核通过
						pj.setProcess(1);
					} else {
						// 审核不通过
						pj.setProcess(-1);
						
					}
					projectService.update(pj);
					jsonResult = "{'info':'success'}";
				}
			} else {
				jsonResult = "{'info':'roleError'}";
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String audit() {
		try {
			Project pj = projectService.getById(viewId);
			entity.setId(null);
			entity.setProject(pj);
			pj.setContractAudit(entity);
			ServiceContract service = pj.getsContractId();
			Date now = new Date();
			service.setDeadLine(DateUtils.dateCount(now, service.getTimes()));
			serviceContractService.update(service);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 导出到Word文档中
	 * 
	 * @return
	 */
	public String export() {
		ActionContext ac = ActionContext.getContext();
		ServletContext sc = (ServletContext) ac
				.get(ServletActionContext.SERVLET_CONTEXT);
		String path = sc.getRealPath("/") + "\\files";
		File file = new File(path);
		if (!file.exists() && !file.isDirectory()) {
			file.mkdir();
		}
		Project pj = projectService.getById(viewId);
		System.out.println(viewId);
		entity = pj.getContractAudit();
		// pj.setProcess(1);
		String str = "<w:sym w:font='Wingdings 2' w:char='F052'/>";
		String str2 = "<w:sym w:font='Wingdings 2' w:char='F0A3'/>";
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("identify", pj.getContractId());
		dataMap.put("client", entity.getClient());
		dataMap.put("service", entity.getService());
		dataMap.put("context", entity.getContractContext());
		if (entity.getContractSame() == 1) {
			dataMap.put("issame1", str);
			dataMap.put("issame2", str2);
		} else {
			dataMap.put("issame1", str2);
			dataMap.put("issame2", str);
		}
		if (entity.getResourceSatisfaction() == 1) {
			dataMap.put("issatify1", str);
			dataMap.put("issatify2", str2);
		} else {
			dataMap.put("issatify1", str2);
			dataMap.put("issatify2", str);
		}
		if (entity.getCustSatisfaction() == 1) {
			dataMap.put("iscussaf1", str);
			dataMap.put("iscussaf2", str2);
		} else {
			dataMap.put("iscussaf1", str2);
			dataMap.put("iscussaf2", str);
		}
		if (entity.getSubpackage() == 1) {
			dataMap.put("ha1", str);
			dataMap.put("ha2", str2);
		} else {
			dataMap.put("ha1", str2);
			dataMap.put("ha2", str);
		}
		if (entity.getSubcontractUnit() == 1) {
			dataMap.put("ha3", str);
			dataMap.put("ha4", str2);
		} else {
			dataMap.put("ha3", str2);
			dataMap.put("ha4", str);
		}
		if (entity.getPaymentSatisfaction() == 1) {
			dataMap.put("money1", str);
			dataMap.put("money2", str2);
		} else {
			dataMap.put("money1", str2);
			dataMap.put("money2", str);
		}
		if (entity.getTimeSatisfaction() == 1) {
			dataMap.put("conf1", str);
			dataMap.put("conf2", str2);
		} else {
			dataMap.put("conf1", str2);
			dataMap.put("conf2", str);
		}
		dataMap.put("other", entity.getOther());
		dataMap.put("result", entity.getAuditResult());
		DocumentHandler dh = new DocumentHandler();
		dh.createDoc(dataMap, "contractAuditRecord.xml", path + "\\"
				+ pj.getsContractId().getIdentify() + "评审记录表.doc");
		fileName = path + "\\" + pj.getsContractId().getIdentify()
				+ "评审记录表.doc";
		realFileName = pj.getsContractId().getIdentify() + "评审记录表.doc";
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
	public ContractAudit getModel() {
		if (entity == null) {
			entity = new ContractAudit();
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

	public Long getViewId() {
		return viewId;
	}

	public void setViewId(Long viewId) {
		this.viewId = viewId;
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

}
