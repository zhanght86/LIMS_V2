package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.base.DocumentHandler;
import com.boncontact.domain.AnalysisProject;
import com.boncontact.domain.ContractMonitoringItem;
import com.boncontact.domain.DeliveryReceitp;
import com.boncontact.domain.Department;
import com.boncontact.domain.Encode;
import com.boncontact.domain.NonSelfSendSample;
import com.boncontact.domain.Project;
import com.boncontact.domain.QualityControl;
import com.boncontact.domain.SelfSendSampleInfo;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

import freemarker.template.utility.StringUtil;

/**
 * 自送样登记Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("selfSendSampleInfo")
public class SelfSendSampleInfoAction extends BaseAction<SelfSendSampleInfo> {
	private static final long serialVersionUID = -1090598854543608287L;
	/* 自送样实体 */
	private SelfSendSampleInfo entity;
	/* id编号 */
	private Long viewId;
	/* JSON数据 */
	private String str;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 文件名，包括路径 */
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;
	private String analysisProjectId;
	private Long delId;
	private Long itemId;

	public String main() {
		List<Project> projectList = projectService
				.findAll(" WHERE process=2 AND gainSample=1");
		ActionContext.getContext().put("projectList", projectList);
		ActionContext.getContext().put("totalRecord", projectList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(projectList.size() / (double) pageRowCount));
		return "main";
	}

	public String addSample() {
		try {
			if (analysisProjectId != null && analysisProjectId != "") {
				String[] ids = StringSplitUtils.splite(analysisProjectId, ",");
				Set<AnalysisProject> projects = new HashSet<AnalysisProject>();
				for (int i = 0; i < ids.length; i++) {
					projects.add(analysisProjectService.getById(Long
							.parseLong(ids[i])));
				}
				entity.setAnalysisProjectSet(projects);
				if (viewId != null) {
					Project pj = projectService.getById(viewId);
					String type = pj.gettContractId().getProjectType();
					entity.setIdentify(AutoIdentify(type));
				} else {
					entity.setIdentify("");
				}

				selfSendSampleInfoService.save(entity);
				jsonResult = "{'info':'success','sampleId':'" + entity.getId()
						+ "','sampleIdentify':'" + entity.getIdentify() + "'}";
			} else {
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return "success";
	}

	public String delSample() {
		try {
			if (delId != null) {
				SelfSendSampleInfo info = selfSendSampleInfoService
						.getById(delId);
				info.setAnalysisProjectSet(null);
				selfSendSampleInfoService.update(info);
				selfSendSampleInfoService.delete(delId);
				jsonResult = "{'info':'success'}";
			} else {
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return "success";
	}

	public String addPage() {
		Project pj = projectService.getById(viewId);
		ActionContext.getContext().put("project", pj);
		if (pj.gettContractId() != null) {
			List<AnalysisProject> items = new ArrayList<AnalysisProject>();
			Set<ContractMonitoringItem> monitorItems = pj.gettContractId()
					.getItems();
			for (ContractMonitoringItem contractMonitoringItem : monitorItems) {
				if (!items
						.contains(contractMonitoringItem.getAnalysisProject())) {
					items.add(contractMonitoringItem.getAnalysisProject());
				}
			}
			ActionContext.getContext().put("items", items);
		} else {
			ActionContext.getContext().put("items",
					analysisProjectService.findAll(""));
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ActionContext.getContext().put("nowDate", sdf.format(new Date()));
		return "addPage";
	}

	public String choosePage() {
		List<SelfSendSampleInfo> selfSendSampleInfoList = selfSendSampleInfoService
				.findAll(" WHERE project =" + viewId + " AND deliver=0");
		ActionContext.getContext().put("selfSendSampleInfoList",
				selfSendSampleInfoList);
		return "choosePage";
	}

	public String receivePage() {
		Project pj = projectService.getById(viewId);
		List<SelfSendSampleInfo> selfSendSampleInfoList = new ArrayList<SelfSendSampleInfo>();
		Iterator<SelfSendSampleInfo> it = pj.getSelfSendSampleInfo().iterator();
		while (it.hasNext()) {
			selfSendSampleInfoList.add(it.next());
		}
		if (selfSendSampleInfoList.size() == 0) {
			ActionContext.getContext().put("client", "");
			ActionContext.getContext().put("date",
					selfSendSampleInfoList.get(0).getDate());
			ActionContext.getContext().put("userName",
					selfSendSampleInfoList.get(0).getUser().getName());
		} else {
			ActionContext.getContext().put("client",
					selfSendSampleInfoList.get(0).getClient());
			ActionContext.getContext().put("date",
					selfSendSampleInfoList.get(0).getDate());
			ActionContext.getContext().put("userName",
					selfSendSampleInfoList.get(0).getUser().getName());
		}
		Set<QualityControl> qualityControlList = pj.getQualityControlSet();
		ActionContext.getContext()
				.put("qualityControlList", qualityControlList);

		ActionContext.getContext().put("selfSendSampleInfoList",
				selfSendSampleInfoList);
		ActionContext.getContext().put("nextIndex",
				selfSendSampleInfoList.size());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ActionContext.getContext().put("nowDate", sdf.format(new Date()));
		ActionContext.getContext().put("project", pj);
		return "receivePage";
	}

	public String choosePageQuality() {
		Project pj = projectService.getById(viewId);
		Set<DeliveryReceitp> DeliveryReceitpSet = pj.getDeliveryReceitpInfo();
		Iterator<DeliveryReceitp> it = DeliveryReceitpSet.iterator();
		if (pj.getGainSample().equals("0")) {
			List<NonSelfSendSample> selfSendSampleInfoList = new ArrayList<NonSelfSendSample>();
			while (it.hasNext()) {
				DeliveryReceitp temp = it.next();
				Set<NonSelfSendSample> selfSendSampleInfoSet = temp
						.getNonSelfSendSampleInfo();
				Iterator<NonSelfSendSample> itSet = selfSendSampleInfoSet
						.iterator();
				while (itSet.hasNext()) {
					NonSelfSendSample si = itSet.next();
					if (!selfSendSampleInfoList.contains(si)) {
						selfSendSampleInfoList.add(si);
					}
				}
			}
			ActionContext.getContext().put("selfSendSampleInfoList",
					selfSendSampleInfoList);
		}
		if (pj.getGainSample().equals("1")) {
			List<SelfSendSampleInfo> selfSendSampleInfoList = new ArrayList<SelfSendSampleInfo>();
			AnalysisProject item = analysisProjectService.getById(itemId);
			while (it.hasNext()) {
				DeliveryReceitp temp = it.next();
				Set<SelfSendSampleInfo> selfSendSampleInfoSet = temp
						.getSelfSendSampleInfo();
				Iterator<SelfSendSampleInfo> itSet = selfSendSampleInfoSet
						.iterator();
				while (itSet.hasNext()) {
					SelfSendSampleInfo si = itSet.next();
					Set<AnalysisProject> analysisProjects = si
							.getAnalysisProjectSet();

					if (analysisProjects.contains(item)
							&& !selfSendSampleInfoList.contains(si)) {
						selfSendSampleInfoList.add(si);
					}
				}
			}
			ActionContext.getContext().put("selfSendSampleInfoList",
					selfSendSampleInfoList);
		}
		return "choosePage";
	}

	public String changePage() {
		Project pj = projectService.getById(viewId);
		ActionContext.getContext().put("project", pj);
		if (pj.gettContractId() != null) {
			List<AnalysisProject> items = new ArrayList<AnalysisProject>();
			Set<ContractMonitoringItem> monitorItems = pj.gettContractId()
					.getItems();
			if (monitorItems.size() != 0) {
				for (ContractMonitoringItem contractMonitoringItem : monitorItems) {
					if (!items.contains(contractMonitoringItem
							.getAnalysisProject())) {
						items.add(contractMonitoringItem.getAnalysisProject());
					}
				}
				ActionContext.getContext().put("items", items);
			}
		} else {
			ActionContext.getContext().put("items",
					analysisProjectService.findAll(""));
		}
		List<SelfSendSampleInfo> selfSendSampleInfoList = new ArrayList<SelfSendSampleInfo>();
		if (pj.getSelfSendSampleInfo().size() != 0) {
			Iterator<SelfSendSampleInfo> it = pj.getSelfSendSampleInfo()
					.iterator();
			while (it.hasNext()) {
				selfSendSampleInfoList.add(it.next());
			}
			ActionContext.getContext().put("selfSendSampleInfoList",
					selfSendSampleInfoList);
			ActionContext.getContext().put("client",
					selfSendSampleInfoList.get(0).getClient());
			ActionContext.getContext().put("userName",
					selfSendSampleInfoList.get(0).getUser().getName());
		} else {
			ActionContext.getContext().put("selfSendSampleInfoList", null);
			ActionContext.getContext().put("client",
					pj.getProjectBook().getClient());
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			ActionContext.getContext().put("userName",
					userService.getById(id).getName());
		}

		ActionContext.getContext().put("nextIndex",
				selfSendSampleInfoList.size());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ActionContext.getContext().put("nowDate", sdf.format(new Date()));

		return "changePage";
	}

	public String add() {
		try {
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			Set<SelfSendSampleInfo> selfSeSampleInfoSet = new LinkedHashSet<SelfSendSampleInfo>();
			String[] jsons = StringSplitUtils.splite(str, ",");
			System.out.println("[str]" + str);
			for (int i = 0; i < jsons.length; i++) {
				if (jsons[i] != null && jsons[i] != "") {
					SelfSendSampleInfo temp = selfSendSampleInfoService
							.getById(Long.parseLong(jsons[i]));
					temp.setClient(entity.getClient());
					temp.setDate(entity.getDate());
					temp.setUser(userService.getById(id));
					temp.setDeliver(0);
					selfSeSampleInfoSet.add(temp);
				}
			}
			Project pj = projectService.getById(viewId);
			pj.setSelfSendSampleInfo(selfSeSampleInfoSet);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
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
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			Set<SelfSendSampleInfo> selfSeSampleInfoSet = new LinkedHashSet<SelfSendSampleInfo>();
			String[] jsons = StringSplitUtils.splite(str, ",");
			for (int i = 0; i < jsons.length; i++) {
				if (jsons[i] != null) {
					SelfSendSampleInfo temp = selfSendSampleInfoService
							.getById(Long.parseLong(jsons[i]));
					temp.setClient(entity.getClient());
					temp.setDate(entity.getDate());
					temp.setUser(userService.getById(id));
					temp.setDeliver(0);
					selfSeSampleInfoSet.add(temp);
				}
			}
			Project pj = projectService.getById(viewId);
			pj.setSelfSendSampleInfo(selfSeSampleInfoSet);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 导出Action
	 * 
	 * @return
	 */
	public String export() {
		Project pj = projectService.getById(viewId);
		List<SelfSendSampleInfo> selfSendSampleInfoList = new ArrayList<SelfSendSampleInfo>();
		Iterator<SelfSendSampleInfo> it = pj.getSelfSendSampleInfo().iterator();
		while (it.hasNext()) {
			selfSendSampleInfoList.add(it.next());
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
		dataMap.put("selfSendSampleInfoList", selfSendSampleInfoList);
		if (selfSendSampleInfoList.size() == 0) {
			dataMap.put("client", "");
			dataMap.put("date", "");
			dataMap.put("user", "");
		} else {
			dataMap.put("client", selfSendSampleInfoList.get(0).getClient());
			dataMap.put("date", selfSendSampleInfoList.get(0).getDate());
			dataMap.put("user", selfSendSampleInfoList.get(0).getUser()
					.getName());
		}
		DocumentHandler dh = new DocumentHandler();
		dh.createDoc(dataMap, "selfSendSampleInfo.xml",
				path + "\\" + pj.getContractId() + "自送样登记表.doc");
		fileName = path + "\\" + pj.getContractId() + "自送样登记表.doc";
		realFileName = pj.getContractId() + "自送样登记表.doc";
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
	 * 删除Action
	 * 
	 * @return
	 */
	public String delete() {
		try {
			selfSendSampleInfoService.delete(viewId);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String deleteAll() {
		try {
			List<SelfSendSampleInfo> tempList = selfSendSampleInfoService
					.findAll("WHERE project=" + viewId);
			for (int i = 0; i < tempList.size(); i++) {
				Long id = tempList.get(i).getId();
				selfSendSampleInfoService.delete(id);
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String viewPage() {
		Project pj = projectService.getById(viewId);
		ActionContext.getContext().put("entity", pj);
		return "viewPage";
	}

	public String otherViewPage() {
		Project pj = projectService.getById(viewId);
		if (pj.getGainSample().equals("0")) {
			List<NonSelfSendSample> selfSendSampleInfoList = new ArrayList<NonSelfSendSample>();
			Iterator<NonSelfSendSample> it = pj.getNonSelfSendSampleInfo()
					.iterator();
			while (it.hasNext()) {
				selfSendSampleInfoList.add(it.next());
			}
			ActionContext.getContext().put("gainType", 0);
			ActionContext.getContext().put("date",
					selfSendSampleInfoList.get(0).getDate());
			ActionContext.getContext().put("userName",
					selfSendSampleInfoList.get(0).getUser().getName());
			ActionContext.getContext().put("selfSendSampleInfoList",
					selfSendSampleInfoList);
			ActionContext.getContext().put("nextIndex",
					selfSendSampleInfoList.size());
		}
		if (pj.getGainSample().equals("1")) {
			List<SelfSendSampleInfo> selfSendSampleInfoList = new ArrayList<SelfSendSampleInfo>();
			Iterator<SelfSendSampleInfo> it = pj.getSelfSendSampleInfo()
					.iterator();
			while (it.hasNext()) {
				selfSendSampleInfoList.add(it.next());
			}
			ActionContext.getContext().put("gainType", 1);
			ActionContext.getContext().put("client",
					selfSendSampleInfoList.get(0).getClient());
			ActionContext.getContext().put("date",
					selfSendSampleInfoList.get(0).getDate());
			ActionContext.getContext().put("userName",
					selfSendSampleInfoList.get(0).getUser().getName());
			ActionContext.getContext().put("selfSendSampleInfoList",
					selfSendSampleInfoList);
			ActionContext.getContext().put("nextIndex",
					selfSendSampleInfoList.size());
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ActionContext.getContext().put("nowDate", sdf.format(new Date()));
		return "otherViewPage";
	}

	/**
	 * 业务流转
	 * 
	 * @return
	 */
	public String flow() {
		try {
			Project pj = projectService.getById(viewId);
			if (pj.getInspectionSheet() != null
					&& pj.getDeliveryReceitpInfo() != null) {
				pj.setProcess(3);
				projectService.update(pj);
				jsonResult = "{'info':'success'}";
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
	 * 自动编号，编号格式为xxxx-xxx 2015-001，2015-002
	 * 
	 * @return
	 * @throws IOException
	 */
	public String AutoIdentify(String type) throws IOException {
		/*
		 * String first = PropertiesUtlis.getValue("/identifier.properties",
		 * "selfSendSample");
		 */
		String first = "";
		int index = 0;
		Encode temp = encodeService.getEncode();
		int history=0;
		
		switch (type) {
		case "验收监测":
			first="YSZ";
			history=temp.getYS();
			index = (int) (history + 1);
			temp.setYS(index);
			break;
		case "环评监测":
			first="HPZ";
			history=temp.getHP();
			index = (int) (history + 1);
			temp.setHP(index);
			break;
		case "委托监测":
			first="WTZ";
			history=temp.getWT();
			index = (int) (history + 1);
			temp.setWT(index);
			break;
		case "执法监测":
			first="ZFZ";
			history=temp.getZF();
			index = (int) (history + 1);
			temp.setZF(index);
			break;
		case "例行监测":
			first="LXZ";
			history=temp.getLX();
			index = (int) (history + 1);
			temp.setLX(index);
			break;
		case "应急监测":
			first="YJZ";
			history=temp.getYJ();
			index = (int) (history + 1);
			temp.setYJ(index);
			break;
		case "监督监测":
			first="JDZ";
			history=temp.getJD();
			index = (int) (history + 1);
			temp.setJD(index);
			break;
		default:
			first="Z";
			history=temp.getSelfSendSample();
			index = (int) (history + 1);
			temp.setSelfSendSample(index);
			break;
		}
		String indexString = first + String.format("%04d", index);
		return indexString;
	}

	public Long getViewId() {
		return viewId;
	}

	public void setViewId(Long viewId) {
		this.viewId = viewId;
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

	public String getAnalysisProjectId() {
		return analysisProjectId;
	}

	public void setAnalysisProjectId(String analysisProjectId) {
		this.analysisProjectId = analysisProjectId;
	}

	public Long getDelId() {
		return delId;
	}

	public void setDelId(Long delId) {
		this.delId = delId;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	@Override
	public SelfSendSampleInfo getModel() {
		if (entity == null) {
			entity = new SelfSendSampleInfo();
		}
		return entity;
	}
}
