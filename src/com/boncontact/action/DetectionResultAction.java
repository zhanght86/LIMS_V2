package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.base.DocumentHandler;
import com.boncontact.domain.AnalysisCategory;
import com.boncontact.domain.CommonTemplet;
import com.boncontact.domain.DeliveryReceitp;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.InspectionSheet_Air;
import com.boncontact.domain.InspectionSheet_Result;
import com.boncontact.domain.InspectionSheet_Soil;
import com.boncontact.domain.InspectionSheet_Solid;
import com.boncontact.domain.InspectionSheet_Water;
import com.boncontact.domain.NonSelfSendSample;
import com.boncontact.domain.OriginalRecord;
import com.boncontact.domain.Project;
import com.boncontact.domain.RecordAudit;
import com.boncontact.domain.SelfSendSampleInfo;
import com.boncontact.util.DeleteFileUtil;
import com.boncontact.util.StringSplitUtils;
import com.opensymphony.xwork2.ActionContext;

/**
 * 检测结果Action
 * 
 * @author 瞿龙俊
 * 
 */
/**
 * @author 瞿龙俊
 * 
 */
@Component("detectionResult")
public class DetectionResultAction extends BaseAction<InspectionSheet_Result> {
	private static final long serialVersionUID = 7559237179197848854L;
	private InspectionSheet_Result entity;
	/* 编号 */
	private Long viewId;
	private Long projectId;
	private String recordPath;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private String resultId;
	private String inspId;
	/* 样品编号 */
	private Long sampleId;
	/* 样品性质 */
	private String sampleProperties;
	/* 分析结果 */
	private double analysisResult;
	/* 删除Id */
	private Long delId;
	/* 采样断面 */
	private String samplingSection;
	/* 备注 */
	private String remarks;
	/* 标况体积 */
	private double standardVolume;
	/* 浓度 */
	private double concentration;
	/* 标干流量 */
	private double standardDryFlow;
	/* 排放量 */
	private double discharge;
	/* 上传路径 */
	private String resultPath;
	// 文件名，包括路径
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;
	/* 备注 */
	private String other;
	private String inspType;
	private String delType;
	private String queryStr;

	public String main() {
		Long id = (Long) ActionContext.getContext().getSession().get("userId");
		List<InspectionSheet> inspectionSheetList = inspectionSheetService
				.findAll(" WHERE analyst=" + id + " and step<2");
		List<Project> projectList = new ArrayList<Project>();
		for (InspectionSheet inspectionSheet : inspectionSheetList) {
			Project temp = inspectionSheet.getProject();
			if (temp.getProcess() == 6 && !projectList.contains(temp)) {
				projectList.add(temp);
			}
		}
		ActionContext.getContext().put("nowId", id);
		ActionContext.getContext().put("projectList", projectList);
		return "main";
	}

