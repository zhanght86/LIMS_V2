package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.boncontact.domain.DeliveryReceitp;
import com.boncontact.domain.Delivery_SampleType;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.InspectionSheet_Air;
import com.boncontact.domain.InspectionSheet_Result;
import com.boncontact.domain.InspectionSheet_Soil;
import com.boncontact.domain.InspectionSheet_Solid;
import com.boncontact.domain.InspectionSheet_Water;
import com.boncontact.domain.NonSelfSendSample;
import com.boncontact.domain.Project;
import com.boncontact.domain.SelfSendSampleInfo;
import com.boncontact.util.StringSplitUtils;
import com.boncontact.util.TempInspection;
import com.opensymphony.xwork2.ActionContext;

/**
 * 送检单Action
 * 
 * @author 瞿龙俊
 * 
 */
@Component("inspectionSheet")
public class InspectionSheetAction extends BaseAction<InspectionSheet> {
	private static final long serialVersionUID = -3095241687723931926L;
	private InspectionSheet entity;
	/* id */
	private Long viewId;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 检测项目Ids */
	private String ids;
	private int typeId;
	private Long itemId;
	// 文件名，包括路径
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;

	public String main() {
		try {
			Project project = projectService.getById(viewId);
			if (project.getGainSample().equals("1")) {
				Set<DeliveryReceitp> deliveryReceitps = project
						.getDeliveryReceitpInfo();
				if (deliveryReceitps.size() != 0) {
					List<SelfSendSampleInfo> waterInspect = new ArrayList<SelfSendSampleInfo>();
					List<SelfSendSampleInfo> airInspect = new ArrayList<SelfSendSampleInfo>();
					List<SelfSendSampleInfo> solidInspect = new ArrayList<SelfSendSampleInfo>();
					List<SelfSendSampleInfo> fixedInspect = new ArrayList<SelfSendSampleInfo>();
					List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> fixedProject = new ArrayList<AnalysisProject>();
					for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
						Set<SelfSendSampleInfo> sampleInfos = deliveryReceitp
								.getSelfSendSampleInfo();
						for (SelfSendSampleInfo selfSendSampleInfo : sampleInfos) {
							Set<AnalysisProject> analysisProjects = selfSendSampleInfo
									.getAnalysisProjectSet();
							for (AnalysisProject projectItem : analysisProjects) {
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 1) {
									// 1:水质样品送检单
									if (!waterInspect
											.contains(selfSendSampleInfo)) {
										waterInspect.add(selfSendSampleInfo);
									}

									if (!waterProject.contains(projectItem)) {
										waterProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 2) {
									// 2:环境空气和无组织废气
									if (!airInspect
											.contains(selfSendSampleInfo)) {
										airInspect.add(selfSendSampleInfo);
									}

									if (!airProject.contains(projectItem)) {
										airProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 3) {
									// 3:土壤、底质样品
									if (!solidInspect
											.contains(selfSendSampleInfo)) {
										solidInspect.add(selfSendSampleInfo);
									}

									if (!solidProject.contains(projectItem)) {
										solidProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 4) {
									// 4:固定污染源有组织废气
									if (!fixedInspect
											.contains(selfSendSampleInfo)) {
										fixedInspect.add(selfSendSampleInfo);
									}

									if (!fixedProject.contains(projectItem)) {
										fixedProject.add(projectItem);
									}
								}
							}

						}
					}
					ActionContext.getContext()
							.put("waterInspect", waterInspect);
					ActionContext.getContext().put("airInspect", airInspect);
					ActionContext.getContext()
							.put("solidInspect", solidInspect);
					ActionContext.getContext()
							.put("fixedInspect", fixedInspect);
					ActionContext.getContext()
							.put("waterProject", waterProject);
					ActionContext.getContext().put("airProject", airProject);
					ActionContext.getContext()
							.put("solidProject", solidProject);
					ActionContext.getContext()
							.put("fixedProject", fixedProject);
				}
			} else {
				Set<DeliveryReceitp> deliveryReceitps = project
						.getDeliveryReceitpInfo();
				if (deliveryReceitps.size() != 0) {
					List<NonSelfSendSample> waterInspect = new ArrayList<NonSelfSendSample>();
					List<NonSelfSendSample> airInspect = new ArrayList<NonSelfSendSample>();
					List<NonSelfSendSample> solidInspect = new ArrayList<NonSelfSendSample>();
					List<NonSelfSendSample> fixedInspect = new ArrayList<NonSelfSendSample>();
					List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> fixedProject = new ArrayList<AnalysisProject>();
					for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
						Set<NonSelfSendSample> sampleInfos = deliveryReceitp
								.getNonSelfSendSampleInfo();
						for (NonSelfSendSample selfSendSampleInfo : sampleInfos) {
							Set<AnalysisProject> analysisProjects = selfSendSampleInfo
									.getAnalysisProjectSet();
							for (AnalysisProject projectItem : analysisProjects) {
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 1) {
									// 1:水质样品送检单
									if (!waterInspect
											.contains(selfSendSampleInfo)) {
										waterInspect.add(selfSendSampleInfo);
									}

									if (!waterProject.contains(projectItem)) {
										waterProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 2) {
									// 2:环境空气和无组织废气
									if (!airInspect
											.contains(selfSendSampleInfo)) {
										airInspect.add(selfSendSampleInfo);
									}

									if (!airProject.contains(projectItem)) {
										airProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 3) {
									// 3:土壤、底质样品
									if (!solidInspect
											.contains(selfSendSampleInfo)) {
										solidInspect.add(selfSendSampleInfo);
									}

									if (!solidProject.contains(projectItem)) {
										solidProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 4) {
									// 4:固定污染源有组织废气
									if (!fixedInspect
											.contains(selfSendSampleInfo)) {
										fixedInspect.add(selfSendSampleInfo);
									}

									if (!fixedProject.contains(projectItem)) {
										fixedProject.add(projectItem);
									}
								}
							}

						}
					}
					ActionContext.getContext()
							.put("waterInspect", waterInspect);
					ActionContext.getContext().put("airInspect", airInspect);
					ActionContext.getContext()
							.put("solidInspect", solidInspect);
					ActionContext.getContext()
							.put("fixedInspect", fixedInspect);
					ActionContext.getContext()
							.put("waterProject", waterProject);
					ActionContext.getContext().put("airProject", airProject);
					ActionContext.getContext()
							.put("solidProject", solidProject);
					ActionContext.getContext()
							.put("fixedProject", fixedProject);
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}

		return "main";
	}

	public String add() {
		try {
			Project project = projectService.getById(viewId);
			if (project.getGainSample().equals("1")) {
				Set<InspectionSheet> inspectionSheets = new HashSet<InspectionSheet>();
				Set<DeliveryReceitp> deliveryReceitps = project
						.getDeliveryReceitpInfo();
				if (deliveryReceitps.size() != 0) {
					List<SelfSendSampleInfo> waterInspect = new ArrayList<SelfSendSampleInfo>();
					List<SelfSendSampleInfo> airInspect = new ArrayList<SelfSendSampleInfo>();
					List<SelfSendSampleInfo> solidInspect = new ArrayList<SelfSendSampleInfo>();
					List<SelfSendSampleInfo> fixedInspect = new ArrayList<SelfSendSampleInfo>();
					List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> fixedProject = new ArrayList<AnalysisProject>();
					for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
						Set<SelfSendSampleInfo> sampleInfos = deliveryReceitp
								.getSelfSendSampleInfo();
						for (SelfSendSampleInfo selfSendSampleInfo : sampleInfos) {
							Set<AnalysisProject> analysisProjects = selfSendSampleInfo
									.getAnalysisProjectSet();
							for (AnalysisProject projectItem : analysisProjects) {
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 1) {
									// 1:水质样品送检单
									if (!waterInspect
											.contains(selfSendSampleInfo)) {
										waterInspect.add(selfSendSampleInfo);
									}

									if (!waterProject.contains(projectItem)) {
										waterProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 2) {
									// 2:环境空气和无组织废气
									if (!airInspect
											.contains(selfSendSampleInfo)) {
										airInspect.add(selfSendSampleInfo);
									}

									if (!airProject.contains(projectItem)) {
										airProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 3) {
									// 3:土壤、底质样品
									if (!solidInspect
											.contains(selfSendSampleInfo)) {
										solidInspect.add(selfSendSampleInfo);
									}

									if (!solidProject.contains(projectItem)) {
										solidProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 4) {
									// 4:固定污染源有组织废气
									if (!fixedInspect
											.contains(selfSendSampleInfo)) {
										fixedInspect.add(selfSendSampleInfo);
									}

									if (!fixedProject.contains(projectItem)) {
										fixedProject.add(projectItem);
									}
								}
							}

						}
					}
					for (AnalysisProject water : waterProject) {
						// 水质送检单
						InspectionSheet waterSheet = new InspectionSheet();
						waterSheet.setSheetType(0);
						waterSheet.setSamplingDate(deliveryReceitps.iterator()
								.next().getSamplingDate());
						waterSheet.setSendSample(deliveryReceitps.iterator()
								.next().getTransferDate());
						waterSheet.setSendUser(deliveryReceitps.iterator()
								.next().getTransferUser());
						waterSheet.setProject(project);
						waterSheet.setAnalysisProject(water);
						waterSheet.setStep(0);
						Set<InspectionSheet_Result> results = new HashSet<InspectionSheet_Result>();
						for (SelfSendSampleInfo sample : waterInspect) {
							Set<AnalysisProject> analysisProjects = sample
									.getAnalysisProjectSet();
							for (AnalysisProject item : analysisProjects) {
								if (item == water) {
									InspectionSheet_Result re = new InspectionSheet_Water();
									re.setSampleInfo(sample);
									results.add(re);
								}
							}
						}
						waterSheet.setResult(results);
						inspectionSheets.add(waterSheet);
					}
					for (AnalysisProject air : airProject) {
						// 空气送检单
						InspectionSheet airSheet = new InspectionSheet();
						airSheet.setSheetType(3);
						airSheet.setSamplingDate(deliveryReceitps.iterator()
								.next().getSamplingDate());
						airSheet.setSendSample(deliveryReceitps.iterator()
								.next().getTransferDate());
						airSheet.setSendUser(deliveryReceitps.iterator().next()
								.getTransferUser());
						airSheet.setProject(project);
						airSheet.setAnalysisProject(air);
						airSheet.setStep(0);
						Set<InspectionSheet_Result> results = new HashSet<InspectionSheet_Result>();
						for (SelfSendSampleInfo sample : airInspect) {
							Set<AnalysisProject> analysisProjects = sample
									.getAnalysisProjectSet();
							for (AnalysisProject item : analysisProjects) {
								if (item == air) {
									InspectionSheet_Result re = new InspectionSheet_Air();
									re.setSampleInfo(sample);
									results.add(re);
								}
							}
						}
						airSheet.setResult(results);
						inspectionSheets.add(airSheet);
					}
					for (AnalysisProject solid : solidProject) {
						// 土壤送检单
						InspectionSheet solidSheet = new InspectionSheet();
						solidSheet.setSheetType(1);
						solidSheet.setSamplingDate(deliveryReceitps.iterator()
								.next().getSamplingDate());
						solidSheet.setSendSample(deliveryReceitps.iterator()
								.next().getTransferDate());
						solidSheet.setSendUser(deliveryReceitps.iterator()
								.next().getTransferUser());
						solidSheet.setProject(project);
						solidSheet.setAnalysisProject(solid);
						solidSheet.setStep(0);
						Set<InspectionSheet_Result> results = new HashSet<InspectionSheet_Result>();
						for (SelfSendSampleInfo sample : solidInspect) {
							Set<AnalysisProject> analysisProjects = sample
									.getAnalysisProjectSet();
							for (AnalysisProject item : analysisProjects) {
								if (item == solid) {
									InspectionSheet_Result re = new InspectionSheet_Soil();
									re.setSampleInfo(sample);
									results.add(re);
								}
							}

						}
						solidSheet.setResult(results);
						inspectionSheets.add(solidSheet);
					}
					for (AnalysisProject fixed : fixedProject) {
						// 固定污染源
						InspectionSheet fixedSheet = new InspectionSheet();
						fixedSheet.setSheetType(2);
						fixedSheet.setSamplingDate(deliveryReceitps.iterator()
								.next().getSamplingDate());
						fixedSheet.setSendSample(deliveryReceitps.iterator()
								.next().getTransferDate());
						fixedSheet.setSendUser(deliveryReceitps.iterator()
								.next().getTransferUser());
						fixedSheet.setProject(project);
						fixedSheet.setAnalysisProject(fixed);
						fixedSheet.setStep(0);
						Set<InspectionSheet_Result> results = new HashSet<InspectionSheet_Result>();
						for (SelfSendSampleInfo sample : fixedInspect) {
							Set<AnalysisProject> analysisProjects = sample
									.getAnalysisProjectSet();
							for (AnalysisProject item : analysisProjects) {
								if (item == fixed) {
									InspectionSheet_Result re = new InspectionSheet_Solid();
									re.setSampleInfo(sample);
									results.add(re);
								}
							}
						}
						fixedSheet.setResult(results);
						inspectionSheets.add(fixedSheet);
					}
					project.setInspectionSheet(inspectionSheets);
					projectService.update(project);
				}
			} else {
				Set<InspectionSheet> inspectionSheets = new HashSet<InspectionSheet>();
				Set<DeliveryReceitp> deliveryReceitps = project
						.getDeliveryReceitpInfo();
				if (deliveryReceitps.size() != 0) {
					List<NonSelfSendSample> waterInspect = new ArrayList<NonSelfSendSample>();
					List<NonSelfSendSample> airInspect = new ArrayList<NonSelfSendSample>();
					List<NonSelfSendSample> solidInspect = new ArrayList<NonSelfSendSample>();
					List<NonSelfSendSample> fixedInspect = new ArrayList<NonSelfSendSample>();
					List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
					List<AnalysisProject> fixedProject = new ArrayList<AnalysisProject>();
					for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
						Set<NonSelfSendSample> sampleInfos = deliveryReceitp
								.getNonSelfSendSampleInfo();
						for (NonSelfSendSample selfSendSampleInfo : sampleInfos) {
							Set<AnalysisProject> analysisProjects = selfSendSampleInfo
									.getAnalysisProjectSet();
							for (AnalysisProject projectItem : analysisProjects) {
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 1) {
									// 1:水质样品送检单
									if (!waterInspect
											.contains(selfSendSampleInfo)) {
										waterInspect.add(selfSendSampleInfo);
									}

									if (!waterProject.contains(projectItem)) {
										waterProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 2) {
									// 2:环境空气和无组织废气
									if (!airInspect
											.contains(selfSendSampleInfo)) {
										airInspect.add(selfSendSampleInfo);
									}

									if (!airProject.contains(projectItem)) {
										airProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 3) {
									// 3:土壤、底质样品
									if (!solidInspect
											.contains(selfSendSampleInfo)) {
										solidInspect.add(selfSendSampleInfo);
									}

									if (!solidProject.contains(projectItem)) {
										solidProject.add(projectItem);
									}
								}
								if (projectItem.getAnalysisCategory()
										.getInspectionSheet() == 4) {
									// 4:固定污染源有组织废气
									if (!fixedInspect
											.contains(selfSendSampleInfo)) {
										fixedInspect.add(selfSendSampleInfo);
									}

									if (!fixedProject.contains(projectItem)) {
										fixedProject.add(projectItem);
									}
								}
							}

						}
					}
					for (AnalysisProject water : waterProject) {
						// 水质送检单
						InspectionSheet waterSheet = new InspectionSheet();
						waterSheet.setSheetType(0);
						waterSheet.setSamplingDate(deliveryReceitps.iterator()
								.next().getSamplingDate());
						waterSheet.setSendSample(deliveryReceitps.iterator()
								.next().getTransferDate());
						waterSheet.setSendUser(deliveryReceitps.iterator()
								.next().getTransferUser());
						waterSheet.setProject(project);
						waterSheet.setAnalysisProject(water);
						waterSheet.setStep(0);
						Set<InspectionSheet_Result> results = new HashSet<InspectionSheet_Result>();
						for (NonSelfSendSample sample : waterInspect) {
							Set<AnalysisProject> analysisProjects = sample
									.getAnalysisProjectSet();
							for (AnalysisProject item : analysisProjects) {
								if (item == water) {
									InspectionSheet_Result re = new InspectionSheet_Water();
									re.setNonSelfSampleInfo(sample);
									results.add(re);
								}
							}
						}
						waterSheet.setResult(results);
						inspectionSheets.add(waterSheet);
					}
					for (AnalysisProject air : airProject) {
						// 空气送检单
						InspectionSheet airSheet = new InspectionSheet();
						airSheet.setSheetType(3);
						airSheet.setSamplingDate(deliveryReceitps.iterator()
								.next().getSamplingDate());
						airSheet.setSendSample(deliveryReceitps.iterator()
								.next().getTransferDate());
						airSheet.setSendUser(deliveryReceitps.iterator().next()
								.getTransferUser());
						airSheet.setProject(project);
						airSheet.setAnalysisProject(air);
						airSheet.setStep(0);
						Set<InspectionSheet_Result> results = new HashSet<InspectionSheet_Result>();
						for (NonSelfSendSample sample : airInspect) {
							Set<AnalysisProject> analysisProjects = sample
									.getAnalysisProjectSet();
							for (AnalysisProject item : analysisProjects) {
								if (item == air) {
									InspectionSheet_Result re = new InspectionSheet_Air();
									re.setNonSelfSampleInfo(sample);
									results.add(re);
								}
							}
						}
						airSheet.setResult(results);
						inspectionSheets.add(airSheet);
					}
					for (AnalysisProject solid : solidProject) {
						// 土壤送检单
						InspectionSheet solidSheet = new InspectionSheet();
						solidSheet.setSheetType(1);
						solidSheet.setSamplingDate(deliveryReceitps.iterator()
								.next().getSamplingDate());
						solidSheet.setSendSample(deliveryReceitps.iterator()
								.next().getTransferDate());
						solidSheet.setSendUser(deliveryReceitps.iterator()
								.next().getTransferUser());
						solidSheet.setProject(project);
						solidSheet.setAnalysisProject(solid);
						solidSheet.setStep(0);
						Set<InspectionSheet_Result> results = new HashSet<InspectionSheet_Result>();
						for (NonSelfSendSample sample : solidInspect) {
							Set<AnalysisProject> analysisProjects = sample
									.getAnalysisProjectSet();
							for (AnalysisProject item : analysisProjects) {
								if (item == solid) {
									InspectionSheet_Result re = new InspectionSheet_Soil();
									re.setNonSelfSampleInfo(sample);
									results.add(re);
								}
							}

						}
						solidSheet.setResult(results);
						inspectionSheets.add(solidSheet);
					}
					for (AnalysisProject fixed : fixedProject) {
						// 固定污染源
						InspectionSheet fixedSheet = new InspectionSheet();
						fixedSheet.setSheetType(2);
						fixedSheet.setSamplingDate(deliveryReceitps.iterator()
								.next().getSamplingDate());
						fixedSheet.setSendSample(deliveryReceitps.iterator()
								.next().getTransferDate());
						fixedSheet.setSendUser(deliveryReceitps.iterator()
								.next().getTransferUser());
						fixedSheet.setProject(project);
						fixedSheet.setAnalysisProject(fixed);
						fixedSheet.setStep(0);
						Set<InspectionSheet_Result> results = new HashSet<InspectionSheet_Result>();
						for (NonSelfSendSample sample : fixedInspect) {
							Set<AnalysisProject> analysisProjects = sample
									.getAnalysisProjectSet();
							for (AnalysisProject item : analysisProjects) {
								if (item == fixed) {
									InspectionSheet_Result re = new InspectionSheet_Solid();
									re.setNonSelfSampleInfo(sample);
									results.add(re);
								}
							}
						}
						fixedSheet.setResult(results);
						inspectionSheets.add(fixedSheet);
					}
					project.setInspectionSheet(inspectionSheets);
					projectService.update(project);
				}
			}

			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String receivePage() {
		try {
			Project project = projectService.getById(viewId);
			if (project.getGainSample().equals("1")) {
				Set<InspectionSheet> inspectionSheets = project
						.getInspectionSheet();
				List<SelfSendSampleInfo> waterInspect = new ArrayList<SelfSendSampleInfo>();
				List<SelfSendSampleInfo> airInspect = new ArrayList<SelfSendSampleInfo>();
				List<SelfSendSampleInfo> solidInspect = new ArrayList<SelfSendSampleInfo>();
				List<SelfSendSampleInfo> fixedInspect = new ArrayList<SelfSendSampleInfo>();
				List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> fixedProject = new ArrayList<AnalysisProject>();
				if (inspectionSheets.size() != 0) {
					for (InspectionSheet inspectionSheet : inspectionSheets) {
						if (inspectionSheet.getSheetType() == 0) {
							// 水质
							if (!waterProject.contains(inspectionSheet
									.getAnalysisProject())) {
								waterProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								waterInspect.add(inspectionSheet_Result
										.getSampleInfo());
							}
						}
						if (inspectionSheet.getSheetType() == 1) {
							// 土壤
							if (!solidProject.contains(inspectionSheet
									.getAnalysisProject())) {
								solidProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								solidInspect.add(inspectionSheet_Result
										.getSampleInfo());
							}
						}
						if (inspectionSheet.getSheetType() == 2) {
							// 固定污染源
							if (!fixedProject.contains(inspectionSheet
									.getAnalysisProject())) {
								fixedProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								fixedInspect.add(inspectionSheet_Result
										.getSampleInfo());
							}
						}
						if (inspectionSheet.getSheetType() == 3) {
							// 空气
							if (!airProject.contains(inspectionSheet
									.getAnalysisProject())) {
								airProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								airInspect.add(inspectionSheet_Result
										.getSampleInfo());
							}
						}
					}
				}

				ActionContext.getContext().put("waterInspect", waterInspect);
				ActionContext.getContext().put("airInspect", airInspect);
				ActionContext.getContext().put("solidInspect", solidInspect);
				ActionContext.getContext().put("fixedInspect", fixedInspect);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solidProject", solidProject);
				ActionContext.getContext().put("fixedProject", fixedProject);
				ActionContext.getContext().put("project", project);
			} else {
				Set<InspectionSheet> inspectionSheets = project
						.getInspectionSheet();
				List<NonSelfSendSample> waterInspect = new ArrayList<NonSelfSendSample>();
				List<NonSelfSendSample> airInspect = new ArrayList<NonSelfSendSample>();
				List<NonSelfSendSample> solidInspect = new ArrayList<NonSelfSendSample>();
				List<NonSelfSendSample> fixedInspect = new ArrayList<NonSelfSendSample>();
				List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> fixedProject = new ArrayList<AnalysisProject>();
				if (inspectionSheets.size() != 0) {
					for (InspectionSheet inspectionSheet : inspectionSheets) {
						if (inspectionSheet.getSheetType() == 0) {
							// 水质
							if (!waterProject.contains(inspectionSheet
									.getAnalysisProject())) {
								waterProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								waterInspect.add(inspectionSheet_Result
										.getNonSelfSampleInfo());
							}
						}
						if (inspectionSheet.getSheetType() == 1) {
							// 土壤
							if (!solidProject.contains(inspectionSheet
									.getAnalysisProject())) {
								solidProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								solidInspect.add(inspectionSheet_Result
										.getNonSelfSampleInfo());
							}
						}
						if (inspectionSheet.getSheetType() == 2) {
							// 固定污染源
							if (!fixedProject.contains(inspectionSheet
									.getAnalysisProject())) {
								fixedProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								fixedInspect.add(inspectionSheet_Result
										.getNonSelfSampleInfo());
							}
						}
						if (inspectionSheet.getSheetType() == 3) {
							// 空气
							if (!airProject.contains(inspectionSheet
									.getAnalysisProject())) {
								airProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								airInspect.add(inspectionSheet_Result
										.getNonSelfSampleInfo());
							}
						}
					}
				}

				ActionContext.getContext().put("waterInspect", waterInspect);
				ActionContext.getContext().put("airInspect", airInspect);
				ActionContext.getContext().put("solidInspect", solidInspect);
				ActionContext.getContext().put("fixedInspect", fixedInspect);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solidProject", solidProject);
				ActionContext.getContext().put("fixedProject", fixedProject);
				ActionContext.getContext().put("project", project);
			}
			ActionContext.getContext().put("inspection",
					project.getInspectionSheet());

		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return "receivePage";
	}

	/**
	 * 水质送检单查看
	 * 
	 * @return
	 */
	public String viewWaterDetailPage() {
		try {
			AnalysisProject analysisProject = analysisProjectService
					.getById(itemId);
			Project pj = projectService.getById(viewId);
			List<SelfSendSampleInfo> selfSampleInfoList = new ArrayList<SelfSendSampleInfo>();
			Set<InspectionSheet> inspectionSheets = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheets) {
				if (inspectionSheet.getSheetType() == 0
						&& inspectionSheet.getAnalysisProject() == analysisProject) {
					ActionContext.getContext().put("sheet", inspectionSheet);
				}
			}
			Delivery_SampleType sampleType =  delivery_SampleTypeService.findByAnalysis(pj, analysisProject);
			ActionContext.getContext().put("entity", pj);
			ActionContext.getContext().put("sampleType", sampleType);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "viewWaterDetailPage";
	}

	/**
	 * 空气送检单
	 * 
	 * @return
	 */
	public String viewAirDetailPage() {
		try {
			AnalysisProject analysisProject = analysisProjectService
					.getById(itemId);
			Project pj = projectService.getById(viewId);
			List<SelfSendSampleInfo> selfSampleInfoList = new ArrayList<SelfSendSampleInfo>();
			Set<InspectionSheet> inspectionSheets = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheets) {
				if (inspectionSheet.getSheetType() == 3
						&& inspectionSheet.getAnalysisProject() == analysisProject) {
					ActionContext.getContext().put("sheet", inspectionSheet);
				}
			}
			ActionContext.getContext().put("entity", pj);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "viewAirDetailPage";
	}

	/**
	 * 固体污染源送检单
	 * 
	 * @return
	 */
	public String viewSolidDetailPage() {
		try {
			AnalysisProject analysisProject = analysisProjectService
					.getById(itemId);
			Project pj = projectService.getById(viewId);
			List<SelfSendSampleInfo> selfSampleInfoList = new ArrayList<SelfSendSampleInfo>();
			Set<InspectionSheet> inspectionSheets = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheets) {
				if (inspectionSheet.getSheetType() == 2
						&& inspectionSheet.getAnalysisProject() == analysisProject) {
					ActionContext.getContext().put("sheet", inspectionSheet);
				}
			}
			ActionContext.getContext().put("entity", pj);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "viewSolidDetailPage";
	}

	/**
	 * 土壤送检单
	 * 
	 * @return
	 */
	public String viewSoilDetailPage() {
		try {
			AnalysisProject analysisProject = analysisProjectService
					.getById(itemId);
			Project pj = projectService.getById(viewId);
			List<SelfSendSampleInfo> selfSampleInfoList = new ArrayList<SelfSendSampleInfo>();
			Set<InspectionSheet> inspectionSheets = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheets) {
				if (inspectionSheet.getSheetType() == 1
						&& inspectionSheet.getAnalysisProject() == analysisProject) {
					ActionContext.getContext().put("sheet", inspectionSheet);
				}
			}
			ActionContext.getContext().put("entity", pj);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "viewSoilDetailPage";
	}
	
	
	/**
	 * 水质送检单填写
	 * 
	 * @return
	 */
	public String writeWaterDetailPage() {
		try {
			AnalysisProject analysisProject = analysisProjectService
					.getById(itemId);
			Project pj = projectService.getById(viewId);
			List<SelfSendSampleInfo> selfSampleInfoList = new ArrayList<SelfSendSampleInfo>();
			Set<InspectionSheet> inspectionSheets = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheets) {
				if (inspectionSheet.getSheetType() == 0
						&& inspectionSheet.getAnalysisProject() == analysisProject) {
					ActionContext.getContext().put("sheet", inspectionSheet);
					List<InspectionSheet_Water> resultList=new ArrayList<InspectionSheet_Water>();
					Set<InspectionSheet_Result> results=inspectionSheet.getResult();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						resultList.add((InspectionSheet_Water)inspectionSheet_Result);
					}
					ActionContext.getContext().put("result", resultList);
				}
			}

			ActionContext.getContext().put("entity", pj);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "writeWaterDetailPage";
	}


	/**
	 * 空气送检单填写
	 * 
	 * @return
	 */
	public String writeAirDetailPage() {
		try {
			AnalysisProject analysisProject = analysisProjectService
					.getById(itemId);
			Project pj = projectService.getById(viewId);
			List<SelfSendSampleInfo> selfSampleInfoList = new ArrayList<SelfSendSampleInfo>();
			Set<InspectionSheet> inspectionSheets = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheets) {
				if (inspectionSheet.getSheetType() == 3
						&& inspectionSheet.getAnalysisProject() == analysisProject) {
					ActionContext.getContext().put("sheet", inspectionSheet);
					List<InspectionSheet_Air> resultList=new ArrayList<InspectionSheet_Air>();
					Set<InspectionSheet_Result> results=inspectionSheet.getResult();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						resultList.add((InspectionSheet_Air)inspectionSheet_Result);
					}
					ActionContext.getContext().put("result", resultList);
				}
			}
			ActionContext.getContext().put("entity", pj);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "writeAirDetailPage";
	}

	/**
	 * 固体污染源送检单
	 * 
	 * @return
	 */
	public String writeSolidDetailPage() {
		try {
			AnalysisProject analysisProject = analysisProjectService
					.getById(itemId);
			Project pj = projectService.getById(viewId);
			List<SelfSendSampleInfo> selfSampleInfoList = new ArrayList<SelfSendSampleInfo>();
			Set<InspectionSheet> inspectionSheets = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheets) {
				if (inspectionSheet.getSheetType() == 2
						&& inspectionSheet.getAnalysisProject() == analysisProject) {
					ActionContext.getContext().put("sheet", inspectionSheet);
					List<InspectionSheet_Solid> resultList=new ArrayList<InspectionSheet_Solid>();
					Set<InspectionSheet_Result> results=inspectionSheet.getResult();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						resultList.add((InspectionSheet_Solid)inspectionSheet_Result);
					}
					ActionContext.getContext().put("result", resultList);
				}
			}
			ActionContext.getContext().put("entity", pj);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "writeSolidDetailPage";
	}

	/**
	 * 土壤送检单
	 * 
	 * @return
	 */
	public String writeSoilDetailPage() {
		try {
			AnalysisProject analysisProject = analysisProjectService
					.getById(itemId);
			Project pj = projectService.getById(viewId);
			List<SelfSendSampleInfo> selfSampleInfoList = new ArrayList<SelfSendSampleInfo>();
			Set<InspectionSheet> inspectionSheets = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheets) {
				if (inspectionSheet.getSheetType() == 1
						&& inspectionSheet.getAnalysisProject() == analysisProject) {
					ActionContext.getContext().put("sheet", inspectionSheet);
					List<InspectionSheet_Soil> resultList=new ArrayList<InspectionSheet_Soil>();
					Set<InspectionSheet_Result> results=inspectionSheet.getResult();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						resultList.add((InspectionSheet_Soil)inspectionSheet_Result);
					}
					ActionContext.getContext().put("result", resultList);
				}
			}
			ActionContext.getContext().put("entity", pj);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "writeSoilDetailPage";
	}
	

	/**
	 * 全部删除送检单
	 * 
	 * @return
	 */
	public String deleteAll() {
		try {
			System.out.println(viewId);
			Project pj = projectService.getById(viewId);
			pj.setAnalysisedProject(null);
			projectService.update(pj);
			if (pj != null) {
				List<InspectionSheet> inspectionSheetList = inspectionSheetService
						.findAll(" WHERE project=" + viewId);
				for (InspectionSheet inspectionSheet : inspectionSheetList) {
					inspectionSheet.setAnalysisProject(null);
					inspectionSheetService.delete(inspectionSheet.getId());
				}
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String export() {
		Project project = projectService.getById(viewId);
		if (project.getGainSample().equals("1")) {
			AnalysisProject analysis = analysisProjectService.getById(itemId);
			Set<InspectionSheet> inspectionSheets = project
					.getInspectionSheet();
			InspectionSheet sheet = null;
			for (InspectionSheet inspectionSheet : inspectionSheets) {
				if (inspectionSheet.getAnalysisProject() != analysis) {
					continue;
				}
				sheet = inspectionSheet;
			}

			ActionContext ac = ActionContext.getContext();
			ServletContext sc = (ServletContext) ac
					.get(ServletActionContext.SERVLET_CONTEXT);
			String path = sc.getRealPath("/") + "\\files";
			File file = new File(path);
			if (!file.exists() && !file.isDirectory()) {
				file.mkdir();
			}
			String br = "<w:p w:rsidR='007218C5' w:rsidRDefault='007218C5'/>";
			String space = "<w:r><w:rPr><w:rFonts w:hint='eastAsia'/></w:rPr><w:t xml:space='preserve'> </w:t></w:r>";
			Map<String, Object> dataMap = new HashMap<String, Object>();
			if (sheet != null) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				if (sheet.getSheetType() == 0) {
					// 水质
					dataMap.put(
							"samplingDate",
							sheet.getSamplingDate() == null ? "" : sdf
									.format(sheet.getSamplingDate()));// 采样日期
					dataMap.put("sendDate", sdf.format(sheet.getSendSample()));// 送样日期
					dataMap.put("analysisProject", sheet.getAnalysisProject()
							.getName());// 分析项目
					dataMap.put("sendUser", sheet.getSendUser().getName());// 送样者
					dataMap.put("receiver", sheet.getReceiver() == null ? "   "
							: sheet.getReceiver().getName());// 接样者
					Set<InspectionSheet_Result> results = sheet.getResult();
					List<TempInspection> tempInspections = new ArrayList<TempInspection>();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						if (inspectionSheet_Result != null) {
							InspectionSheet_Water water = (InspectionSheet_Water) inspectionSheet_Result;
							TempInspection temp = new TempInspection();
							temp.setIdentify(inspectionSheet_Result
									.getSampleInfo().getIdentify());
							temp.setAnalysisResult(water.getAnalysisResult() == 0 ? " "
									: water.getAnalysisResult() + "");
							temp.setSampProp(water.getSampleProperties() == null ? " "
									: water.getSampleProperties());
							tempInspections.add(temp);
						}
					}
					dataMap.put("selfSendSampleInfoList", tempInspections);// 样品信息
					dataMap.put("analyst", sheet.getAnalyst() == null ? "   "
							: sheet.getAnalyst().getName());// 分析者
					dataMap.put(
							"analystDate",
							sheet.getAnalysisDate() == null ? "   " : sdf
									.format(sheet.getAnalysisDate()));// 分析日期
					dataMap.put("checkUser",
							sheet.getReceiver() == null ? "   " : sheet
									.getReceiver().getName());// 复核者
					dataMap.put("checkfinal", sheet.getAudit() == null ? "   "
							: sheet.getAudit().getName());// 审核者
				}
				if (sheet.getSheetType() == 1) {
					// 土壤
					dataMap.put("analysisProject", sheet.getAnalysisProject()
							.getName());// 分析项目
					dataMap.put("sendUser", sheet.getSendUser().getName());// 送样者
					dataMap.put("receiver", sheet.getReceiver() == null ? "   "
							: sheet.getReceiver().getName());// 接样者
					dataMap.put("sendDate", sdf.format(sheet.getSendSample()));// 送样日期
					dataMap.put("analyst", sheet.getAnalyst() == null ? "   "
							: sheet.getAnalyst().getName());// 分析者
					dataMap.put(
							"analystDate",
							sheet.getAnalysisDate() == null ? "   " : sdf
									.format(sheet.getAnalysisDate()));// 分析日期
					dataMap.put("checkUser",
							sheet.getReceiver() == null ? "   " : sheet
									.getReceiver().getName());// 复核者
					dataMap.put("checkfinal", sheet.getAudit() == null ? "   "
							: sheet.getAudit().getName());// 审核者
					Set<InspectionSheet_Result> results = sheet.getResult();
					List<TempInspection> tempInspections = new ArrayList<TempInspection>();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						if (inspectionSheet_Result != null) {
							InspectionSheet_Soil soil = (InspectionSheet_Soil) inspectionSheet_Result;
							TempInspection temp = new TempInspection();
							temp.setIdentify(inspectionSheet_Result
									.getSampleInfo().getIdentify());
							temp.setAnalysisResult(soil.getAnalysisResult() == 0 ? " "
									: soil.getAnalysisResult() + "");
							temp.setName(inspectionSheet_Result.getSampleInfo()
									.getSampleName() == null ? " "
									: inspectionSheet_Result.getSampleInfo()
											.getSampleName());
							temp.setPoint(soil.getSamplingSection() == null ? "  "
									: soil.getSamplingSection());
							temp.setOther(soil.getRemarks() == null ? "   "
									: soil.getRemarks());
							tempInspections.add(temp);
						}
					}
					dataMap.put("selfSendSampleInfoList", tempInspections);// 样品信息
				}
				if (sheet.getSheetType() == 2) {
					// 固定污染源
					dataMap.put("analysisProject", sheet.getAnalysisProject()
							.getName());// 分析项目
					dataMap.put("sendUser", sheet.getSendUser().getName());// 送样者
					dataMap.put("receiver", sheet.getReceiver() == null ? "   "
							: sheet.getReceiver().getName());// 接样者
					dataMap.put("sendDate", sdf.format(sheet.getSendSample()));// 送样日期
					dataMap.put("analyst", sheet.getAnalyst() == null ? "   "
							: sheet.getAnalyst().getName());// 分析者
					dataMap.put(
							"analystDate",
							sheet.getAnalysisDate() == null ? "   " : sdf
									.format(sheet.getAnalysisDate()));// 分析日期
					dataMap.put("checkUser",
							sheet.getReceiver() == null ? "   " : sheet
									.getReceiver().getName());// 复核者
					dataMap.put("checkfinal", sheet.getAudit() == null ? "   "
							: sheet.getAudit().getName());// 审核者
					Set<InspectionSheet_Result> results = sheet.getResult();
					List<TempInspection> tempInspections = new ArrayList<TempInspection>();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						if (inspectionSheet_Result != null) {
							InspectionSheet_Solid solid = (InspectionSheet_Solid) inspectionSheet_Result;
							TempInspection temp = new TempInspection();
							temp.setIdentify(inspectionSheet_Result
									.getSampleInfo().getIdentify());
							temp.setAnalysisResult(solid.getAnalysisResult() == 0 ? " "
									: solid.getAnalysisResult() + "");
							temp.setName(inspectionSheet_Result.getSampleInfo()
									.getSampleName() == null ? " "
									: inspectionSheet_Result.getSampleInfo()
											.getSampleName());
							temp.setVolume(solid.getStandardVolume() == 0 ? "  "
									: solid.getStandardVolume() + "");
							temp.setFlow(solid.getStandardDryFlow() == 0 ? "  "
									: solid.getStandardDryFlow() + "");
							temp.setConcentration(solid.getConcentration() == 0 ? "  "
									: solid.getConcentration() + "");
							temp.setDischarge(solid.getDischarge() == 0 ? "  "
									: solid.getDischarge() + "");
							tempInspections.add(temp);
						}
					}
					dataMap.put("selfSendSampleInfoList", tempInspections);// 样品信息
				}
				if (sheet.getSheetType() == 3) {
					// 环境空气
					dataMap.put("analysisProject", sheet.getAnalysisProject()
							.getName());// 分析项目
					dataMap.put("sendUser", sheet.getSendUser().getName());// 送样者
					dataMap.put("receiver", sheet.getReceiver() == null ? "   "
							: sheet.getReceiver().getName());// 接样者
					dataMap.put("sendDate", sdf.format(sheet.getSendSample()));// 送样日期
					dataMap.put("analyst", sheet.getAnalyst() == null ? "   "
							: sheet.getAnalyst().getName());// 分析者
					dataMap.put(
							"analystDate",
							sheet.getAnalysisDate() == null ? "   " : sdf
									.format(sheet.getAnalysisDate()));// 分析日期
					dataMap.put("checkUser",
							sheet.getReceiver() == null ? "   " : sheet
									.getReceiver().getName());// 复核者
					dataMap.put("checkfinal", sheet.getAudit() == null ? "   "
							: sheet.getAudit().getName());// 审核者
					Set<InspectionSheet_Result> results = sheet.getResult();
					List<TempInspection> tempInspections = new ArrayList<TempInspection>();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						if (inspectionSheet_Result != null) {
							InspectionSheet_Air air = (InspectionSheet_Air) inspectionSheet_Result;
							TempInspection temp = new TempInspection();
							temp.setIdentify(inspectionSheet_Result
									.getSampleInfo().getIdentify());
							temp.setConcentration(air.getConcentration() == 0 ? "  "
									: air.getConcentration() + "");
							temp.setName(inspectionSheet_Result.getSampleInfo()
									.getSampleName() == null ? " "
									: inspectionSheet_Result.getSampleInfo()
											.getSampleName());
							temp.setVolume(air.getStandardVolume() == 0 ? "  "
									: air.getStandardVolume() + "");
							temp.setAnalysisResult(air.getAnalysisResult() == 0 ? "   "
									: air.getAnalysisResult() + "");
							tempInspections.add(temp);
						}
					}
					dataMap.put("selfSendSampleInfoList", tempInspections);// 样品信息
				}
			}
			DocumentHandler dh = new DocumentHandler();
			if (sheet.getSheetType() == 0) {
				dh.createDoc(dataMap, "InspectionSheet_Water.xml", path + "\\"
						+ project.getContractId() + "水质样品送检单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "水质样品送检单.doc";
				realFileName = project.getContractId() + "水质样品送检单.doc";
			}
			if (sheet.getSheetType() == 1) {
				dh.createDoc(dataMap, "InspectionSheet_Soil.xml", path + "\\"
						+ project.getContractId() + "土壤、底质样品送检单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "土壤、底质样品送检单.doc";
				realFileName = project.getContractId() + "土壤、底质样品送检单.doc";
			}
			if (sheet.getSheetType() == 2) {
				dh.createDoc(dataMap, "InspectionSheet_Solid.xml", path + "\\"
						+ project.getContractId() + "固定污染源有组织废气样品送检单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "固定污染源有组织废气样品送检单.doc";
				realFileName = project.getContractId() + "固定污染源有组织废气样品送检单.doc";
			}
			if (sheet.getSheetType() == 3) {
				dh.createDoc(dataMap, "InspectionSheet_Air.xml", path + "\\"
						+ project.getContractId() + "环境空气和无组织废气样品送检单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "环境空气和无组织废气样品送检单.doc";
				realFileName = project.getContractId() + "环境空气和无组织废气样品送检单.doc";
			}
		} else {
			AnalysisProject analysis = analysisProjectService.getById(itemId);
			Set<InspectionSheet> inspectionSheets = project
					.getInspectionSheet();
			InspectionSheet sheet = null;
			for (InspectionSheet inspectionSheet : inspectionSheets) {
				if (inspectionSheet.getAnalysisProject() != analysis) {
					continue;
				}
				sheet = inspectionSheet;
			}

			ActionContext ac = ActionContext.getContext();
			ServletContext sc = (ServletContext) ac
					.get(ServletActionContext.SERVLET_CONTEXT);
			String path = sc.getRealPath("/") + "\\files";
			File file = new File(path);
			if (!file.exists() && !file.isDirectory()) {
				file.mkdir();
			}
			String br = "<w:p w:rsidR='007218C5' w:rsidRDefault='007218C5'/>";
			String space = "<w:r><w:rPr><w:rFonts w:hint='eastAsia'/></w:rPr><w:t xml:space='preserve'> </w:t></w:r>";
			Map<String, Object> dataMap = new HashMap<String, Object>();
			if (sheet != null) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				if (sheet.getSheetType() == 0) {
					// 水质
					dataMap.put(
							"samplingDate",
							sheet.getSamplingDate() == null ? "" : sdf
									.format(sheet.getSamplingDate()));// 采样日期
					dataMap.put("sendDate", sdf.format(sheet.getSendSample()));// 送样日期
					dataMap.put("analysisProject", sheet.getAnalysisProject()
							.getName());// 分析项目
					dataMap.put("sendUser", sheet.getSendUser().getName());// 送样者
					dataMap.put("receiver", sheet.getReceiver() == null ? "   "
							: sheet.getReceiver().getName());// 接样者
					Set<InspectionSheet_Result> results = sheet.getResult();
					List<TempInspection> tempInspections = new ArrayList<TempInspection>();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						if (inspectionSheet_Result != null) {
							InspectionSheet_Water water = (InspectionSheet_Water) inspectionSheet_Result;
							TempInspection temp = new TempInspection();
							temp.setIdentify(inspectionSheet_Result
									.getNonSelfSampleInfo().getIdentify());
							temp.setAnalysisResult(water.getAnalysisResult() == 0 ? " "
									: water.getAnalysisResult() + "");
							temp.setSampProp(water.getSampleProperties() == null ? " "
									: water.getSampleProperties());
							tempInspections.add(temp);
						}
					}
					dataMap.put("selfSendSampleInfoList", tempInspections);// 样品信息
					dataMap.put("analyst", sheet.getAnalyst() == null ? "   "
							: sheet.getAnalyst().getName());// 分析者
					dataMap.put(
							"analystDate",
							sheet.getAnalysisDate() == null ? "   " : sdf
									.format(sheet.getAnalysisDate()));// 分析日期
					dataMap.put("checkUser",
							sheet.getReceiver() == null ? "   " : sheet
									.getReceiver().getName());// 复核者
					dataMap.put("checkfinal", sheet.getAudit() == null ? "   "
							: sheet.getAudit().getName());// 审核者
				}
				if (sheet.getSheetType() == 1) {
					// 土壤
					dataMap.put("analysisProject", sheet.getAnalysisProject()
							.getName());// 分析项目
					dataMap.put("sendUser", sheet.getSendUser().getName());// 送样者
					dataMap.put("receiver", sheet.getReceiver() == null ? "   "
							: sheet.getReceiver().getName());// 接样者
					dataMap.put("sendDate", sdf.format(sheet.getSendSample()));// 送样日期
					dataMap.put("analyst", sheet.getAnalyst() == null ? "   "
							: sheet.getAnalyst().getName());// 分析者
					dataMap.put(
							"analystDate",
							sheet.getAnalysisDate() == null ? "   " : sdf
									.format(sheet.getAnalysisDate()));// 分析日期
					dataMap.put("checkUser",
							sheet.getReceiver() == null ? "   " : sheet
									.getReceiver().getName());// 复核者
					dataMap.put("checkfinal", sheet.getAudit() == null ? "   "
							: sheet.getAudit().getName());// 审核者
					Set<InspectionSheet_Result> results = sheet.getResult();
					List<TempInspection> tempInspections = new ArrayList<TempInspection>();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						if (inspectionSheet_Result != null) {
							InspectionSheet_Soil soil = (InspectionSheet_Soil) inspectionSheet_Result;
							TempInspection temp = new TempInspection();
							temp.setIdentify(inspectionSheet_Result
									.getNonSelfSampleInfo().getIdentify());
							temp.setAnalysisResult(soil.getAnalysisResult() == 0 ? " "
									: soil.getAnalysisResult() + "");
							temp.setName(inspectionSheet_Result
									.getNonSelfSampleInfo().getSampleName() == null ? " "
									: inspectionSheet_Result
											.getNonSelfSampleInfo()
											.getSampleName());
							temp.setPoint(soil.getSamplingSection() == null ? "  "
									: soil.getSamplingSection());
							temp.setOther(soil.getRemarks() == null ? "   "
									: soil.getRemarks());
							tempInspections.add(temp);
						}
					}
					dataMap.put("selfSendSampleInfoList", tempInspections);// 样品信息
				}
				if (sheet.getSheetType() == 2) {
					// 固定污染源
					dataMap.put("analysisProject", sheet.getAnalysisProject()
							.getName());// 分析项目
					dataMap.put("sendUser", sheet.getSendUser().getName());// 送样者
					dataMap.put("receiver", sheet.getReceiver() == null ? "   "
							: sheet.getReceiver().getName());// 接样者
					dataMap.put("sendDate", sdf.format(sheet.getSendSample()));// 送样日期
					dataMap.put("analyst", sheet.getAnalyst() == null ? "   "
							: sheet.getAnalyst().getName());// 分析者
					dataMap.put(
							"analystDate",
							sheet.getAnalysisDate() == null ? "   " : sdf
									.format(sheet.getAnalysisDate()));// 分析日期
					dataMap.put("checkUser",
							sheet.getReceiver() == null ? "   " : sheet
									.getReceiver().getName());// 复核者
					dataMap.put("checkfinal", sheet.getAudit() == null ? "   "
							: sheet.getAudit().getName());// 审核者
					Set<InspectionSheet_Result> results = sheet.getResult();
					List<TempInspection> tempInspections = new ArrayList<TempInspection>();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						if (inspectionSheet_Result != null) {
							InspectionSheet_Solid solid = (InspectionSheet_Solid) inspectionSheet_Result;
							TempInspection temp = new TempInspection();
							temp.setIdentify(inspectionSheet_Result
									.getNonSelfSampleInfo().getIdentify());
							temp.setAnalysisResult(solid.getAnalysisResult() == 0 ? " "
									: solid.getAnalysisResult() + "");
							temp.setName(inspectionSheet_Result
									.getNonSelfSampleInfo().getSampleName() == null ? " "
									: inspectionSheet_Result
											.getNonSelfSampleInfo()
											.getSampleName());
							temp.setVolume(solid.getStandardVolume() == 0 ? "  "
									: solid.getStandardVolume() + "");
							temp.setFlow(solid.getStandardDryFlow() == 0 ? "  "
									: solid.getStandardDryFlow() + "");
							temp.setConcentration(solid.getConcentration() == 0 ? "  "
									: solid.getConcentration() + "");
							temp.setDischarge(solid.getDischarge() == 0 ? "  "
									: solid.getDischarge() + "");
							tempInspections.add(temp);
						}
					}
					dataMap.put("selfSendSampleInfoList", tempInspections);// 样品信息
				}
				if (sheet.getSheetType() == 3) {
					// 环境空气
					dataMap.put("analysisProject", sheet.getAnalysisProject()
							.getName());// 分析项目
					dataMap.put("sendUser", sheet.getSendUser().getName());// 送样者
					dataMap.put("receiver", sheet.getReceiver() == null ? "   "
							: sheet.getReceiver().getName());// 接样者
					dataMap.put("sendDate", sdf.format(sheet.getSendSample()));// 送样日期
					dataMap.put("analyst", sheet.getAnalyst() == null ? "   "
							: sheet.getAnalyst().getName());// 分析者
					dataMap.put(
							"analystDate",
							sheet.getAnalysisDate() == null ? "   " : sdf
									.format(sheet.getAnalysisDate()));// 分析日期
					dataMap.put("checkUser",
							sheet.getReceiver() == null ? "   " : sheet
									.getReceiver().getName());// 复核者
					dataMap.put("checkfinal", sheet.getAudit() == null ? "   "
							: sheet.getAudit().getName());// 审核者
					Set<InspectionSheet_Result> results = sheet.getResult();
					List<TempInspection> tempInspections = new ArrayList<TempInspection>();
					for (InspectionSheet_Result inspectionSheet_Result : results) {
						if (inspectionSheet_Result != null) {
							InspectionSheet_Air air = (InspectionSheet_Air) inspectionSheet_Result;
							TempInspection temp = new TempInspection();
							temp.setIdentify(inspectionSheet_Result
									.getNonSelfSampleInfo().getIdentify());
							temp.setConcentration(air.getConcentration() == 0 ? "  "
									: air.getConcentration() + "");
							temp.setName(inspectionSheet_Result
									.getNonSelfSampleInfo().getSampleName() == null ? " "
									: inspectionSheet_Result
											.getNonSelfSampleInfo()
											.getSampleName());
							temp.setVolume(air.getStandardVolume() == 0 ? "  "
									: air.getStandardVolume() + "");
							temp.setAnalysisResult(air.getAnalysisResult() == 0 ? "   "
									: air.getAnalysisResult() + "");
							tempInspections.add(temp);
						}
					}
					dataMap.put("selfSendSampleInfoList", tempInspections);// 样品信息
				}
			}
			DocumentHandler dh = new DocumentHandler();
			if (sheet.getSheetType() == 0) {
				dh.createDoc(dataMap, "InspectionSheet_Water.xml", path + "\\"
						+ project.getContractId() + "水质样品送检单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "水质样品送检单.doc";
				realFileName = project.getContractId() + "水质样品送检单.doc";
			}
			if (sheet.getSheetType() == 1) {
				dh.createDoc(dataMap, "InspectionSheet_Soil.xml", path + "\\"
						+ project.getContractId() + "土壤、底质样品送检单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "土壤、底质样品送检单.doc";
				realFileName = project.getContractId() + "土壤、底质样品送检单.doc";
			}
			if (sheet.getSheetType() == 2) {
				dh.createDoc(dataMap, "InspectionSheet_Solid.xml", path + "\\"
						+ project.getContractId() + "固定污染源有组织废气样品送检单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "固定污染源有组织废气样品送检单.doc";
				realFileName = project.getContractId() + "固定污染源有组织废气样品送检单.doc";
			}
			if (sheet.getSheetType() == 3) {
				dh.createDoc(dataMap, "InspectionSheet_Air.xml", path + "\\"
						+ project.getContractId() + "环境空气和无组织废气样品送检单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "环境空气和无组织废气样品送检单.doc";
				realFileName = project.getContractId() + "环境空气和无组织废气样品送检单.doc";
			}
		}

		return "export";
	}

	public String viewPage() {
		try {
			Project project = projectService.getById(viewId);
			if (project.getGainSample().equals("1")) {
				Set<InspectionSheet> inspectionSheets = project
						.getInspectionSheet();
				List<SelfSendSampleInfo> waterInspect = new ArrayList<SelfSendSampleInfo>();
				List<SelfSendSampleInfo> airInspect = new ArrayList<SelfSendSampleInfo>();
				List<SelfSendSampleInfo> solidInspect = new ArrayList<SelfSendSampleInfo>();
				List<SelfSendSampleInfo> fixedInspect = new ArrayList<SelfSendSampleInfo>();
				List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> fixedProject = new ArrayList<AnalysisProject>();
				if (inspectionSheets.size() != 0) {
					for (InspectionSheet inspectionSheet : inspectionSheets) {
						if (inspectionSheet.getSheetType() == 0) {
							// 水质
							if (!waterProject.contains(inspectionSheet
									.getAnalysisProject())) {
								waterProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								if (!waterInspect
										.contains(inspectionSheet_Result
												.getSampleInfo())) {
									waterInspect.add(inspectionSheet_Result
											.getSampleInfo());
								}

							}
						}
						if (inspectionSheet.getSheetType() == 1) {
							// 土壤
							if (!solidProject.contains(inspectionSheet
									.getAnalysisProject())) {
								solidProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								if (!solidInspect
										.contains(inspectionSheet_Result
												.getSampleInfo())) {
									solidInspect.add(inspectionSheet_Result
											.getSampleInfo());
								}

							}
						}
						if (inspectionSheet.getSheetType() == 2) {
							// 固定污染源
							if (!fixedProject.contains(inspectionSheet
									.getAnalysisProject())) {
								fixedProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								if (!fixedInspect
										.contains(inspectionSheet_Result
												.getSampleInfo())) {
									fixedInspect.add(inspectionSheet_Result
											.getSampleInfo());
								}
							}
						}
						if (inspectionSheet.getSheetType() == 3) {
							// 空气
							if (!airProject.contains(inspectionSheet
									.getAnalysisProject())) {
								airProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								if (!airInspect.contains(inspectionSheet_Result
										.getSampleInfo())) {
									airInspect.add(inspectionSheet_Result
											.getSampleInfo());
								}
							}
						}
					}
				}

				ActionContext.getContext().put("waterInspect", waterInspect);
				ActionContext.getContext().put("airInspect", airInspect);
				ActionContext.getContext().put("solidInspect", solidInspect);
				ActionContext.getContext().put("fixedInspect", fixedInspect);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solidProject", solidProject);
				ActionContext.getContext().put("fixedProject", fixedProject);
				ActionContext.getContext().put("project", project);
			} else {
				Set<InspectionSheet> inspectionSheets = project
						.getInspectionSheet();
				List<NonSelfSendSample> waterInspect = new ArrayList<NonSelfSendSample>();
				List<NonSelfSendSample> airInspect = new ArrayList<NonSelfSendSample>();
				List<NonSelfSendSample> solidInspect = new ArrayList<NonSelfSendSample>();
				List<NonSelfSendSample> fixedInspect = new ArrayList<NonSelfSendSample>();
				List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> fixedProject = new ArrayList<AnalysisProject>();
				if (inspectionSheets.size() != 0) {
					for (InspectionSheet inspectionSheet : inspectionSheets) {
						if (inspectionSheet.getSheetType() == 0) {
							// 水质
							if (!waterProject.contains(inspectionSheet
									.getAnalysisProject())) {
								waterProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								waterInspect.add(inspectionSheet_Result
										.getNonSelfSampleInfo());
							}
						}
						if (inspectionSheet.getSheetType() == 1) {
							// 土壤
							if (!solidProject.contains(inspectionSheet
									.getAnalysisProject())) {
								solidProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								solidInspect.add(inspectionSheet_Result
										.getNonSelfSampleInfo());
							}
						}
						if (inspectionSheet.getSheetType() == 2) {
							// 固定污染源
							if (!fixedProject.contains(inspectionSheet
									.getAnalysisProject())) {
								fixedProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								fixedInspect.add(inspectionSheet_Result
										.getNonSelfSampleInfo());
							}
						}
						if (inspectionSheet.getSheetType() == 3) {
							// 空气
							if (!airProject.contains(inspectionSheet
									.getAnalysisProject())) {
								airProject.add(inspectionSheet
										.getAnalysisProject());
							}
							Set<InspectionSheet_Result> results = inspectionSheet
									.getResult();
							for (InspectionSheet_Result inspectionSheet_Result : results) {
								airInspect.add(inspectionSheet_Result
										.getNonSelfSampleInfo());
							}
						}
					}
				}

				ActionContext.getContext().put("waterInspect", waterInspect);
				ActionContext.getContext().put("airInspect", airInspect);
				ActionContext.getContext().put("solidInspect", solidInspect);
				ActionContext.getContext().put("fixedInspect", fixedInspect);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solidProject", solidProject);
				ActionContext.getContext().put("fixedProject", fixedProject);
				ActionContext.getContext().put("project", project);
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}

		return "viewPage";
	}
	
	public String viewReportPage() {
		try {
			Project project = projectService.getById(viewId);
			Set<InspectionSheet> inspectionSheets=project.getInspectionSheet();
			ActionContext.getContext().put("inspectionSheets", inspectionSheets);
			ActionContext.getContext().put("projectId", viewId);
			if (project.getGainSample().equals("1")) {
				
//				Set<InspectionSheet> inspectionSheets = project
//						.getInspectionSheet();
//				List<SelfSendSampleInfo> waterInspect = new ArrayList<SelfSendSampleInfo>();
//				List<SelfSendSampleInfo> airInspect = new ArrayList<SelfSendSampleInfo>();
//				List<SelfSendSampleInfo> solidInspect = new ArrayList<SelfSendSampleInfo>();
//				List<SelfSendSampleInfo> fixedInspect = new ArrayList<SelfSendSampleInfo>();
//				List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
//				List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
//				List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
//				List<AnalysisProject> fixedProject = new ArrayList<AnalysisProject>();
//				if (inspectionSheets.size() != 0) {
//					for (InspectionSheet inspectionSheet : inspectionSheets) {
//						if (inspectionSheet.getSheetType() == 0) {
//							// 水质
//							if (!waterProject.contains(inspectionSheet
//									.getAnalysisProject())) {
//								waterProject.add(inspectionSheet
//										.getAnalysisProject());
//							}
//							Set<InspectionSheet_Result> results = inspectionSheet
//									.getResult();
//							for (InspectionSheet_Result inspectionSheet_Result : results) {
//								if (!waterInspect
//										.contains(inspectionSheet_Result
//												.getSampleInfo())) {
//									waterInspect.add(inspectionSheet_Result
//											.getSampleInfo());
//								}
//
//							}
//						}
//						if (inspectionSheet.getSheetType() == 1) {
//							// 土壤
//							if (!solidProject.contains(inspectionSheet
//									.getAnalysisProject())) {
//								solidProject.add(inspectionSheet
//										.getAnalysisProject());
//							}
//							Set<InspectionSheet_Result> results = inspectionSheet
//									.getResult();
//							for (InspectionSheet_Result inspectionSheet_Result : results) {
//								if (!solidInspect
//										.contains(inspectionSheet_Result
//												.getSampleInfo())) {
//									solidInspect.add(inspectionSheet_Result
//											.getSampleInfo());
//								}
//
//							}
//						}
//						if (inspectionSheet.getSheetType() == 2) {
//							// 固定污染源
//							if (!fixedProject.contains(inspectionSheet
//									.getAnalysisProject())) {
//								fixedProject.add(inspectionSheet
//										.getAnalysisProject());
//							}
//							Set<InspectionSheet_Result> results = inspectionSheet
//									.getResult();
//							for (InspectionSheet_Result inspectionSheet_Result : results) {
//								if (!fixedInspect
//										.contains(inspectionSheet_Result
//												.getSampleInfo())) {
//									fixedInspect.add(inspectionSheet_Result
//											.getSampleInfo());
//								}
//							}
//						}
//						if (inspectionSheet.getSheetType() == 3) {
//							// 空气
//							if (!airProject.contains(inspectionSheet
//									.getAnalysisProject())) {
//								airProject.add(inspectionSheet
//										.getAnalysisProject());
//							}
//							Set<InspectionSheet_Result> results = inspectionSheet
//									.getResult();
//							for (InspectionSheet_Result inspectionSheet_Result : results) {
//								if (!airInspect.contains(inspectionSheet_Result
//										.getSampleInfo())) {
//									airInspect.add(inspectionSheet_Result
//											.getSampleInfo());
//								}
//							}
//						}
//					}
//				}
//
//				ActionContext.getContext().put("waterInspect", waterInspect);
//				ActionContext.getContext().put("airInspect", airInspect);
//				ActionContext.getContext().put("solidInspect", solidInspect);
//				ActionContext.getContext().put("fixedInspect", fixedInspect);
//				ActionContext.getContext().put("waterProject", waterProject);
//				ActionContext.getContext().put("airProject", airProject);
//				ActionContext.getContext().put("solidProject", solidProject);
//				ActionContext.getContext().put("fixedProject", fixedProject);
//				ActionContext.getContext().put("project", project);
			} else {
//				Set<InspectionSheet> inspectionSheets = project
//						.getInspectionSheet();
//				List<NonSelfSendSample> waterInspect = new ArrayList<NonSelfSendSample>();
//				List<NonSelfSendSample> airInspect = new ArrayList<NonSelfSendSample>();
//				List<NonSelfSendSample> solidInspect = new ArrayList<NonSelfSendSample>();
//				List<NonSelfSendSample> fixedInspect = new ArrayList<NonSelfSendSample>();
//				List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
//				List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
//				List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
//				List<AnalysisProject> fixedProject = new ArrayList<AnalysisProject>();
//				if (inspectionSheets.size() != 0) {
//					for (InspectionSheet inspectionSheet : inspectionSheets) {
//						if (inspectionSheet.getSheetType() == 0) {
//							// 水质
//							if (!waterProject.contains(inspectionSheet
//									.getAnalysisProject())) {
//								waterProject.add(inspectionSheet
//										.getAnalysisProject());
//							}
//							Set<InspectionSheet_Result> results = inspectionSheet
//									.getResult();
//							for (InspectionSheet_Result inspectionSheet_Result : results) {
//								waterInspect.add(inspectionSheet_Result
//										.getNonSelfSampleInfo());
//							}
//						}
//						if (inspectionSheet.getSheetType() == 1) {
//							// 土壤
//							if (!solidProject.contains(inspectionSheet
//									.getAnalysisProject())) {
//								solidProject.add(inspectionSheet
//										.getAnalysisProject());
//							}
//							Set<InspectionSheet_Result> results = inspectionSheet
//									.getResult();
//							for (InspectionSheet_Result inspectionSheet_Result : results) {
//								solidInspect.add(inspectionSheet_Result
//										.getNonSelfSampleInfo());
//							}
//						}
//						if (inspectionSheet.getSheetType() == 2) {
//							// 固定污染源
//							if (!fixedProject.contains(inspectionSheet
//									.getAnalysisProject())) {
//								fixedProject.add(inspectionSheet
//										.getAnalysisProject());
//							}
//							Set<InspectionSheet_Result> results = inspectionSheet
//									.getResult();
//							for (InspectionSheet_Result inspectionSheet_Result : results) {
//								fixedInspect.add(inspectionSheet_Result
//										.getNonSelfSampleInfo());
//							}
//						}
//						if (inspectionSheet.getSheetType() == 3) {
//							// 空气
//							if (!airProject.contains(inspectionSheet
//									.getAnalysisProject())) {
//								airProject.add(inspectionSheet
//										.getAnalysisProject());
//							}
//							Set<InspectionSheet_Result> results = inspectionSheet
//									.getResult();
//							for (InspectionSheet_Result inspectionSheet_Result : results) {
//								airInspect.add(inspectionSheet_Result
//										.getNonSelfSampleInfo());
//							}
//						}
//					}
//				}
//
//				ActionContext.getContext().put("waterInspect", waterInspect);
//				ActionContext.getContext().put("airInspect", airInspect);
//				ActionContext.getContext().put("solidInspect", solidInspect);
//				ActionContext.getContext().put("fixedInspect", fixedInspect);
//				ActionContext.getContext().put("waterProject", waterProject);
//				ActionContext.getContext().put("airProject", airProject);
//				ActionContext.getContext().put("solidProject", solidProject);
//				ActionContext.getContext().put("fixedProject", fixedProject);
//				ActionContext.getContext().put("project", project);
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}

		return "viewReportPage";
	}

	public String otherViewPage() {
		try {
			Project pj = projectService.getById(viewId);
			List<InspectionSheet> inspectionList = new ArrayList<InspectionSheet>();
			Set<InspectionSheet> inspectionSheetSet = pj.getInspectionSheet();
			Iterator<InspectionSheet> inspectionSheetIt = inspectionSheetSet
					.iterator();
			while (inspectionSheetIt.hasNext()) {
				InspectionSheet temp = inspectionSheetIt.next();
				inspectionList.add(temp);
			}
			ActionContext.getContext().put("inspectionList", inspectionList);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "viewPage";
	}

	/**
	 * 删除Action
	 * 
	 * @return
	 */
	public String delete() {
		try {
			System.out.println(viewId);
			InspectionSheet inspection = inspectionSheetService.getById(viewId);
			if (inspection != null) {
				Project pj = inspection.getProject();
				Set<AnalysisProject> AnalysisProjected = pj
						.getAnalysisedProject();
				AnalysisProject item = inspection.getAnalysisProject();
				AnalysisProjected.remove(item);
				pj.setAnalysisedProject(AnalysisProjected);
				projectService.update(pj);
				System.out.println(viewId);
				inspection.setAnalysisProject(null);
				inspectionSheetService.delete(inspection.getId());
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
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
	public InspectionSheet getModel() {
		if (entity == null) {
			entity = new InspectionSheet();
		}
		return entity;
	}
}
