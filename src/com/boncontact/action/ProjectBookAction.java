package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.base.DocumentHandler;
import com.boncontact.domain.ContractMonitoringItem;
import com.boncontact.domain.Project;
import com.boncontact.domain.ProjectBook;
import com.boncontact.domain.Role;
import com.boncontact.domain.User;
import com.boncontact.util.PropertiesConfig;
import com.boncontact.util.PropertiesUtlis;
import com.boncontact.util.UserInfo;
import com.boncontact.util.moneyUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 任务书Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("projectBook")
public class ProjectBookAction extends BaseAction<ProjectBook> {
	private static final long serialVersionUID = -5704617093936588654L;
	/* 任务书实体 */
	private ProjectBook entity;
	/* 业务Id */
	private Long viewId;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 实验分析室id负责人 */
	private Long projectChargeId;
	/* 下发部门ID */
	private Long departmentId;
	/* 现场检测室负责人ID */
	private Long projectChargeIdTwo;
	/* 文件名，包括路径 */
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;
	// 部门Id
	private Long depId;
	// 自送样/非自送样
	private String gainSample;

	public String main() {
		try {
			Project project = projectService.getById(viewId);
			ActionContext.getContext().put("project", project);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			ActionContext.getContext().put("nowDate", sdf.format(new Date()));
			if (project.gettContractId() != null) {
				ActionContext.getContext().put("contractType", 0);
				ActionContext.getContext().put("tContract",
						project.gettContractId());
			} else {
				ActionContext.getContext().put("contractType", 1);
				ActionContext.getContext().put("sContract",
						project.getsContractId());
			}
			ActionContext.getContext().put("departmentList",
					departmentService.findAll(""));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "main";
	}

	public String userList() {
		try {
			List<UserInfo> object = new ArrayList<UserInfo>();
			List<User> users = userService
					.findAll(" WHERE c.role.department.id=" + depId);
			for (User user : users) {
				UserInfo userInfo = new UserInfo();
				userInfo.setId(user.getId());
				userInfo.setName(user.getName());
				object.add(userInfo);
			}
			JSONArray json = JSONArray.fromObject(object);
			System.out.println(json);
			jsonResult = "{'info':'success','list':" + json + "}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return "success";
	}

	/**
	 * 保存任务书Action
	 * 
	 * @return
	 */
	public String save() {
		try {
			Project project = projectService.getById(viewId);
			ProjectBook pb = new ProjectBook();
			pb = entity;
			pb.setId(null);
			if (project.gettContractId() != null) {
				pb.setClient(project.gettContractId().getCustomerName());
				pb.setProjectName(project.gettContractId().getProjectName());
				pb.setProjectWay(project.gettContractId().getProjectWay());
				pb.setCustomerText(project.gettContractId().getProjectWayText());
			} else {
				pb.setClient(project.getsContractId().getClient());
				pb.setProjectName(project.getsContractId().getName());
			}
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			pb.setTaskUnder(userService.getById(id));
			pb.setTaskUnderDate(new Date());
			pb.setUndertake(departmentService.getById(departmentId));
			pb.setProjectCharge(userService.getById(projectChargeId));
			Long xcjcsId=Long.parseLong(PropertiesConfig.readData("/setting.properties", "xcjcs"));
			//Long xcjcsId=3L;  fix:MAC机器上的路径问题
			if(xcjcsId!=0&&xcjcsId==departmentId){
				project.setGainSample("0");
			}else{
				project.setGainSample("1");
			}
			
			project.setProjectBook(pb);
			projectService.update(project);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 删除任务书Action
	 * 
	 * @return
	 */
	public String delete() {
		try {
			System.out.println(viewId);
			Project project = projectService.getById(viewId);
			project.setProjectBook(null);
			project.setGainSample(null);
			projectService.update(project);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 查看任务书Action
	 * 
	 * @return
	 */
	public String viewProjectBook() {
		/*Project pj = projectService.getById(viewId);
		ProjectBook pb = pj.getProjectBook();
		ActionContext.getContext().put("identify", pj.getContractId());
		ActionContext.getContext().getValueStack().push(pb);
		ActionContext.getContext().put("pj", pj);*/
		ActionContext.getContext().put("entity", projectService.getById(viewId));
		return "viewProjectBook";
	}

	public String changeProjectBook() {
		Project pj = projectService.getById(viewId);
		if (pj.gettContractId() != null) {
			ActionContext.getContext().put("contractType", 0);
		} else {
			ActionContext.getContext().put("contractType", 1);
		}
		ProjectBook pb = pj.getProjectBook();
		ActionContext.getContext().put("identify", pj.getContractId());
		ActionContext.getContext().getValueStack().push(pb);
		ActionContext.getContext().put("project", pj);
		ActionContext.getContext().put("departmentList",
				departmentService.findAll(""));
		return "changeProjectBook";
	};

	public String change() {
		try {
			Project project = projectService.getById(viewId);
			ProjectBook pb = new ProjectBook();
			pb = entity;
			pb.setId(null);
			if (project.gettContractId() != null) {
				pb.setClient(project.gettContractId().getCustomerName());
				pb.setProjectName(project.gettContractId().getProjectName());
				pb.setProjectWay(project.gettContractId().getProjectWay());
				pb.setCustomerText(project.gettContractId().getProjectWayText());
			} else {
				pb.setClient(project.getsContractId().getClient());
				pb.setProjectName(project.getsContractId().getName());
			}
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			pb.setTaskUnder(userService.getById(id));
			pb.setTaskUnderDate(new Date());
			pb.setUndertake(departmentService.getById(departmentId));
			pb.setProjectCharge(userService.getById(projectChargeId));
			Long xcjcsId=Long.parseLong(PropertiesConfig.readData("/setting.properties", "xcjcs"));
			if(xcjcsId!=0&&xcjcsId==departmentId){
				project.setGainSample("0");
			}else{
				project.setGainSample("1");
			}
			project.setProjectBook(pb);
			projectService.update(project);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 业务流转
	 * 
	 * @return
	 */
	public String flow() {
		try {
			Project pj = projectService.getById(viewId);
			if (pj.getProjectBook() != null) {
				pj.setProcess(2);
				projectService.update(pj);
				jsonResult = "{'info':'success'}";
			} else {
				jsonResult = "{'info':'failed'}";
			}
		} catch (Exception e) {
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
		ProjectBook pb = pj.getProjectBook();
		ActionContext ac = ActionContext.getContext();
		ServletContext sc = (ServletContext) ac
				.get(ServletActionContext.SERVLET_CONTEXT);
		String path = sc.getRealPath("/") + "\\files";
		File file = new File(path);
		if (!file.exists() && !file.isDirectory()) {
			file.mkdir();
		}
		String right = "<w:sym w:font='Wingdings 2' w:char='F050'/>";
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("identify", pj.getContractId());
		dataMap.put("client", pb.getClient());
		dataMap.put("projectName", pb.getProjectName());
		dataMap.put("aim", pb.getAim());
		dataMap.put("address", pb.getAddress());
		dataMap.put("code", pb.getCode());
		dataMap.put("contact", pb.getContact());
		dataMap.put("tel", pb.getTel());
		if (pj.gettContractId() != null) {
			String str = "";
			Set<ContractMonitoringItem> items = pj.gettContractId().getItems();
			for (ContractMonitoringItem item : items) {
				if (item != null) {
					str += item.getAnalysisProject().getName()+"（"+item.getAnalysisCategory().getName()+"，"+item.getSiteNum()+"，"+item.getAnalysisFrequency().getName()+"，"+item.getOther()+"），  ";
				}
			}
			dataMap.put("context", str);
		} else {
			dataMap.put("context", pb.getContext());
		}

		if (pb.getProjectWay() == 0) {
			dataMap.put("way1", right);
			dataMap.put("way2", "");
			dataMap.put("customerText", pb.getCustomerText());
		} else {
			dataMap.put("way1", "");
			dataMap.put("way2", right);
			dataMap.put("customerText", pb.getCustomerText());
		}
		dataMap.put("taskUnder", pb.getTaskUnder().getName());
		dataMap.put("taskUnderDate", pb.getTaskUnderDate());
		dataMap.put("undertake", pb.getUndertake().getName());
		dataMap.put("projectCharge", pb.getProjectCharge().getName());
		dataMap.put("reportWriter", pb.getReportWriter() == null ? "" : pb
				.getReportWriter().getName());
		dataMap.put("reportDate",
				pb.getReportDate() == null ? "" : pb.getReportDate());
		dataMap.put("reportFirstInstance",
				pb.getReportFirstInstance() == null ? "" : pb
						.getReportFirstInstance().getName());
		dataMap.put("reportFirstDate", pb.getReportFirstDate() == null ? ""
				: pb.getReportFirstDate());
		dataMap.put("reportSecondInstance",
				pb.getReportSecondInstance() == null ? "" : pb
						.getReportSecondInstance().getName());
		dataMap.put("reportSecondDate", pb.getReportSecondDate() == null ? ""
				: pb.getReportSecondDate());
		dataMap.put("reportSign", pb.getReportSign() == null ? "" : pb
				.getReportSign().getName());
		dataMap.put("reportSignDate",
				pb.getReportSignDate() == null ? "" : pb.getReportSignDate());
		dataMap.put("salesmanSign", pb.getSalesmanSign() == null ? "" : pb
				.getSalesmanSign().getName());
		dataMap.put("salesmanSignDate", pb.getSalesmanSignDate() == null ? ""
				: pb.getSalesmanSignDate());
		dataMap.put("fileClerk", pb.getFileClerk() == null ? "" : pb
				.getFileClerk().getName());
		dataMap.put("fileClerkDate",
				pb.getFileClerkDate() == null ? "" : pb.getFileClerkDate());

		DocumentHandler dh = new DocumentHandler();
		dh.createDoc(dataMap, "projectBook.xml",
				path + "\\" + pj.getContractId() + "任务书.doc");
		fileName = path + "\\" + pj.getContractId() + "任务书.doc";
		realFileName = pj.getContractId() + "任务书.doc";
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

	@Override
	public ProjectBook getModel() {
		if (entity == null) {
			entity = new ProjectBook();
		}
		return entity;
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

	public Long getProjectChargeId() {
		return projectChargeId;
	}

	public void setProjectChargeId(Long projectChargeId) {
		this.projectChargeId = projectChargeId;
	}

	public Long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Long departmentId) {
		this.departmentId = departmentId;
	}

	public Long getProjectChargeIdTwo() {
		return projectChargeIdTwo;
	}

	public void setProjectChargeIdTwo(Long projectChargeIdTwo) {
		this.projectChargeIdTwo = projectChargeIdTwo;
	}

	public Long getDepId() {
		return depId;
	}

	public void setDepId(Long depId) {
		this.depId = depId;
	}

	public String getGainSample() {
		return gainSample;
	}

	public void setGainSample(String gainSample) {
		this.gainSample = gainSample;
	}

}
