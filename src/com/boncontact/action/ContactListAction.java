package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.base.DocumentHandler;
import com.boncontact.domain.ContractMonitoringItem;
import com.boncontact.domain.Project;
import com.boncontact.domain.Report;
import com.boncontact.domain.ServiceContract;
import com.boncontact.domain.TrafficContract;
import com.boncontact.domain.User;
import com.boncontact.util.ContractWork;
import com.boncontact.util.StringSplitUtils;
import com.boncontact.util.moneyUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 合同列表Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("contractList")
public class ContactListAction extends BaseAction<Project> {
	private static final long serialVersionUID = 1222997912073385586L;
	/* 项目实体 */
	private Project entity;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 当前页码 */
	private int pageNum;
	/* 查看合同id */
	private Long viewId;
	/* 查询SQL */
	private String queryStr;
	/* 承办人编号 */
	private String containerIdentify;
	/* 合同类型0:业务合同，1：服务合同 */
	private int contractType;
	private String exportIds;
	/* 文件名，包括路径 */
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;
	public String main() {
		List<TrafficContract> trafficList = trafficContractService
				.findAll("ORDER BY identify DESC");
		ActionContext.getContext().put("trafficList", trafficList);
		ActionContext.getContext().put("totalRecord", trafficList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(trafficList.size() / (double) pageRowCount));
		return "main";
	}

	public String contractSList() {
		List<ServiceContract> serviceList = serviceContractService
				.findAll("ORDER BY identify DESC");
		ActionContext.getContext().put("serviceList", serviceList);
		ActionContext.getContext().put("totalRecord", serviceList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(serviceList.size() / (double) pageRowCount));
		return "contractSList";
	}

