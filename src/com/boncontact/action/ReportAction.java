package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.CommonTemplet;
import com.boncontact.domain.Encode;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.Project;
import com.boncontact.domain.ProjectBook;
import com.boncontact.domain.Report;
import com.boncontact.domain.ReportAudit;
import com.boncontact.util.DeleteFileUtil;
import com.boncontact.util.PropertiesConfig;
import com.opensymphony.xwork2.ActionContext;
import com.sun.org.apache.regexp.internal.REProgram;

@Component("report")
public class ReportAction extends BaseAction<Report> {
	private static final long serialVersionUID = -9144766813279055533L;
	private Report entity;
	private Long viewId;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private int reportType = -1;
	// 文件名，包括路径
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;
	private String reportPath;
	private Long projectId;

	public String main() {
		List<Project> projectList = projectService.findAll("WHERE process=9  or process = 10");
		List<Project> levelPj = new ArrayList<Project>();
		for (Project project : projectList) {
			int flag = 0;
			Set<Report> rp = project.getReportSet();
			if (rp.size() == 0) {
				flag = 1;
			}
			for (Report report : rp) {
				if (report.getResult() <5  ) {
					flag = 1;
				}
			}
			if (flag == 1) {
				levelPj.add(project);
			}
		}
		ActionContext.getContext().put("projectList", levelPj);
		return "main";
	}

	public String addPage() {
		if (viewId != null) {
			ActionContext.getContext().put("viewId", viewId);
		}
		return "addPage";
	}
	
	public String addCoverPage(){
		if(viewId!=null){
			Report report=reportService.getById(viewId);
			ActionContext.getContext().put("entity", report);
			
		}
		return "addCoverPage";
	}

	public String referPage() {
		if (viewId != null && reportType != -1) {

			Project pb = projectService.getById(viewId);
			ActionContext.getContext().put("entity", pb);
			ActionContext.getContext().put("projectId", viewId);
			ActionContext.getContext().put("reportType", reportType);
		}

		return "referPage";
	}

	public String changePage() {
		if (viewId != null && projectId != null) {
			Report report = reportService.getById(viewId);
			ActionContext.getContext().put("entity", report);
			ActionContext.getContext().put("project",
					projectService.getById(projectId));
		}
		return "changePage";
	}
	
