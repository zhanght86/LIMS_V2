package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.base.DocumentHandler;
import com.boncontact.domain.AnalysisProject;
import com.boncontact.domain.ContractMonitoringItem;
import com.boncontact.domain.Encode;
import com.boncontact.domain.Project;
import com.boncontact.domain.TrafficContract;
import com.boncontact.domain.User;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.StringSplitUtils;
import com.boncontact.util.moneyUtils;
import com.opensymphony.xwork2.ActionContext;


/**
 * 业务合同Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("contract")
public class ContractAction extends BaseAction<TrafficContract> {
	private static final long serialVersionUID = 6514609820794261133L;
	// 业务合同实体
	private TrafficContract entity;
	// 文件名，包括路径
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;
	// 承办人编号
	private String ContractorsId;
	// 项目列表JSON
	private String str;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private Long analysisCategoryId;
	private Long viewId;
	/**
	 * 打开填写合同页面
	 * 
	 * @return
	 * @throws IOException
	 */
	public String addPage() throws IOException {
		ActionContext.getContext().put("identify", "请先保存合同！");
		Long id=(Long) ActionContext.getContext().getSession().get("userId");
		User contractors = userService.getById(id);
		ActionContext.getContext().put("ContractorsId", contractors.getName());
		ActionContext.getContext().put("analysisCategory", analysisCategoryService.findAll(""));
		ActionContext.getContext().put("analysisFrequency", analysisFrequencyService.findAll(""));
		return "addPage";
	}

	/**
	 * 保存合同
	 * 
	 * @return
	 */
	public String save() {
		try {
			entity.setIdentify(AutoIdentify());
			boolean result = trafficContractService.flow(entity);
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
	
	public String template() throws IOException{
		Set<ContractMonitoringItem> contractItems = new HashSet<ContractMonitoringItem>();
		String[] strList = StringSplitUtils.splite(str, ";");
		for (int i = 0; i < strList.length; i++) {
			String[] items = StringSplitUtils.splite(strList[i], ",");
			ContractMonitoringItem contractItem = new ContractMonitoringItem();
			for (int j = 0; j < items.length; j++) {
				String item = items[j];
				String[] temp = StringSplitUtils.splite(item, ":");
				String key = StringSplitUtils.splite(item, ":")[0];
				String value = "";
				if (temp.length == 2) {
					value = StringSplitUtils.splite(item, ":")[1];
				}
				if (key.equalsIgnoreCase("environmentElement")) {
					contractItem.setAnalysisCategory(analysisCategoryService.getById(Long.parseLong(value)));
				}
				if (key.equalsIgnoreCase("siteNum")) {
					if (value != "") {
						contractItem.setSiteNum(Integer.parseInt(value));
					} else {
						contractItem.setSiteNum(0);
					}
				}
				if (key.equalsIgnoreCase("project")) {
					contractItem.setAnalysisProject(analysisProjectService.getById(Long.parseLong(value)));
				}
				if (key.equalsIgnoreCase("frequency")) {
					contractItem.setAnalysisFrequency(analysisFrequencyService.getById(Long.parseLong(value)));
				}
				if (key.equalsIgnoreCase("other")) {
					contractItem.setOther(value);
				}
			}
			contractItems.add(contractItem);
		}
		Long userId=(Long) ActionContext.getContext().getSession().get("userId");
		User contractors = userService.getById(userId);
		entity.setId(null);
		entity.setContractors(contractors);
		entity.setItems(contractItems);
		entity.setIdentify(AutoIdentify());
		trafficContractService.save(entity);
		ActionContext.getContext().put("entity", entity);
		return "template";
	}

	/**
	 * 生成合同
	 * 
	 * @return
	 */
	public String create() {
		Set<ContractMonitoringItem> contractItems = new HashSet<ContractMonitoringItem>();
		String[] strList = StringSplitUtils.splite(str, ";");
		for (int i = 0; i < strList.length; i++) {
			String[] items = StringSplitUtils.splite(strList[i], ",");
			ContractMonitoringItem contractItem = new ContractMonitoringItem();
			for (int j = 0; j < items.length; j++) {
				String item = items[j];
				String[] temp = StringSplitUtils.splite(item, ":");
				String key = StringSplitUtils.splite(item, ":")[0];
				String value = "";
				if (temp.length == 2) {
					value = StringSplitUtils.splite(item, ":")[1];
				}
				if (key.equalsIgnoreCase("environmentElement")) {
					contractItem.setAnalysisCategory(analysisCategoryService.getById(Long.parseLong(value)));
				}
				if (key.equalsIgnoreCase("siteNum")) {
					if (value != "") {
						contractItem.setSiteNum(Integer.parseInt(value));
					} else {
						contractItem.setSiteNum(0);
					}
				}
				if (key.equalsIgnoreCase("project")) {
					contractItem.setAnalysisProject(analysisProjectService.getById(Long.parseLong(value)));
				}
				if (key.equalsIgnoreCase("frequency")) {
					contractItem.setAnalysisFrequency(analysisFrequencyService.getById(Long.parseLong(value)));
				}
				if (key.equalsIgnoreCase("other")) {
					contractItem.setOther(value);
				}

			}
			contractItems.add(contractItem);
		}
		TrafficContract temp = entity;
		ActionContext.getContext().put("costNum",
				moneyUtils.change(entity.getCost()));
		ActionContext.getContext().put("costNumSmall",entity.getCost());
		ActionContext.getContext().getValueStack().push(temp);
		DateFormat df = DateFormat.getDateInstance();
		ActionContext.getContext().put("cost", "123456");
		ActionContext.getContext().put("data", df.format(temp.getDeadLine()));
		Long userId=(Long) ActionContext.getContext().getSession().get("userId");
		User contractors = userService.getById(userId);
		entity.setContractors(contractors);
		ActionContext.getContext()
				.put("ContractorsName", contractors.getName());
		temp.setItems(contractItems);
		entity.setItems(contractItems);
		ActionContext.getContext().put("items", contractItems);
		ActionContext.getContext().put("rowSpan", 6 + contractItems.size());
		return "create";
	}
	
	
	public String analysisCategory(){
		System.out.println(analysisCategoryId);
		List<AnalysisProject> analysisProjects=analysisProjectService.findAll(" WHERE analysisCategory="+analysisCategoryId);
		JSONArray json=JSONArray.fromObject(analysisProjects);
		System.out.println(json);
		jsonResult = "{'info':'success','list':"+json+"}";
		return "success";
	}

	/**
	 * 自动编号，编号格式为xxxx-xxx 2015-001，2015-002
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
		String indexString = first +"-"+ String.format("%03d", index);

		return indexString;
	}

	/**
	 * 进入流程：根据合同创建项目，进入流程
	 * 
	 * @return
	 */
	public String flow() {
		try {
			System.out.println("Get to here");
			List<Project> projectList=projectService.findAll(" WHERE tContractId="+viewId);
			if(projectList.size()!=0){
				jsonResult = "{'info':'container'}";
				return SUCCESS;
			}
			entity=trafficContractService.getById(viewId);
			Project project = new Project();
			project.setContractId(entity.getIdentify());
			project.settContractId(entity);
			project.setProcess(1);
			project.setDraftsMan(entity.getContractors());
			project.setCreateTime(new Date());
			projectService.save(project);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}
	/**
	 * 进入流程：根据合同创建项目，进入流程
	 * 
	 * @return
	 */
	public String flowInto() {
		try {
			TrafficContract tContract=trafficContractService.getById(viewId);
			Project project = new Project();
			project.setContractId(tContract.getIdentify());
			project.settContractId(tContract);
			project.setProcess(1);
			project.setDraftsMan(tContract.getContractors());
			project.setCreateTime(new Date());
			projectService.save(project);
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
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("identify", entity.getIdentify());
		dataMap.put("customerName", entity.getCustomerName());
		dataMap.put("customerCode", entity.getCustomerCode());
		dataMap.put("customerAddress", entity.getCustomerAddress());
		dataMap.put("customerTel", entity.getCustomerTel());
		dataMap.put("customerPeople", entity.getCustomerPeople());
		dataMap.put("customerFax", entity.getCustomerFax());
		dataMap.put("projectName", entity.getProjectName());
		dataMap.put("projectAim", entity.getProjectAim());
		dataMap.put("projectType", entity.getProjectType());
		if (entity.getProjectWay() == 0) {
			dataMap.put("projectWay", "以我单位通过计量认证、国家实验室认可的方法进行检测");
		} else {
			dataMap.put("projectWay", "客户指定的方法：" + entity.getProjectWayText());
		}

		dataMap.put("subpackageName", entity.getSubpackageName());
		dataMap.put("subProject", entity.getSubProject());
		dataMap.put("paymentWay", entity.getPaymentWay());
		DateFormat df = DateFormat.getDateInstance();
		dataMap.put("deadLine", df.format(entity.getDeadLine()));
		dataMap.put("cost", moneyUtils.change(entity.getCost()));
		dataMap.put("costSmall",entity.getCost());
		if (entity.getInRoom() == 0) {
			dataMap.put("inRoom", "不");
		} else {
			dataMap.put("inRoom", "");
		}
		if (entity.getSecrecy() == 0) {
			dataMap.put("secrecy", "不");
		} else {
			dataMap.put("secrecy", "");
		}
		dataMap.put("other", entity.getOther());
		dataMap.put("entrusted", entity.getEntrusted());
		dataMap.put("entrustedCode", entity.getEntrustedCode());
		dataMap.put("entrustedAddress", entity.getEntrustedAddress());
		dataMap.put("entrustedTel", entity.getEntrustedTel());
		dataMap.put("contractors", "张三");
		dataMap.put("entrustedFax", entity.getEntrustedFax());
		dataMap.put("items", entity.getItems());
		DocumentHandler dh = new DocumentHandler();
		dh.createDoc(dataMap, "trafficContract.xml",
				path + "\\" + entity.getIdentify() + ".doc");
		fileName = path + "\\" + entity.getIdentify() + ".doc";
		realFileName = entity.getIdentify() + ".doc";
		return "export";
	}
	
	/**
	 * 导出到Word文档中
	 * 
	 * @return
	 */
	public String exportTContract() {
		entity=trafficContractService.getById(viewId);
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
		dataMap.put("customerName", entity.getCustomerName());
		dataMap.put("customerCode", entity.getCustomerCode());
		dataMap.put("customerAddress", entity.getCustomerAddress());
		dataMap.put("customerTel", entity.getCustomerTel());
		dataMap.put("customerPeople", entity.getCustomerPeople());
		dataMap.put("customerFax", entity.getCustomerFax());
		dataMap.put("projectName", entity.getProjectName());
		dataMap.put("projectAim", entity.getProjectAim());
		dataMap.put("projectType", entity.getProjectType());
		if (entity.getProjectWay() == 0) {
			dataMap.put("projectWay", "以我单位通过计量认证、国家实验室认可的方法进行检测");
		} else {
			dataMap.put("projectWay", "客户指定的方法：" + entity.getProjectWayText());
		}

		dataMap.put("subpackageName", entity.getSubpackageName());
		dataMap.put("subProject", entity.getSubProject());
		dataMap.put("paymentWay", entity.getPaymentWay());
		DateFormat df = DateFormat.getDateInstance();
		dataMap.put("deadLine", df.format(entity.getDeadLine()));
		dataMap.put("cost", moneyUtils.change(entity.getCost()));
		dataMap.put("costSmall",entity.getCost());
		if (entity.getInRoom() == 0) {
			dataMap.put("inRoom", "不");
		} else {
			dataMap.put("inRoom", "");
		}
		if (entity.getSecrecy() == 0) {
			dataMap.put("secrecy", "不");
		} else {
			dataMap.put("secrecy", "");
		}
		dataMap.put("other", entity.getOther());
		dataMap.put("entrusted", entity.getEntrusted());
		dataMap.put("entrustedCode", entity.getEntrustedCode());
		dataMap.put("entrustedAddress", entity.getEntrustedAddress());
		dataMap.put("entrustedTel", entity.getEntrustedTel());
		dataMap.put("contractors", "张三");
		dataMap.put("entrustedFax", entity.getEntrustedFax());
		dataMap.put("items", entity.getItems());
		DocumentHandler dh = new DocumentHandler();
		dh.createDoc(dataMap, "trafficContract.xml",
				path + "\\" + entity.getIdentify() + ".doc");
		fileName = path + "\\" + entity.getIdentify() + ".doc";
		realFileName = entity.getIdentify() + ".doc";
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

	// =====================================================GET/SET================================================
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

	public String getContractorsId() {
		return ContractorsId;
	}

	public void setContractorsId(String contractorsId) {
		ContractorsId = contractorsId;
	}

	@Override
	public TrafficContract getModel() {
		if (entity == null) {
			entity = new TrafficContract();
		}
		return entity;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
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

	public Long getAnalysisCategoryId() {
		return analysisCategoryId;
	}

	public void setAnalysisCategoryId(Long analysisCategoryId) {
		this.analysisCategoryId = analysisCategoryId;
	}
	
	

}
