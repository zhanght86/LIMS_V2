package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.base.DocumentHandler;
import com.boncontact.domain.ContractChange;
import com.boncontact.domain.DeliveryReceitp;
import com.boncontact.domain.Project;
import com.boncontact.domain.QualityControl;
import com.boncontact.domain.ServiceContract;
import com.boncontact.domain.TrafficContract;
import com.opensymphony.xwork2.ActionContext;

/**
 * 合同修改Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("contractChange")
public class ContractChangeAction extends BaseAction<ContractChange> {
	private static final long serialVersionUID = -7882738221032147917L;
	private ContractChange entity;
	private Long viewId;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private String query;
	private String changeStr;
	// 文件名，包括路径
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;

	public String main() {
		List<Project> project = projectService
				.findAll(" WHERE process>-2 AND process<11 AND sContractId is not null");
		ActionContext.getContext().put("projectList", project);

		return "main";
	}

	public String addPage() {
		Project pj = projectService.getById(viewId);
		ServiceContract sc = pj.getsContractId();
		if (sc != null) {
			ActionContext.getContext().put("sc", sc);
			ActionContext.getContext().put("pj", pj);
		}
		return "addPage";
	}

	public String add() {
		try {
			Project pj = projectService.getById(viewId);
			ServiceContract sc = pj.getsContractId();
			entity.setId(null);
			entity.setServiceContract(pj.getsContractId());
			entity.setChangeDate(new Date());
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			entity.setChanger(userService.getById(id));
			entity.setProject(pj);

			Set<ContractChange> contractChange = pj.getContractChange();
			contractChange.add(entity);
			if (entity.getReAudit() == 1) {
				// 不重新审核
				pj.setProcess(2);
			}
			if (entity.getReAudit() == 0) {
				// 重新审核
				pj.setProcess(0);
			}
			projectService.update(pj);
			System.out.println(query);
			if (query.equals("name")) {
				sc.setName(entity.getContext());
			}
			if (query.equals("context")) {
				sc.setContext(entity.getContext());
			}
			if (query.equals("clientResp")) {
				sc.setClientResp(entity.getContext());
			}
			if (query.equals("serviceResp")) {
				sc.setServiceResp(entity.getContext());
			}
			if (query.equals("times")) {
				sc.setTimes(Integer.parseInt(entity.getContext()));
			}
			if (query.equals("cost")) {
				sc.setCost(Double.parseDouble(entity.getContext()));
			}
			if (query.equals("client")) {
				sc.setClient(entity.getContext());
			}
			if (query.equals("clientAddress")) {
				sc.setClientAddress(entity.getContext());
			}
			if (query.equals("service")) {
				sc.setService(entity.getContext());
			}
			if (query.equals("serviceAddress")) {
				sc.setServiceAddress(entity.getContext());
			}
			if (query.equals("serviceTel")) {
				sc.setServiceTel(entity.getContext());
			}
			if (query.equals("serviceBank")) {
				sc.setServiceBank(entity.getContext());
			}
			if (query.equals("serviceCard")) {
				sc.setServiceCard(entity.getContext());
			}
			if (query.equals("bearUnit")) {
				sc.setBearUnit(entity.getContext());
			}
			if (query.equals("bearUnitAddress")) {
				sc.setBearUnitAddress(entity.getContext());
			}
			if (query.equals("bearUnitTel")) {
				sc.setBearUnitTel(entity.getContext());
			}
			if (query.equals("clientTel")) {
				sc.setClientTel(entity.getContext());
			}
			serviceContractService.update(sc);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String viewPage() {
		List<ContractChange> contractChangeList = contractChangeService
				.findAll(" WHERE project=" + viewId);
		ActionContext.getContext()
				.put("contractChangeList", contractChangeList);
		ActionContext.getContext()
				.put("totalRecord", contractChangeList.size());
		ActionContext.getContext().put(
				"totalPage",
				(int) Math.ceil(contractChangeList.size()
						/ (double) pageRowCount));
		return "viewPage";
	}

	public String viewDetailPage() {
		ContractChange contractChange = contractChangeService.getById(viewId);
		ActionContext.getContext().put("cc", contractChange);
		return "viewDetailPage";
	}

	public String export() {
		ContractChange contractChange = contractChangeService.getById(viewId);
		Project pj = contractChange.getProject();
		ActionContext ac = ActionContext.getContext();
		ServletContext sc = (ServletContext) ac
				.get(ServletActionContext.SERVLET_CONTEXT);
		String path = sc.getRealPath("/") + "\\files";
		File file = new File(path);
		if (!file.exists() && !file.isDirectory()) {
			file.mkdir();
		}
		String str = "<w:sym w:font='Wingdings 2' w:char='F052'/>";
		String str2 = "<w:sym w:font='Wingdings 2' w:char='F0A3'/>";
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("identify", pj.getContractId());
		dataMap.put("name", pj.getsContractId().getName());
		dataMap.put("signDate", pj.getCreateTime());
		dataMap.put("changeDate", contractChange.getChangeDate());
		dataMap.put("reason", contractChange.getReason());
		dataMap.put("context", contractChange.getContext());
		dataMap.put("is", contractChange.getReAudit() == 0 ? str : str2);
		dataMap.put("not", contractChange.getReAudit() == 1 ? str : str2);
		DocumentHandler dh = new DocumentHandler();
		dh.createDoc(dataMap, "changeContract.xml",
				path + "\\" +  pj.getContractId() + "合同（委托书）变更申请书.doc");
		fileName = path + "\\" + pj.getContractId() + "合同（委托书）变更申请书.doc";
		realFileName = pj.getContractId() + "合同（委托书）变更申请书.doc";
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

	public Long getViewId() {
		return viewId;
	}

	public void setViewId(Long viewId) {
		this.viewId = viewId;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getChangeStr() {
		return changeStr;
	}

	public void setChangeStr(String changeStr) {
		this.changeStr = changeStr;
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

	@Override
	public ContractChange getModel() {
		if (entity == null) {
			entity = new ContractChange();
		}
		return entity;
	}

}