	public String deleteReport() {
		try {
			if(viewId!=null){
				Report temp = reportService.getById(viewId);
				String path = ServletActionContext.getRequest().getRealPath(
						"/")+temp.getPath();
				if (path != null) {
					DeleteFileUtil.delete(path);
				}
				String coverPath=ServletActionContext.getRequest().getRealPath(
						"/")+temp.getCoverPath();
				if(coverPath != null){
					DeleteFileUtil.delete(coverPath);
				}
				reportService.delete(viewId);
				jsonResult = "{'info':'success'}";
			}else{
				jsonResult = "{'info':'failed'}";
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}
	
	public String deleteReportCover() {
		try {
			if(viewId!=null){
				Report temp = reportService.getById(viewId);
				String path = ServletActionContext.getRequest().getRealPath(
						"/")+temp.getCoverPath();
				if (path != null) {
					DeleteFileUtil.delete(path);
				}
				temp.setCoverPath(null);
				reportService.update(temp);
				jsonResult = "{'info':'success'}";
			}else{
				jsonResult = "{'info':'failed'}";
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String viewPage() {
		if (viewId != null) {
			Report report = reportService.getById(viewId);
			ActionContext.getContext().put("entity", report);
		}
		return "viewPage";
	}

	public String saveRecord() {
		try {
			if (viewId != null && reportPath != null) {
				Long id = (Long) ActionContext.getContext().getSession()
						.get("userId");
				String year = PropertiesConfig.readData(
						"/identifier.properties", "contractNum");
				String[] typeList = { "air", "voice", "water", "soil", "smoke" };
				int reportId = AutoIdentify(typeList[reportType]);
				String ids = String.format("%03d", reportId);
				Project project = projectService.getById(viewId);
				Set<Report> reportSet = project.getReportSet();
				Report report = new Report();
				report.setId(null);
				report.setIdentify(year + "-" + ids);
				report.setMaker(userService.getById(id));
				report.setPath(reportPath);
				report.setCreateDate(new Date());
				report.setType(reportType);
				report.setProject(project);
				report.setResult(0);
				if (!reportSet.contains(report)) {
					reportSet.add(report);
				}
				project.setReportSet(reportSet);
				projectService.update(project);
				jsonResult = "{'info':'success','year':'" + year
						+ "','identify':'" + reportId + "','id':'"
						+ report.getId() + "'}";
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}
	
	
	public String saveRecordCover(){
		try {
			if (viewId != null && reportPath != null) {
				Report report=reportService.getById(viewId);
				report.setCoverPath(reportPath);
				reportService.update(report);
				jsonResult = "{'info':'success'}";
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		
		return SUCCESS;
	}
	public String viewCoverPage(){
		if (viewId != null) {
			Report report = reportService.getById(viewId);
			ActionContext.getContext().put("entity", report);
		}
		
		return "viewCoverPage";
	}

	public String add() {
		try {
			Project pj = projectService.getById(viewId);
			if (reportService.getByIndetify(entity.getIdentify()) != null) {
				jsonResult = "{'info':'repeat'}";
				return SUCCESS;
			}
			entity.setProject(pj);
			entity.setId(null);
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			entity.setMaker(userService.getById(id));
			Set<Report> reportSet = pj.getReportSet();
			reportSet.add(entity);
			pj.setReportSet(reportSet);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String export() {
		try {
			Report ct = reportService.getById(viewId);
			fileName = ct.getPath();
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

	public String createNum() {
		try {
			String[] typeList = { "air", "voice", "water", "soil", "smoke" };
			int id = AutoIdentify(typeList[reportType]);
			String ids = String.format("%03d", id);
			jsonResult = "{'info':'success','num':'" + ids + "'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String delete() {
		try {
			reportService.delete(viewId);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String flow() {
		try {
			Project pj = projectService.getById(viewId);
			if (pj != null) {
				if (pj.getReportSet().size() == 0) {
					jsonResult = "{'info':'noone'}";
					return SUCCESS;
				} else {
					Set<Report> reportSet = pj.getReportSet();
					String identifys="";
					for (Report report : reportSet) {
						if(report.getCoverPath()==null){
							identifys+=report.getIdentify()+",";
						}
					}
					if(identifys != ""){
						jsonResult = "{'info':'nooneCover','identify':'"+identifys.substring(0,identifys.length()-1)+"'}";
						return SUCCESS;
					}
					for (Report report : reportSet) {
						
						if (report.getResult() == 0) {
							if (report.getReportAudit() != null) {
								//report.setReportAudit(null);
								//reportService.update(report);
								//ReportAudit audit= new ReportAudit();
								ReportAudit history_Audit=report.getReportAudit();
								history_Audit.setReport(null);
								
								Set<ReportAudit> history=report.getHistoryAudit();
								history.add(history_Audit);
								report.setHistoryAudit(history);
								//report.setReportAudit(null);
								reportService.update(report);
							}
							ReportAudit audit = new ReportAudit();
							audit.setReport(report);
							report.setReportAudit(audit);
							report.setResult(1);
						}

					}

					ProjectBook pb = pj.getProjectBook();
					if (pb != null) {
						pb.setReportDate(new Date());
						Long id = (Long) ActionContext.getContext()
								.getSession().get("userId");
						pb.setReportWriter(userService.getById(id));
						pj.setProjectBook(pb);
						projectService.update(pj);
					}
				}
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}
	
	public String viewHistoryAudit(){
		System.out.println("执行viewHistoryAudit");
		return "viewHistoryAudit";
	}

	/**
	 * 自动编号，( 20xx ) 邦监 ( x )字第( xxx )号
	 * 
	 * @return
	 * @throws IOException
	 */
	public int AutoIdentify(String type) throws IOException {
		int index = 0;
		Encode temp = encodeService.getEncode();
		if (temp != null) {
			if (type == "air") {
				index = (int) (temp.getAirReport() + 1);
				temp.setAirReport(index);
			}
			if (type == "voice") {
				index = (int) (temp.getVoiceReport() + 1);
				temp.setVoiceReport(index);
			}
			if (type == "water") {
				index = (int) (temp.getWaterReport() + 1);
				temp.setWaterReport(index);
			}
			if (type == "soil") {
				index = (int) (temp.getSoilReport() + 1);
				temp.setSoilReport(index);
			}
			if (type == "smoke") {
				index = (int) (temp.getSmokeReport() + 1);
				temp.setSmokeReport(index);
			}
			encodeService.update(temp);
		} else {
			index += 1;
			temp.setAirReport(0);
			temp.setVoiceReport(0);
			temp.setWaterReport(0);
			temp.setSoilReport(0);
			temp.setSmokeReport(0);
			if (type == "air") {
				temp.setAirReport(1);
			}
			if (type == "voice") {
				temp.setVoiceReport(1);
			}
			if (type == "water") {
				temp.setWaterReport(1);
			}
			if (type == "soil") {
				temp.setSoilReport(1);
			}
			if (type == "smoke") {
				temp.setSmokeReport(1);
			}
			encodeService.update(temp);
		}
		return index;
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

	public int getReportType() {
		return reportType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
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

	public String getReportPath() {
		return reportPath;
	}

	public void setReportPath(String reportPath) {
		this.reportPath = reportPath;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

	@Override
	public Report getModel() {
		if (entity == null) {
			entity = new Report();
		}
		return entity;
	}

}
