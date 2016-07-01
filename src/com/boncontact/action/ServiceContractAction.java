package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.base.DocumentHandler;
import com.boncontact.domain.Encode;
import com.boncontact.domain.Project;
import com.boncontact.domain.ServiceContract;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.moneyUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 服务合同Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("serviceContract")
public class ServiceContractAction extends BaseAction<ServiceContract> {
	private static final long serialVersionUID = 3627431459732864703L;
	// 服务合同实体
	private ServiceContract entity;
	// 文件名，包含路径
	private String fileName;
	// 文件名，不包含路径
	private String realFileName;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private Long viewId;

	/**
	 * 生成合同
	 * 
	 * @return
	 */
	public String createService() {
		ActionContext.getContext().getValueStack().push(entity);
		ActionContext.getContext().put("costUpper",
				moneyUtils.change(entity.getCost()));
		return "createService";
	}

	/**
	 * 保存合同
	 * 
	 * @return
	 */
	public String save() {
		try {
			entity.setIdentify(AutoIdentify());
			boolean result = serviceContractService.flow(entity);
			if (result) {
				jsonResult = "{'info':'success','identify':'"
						+ entity.getIdentify() + "'}";
			} else {
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 合同进入流程，创建项目
	 * 
	 * @return
	 */
	public String flow() {
		try {
			Project project = new Project();
			project.setContractId(entity.getIdentify());
			project.setsContractId(entity);
			project.setProcess(0);
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			project.setDraftsMan(userService.getById(id));
			project.setCreateTime(new Date());
			Long roleId = Long.parseLong(PropertiesUtlis.getValue(
					"/setting.properties", "contractAuditRole"));
			project.setContractAuditRole(roleService.getById(roleId));
			projectService.save(project);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 合同进入流程，创建项目
	 * 
	 * @return
	 */
	public String flowInto() {
		try {
			ServiceContract sc = serviceContractService.getById(viewId);
			Project project = new Project();
			project.setContractId(sc.getIdentify());
			project.setsContractId(sc);
			project.setProcess(0);
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			project.setDraftsMan(userService.getById(id));
			project.setCreateTime(new Date());
			Long roleId = Long.parseLong(PropertiesUtlis.getValue(
					"/setting.properties", "contractAuditRole"));
			project.setContractAuditRole(roleService.getById(roleId));
			projectService.save(project);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 自动生成编号，和业务合同共享
	 * 
	 * @return
	 * @throws IOException
	 */
	public String AutoIdentify() throws IOException {
		String first = PropertiesUtlis.getValue("/identifier.properties",
				"contractNum");
		int index = 0;
		Encode temp = encodeService.getEncode();
		if (temp != null) {
			index = (int) (temp.getContracId() + 1);
			temp.setContracId(index);
		} else {
			index += 1;
		}
		String indexString = first + String.format("%03d", index);

		return indexString;
	}

	/**
	 * 导出合同，导出到Word中
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
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("identify", entity.getIdentify());
		dataMap.put("name", entity.getName());
		dataMap.put("context", entity.getContext());
		dataMap.put("clientResp", entity.getClientResp());
		dataMap.put("serviceResp", entity.getServiceResp());
		dataMap.put("times", entity.getTimes());
		dataMap.put("costUpper", moneyUtils.change(entity.getCost()));
		dataMap.put("cost", entity.getCost());
		dataMap.put("client", entity.getClient());
		dataMap.put("clientAddress", entity.getClientAddress());
		dataMap.put("clientTel", entity.getClientTel());
		dataMap.put("service", entity.getService());
		dataMap.put("serviceAddress", entity.getServiceAddress());
		dataMap.put("serviceTel", entity.getServiceTel());
		dataMap.put("serviceBank", entity.getServiceBank());
		dataMap.put("serviceCard", entity.getServiceCard());
		dataMap.put("bearUnit", entity.getBearUnit());
		dataMap.put("bearUnitAddress", entity.getBearUnitAddress());
		dataMap.put("bearUnitTel", entity.getBearUnitTel());
		DocumentHandler dh = new DocumentHandler();
		dh.createDoc(dataMap, "serviceContract.xml",
				path + "\\" + entity.getIdentify() + ".doc");
		fileName = path + "\\" + entity.getIdentify() + ".doc";
		realFileName = entity.getIdentify() + ".doc";
		return "export";
	}

	public String exportSContract() {
		entity = serviceContractService.getById(viewId);
		ActionContext ac = ActionContext.getContext();
		ServletContext sc = (ServletContext) ac
				.get(ServletActionContext.SERVLET_CONTEXT);
		String path = sc.getRealPath("/") + "\\files";
		File file = new File(path);
		if (!file.exists() && !file.isDirectory()) {
			file.mkdir();
		}
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("identify", entity.getIdentify());
		dataMap.put("name", entity.getName());
		dataMap.put("context", entity.getContext());
		dataMap.put("clientResp", entity.getClientResp());
		dataMap.put("serviceResp", entity.getServiceResp());
		dataMap.put("times", entity.getTimes());
		dataMap.put("costUpper", moneyUtils.change(entity.getCost()));
		dataMap.put("cost", entity.getCost());
		dataMap.put("client", entity.getClient());
		dataMap.put("clientAddress", entity.getClientAddress());
		dataMap.put("clientTel", entity.getClientTel());
		dataMap.put("service", entity.getService());
		dataMap.put("serviceAddress", entity.getServiceAddress());
		dataMap.put("serviceTel", entity.getServiceTel());
		dataMap.put("serviceBank", entity.getServiceBank());
		dataMap.put("serviceCard", entity.getServiceCard());
		dataMap.put("bearUnit", entity.getBearUnit());
		dataMap.put("bearUnitAddress", entity.getBearUnitAddress());
		dataMap.put("bearUnitTel", entity.getBearUnitTel());
		DocumentHandler dh = new DocumentHandler();
		dh.createDoc(dataMap, "serviceContract.xml",
				path + "\\" + entity.getIdentify() + ".doc");
		fileName = path + "\\" + entity.getIdentify() + ".doc";
		realFileName = entity.getIdentify() + ".doc";
		return "exportSContract";
	}

	/**
	 * Struts2需要的输入流
	 * 
	 * @return
	 * @throws Exception
	 */
	public InputStream getInputStream() throws Exception {
		File f = new File(fileName);
		return new FileInputStream(f);
	}

	/**
	 * 下载的文件名
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

	// ===================================================GET/SET==========================================
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

	@Override
	public ServiceContract getModel() {
		if (entity == null) {
			entity = new ServiceContract();
		}
		return entity;
	}
}