	public String writeWater() {
		try {
			if (viewId != null) {
				InspectionSheet_Water water = (InspectionSheet_Water) inspectionSheet_ResultService
						.getById(viewId);
				water.setAnalysisResult(analysisResult);
				water.setSaveDate(new Date());
				inspectionSheet_ResultService.update(water);
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

	public String writeAir() {
		try {
			if (viewId != null) {
				InspectionSheet_Air air = (InspectionSheet_Air) inspectionSheet_ResultService
						.getById(viewId);
				air.setAnalysisResult(analysisResult);
				air.setConcentration(concentration);
				air.setStandardVolume(standardVolume);
				air.setSaveDate(new Date());
				inspectionSheet_ResultService.update(air);
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

	public String writeSolid() {
		try {
			if (viewId != null) {
				InspectionSheet_Solid solid = (InspectionSheet_Solid) inspectionSheet_ResultService
						.getById(viewId);
				solid.setAnalysisResult(analysisResult);
				solid.setConcentration(concentration);
				solid.setStandardVolume(standardVolume);
				solid.setDischarge(discharge);
				solid.setStandardDryFlow(standardDryFlow);
				solid.setSaveDate(new Date());
				inspectionSheet_ResultService.update(solid);
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

	public String writeSoil() {
		try {
			if (viewId != null) {
				InspectionSheet_Soil soil = (InspectionSheet_Soil) inspectionSheet_ResultService
						.getById(viewId);
				soil.setAnalysisResult(analysisResult);
				soil.setRemarks(remarks);
				soil.setSamplingSection(samplingSection);
				soil.setSaveDate(new Date());
				inspectionSheet_ResultService.update(soil);
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
	 * 原始记录审核表
	 * 
	 * @return
	 */
	public String exportAudit() {
		System.out.println("执行到这了");
		System.out.println(viewId);
		Project pj = projectService.getById(viewId);
		RecordAudit ra = pj.getRecordAudit();
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
		dataMap.put("projectName", ra.getProject().getProjectBook()
				.getProjectName());
		dataMap.put("a1", ra.getFirstInstance1() == 1 ? str : str2);
		dataMap.put("a2", ra.getFirstInstance1() == 2 ? str : str2);
		dataMap.put("a3", ra.getFirstInstance1() == 3 ? str : str2);
		dataMap.put("b1", ra.getFirstInstance2() == 1 ? str : str2);
		dataMap.put("b2", ra.getFirstInstance2() == 2 ? str : str2);
		dataMap.put("b3", ra.getFirstInstance2() == 3 ? str : str2);
		dataMap.put("c1", ra.getFirstInstance3() == 1 ? str : str2);
		dataMap.put("c2", ra.getFirstInstance3() == 2 ? str : str2);
		dataMap.put("c3", ra.getFirstInstance3() == 3 ? str : str2);
		dataMap.put("d1", ra.getFirstInstance4() == 1 ? str : str2);
		dataMap.put("d2", ra.getFirstInstance4() == 2 ? str : str2);
		dataMap.put("d3", ra.getFirstInstance4() == 3 ? str : str2);
		dataMap.put("e1", ra.getFirstInstance5() == 1 ? str : str2);
		dataMap.put("e2", ra.getFirstInstance5() == 2 ? str : str2);
		dataMap.put("e3", ra.getFirstInstance5() == 3 ? str : str2);
		dataMap.put("f1", ra.getFirstInstance6() == 1 ? str : str2);
		dataMap.put("f2", ra.getFirstInstance6() == 2 ? str : str2);
		dataMap.put("f3", ra.getFirstInstance6() == 3 ? str : str2);
		dataMap.put("g1", ra.getSecondInstance1() == 1 ? str : str2);
		dataMap.put("g2", ra.getSecondInstance1() == 2 ? str : str2);
		dataMap.put("g3", ra.getSecondInstance1() == 3 ? str : str2);
		dataMap.put("h1", ra.getSecondInstance2() == 1 ? str : str2);
		dataMap.put("h2", ra.getSecondInstance2() == 2 ? str : str2);
		dataMap.put("h3", ra.getSecondInstance2() == 3 ? str : str2);
		dataMap.put("i1", ra.getSecondInstance3() == 1 ? str : str2);
		dataMap.put("i2", ra.getSecondInstance3() == 2 ? str : str2);
		dataMap.put("i3", ra.getSecondInstance3() == 3 ? str : str2);
		dataMap.put("j1", ra.getSecondInstance4() == 1 ? str : str2);
		dataMap.put("j2", ra.getSecondInstance4() == 2 ? str : str2);
		dataMap.put("j3", ra.getSecondInstance4() == 3 ? str : str2);
		dataMap.put("k1", ra.getSecondInstance5() == 1 ? str : str2);
		dataMap.put("k2", ra.getSecondInstance5() == 2 ? str : str2);
		dataMap.put("k3", ra.getSecondInstance5() == 3 ? str : str2);
		dataMap.put("l1", ra.getSecondInstance6() == 1 ? str : str2);
		dataMap.put("l2", ra.getSecondInstance6() == 2 ? str : str2);
		dataMap.put("l3", ra.getSecondInstance6() == 3 ? str : str2);
		dataMap.put("other1", ra.getFirstOther());
		dataMap.put("other2", ra.getSecondOther());
		dataMap.put("other3", ra.getRemarks());
		dataMap.put("date1", ra.getFirstAuditDate());
		dataMap.put("data2", ra.getSecondAuditDate());
		dataMap.put("auditOne", ra.getFirstAudit().getName());
		dataMap.put("auditTwo", ra.getSecondAudit().getName());
		DocumentHandler dh = new DocumentHandler();
		dh.createDoc(dataMap, "resultAudit.xml",
				path + "\\" + pj.getContractId() + "原始记录审核记录表.doc");
		fileName = path + "\\" + pj.getContractId() + "原始记录审核记录表.doc";
		realFileName = pj.getContractId() + "原始记录审核记录表.doc";
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

	public String resultURL() {
		try {
			InspectionSheet temp = inspectionSheetService.getById(viewId);
			temp.setResultPath(resultPath);
			inspectionSheetService.update(temp);
			jsonResult = "{'info':'success'}";

		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String addPage() {
		List<AnalysisCategory> categories=analysisCategoryService.findAll("");
		ActionContext.getContext().put("categories", categories);
		ActionContext.getContext().put("projectId", projectId);
		List<AnalysisCategory> analysisCategorieList = analysisCategoryService
				.findAll("");
		List<OriginalRecord> originalRecord = originalRecordService.findAll("");
		ActionContext.getContext().put("originalRecord", originalRecord);
		ActionContext.getContext().put("analysisCategorieList",
				analysisCategorieList);
		ActionContext.getContext().put("totalRecord", originalRecord.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(originalRecord.size() / (double) pageRowCount));
		return "addPage";
	}
	
	/**
	 * 查询按钮
	 * 
	 * @return
	 */
	public String query() {
		List<OriginalRecord> originalRecordList = new ArrayList<OriginalRecord>();
		if (queryStr != null) {
			String[] queryInfo = StringSplitUtils.splite(queryStr, ";");
			String query = "";
			String condition = "where ";
			String middle = " inner join fetch c.category u ";
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
				originalRecordList = originalRecordService.findAll("");
			} else {
				originalRecordList = originalRecordService.findAll(middle
						+ condition + query+" Group by c.id");
			}
		}
		List<AnalysisCategory> categories=analysisCategoryService.findAll("");
		ActionContext.getContext().put("categories", categories);
		
		ActionContext.getContext().put("record", originalRecordList);
		ActionContext.getContext().put("totalRecord", originalRecordList.size());
		ActionContext.getContext().put(
				"totalPage",
				(int) Math.ceil(originalRecordList.size()
						/ (double) pageRowCount));
		return "addPage";
	}
	
	

	public String recordPage() {
		if (viewId != null && projectId !=null) {
			OriginalRecord record = originalRecordService.getById(viewId);
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			ActionContext.getContext().put("entity", record);
			ActionContext.getContext().put("username",
					userService.getById(id).getName());
			ActionContext.getContext().put("InspectId", projectId);
			System.out.println(projectId);
		}
		return "recordPage";
	}

	public String viewPage() {
		if (viewId != null) {
			InspectionSheet sheet = inspectionSheetService.getById(viewId);
			ActionContext.getContext().put("entity", sheet);
		}
		return "viewPage";
	}

	public String changePage() {
		if (viewId != null) {
			InspectionSheet sheet = inspectionSheetService.getById(viewId);
			ActionContext.getContext().put("entity", sheet);
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			ActionContext.getContext().put("username",
					userService.getById(id).getName());
			ActionContext.getContext().put("projectId", viewId);
		}
		return "changePage";
	}

	public String saveRecord() {
		try {
			System.out.println(projectId);
			System.out.println(recordPath);
			if (projectId != null && recordPath != null) {
				InspectionSheet inspectionSheet = inspectionSheetService
						.getById(projectId);
				inspectionSheet.setResultPath(recordPath);
				inspectionSheetService.update(inspectionSheet);
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

	public String delete() {
		try {
			InspectionSheet_Result result = inspectionSheet_ResultService
					.getById(delId);
			if (result != null) {
				if (delType.equals("0")) {
					InspectionSheet_Water water = (InspectionSheet_Water) result;
					water.setAnalysisResult(0.0);
					water.setSampleProperties(null);
					inspectionSheet_ResultService.update(water);
				}
				if (delType.equals("1")) {
					InspectionSheet_Soil soil = (InspectionSheet_Soil) result;
					soil.setAnalysisResult(0);
					soil.setRemarks("");
					soil.setSamplingSection("");
					inspectionSheet_ResultService.update(soil);
				}
				if (delType.equals("2")) {
					InspectionSheet_Solid solid = (InspectionSheet_Solid) result;
					solid.setAnalysisResult(0);
					solid.setConcentration(0);
					solid.setDischarge(0);
					solid.setStandardDryFlow(0);
					solid.setStandardVolume(0);
					inspectionSheet_ResultService.update(solid);
				}
				if (delType.equals("3")) {
					InspectionSheet_Air air = (InspectionSheet_Air) result;
					air.setAnalysisResult(0);
					air.setConcentration(0);
					air.setStandardVolume(0);
					inspectionSheet_ResultService.update(air);
				}
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 添加备注
	 * 
	 * @return
	 */
	public String addOther() {
		try {
			InspectionSheet temp = inspectionSheetService.getById(viewId);
			temp.setOther(other);
			inspectionSheetService.update(temp);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	/**
	 * 删除备注信息
	 * 
	 * @return
	 */
	public String delOther() {
		try {
			InspectionSheet temp = inspectionSheetService.getById(viewId);
			temp.setOther(null);
			inspectionSheetService.update(temp);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String deleteRecord() {
		try {
			InspectionSheet temp = inspectionSheetService.getById(viewId);
			String path = ServletActionContext.getRequest().getRealPath(
					"/")+temp.getResultPath();
			if (path != null) {
				DeleteFileUtil.delete(path);
			}
			temp.setResultPath(null);
			inspectionSheetService.update(temp);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String refer() {
		try {
			InspectionSheet temp = inspectionSheetService.getById(viewId);
			if(temp.getResultPath() == null || temp.getResultPath() == ""){
				jsonResult = "{'info':'emptyPath'}";
			}else{
				temp.setStep(1L);
				inspectionSheetService.update(temp);
				jsonResult = "{'info':'success'}";
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String flow() {
		try {
			Project pj = projectService.getById(viewId);
			Set<InspectionSheet> inspectionSheetList = pj.getInspectionSheet();
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			for (InspectionSheet inspectionSheet : inspectionSheetList) {
				if (inspectionSheet.getAnalyst() == userService.getById(id)
						&& inspectionSheet.getStep() == 1) {
					inspectionSheet.setStep(2);
					inspectionSheet.setAnalysisDate(new Date());
					inspectionSheetService.update(inspectionSheet);
				}
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String getSamplingSection() {
		return samplingSection;
	}

	public void setSamplingSection(String samplingSection) {
		this.samplingSection = samplingSection;
	}

	public Long getSampleId() {
		return sampleId;
	}

	public void setSampleId(Long sampleId) {
		this.sampleId = sampleId;
	}

	public String getSampleProperties() {
		return sampleProperties;
	}

	public void setSampleProperties(String sampleProperties) {
		this.sampleProperties = sampleProperties;
	}

	public double getAnalysisResult() {
		return analysisResult;
	}

	public void setAnalysisResult(double analysisResult) {
		this.analysisResult = analysisResult;
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

	public Long getDelId() {
		return delId;
	}

	public void setDelId(Long delId) {
		this.delId = delId;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public double getStandardVolume() {
		return standardVolume;
	}

	public void setStandardVolume(double standardVolume) {
		this.standardVolume = standardVolume;
	}

	public double getConcentration() {
		return concentration;
	}

	public void setConcentration(double concentration) {
		this.concentration = concentration;
	}

	public double getStandardDryFlow() {
		return standardDryFlow;
	}

	public void setStandardDryFlow(double standardDryFlow) {
		this.standardDryFlow = standardDryFlow;
	}

	public double getDischarge() {
		return discharge;
	}

	public void setDischarge(double discharge) {
		this.discharge = discharge;
	}

	public String getResultPath() {
		return resultPath;
	}

	public void setResultPath(String resultPath) {
		this.resultPath = resultPath;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getResultId() {
		return resultId;
	}

	public void setResultId(String resultId) {
		this.resultId = resultId;
	}

	public String getInspId() {
		return inspId;
	}

	public void setInspId(String inspId) {
		this.inspId = inspId;
	}

	public String getDelType() {
		return delType;
	}

	public void setDelType(String delType) {
		this.delType = delType;
	}

	public String getInspType() {
		return inspType;
	}

	public void setInspType(String inspType) {
		this.inspType = inspType;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

	public String getRecordPath() {
		return recordPath;
	}

	public void setRecordPath(String recordPath) {
		this.recordPath = recordPath;
	}

	
	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	@Override
	public InspectionSheet_Result getModel() {
		if (entity == null) {
			entity = new InspectionSheet_Result();
		}
		return entity;
	}
}