	/**
	 * 查询业务合同
	 * 
	 * @return
	 */
	public String query() {
		List<TrafficContract> trafficList = new ArrayList<TrafficContract>();
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
				if (key.equals("process")) {
					key = "project.process";
				}
				if (key.equals("contractors")) {
					key = "c.Contractors.identify";
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
				query += " deadLine between '" + startTime + "' and '"
						+ endTime + "'";
			}
			if (query == "") {
				trafficList = trafficContractService
						.findAll(" ORDER BY identify DESC");
			} else {
				trafficList = trafficContractService.findAll(condition + query
						+ " ORDER BY identify DESC");
			}
		}
		ActionContext.getContext().put("trafficList", trafficList);
		ActionContext.getContext().put("totalRecord", trafficList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(trafficList.size() / (double) pageRowCount));
		return "main";
	}

	/**
	 * 查询服务合同
	 * 
	 * @return
	 */
	public String queryS() {
		List<ServiceContract> serviceList = new ArrayList<ServiceContract>();
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
				if (key.equals("process")) {
					key = "project.process";
				}
				if (key.equals("contractors")) {
					key = "c.Contractors.identify";
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
				query += " deadLine between '" + startTime + "' and '"
						+ endTime + "'";
			}
			System.out.println(query);
			if (query == "") {
				serviceList = serviceContractService
						.findAll(" ORDER BY identify DESC");
			} else {
				serviceList = serviceContractService.findAll(condition + query
						+ " ORDER BY identify DESC");
			}
		}
		ActionContext.getContext().put("serviceList", serviceList);
		ActionContext.getContext().put("totalRecord", serviceList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(serviceList.size() / (double) pageRowCount));
		return "contractSList";
	}

	/**
	 * 查看业务合同Action
	 * 
	 * @return
	 */
	public String viewTContract() {
//		Project tempProject = projectService.getById(viewId);
//		TrafficContract traffic = trafficContractService.getById(tempProject
//				.gettContractId().getId());
//
//		ActionContext.getContext().put("costNum",
//				moneyUtils.change(traffic.getCost()));
//		ActionContext.getContext().getValueStack().push(traffic);
//		DateFormat df = DateFormat.getDateInstance();
//		ActionContext.getContext()
//				.put("data", df.format(traffic.getDeadLine()));
//		ActionContext.getContext().put("ContractorsName",
//				traffic.getContractors().getName());
//		ActionContext.getContext().put("items", traffic.getItems());
//		ActionContext.getContext()
//				.put("rowSpan", 6 + traffic.getItems().size());
		Project tempProject = projectService.getById(viewId);
		ActionContext.getContext().put("entity", tempProject.gettContractId());
		return "viewTContract";
	}

	public String viewProject() {
		if(viewId != null){
			Project pj = projectService.getById(viewId);
			ActionContext.getContext().put("pj", pj);
			ActionContext.getContext().getValueStack().push(pj);
		}
		return "viewProject";
	}

	/**
	 * 查看服务合同Action
	 * 
	 * @return
	 */
	public String viewSContract() {
		Project tempProject = projectService.getById(viewId);
		ServiceContract serviceContract = serviceContractService
				.getById(tempProject.getsContractId().getId());

		ActionContext.getContext().getValueStack().push(serviceContract);
		ActionContext.getContext().put("costUpper",
				moneyUtils.change(serviceContract.getCost()));
		return "viewSContract";
	}

	public String stopContract() {
		try {
			Project pj = new Project();
			if (contractType == 0) {
				pj = trafficContractService.getById(viewId).getProject();
			} else {
				if (contractType == 1) {
					pj = serviceContractService.getById(viewId).getProject();
				}
			}
			if (pj == null) {
				jsonResult = "{'info':'error'}";
				return SUCCESS;
			}
			pj.setProcess(-2);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'error'}";
		}
		return SUCCESS;
	}

	public String deleteContract() {
		try {
			if (viewId == null) {
				jsonResult = "{'info':'error'}";
				return SUCCESS;
			}
			if (contractType == 0) {
				trafficContractService.delete(viewId);
			} else {
				if (contractType == 1) {
					serviceContractService.delete(viewId);
				}
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'error'}";
		}
		return SUCCESS;
	}

	public String viewAudit() {
		System.out.println(viewId);
		return "viewAudit";
	}
	
	
	public String exportList(){
		try{
			List<ContractWork> contractList=new ArrayList<ContractWork>();
			List<TrafficContract> trafficContracts=new ArrayList<TrafficContract>();
			if(exportIds != null){
				String[] ids=StringSplitUtils.splite(exportIds, ";");
				for (String id : ids) {
					if(id!=null){
						trafficContracts.add(trafficContractService.getById(Long.parseLong(id)));
					}
				}
			}
			for (TrafficContract trafficContract : trafficContracts) {
				if(trafficContract!=null){
					ContractWork cw=new ContractWork();
					cw.setContractIdentify(trafficContract.getIdentify());
					Set<Report> reportSet=trafficContract.getProject().getReportSet();
					String reportIds="";
					for (Report report : reportSet) {
						reportIds+=report.getIdentify()+",";
					}
					cw.setReportId(reportIds==""?" ":reportIds);
					cw.setAddress(trafficContract.getCustomerAddress());
					cw.setClient(trafficContract.getCustomerName());
					Set<ContractMonitoringItem> items=trafficContract.getItems();
					String contractMonitoringItemIds="";
					for (ContractMonitoringItem contractMonitoringItem : items) {
						contractMonitoringItemIds+=contractMonitoringItem.getAnalysisProject().getName()+",";
					}
					cw.setItems(contractMonitoringItemIds);
					cw.setPeople(trafficContract.getCustomerPeople());
					cw.setTel(trafficContract.getCustomerTel());
					cw.setTime(trafficContract.getProject().getCreateTime().toString());
					cw.setPay(trafficContract.getCost()+"");
					contractList.add(cw);
				}	
			}
			ActionContext ac = ActionContext.getContext();
			ServletContext sc = (ServletContext) ac
					.get(ServletActionContext.SERVLET_CONTEXT);
			String path = sc.getRealPath("/") + "\\files";
			File file = new File(path);
			if (!file.exists() && !file.isDirectory()) {
				file.mkdir();
			}
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("contractList", contractList);
			DocumentHandler dh = new DocumentHandler();
			dh.createDoc(dataMap, "test.xml",
					path + "\\环境监测业务登记表.doc");
			fileName = path + "\\环境监测业务登记表.doc";
			realFileName = "环境监测业务登记表.doc";
		}catch(Exception e){
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
	public Project getModel() {
		if (entity == null) {
			entity = new Project();
		}
		return entity;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
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

	public String getContainerIdentify() {
		return containerIdentify;
	}

	public void setContainerIdentify(String containerIdentify) {
		this.containerIdentify = containerIdentify;
	}

	public int getContractType() {
		return contractType;
	}

	public void setContractType(int contractType) {
		this.contractType = contractType;
	}

	public String getExportIds() {
		return exportIds;
	}

	public void setExportIds(String exportIds) {
		this.exportIds = exportIds;
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
