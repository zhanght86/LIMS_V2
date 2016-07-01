package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
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
import com.boncontact.domain.DeliveryReceitp;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.InspectionSheet_Result;
import com.boncontact.domain.NonSelfSendSample;
import com.boncontact.domain.Project;
import com.boncontact.domain.QualityControl;
import com.boncontact.domain.SelfSendSampleInfo;
import com.opensymphony.xwork2.ActionContext;

@Component("qualityControl")
public class QualityControlAction extends BaseAction<QualityControl> {
	private static final long serialVersionUID = -5359739739637587167L;
	private QualityControl entity;
	/* 编号 */
	private Long viewId;
	/* 分析项目Id */
	private Long itemId;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private Long projectId;
	// 文件名，包括路径
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;
	/**
	 * 质量控制Action
	 * 
	 * @return
	 */
	public String main() {
		List<Project> projectList = projectService.findAll(" WHERE process=3");
		ActionContext.getContext().put("projectList", projectList);
		return "main";
	}

	/**
	 * 新增页面Action
	 * 
	 * @return
	 */
	public String addPage() {
		try {
			Project pj = projectService.getById(viewId);
			if (pj.gettContractId() != null) {
				ActionContext.getContext().put("projectName",
						pj.gettContractId().getProjectName());
			}
			if (pj.getsContractId() != null) {
				ActionContext.getContext().put("projectName",
						pj.getsContractId().getName());
			}
			if (pj.getGainSample().equals("1")) {
				ActionContext.getContext().put("SamplingDate",
						pj.getSelfSendSampleInfo().iterator().next().getDate());
			} else {
				Set<DeliveryReceitp> deliReceitpSet = pj
						.getDeliveryReceitpInfo();
				if (deliReceitpSet.size() != 0) {
					ActionContext.getContext().put("SamplingDate",
							deliReceitpSet.iterator().next().getSamplingDate());
				}
			}
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			ActionContext.getContext().put("lister",
					userService.getById(id).getName());
			List<QualityControl> qualityControlList = qualityControlService
					.findAll(" WHERE project=" + viewId);
			Set<InspectionSheet> inspectionSheets=pj.getInspectionSheet();
			List<SelfSendSampleInfo> selfSendSampleInfos =new ArrayList<SelfSendSampleInfo>();
			List<NonSelfSendSample> nonSelfSendSamples=new ArrayList<NonSelfSendSample>();
			if(inspectionSheets.size()!=0){
				if(pj.getGainSample().equals("1")){
					for (InspectionSheet inspectionSheet : inspectionSheets) {
						Set<InspectionSheet_Result> results=inspectionSheet.getResult();
						for (InspectionSheet_Result inspectionSheet_Result : results) {
							if(!selfSendSampleInfos.contains(inspectionSheet_Result.getSampleInfo())){
								selfSendSampleInfos.add(inspectionSheet_Result.getSampleInfo());
							}
						}
					}
					ActionContext.getContext().put("selfSendSampleInfoList", selfSendSampleInfos);
				}else{
					for (InspectionSheet inspectionSheet : inspectionSheets) {
						Set<InspectionSheet_Result> results=inspectionSheet.getResult();
						for (InspectionSheet_Result inspectionSheet_Result : results) {
							nonSelfSendSamples.add(inspectionSheet_Result.getNonSelfSampleInfo());
							
						}
					}
					ActionContext.getContext().put("nonSelfSendSampleInfoList", nonSelfSendSamples);
				}
			}
			ActionContext.getContext().put("project", pj);
			ActionContext.getContext().put("qualityControlList",
					qualityControlList);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "addPage";
	}
	
	public String projectToSampleNum(){
		try{
			if(viewId!=null&&itemId!=null){
				Project project=projectService.getById(viewId);
				Set<InspectionSheet> inspectionSheets=project.getInspectionSheet();
				List<SelfSendSampleInfo> selfSendSampleInfos=new ArrayList<SelfSendSampleInfo>();
				List<NonSelfSendSample> nonSelfSendSamples=new ArrayList<NonSelfSendSample>();
				for (InspectionSheet inspectionSheet : inspectionSheets) {
					if(inspectionSheet.getAnalysisProject()!=analysisProjectService.getById(itemId)){
						continue;
					}
					Set<InspectionSheet_Result> results=inspectionSheet.getResult();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						if(project.getGainSample().equals("1")){
							selfSendSampleInfos.add(inspectionSheet_Result.getSampleInfo());
						}else{
							nonSelfSendSamples.add(inspectionSheet_Result.getNonSelfSampleInfo());
						}
					}
				}
				int sampleNum=0;
				if(project.getGainSample().equals("1")){
					sampleNum=selfSendSampleInfos.size();
				}else {
					sampleNum=nonSelfSendSamples.size();
				}
				jsonResult = "{'info':'success','sampleNum':"+sampleNum+"}";
			}
		}catch(Exception e){
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String flow() {
		try {
			Project pj = projectService.getById(viewId);
			pj.setProcess(4);
			pj.setQualityControlDate(new Date());
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			pj.setQualityControlUser(userService.getById(id));
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String delete() {
		try {
			QualityControl qc = qualityControlService.getById(viewId);
			Project pj = qc.getProject();
			Set<QualityControl> qualityControlSet = pj.getQualityControlSet();
			qualityControlSet.remove(qc);
			pj.setQualityControlSet(null);
			pj.setQualityControlSet(qualityControlSet);
			projectService.update(pj);
			qualityControlService.delete(viewId);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String deleteAll() {
		try {
			System.out.println(viewId);
			Project pj = projectService.getById(viewId);
			pj.setQualityControlSet(null);
			List<QualityControl> qc = qualityControlService
					.findAll(" WHERE project =" + viewId);
			projectService.update(pj);
			for (QualityControl qualityControl : qc) {
				qualityControlService.delete(qualityControl.getId());
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String changePage() {
		QualityControl qc = qualityControlService.getById(viewId);
		Project pj = qc.getProject();
		ActionContext.getContext().getValueStack().push(qc);
		ActionContext.getContext().put("itemId",
				qc.getAnalysisProject().getId());
		if (pj.getGainSample().equals("0")) {
			ActionContext.getContext().put("sysSampleId",
					qc.getNonLaboratorySample().getId());
			ActionContext.getContext().put("backSampleId",
					qc.getNonSpikedRecoverySample().getId());
		}
		if (pj.getGainSample().equals("1")) {
			ActionContext.getContext().put("backSampleId",
					qc.getSpikedRecoverySample().getId());
			ActionContext.getContext().put("sysSampleId",
					qc.getLaboratorySample().getId());
		}
		ActionContext.getContext().put("gainSample", pj.getGainSample());
		ActionContext.getContext().put("projectId", qc.getProject().getId());
		return "changePage";
	}

	public String change() {
		try {
			QualityControl temp = qualityControlService.getById(entity.getId());
			Project pj = temp.getProject();
			temp.setAnalysisProject(analysisProjectService.getById(itemId));
			temp.setProject(projectService.getById(projectId));
			temp.setBlindSample(entity.getBlindSample());
			temp.setLaboratorySampleNum(entity.getLaboratorySampleNum());
			temp.setSampleNum(entity.getSampleNum());
			temp.setParallelSample(entity.getParallelSample());
			temp.setSpikedRecoverySampleNum(entity.getSpikedRecoverySampleNum());
			qualityControlService.update(temp);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}
	
	public String finishQuery(){
		try{
			Project pj=projectService.getById(viewId);
			Set<QualityControl> QualityControlSet = pj.getQualityControlSet();
			for (QualityControl qualityControl : QualityControlSet) {
				Long id = (Long) ActionContext.getContext().getSession()
						.get("userId");
				qualityControl.setCreateUser(userService.getById(id));
				qualityControl.setCreateDate(new Date());
				qualityControlService.update(qualityControl);
			}
			jsonResult = "{'info':'success'}";
		}catch(Exception e){
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String add() {
		try {
			Project pj = projectService.getById(viewId);
			Set<QualityControl> QualityControlSet = pj.getQualityControlSet();
			entity.setAnalysisProject(analysisProjectService.getById(itemId));
			entity.setProject(projectService.getById(viewId));
			entity.setId(null);
			QualityControlSet.add(entity);
			pj.setQualityControlSet(null);
			pj.setQualityControlSet(QualityControlSet);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String viewPage() {
		try {
			Project pj = projectService.getById(viewId);
			ActionContext.getContext().put("entity", pj);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "viewPage";
	}

	public String export() {
		Project pj = projectService.getById(viewId);
		ActionContext ac = ActionContext.getContext();
		ServletContext sc = (ServletContext) ac
				.get(ServletActionContext.SERVLET_CONTEXT);
		String path = sc.getRealPath("/") + "\\files";
		File file = new File(path);
		if (!file.exists() && !file.isDirectory()) {
			file.mkdir();
		}
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<QualityControl> qualityControlList = new ArrayList<QualityControl>(
				pj.getQualityControlSet());
		Set<DeliveryReceitp> deliveryReceitpSet = pj.getDeliveryReceitpInfo();
		Date samplingDate = deliveryReceitpSet.iterator().next()
				.getSamplingDate();
		for (DeliveryReceitp deliveryReceitp : deliveryReceitpSet) {
			Date tempDate = deliveryReceitp.getSamplingDate();
			if (samplingDate.before(tempDate)) {
				samplingDate = tempDate;
			}
		}
		dataMap.put("projectName", pj.gettContractId() == null ? pj
				.getsContractId().getName() : pj.gettContractId()
				.getProjectName());
		dataMap.put("samplingDate", samplingDate);
		dataMap.put("qualityControlUser",
				pj.getQualityControlUser() == null ? "" : pj
						.getQualityControlUser().getName());
		dataMap.put(
				"qualityDate",
				pj.getQualityControlDate() == null ? "" : pj
						.getQualityControlDate());
		dataMap.put("ResultList", qualityControlList);
		DocumentHandler dh = new DocumentHandler();
		if (pj.getGainSample().equals("0")) {
			dh.createDoc(dataMap, "QualityControl_non.xml",
					path + "\\" + pj.getContractId() + "质量控制统计表.doc");
		}
		if (pj.getGainSample().equals("1")) {
			dh.createDoc(dataMap, "QualityControl.xml",
					path + "\\" + pj.getContractId() + "质量控制统计表.doc");
		}
		
		fileName = path + "\\" + pj.getContractId() + "质量控制统计表.doc";
		realFileName = pj.getContractId() + "质量控制统计表.doc";
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

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

	@Override
	public QualityControl getModel() {
		if (entity == null) {
			entity = new QualityControl();
		}
		return entity;
	}

}
