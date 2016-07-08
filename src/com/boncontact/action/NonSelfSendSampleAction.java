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
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 非自送样Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("nonSelfSendSample")
public class NonSelfSendSampleAction extends BaseAction<NonSelfSendSample> {
	private static final long serialVersionUID = -1465883043456327026L;
	private NonSelfSendSample entity;
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
	private String dateTime;

	public String main() {
		List<Project> projectList = projectService
				.findAll(" WHERE process=2 AND gainSample=0");
		ActionContext.getContext().put("projectList", projectList);
		ActionContext.getContext().put("totalRecord", projectList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(projectList.size() / (double) pageRowCount));
		return "main";
	}

	public String addSample() {
		try {
			if (viewId != null && analysisProjectId != null
					&& analysisProjectId != "") {
				Project pj = projectService.getById(viewId);
				String[] ids = StringSplitUtils.splite(analysisProjectId, ",");
				Set<AnalysisProject> projects = new HashSet<AnalysisProject>();
				for (int i = 0; i < ids.length; i++) {
					projects.add(analysisProjectService.getById(Long
							.parseLong(ids[i])));
				}
				entity.setAnalysisProjectSet(projects);
				if (pj != null) {
					String type = pj.gettContractId().getProjectType();
					entity.setIdentify(AutoIdentify(type));
				} else {
					entity.setIdentify("");
				}
				Set<NonSelfSendSample> nonSelfSendSamples = pj
						.getNonSelfSendSampleInfo();
				entity.setId(null);
				nonSelfSendSampleService.save(entity);
				nonSelfSendSamples.add(entity);
				pj.setNonSelfSendSampleInfo(nonSelfSendSamples);
				projectService.update(pj);
				// nonSelfSendSampleService.save(entity);
				jsonResult = "{'info':'success','sampleId':'" + entity.getId()
						+ "','sampleIdentify':'" + entity.getIdentify() + "'}";
			} else {
				System.out.println("analysisProjectId不存在");
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
			if (viewId != null) {
				nonSelfSendSampleService.delete(viewId);
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

		Set<NonSelfSendSample> nonSelfSendSamples = pj
				.getNonSelfSendSampleInfo();
		ActionContext.getContext()
				.put("nowDate",
						nonSelfSendSamples.iterator().hasNext() ? sdf
								.format(nonSelfSendSamples.iterator().next()
										.getDate() == null ? new Date()
										: nonSelfSendSamples.iterator().next()
												.getDate()) : sdf
								.format(new Date()));
		ActionContext.getContext().put("selfSendSampleInfoList",
				nonSelfSendSamples);
		return "addPage";
	}

	public String add() {
		try {
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			Project pj = projectService.getById(viewId);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Set<NonSelfSendSample> nonSelfSendSamples = pj
					.getNonSelfSendSampleInfo();
			for (NonSelfSendSample nonSelfSendSample : nonSelfSendSamples) {
				nonSelfSendSample.setDate(sdf.parse(dateTime));
				nonSelfSendSample.setUser(userService.getById(id));
			}
			pj.setNonSelfSendSampleInfo(nonSelfSendSamples);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
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
		List<NonSelfSendSample> nonSelfSendSampleInfoList = new ArrayList<NonSelfSendSample>();
		if (pj.getNonSelfSendSampleInfo().size() != 0) {
			Iterator<NonSelfSendSample> it = pj.getNonSelfSendSampleInfo()
					.iterator();
			while (it.hasNext()) {
				nonSelfSendSampleInfoList.add(it.next());
			}
			ActionContext.getContext().put("selfSendSampleInfoList",
					nonSelfSendSampleInfoList);
			ActionContext.getContext().put(
					"userName",
					nonSelfSendSampleInfoList.get(0).getUser() == null ? ""
							: nonSelfSendSampleInfoList.get(0).getUser()
									.getName());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			ActionContext.getContext().put(
					"nowDate",
					nonSelfSendSampleInfoList.get(0).getDate() == null ? ""
							: sdf.format(nonSelfSendSampleInfoList.get(0)
									.getDate()));
		} else {
			ActionContext.getContext().put("selfSendSampleInfoList", null);
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			ActionContext.getContext().put("userName",
					userService.getById(id).getName());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			ActionContext.getContext().put("nowDate", sdf.format(new Date()));
		}

		ActionContext.getContext().put("nextIndex",
				nonSelfSendSampleInfoList.size());
		return "changePage";
	}

	public String receivePage() {
		Project pj = projectService.getById(viewId);
		List<NonSelfSendSample> nonSelfSendSampleInfoList = new ArrayList<NonSelfSendSample>();
		Iterator<NonSelfSendSample> it = pj.getNonSelfSendSampleInfo()
				.iterator();
		while (it.hasNext()) {
			nonSelfSendSampleInfoList.add(it.next());
		}
		if (nonSelfSendSampleInfoList.size() != 0) {
			ActionContext.getContext().put("date",
					nonSelfSendSampleInfoList.get(0).getDate());
			ActionContext.getContext().put("userName",
					nonSelfSendSampleInfoList.get(0).getUser().getName());
			ActionContext.getContext().put("nowDate",
					nonSelfSendSampleInfoList.get(0).getDate());
		} else {
			ActionContext.getContext().put("date", new Date());
			ActionContext.getContext().put("userName", "");
			ActionContext.getContext().put("nowDate", new Date());
		}
		Set<QualityControl> qualityControlList = pj.getQualityControlSet();
		ActionContext.getContext()
				.put("qualityControlList", qualityControlList);
		ActionContext.getContext().put("selfSendSampleInfoList",
				nonSelfSendSampleInfoList);
		ActionContext.getContext().put("nextIndex",
				nonSelfSendSampleInfoList.size());

		ActionContext.getContext().put("project", pj);
		return "receivePage";
	}

	/**
	 * 删除Action
	 * 
	 * @return
	 */
	public String delete() {
		try {
			nonSelfSendSampleService.delete(viewId);
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
			Set<NonSelfSendSample> selfSeSampleInfoSet = new LinkedHashSet<NonSelfSendSample>();
			String[] jsons = StringSplitUtils.splite(str, ",");
			for (int i = 0; i < jsons.length; i++) {
				if (jsons[i] != null) {
					System.out.println(jsons[i]);
					NonSelfSendSample temp = nonSelfSendSampleService
							.getById(Long.parseLong(jsons[i]));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					temp.setDate(sdf.parse(dateTime));
					temp.setUser(userService.getById(id));
					temp.setDeliver(0);
					selfSeSampleInfoSet.add(temp);
				}
			}
			Project pj = projectService.getById(viewId);
			pj.setNonSelfSendSampleInfo(selfSeSampleInfoSet);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String deleteAll() {
		try {
			List<NonSelfSendSample> tempList = nonSelfSendSampleService
					.findAll("WHERE project=" + viewId);
			for (int i = 0; i < tempList.size(); i++) {
				Long id = tempList.get(i).getId();
				nonSelfSendSampleService.delete(id);
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

	public String choosePage() {
		List<NonSelfSendSample> nonSelfSendSampleInfoList = nonSelfSendSampleService
				.findAll(" WHERE project =" + viewId + " AND deliver=0");
		ActionContext.getContext().put("nonSelfSendSampleInfoList",
				nonSelfSendSampleInfoList);
		return "choosePage";
	}

	/**
	 * 导出Action
	 * 
	 * @return
	 */
	public String export() {
		Project pj = projectService.getById(viewId);
		List<NonSelfSendSample> nonSelfSendSampleInfoList = new ArrayList<NonSelfSendSample>();
		Iterator<NonSelfSendSample> it = pj.getNonSelfSendSampleInfo()
				.iterator();
		while (it.hasNext()) {
			nonSelfSendSampleInfoList.add(it.next());
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
		dataMap.put("nonSelfSendSampleInfoList", nonSelfSendSampleInfoList);
		dataMap.put("date", nonSelfSendSampleInfoList.get(0).getDate());
		dataMap.put("userName", nonSelfSendSampleInfoList.get(0).getUser()
				.getName());
		DocumentHandler dh = new DocumentHandler();
		dh.createDoc(dataMap, "nonSelfSendSample.xml",
				path + "\\" + pj.getContractId() + "现场采样登记表.doc");
		fileName = path + "\\" + pj.getContractId() + "现场采样登记表.doc";
		realFileName = pj.getContractId() + "现场采样登记表.doc";
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
	 * 自动编号，编号格式为A0001~A1999 B0001~B1999
	 * 
	 * @return
	 * @throws IOException
	 */
	public String AutoIdentify(String type) throws IOException {
		String first = "";
		int index = 0;
		Encode temp = encodeService.getEncode();
		int history = 0;

		switch (type) {
		case "验收监测":
			first = "YSA";
			history = temp.getYS();
			index = (int) (history + 1);
			temp.setYS(index);
			break;
		case "环评监测":
			first = "HPA";
			history = temp.getHP();
			index = (int) (history + 1);
			temp.setHP(index);
			break;
		case "委托监测":
			first = "WTA";
			history = temp.getWT();
			index = (int) (history + 1);
			temp.setWT(index);
			break;
		case "执法监测":
			first = "ZFA";
			history = temp.getZF();
			index = (int) (history + 1);
			temp.setZF(index);
			break;
		case "例行监测":
			first = "LXA";
			history = temp.getLX();
			index = (int) (history + 1);
			temp.setLX(index);
			break;
		case "应急监测":
			first = "YJA";
			history = temp.getYJ();
			index = (int) (history + 1);
			temp.setYJ(index);
			break;
		case "监督监测":
			first = "JDA";
			history = temp.getJD();
			index = (int) (history + 1);
			temp.setJD(index);
			break;
		default:
			first = "A";
			history = temp.getSelfSendSample();
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

	public NonSelfSendSample getEntity() {
		return entity;
	}

	public void setEntity(NonSelfSendSample entity) {
		this.entity = entity;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getAnalysisProjectId() {
		return analysisProjectId;
	}

	public void setAnalysisProjectId(String analysisProjectId) {
		this.analysisProjectId = analysisProjectId;
	}

	@Override
	public NonSelfSendSample getModel() {
		if (entity == null) {
			entity = new NonSelfSendSample();
		}
		return entity;
	}

}
