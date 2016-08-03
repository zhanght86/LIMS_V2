package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.aspectj.weaver.ast.Var;
import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.base.DocumentHandler;
import com.boncontact.domain.AnalysisProject;
import com.boncontact.domain.DeliveryReceitp;
import com.boncontact.domain.Delivery_SampleType;
import com.boncontact.domain.NonSelfSendSample;
import com.boncontact.domain.Project;
import com.boncontact.domain.SelfSendSampleInfo;
import com.boncontact.util.StringSplitUtils;
import com.boncontact.util.moneyUtils;
import com.opensymphony.xwork2.ActionContext;

@Component("deliveryReceitp")
public class DeliveryReceitpAction extends BaseAction<DeliveryReceitp> {
	private static final long serialVersionUID = 1438047153947541695L;
	private DeliveryReceitp entity;
	/* id */
	private Long viewId;
	/* 样品列表 */
	private String sampleList;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	/* 项目Id */
	private String projectItemHide;
	/* 导出格式 */
	private String exportType;
	// 文件名，包括路径
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;
	// 样品类型
	private String typeList;

	/**
	 * 主界面
	 * 
	 * @return
	 */
	public String main() {
		Project project = projectService.getById(viewId);
		if (project != null) {
			if (project.getGainSample().equals("1")) {

				Set<SelfSendSampleInfo> selfSendSampleInfos = project
						.getSelfSendSampleInfo();
				List<SelfSendSampleInfo> water = new ArrayList<SelfSendSampleInfo>();
				List<SelfSendSampleInfo> air = new ArrayList<SelfSendSampleInfo>();
				List<SelfSendSampleInfo> solid = new ArrayList<SelfSendSampleInfo>();
				List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
				for (SelfSendSampleInfo selfSendSampleInfo : selfSendSampleInfos) {
					Set<AnalysisProject> projects = selfSendSampleInfo
							.getAnalysisProjectSet();
					for (AnalysisProject item : projects) {
						int type = item.getAnalysisCategory()
								.getDeliveryReceitp();
						if (type == 1) {
							if (!water.contains(selfSendSampleInfo)) {
								water.add(selfSendSampleInfo);
							}
							if (!waterProject.contains(item)) {
								waterProject.add(item);
							}
						}
						if (type == 2) {
							// 空气和废气
							if (!air.contains(selfSendSampleInfo)) {
								air.add(selfSendSampleInfo);
							}

							if (!airProject.contains(item)) {
								airProject.add(item);
							}
						}
						if (type == 3) {
							// 土壤
							if (!solid.contains(selfSendSampleInfo)) {
								solid.add(selfSendSampleInfo);
							}

							if (!solidProject.contains(item)) {
								solidProject.add(item);
							}
						}
					}

				}
				ActionContext.getContext().put("water", water);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("air", air);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solid", solid);
				ActionContext.getContext().put("solidProject", solidProject);
			} else {
				Set<NonSelfSendSample> selfSendSampleInfos = project
						.getNonSelfSendSampleInfo();
				List<NonSelfSendSample> water = new ArrayList<NonSelfSendSample>();
				List<NonSelfSendSample> air = new ArrayList<NonSelfSendSample>();
				List<NonSelfSendSample> solid = new ArrayList<NonSelfSendSample>();
				List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
				List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
				for (NonSelfSendSample selfSendSampleInfo : selfSendSampleInfos) {
					Set<AnalysisProject> projects = selfSendSampleInfo
							.getAnalysisProjectSet();
					for (AnalysisProject item : projects) {
						int type = item.getAnalysisCategory()
								.getDeliveryReceitp();
						if (type == 1) {
							if (!water.contains(selfSendSampleInfo)) {
								water.add(selfSendSampleInfo);
							}
							if (!waterProject.contains(item)) {
								waterProject.add(item);
							}
						}
						if (type == 2) {
							// 空气和废气
							if (!air.contains(selfSendSampleInfo)) {
								air.add(selfSendSampleInfo);
							}

							if (!airProject.contains(item)) {
								airProject.add(item);
							}
						}
						if (type == 3) {
							// 土壤
							if (!solid.contains(selfSendSampleInfo)) {
								solid.add(selfSendSampleInfo);
							}

							if (!solidProject.contains(item)) {
								solidProject.add(item);
							}
						}
					}

				}
				ActionContext.getContext().put("water", water);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("air", air);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solid", solid);
				ActionContext.getContext().put("solidProject", solidProject);
			}
		}
		return "main";
	}

	public String add() {
		try {
			Project project = projectService.getById(viewId);
			if (project != null) {
				if (project.getGainSample().equals("1")) {
					Set<DeliveryReceitp> deliveryReceitps = new HashSet<DeliveryReceitp>();
					Set<SelfSendSampleInfo> selfSendSampleInfos = project
							.getSelfSendSampleInfo();
					Set<SelfSendSampleInfo> water = new HashSet<SelfSendSampleInfo>();
					Set<SelfSendSampleInfo> air = new HashSet<SelfSendSampleInfo>();
					Set<SelfSendSampleInfo> solid = new HashSet<SelfSendSampleInfo>();
					Set<AnalysisProject> waterProject = new HashSet<AnalysisProject>();
					Set<AnalysisProject> airProject = new HashSet<AnalysisProject>();
					Set<AnalysisProject> solidProject = new HashSet<AnalysisProject>();
					for (SelfSendSampleInfo selfSendSampleInfo : selfSendSampleInfos) {
						Set<AnalysisProject> projects = selfSendSampleInfo
								.getAnalysisProjectSet();
						for (AnalysisProject item : projects) {
							int type = item.getAnalysisCategory()
									.getDeliveryReceitp();
							if (type == 1) {
								if (!water.contains(selfSendSampleInfo)) {
									water.add(selfSendSampleInfo);
								}
								if (!waterProject.contains(item)) {
									waterProject.add(item);
								}
							}
							if (type == 2) {
								// 空气和废气
								if (!air.contains(selfSendSampleInfo)) {
									air.add(selfSendSampleInfo);
								}

								if (!airProject.contains(item)) {
									airProject.add(item);
								}
							}
							if (type == 3) {
								// 土壤
								if (!solid.contains(selfSendSampleInfo)) {
									solid.add(selfSendSampleInfo);
								}

								if (!solidProject.contains(item)) {
									solidProject.add(item);
								}
							}
						}
					}
					if (waterProject.size() != 0) {
						// 增加水的交联单
						DeliveryReceitp dr = new DeliveryReceitp();
						dr.setSamplesType(1);
						if (project.getSelfSendSampleInfo().size() != 0) {
							dr.setSamplingDate(project.getSelfSendSampleInfo()
									.iterator().next().getDate());
						} else {
							dr.setSamplingDate(new Date());
						}
						dr.setMonitoringType(project.gettContractId()
								.getProjectType());
						dr.setItemNum(waterProject.size());
						dr.setSelfSendSampleInfo(water);
						dr.setProject(project);
						dr.setTransferDate(new Date());
						Long id = (Long) ActionContext.getContext()
								.getSession().get("userId");
						dr.setTransferUser(userService.getById(id));
						dr.setAnalysisProject(waterProject);

						System.out.println(dr);
						//deliveryReceitpService.save(dr);
						deliveryReceitps.add(dr);
						System.out.println(deliveryReceitps.size());
					}
					if (airProject.size() != 0) {
						// 增加空气交联单
						DeliveryReceitp dr = new DeliveryReceitp();
						dr.setSamplesType(2);
						if (project.getSelfSendSampleInfo().size() != 0) {
							dr.setSamplingDate(project.getSelfSendSampleInfo()
									.iterator().next().getDate());
						} else {
							dr.setSamplingDate(new Date());
						}
						dr.setMonitoringType(project.gettContractId()
								.getProjectType());
						dr.setItemNum(airProject.size());
						dr.setSelfSendSampleInfo(air);
						dr.setProject(project);
						dr.setTransferDate(new Date());
						Long id = (Long) ActionContext.getContext()
								.getSession().get("userId");
						dr.setTransferUser(userService.getById(id));
						dr.setAnalysisProject(airProject);
						System.out.println(dr);
						//deliveryReceitpService.save(dr);
						deliveryReceitps.add(dr);
						System.out.println(deliveryReceitps.size());
					}
					if (solidProject.size() != 0) {
						// 增加土壤交联单
						DeliveryReceitp dr = new DeliveryReceitp();
						dr.setSamplesType(0);
						if (project.getSelfSendSampleInfo().size() != 0) {
							dr.setSamplingDate(project.getSelfSendSampleInfo()
									.iterator().next().getDate());
						} else {
							dr.setSamplingDate(new Date());
						}
						dr.setMonitoringType(project.gettContractId()
								.getProjectType());
						dr.setItemNum(airProject.size());
						dr.setSelfSendSampleInfo(solid);
						dr.setProject(project);
						dr.setTransferDate(new Date());
						Long id = (Long) ActionContext.getContext()
								.getSession().get("userId");
						dr.setTransferUser(userService.getById(id));
						dr.setAnalysisProject(solidProject);
						System.out.println(dr);
						//deliveryReceitpService.save(dr);
						deliveryReceitps.add(dr);
						System.out.println(deliveryReceitps.size());
					}

					for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
						//System.out.println("deliveryReceitpId:"+deliveryReceitp.getId()+"  analysisProject:"+deliveryReceitp.getAnalysisProject());
						System.out.println("有一个交联单哦");
						//deliveryReceitpService.save(deliveryReceitp);
						//System.out.println(deliveryReceitp);
					}
					project.setDeliveryReceitpInfo(deliveryReceitps);
					//System.out.println(project);
					projectService.update(project);
				} else {
					Set<DeliveryReceitp> deliveryReceitpSet = new HashSet<DeliveryReceitp>();
					Set<NonSelfSendSample> nonSelfSendSampleInfos = project
							.getNonSelfSendSampleInfo();
					Set<NonSelfSendSample> water = new HashSet<NonSelfSendSample>();
					Set<NonSelfSendSample> air = new HashSet<NonSelfSendSample>();
					Set<NonSelfSendSample> solid = new HashSet<NonSelfSendSample>();
					Set<AnalysisProject> waterProject = new HashSet<AnalysisProject>();
					Set<AnalysisProject> airProject = new HashSet<AnalysisProject>();
					Set<AnalysisProject> solidProject = new HashSet<AnalysisProject>();
					for (NonSelfSendSample nonSelfSendSampleInfo : nonSelfSendSampleInfos) {
						Set<AnalysisProject> analysisProjects = nonSelfSendSampleInfo
								.getAnalysisProjectSet();
						for (AnalysisProject ap : analysisProjects) {
							if (ap.getAnalysisCategory().getDeliveryReceitp() == 1) {
								// 水和废水
								water.add(nonSelfSendSampleInfo);
								if (!waterProject
										.contains(nonSelfSendSampleInfo
												.getAnalysisProject())) {
									waterProject.add(ap);
								}
							}
							if (ap.getAnalysisCategory().getDeliveryReceitp() == 2) {
								// 空气和废气
								air.add(nonSelfSendSampleInfo);
								if (!airProject.contains(nonSelfSendSampleInfo
										.getAnalysisProject())) {
									airProject.add(ap);
								}
							}
							if (ap.getAnalysisCategory().getDeliveryReceitp() == 3) {
								// 土壤
								solid.add(nonSelfSendSampleInfo);
								if (!solidProject
										.contains(nonSelfSendSampleInfo
												.getAnalysisProject())) {
									solidProject.add(ap);
								}
							}
						}
					}

					if (waterProject.size() != 0) {
						// 增加水的交联单
						DeliveryReceitp dr = new DeliveryReceitp();
						dr.setSamplesType(1);
						if (project.getNonSelfSendSampleInfo().size() != 0) {
							dr.setSamplingDate(project
									.getNonSelfSendSampleInfo().iterator()
									.next().getDate());
						} else {
							dr.setSamplingDate(new Date());
						}
						dr.setMonitoringType(project.gettContractId()
								.getProjectType());
						dr.setItemNum(waterProject.size());
						dr.setNonSelfSendSampleInfo(water);
						dr.setProject(project);
						dr.setTransferDate(new Date());
						Long id = (Long) ActionContext.getContext()
								.getSession().get("userId");
						dr.setTransferUser(userService.getById(id));
						dr.setAnalysisProject(waterProject);
						deliveryReceitpService.save(dr);
						deliveryReceitpSet.add(dr);
					}
					if (airProject.size() != 0) {
						// 增加空气交联单
						DeliveryReceitp dr = new DeliveryReceitp();
						dr.setSamplesType(2);
						if (project.getNonSelfSendSampleInfo().size() != 0) {
							dr.setSamplingDate(project
									.getNonSelfSendSampleInfo().iterator()
									.next().getDate());
						} else {
							dr.setSamplingDate(new Date());
						}
						dr.setMonitoringType(project.gettContractId()
								.getProjectType());
						dr.setItemNum(airProject.size());
						dr.setNonSelfSendSampleInfo(air);
						dr.setProject(project);
						dr.setTransferDate(new Date());
						Long id = (Long) ActionContext.getContext()
								.getSession().get("userId");
						dr.setTransferUser(userService.getById(id));
						dr.setAnalysisProject(airProject);
						deliveryReceitpService.save(dr);
						deliveryReceitpSet.add(dr);
					}
					if (solidProject.size() != 0) {
						// 土壤交联单
						DeliveryReceitp dr = new DeliveryReceitp();
						dr.setSamplesType(0);
						if (project.getNonSelfSendSampleInfo().size() != 0) {
							dr.setSamplingDate(project
									.getNonSelfSendSampleInfo().iterator()
									.next().getDate());
						} else {
							dr.setSamplingDate(new Date());
						}
						dr.setMonitoringType(project.gettContractId()
								.getProjectType());
						dr.setItemNum(airProject.size());
						dr.setNonSelfSendSampleInfo(solid);
						dr.setProject(project);
						dr.setTransferDate(new Date());
						Long id = (Long) ActionContext.getContext()
								.getSession().get("userId");
						dr.setTransferUser(userService.getById(id));
						dr.setAnalysisProject(solidProject);
						deliveryReceitpService.save(dr);
						deliveryReceitpSet.add(dr);
					}

					for (DeliveryReceitp dr : deliveryReceitpSet) {

						deliveryReceitpService.save(dr);
						System.out.println(dr);
					}
					project.setDeliveryReceitpInfo(deliveryReceitpSet);
					projectService.update(project);
				}

				// 此处为样品类型Set集->Project的Demo
				Set<Delivery_SampleType> sampleTypes = new HashSet<Delivery_SampleType>();
				System.out.println("输出" + typeList);
				String[] idStrings = StringSplitUtils.splite(typeList, ";");
				for (String ids : idStrings) {
					String[] kv = StringSplitUtils.splite(ids, ":");
					long id = Long.parseLong(kv[0]);
					String value = kv[1];
					Delivery_SampleType type = new Delivery_SampleType();
					type.setAnalysis(analysisProjectService.getById(id));
					type.setProject(project);
					type.setType(value);
					type.setDeliver("0");
					sampleTypes.add(type);
				}
				project.setSampleTypeSet(sampleTypes);
				projectService.update(project);

			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String change() {
		try {
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String viewDetailPage() {
		try {
			Project pj = projectService.getById(viewId);
			ActionContext.getContext().put("entity", pj);
			ActionContext.getContext().put("exportType", exportType);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "viewDetailPage";
	}

	public String delete() {
		try {
			DeliveryReceitp temp = deliveryReceitpService.getById(viewId);
			Set<SelfSendSampleInfo> info = temp.getSelfSendSampleInfo();
			Iterator<SelfSendSampleInfo> it = info.iterator();
			while (it.hasNext()) {
				SelfSendSampleInfo ssi = it.next();
				ssi.setDeliver(0);
				selfSendSampleInfoService.update(ssi);
			}
			temp.setSelfSendSampleInfo(null);
			deliveryReceitpService.delete(temp.getId());

			// Project project = temp.getProject();
			// project.setSampleTypeSet(null);
			// projectService.update(project);
			/*
			 * project.setSampleTypeSet(null); projectService.update(project);
			 */
			/*
			 * if (project != null) { project.setSampleTypeSet(null);
			 * 
			 * }
			 */
			/*
			 * List<Delivery_SampleType> types = delivery_SampleTypeService
			 * .findByProject(project);
			 * System.out.println("length: "+types.size()); for
			 * (Delivery_SampleType delivery_SampleType : types) {
			 * //delivery_SampleTypeService.delete(delivery_SampleType.getId());
			 * }
			 */
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String deleteAll() {
		try {
			List<DeliveryReceitp> deliveryReceitpList = deliveryReceitpService
					.findAll(" WHERE project=" + viewId);
			if (deliveryReceitpList != null) {
				for (int i = 0; i < deliveryReceitpList.size(); i++) {
					DeliveryReceitp temp = deliveryReceitpList.get(i);
					Set<SelfSendSampleInfo> selfSet = temp
							.getSelfSendSampleInfo();
					Iterator<SelfSendSampleInfo> selIt = selfSet.iterator();
					while (selIt.hasNext()) {
						SelfSendSampleInfo ssi = selIt.next();
						ssi.setDeliver(0);
						selfSendSampleInfoService.update(ssi);
					}
					deliveryReceitpService.delete(temp.getId());
				}
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

	public String export() {
		Project project = projectService.getById(viewId);
		if (project.getGainSample().equals("1")) {
			Set<DeliveryReceitp> deliveryReceitps = project
					.getDeliveryReceitpInfo();
			Set<SelfSendSampleInfo> water = new HashSet<SelfSendSampleInfo>();
			Set<SelfSendSampleInfo> air = new HashSet<SelfSendSampleInfo>();
			Set<SelfSendSampleInfo> solid = new HashSet<SelfSendSampleInfo>();
			List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();

			ActionContext ac = ActionContext.getContext();
			ServletContext sc = (ServletContext) ac
					.get(ServletActionContext.SERVLET_CONTEXT);
			String path = sc.getRealPath("/") + "\\files";
			File file = new File(path);
			if (!file.exists() && !file.isDirectory()) {
				file.mkdir();
			}
			String br = "<w:p w:rsidR='007218C5' w:rsidRDefault='007218C5'/>";
			Map<String, Object> dataMap = new HashMap<String, Object>();
			for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
				if (exportType.equals("solid")
						&& deliveryReceitp.getSamplesType() == 0) {
					// 土壤
					dataMap.put("samplingDate",
							deliveryReceitp.getSamplingDate());
					dataMap.put("monitoringType",
							deliveryReceitp.getMonitoringType());
					Set<SelfSendSampleInfo> selfSendSampleInfos = deliveryReceitp
							.getSelfSendSampleInfo();
					String item = "";
					String sample = "";
					for (SelfSendSampleInfo selfSendSampleInfo : selfSendSampleInfos) {
						if (!solidProject.contains(selfSendSampleInfo
								.getAnalysisProject())) {
							solidProject.add(selfSendSampleInfo
									.getAnalysisProject());
							item += selfSendSampleInfo.getAnalysisProject()
									.getName() + "，";
						}
						sample += selfSendSampleInfo.getIdentify()
								+ "，"
								+ selfSendSampleInfo.getSampleName()
								+ "，"
								+ selfSendSampleInfo.getSampleState()
								+ "，"
								+ selfSendSampleInfo.getAnalysisProject()
										.getName() + br;
					}
					dataMap.put("itemNum", solidProject.size());
					dataMap.put("item", item);
					dataMap.put("sampleIndetify", sample);
				}
				if (exportType.equals("water")
						&& deliveryReceitp.getSamplesType() == 1) {
					// 水和废水
					dataMap.put("samplingDate",
							deliveryReceitp.getSamplingDate());
					dataMap.put("monitoringType",
							deliveryReceitp.getMonitoringType());
					Set<SelfSendSampleInfo> selfSendSampleInfos = deliveryReceitp
							.getSelfSendSampleInfo();
					String item = "";
					String sample = "";
					for (SelfSendSampleInfo selfSendSampleInfo : selfSendSampleInfos) {
						if (!waterProject.contains(selfSendSampleInfo
								.getAnalysisProject())) {
							waterProject.add(selfSendSampleInfo
									.getAnalysisProject());
							item += selfSendSampleInfo.getAnalysisProject()
									.getName() + "，";
						}
						sample += selfSendSampleInfo.getIdentify()
								+ "，"
								+ selfSendSampleInfo.getSampleName()
								+ "，"
								+ selfSendSampleInfo.getSampleState()
								+ "，"
								+ selfSendSampleInfo.getAnalysisProject()
										.getName() + br;
					}
					dataMap.put("itemNum", waterProject.size());
					dataMap.put("item", item);
					dataMap.put("sampleIndetify", sample);
				}
				if (exportType.equals("air")
						&& deliveryReceitp.getSamplesType() == 2) {
					// 空气和废气
					dataMap.put("samplingDate",
							deliveryReceitp.getSamplingDate());
					dataMap.put("monitoringType",
							deliveryReceitp.getMonitoringType());
					Set<SelfSendSampleInfo> selfSendSampleInfos = deliveryReceitp
							.getSelfSendSampleInfo();
					String item = "";
					String sample = "";
					for (SelfSendSampleInfo selfSendSampleInfo : selfSendSampleInfos) {
						if (!airProject.contains(selfSendSampleInfo
								.getAnalysisProject())) {
							airProject.add(selfSendSampleInfo
									.getAnalysisProject());
							item += selfSendSampleInfo.getAnalysisProject()
									.getName() + "，";
						}
						sample += selfSendSampleInfo.getIdentify()
								+ "，"
								+ selfSendSampleInfo.getSampleName()
								+ "，"
								+ selfSendSampleInfo.getSampleState()
								+ "，"
								+ selfSendSampleInfo.getAnalysisProject()
										.getName() + br;
					}
					dataMap.put("itemNum", airProject.size());
					dataMap.put("item", item);
					dataMap.put("sampleIndetify", sample);

				}
			}
			DocumentHandler dh = new DocumentHandler();
			if (exportType.equals("air")) {
				dh.createDoc(dataMap, "deliveryReceitp_air.xml", path + "\\"
						+ project.getContractId() + "空气和废气样品交接联单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "空气和废气样品交接联单.doc";
				realFileName = project.getContractId() + "空气和废气样品交接联单.doc";
			}
			if (exportType.equals("water")) {
				dh.createDoc(dataMap, "deliveryReceitp_water.xml", path + "\\"
						+ project.getContractId() + "水和废水样品交接联单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "水和废水样品交接联单.doc";
				realFileName = project.getContractId() + "水和废水样品交接联单.doc";
			}
			if (exportType.equals("solid")) {
				dh.createDoc(dataMap, "deliveryReceitp_solid.xml", path + "\\"
						+ project.getContractId() + "土壤样品交接联单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "土壤样品交接联单.doc";
				realFileName = project.getContractId() + "土壤样品交接联单.doc";
			}
		} else {
			Set<DeliveryReceitp> deliveryReceitps = project
					.getDeliveryReceitpInfo();
			Set<NonSelfSendSample> water = new HashSet<NonSelfSendSample>();
			Set<NonSelfSendSample> air = new HashSet<NonSelfSendSample>();
			Set<NonSelfSendSample> solid = new HashSet<NonSelfSendSample>();
			List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();

			ActionContext ac = ActionContext.getContext();
			ServletContext sc = (ServletContext) ac
					.get(ServletActionContext.SERVLET_CONTEXT);
			String path = sc.getRealPath("/") + "\\files";
			File file = new File(path);
			if (!file.exists() && !file.isDirectory()) {
				file.mkdir();
			}
			String br = "<w:p w:rsidR='007218C5' w:rsidRDefault='007218C5'/>";
			Map<String, Object> dataMap = new HashMap<String, Object>();
			for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
				if (exportType.equals("solid")
						&& deliveryReceitp.getSamplesType() == 0) {
					// 土壤
					dataMap.put("samplingDate",
							deliveryReceitp.getSamplingDate());
					dataMap.put("monitoringType",
							deliveryReceitp.getMonitoringType());
					Set<NonSelfSendSample> nonSelfSendSampleInfos = deliveryReceitp
							.getNonSelfSendSampleInfo();
					String item = "";
					String sample = "";
					for (NonSelfSendSample nonSelfSendSampleInfo : nonSelfSendSampleInfos) {
						if (!solidProject.contains(nonSelfSendSampleInfo
								.getAnalysisProject())) {
							solidProject.add(nonSelfSendSampleInfo
									.getAnalysisProject());
							item += nonSelfSendSampleInfo.getAnalysisProject()
									.getName() + "，";
						}
						sample += nonSelfSendSampleInfo.getIdentify()
								+ "，"
								+ nonSelfSendSampleInfo.getSampleName()
								+ "，"
								+ nonSelfSendSampleInfo.getSampleState()
								+ "，"
								+ nonSelfSendSampleInfo.getSamplingPosition()
								+ "，"
								+ nonSelfSendSampleInfo.getAnalysisProject()
										.getName() + br;
					}
					dataMap.put("itemNum", solidProject.size());
					dataMap.put("item", item);
					dataMap.put("sampleIndetify", sample);
				}
				if (exportType.equals("water")
						&& deliveryReceitp.getSamplesType() == 1) {
					// 水和废水
					dataMap.put("samplingDate",
							deliveryReceitp.getSamplingDate());
					dataMap.put("monitoringType",
							deliveryReceitp.getMonitoringType());
					Set<NonSelfSendSample> nonSelfSendSampleInfos = deliveryReceitp
							.getNonSelfSendSampleInfo();
					String item = "";
					String sample = "";
					for (NonSelfSendSample nonSelfSendSampleInfo : nonSelfSendSampleInfos) {
						if (!waterProject.contains(nonSelfSendSampleInfo
								.getAnalysisProject())) {
							waterProject.add(nonSelfSendSampleInfo
									.getAnalysisProject());
							item += nonSelfSendSampleInfo.getAnalysisProject()
									.getName() + "，";
						}
						sample += nonSelfSendSampleInfo.getIdentify()
								+ "，"
								+ nonSelfSendSampleInfo.getSampleName()
								+ "，"
								+ nonSelfSendSampleInfo.getSampleState()
								+ "，"
								+ nonSelfSendSampleInfo.getSamplingPosition()
								+ "，"
								+ nonSelfSendSampleInfo.getAnalysisProject()
										.getName() + br;
					}
					dataMap.put("itemNum", waterProject.size());
					dataMap.put("item", item);
					dataMap.put("sampleIndetify", sample);
				}
				if (exportType.equals("air")
						&& deliveryReceitp.getSamplesType() == 2) {
					// 空气和废气
					dataMap.put("samplingDate",
							deliveryReceitp.getSamplingDate());
					dataMap.put("monitoringType",
							deliveryReceitp.getMonitoringType());
					Set<NonSelfSendSample> nonSelfSendSampleInfos = deliveryReceitp
							.getNonSelfSendSampleInfo();
					String item = "";
					String sample = "";
					for (NonSelfSendSample nonSelfSendSampleInfo : nonSelfSendSampleInfos) {
						if (!airProject.contains(nonSelfSendSampleInfo
								.getAnalysisProject())) {
							airProject.add(nonSelfSendSampleInfo
									.getAnalysisProject());
							item += nonSelfSendSampleInfo.getAnalysisProject()
									.getName() + "，";
						}
						sample += nonSelfSendSampleInfo.getIdentify()
								+ "，"
								+ nonSelfSendSampleInfo.getSampleName()
								+ "，"
								+ nonSelfSendSampleInfo.getSampleState()
								+ "，"
								+ nonSelfSendSampleInfo.getSamplingPosition()
								+ "，"
								+ nonSelfSendSampleInfo.getAnalysisProject()
										.getName() + br;
					}
					dataMap.put("itemNum", airProject.size());
					dataMap.put("item", item);
					dataMap.put("sampleIndetify", sample);

				}
			}
			DocumentHandler dh = new DocumentHandler();
			if (exportType.equals("air")) {
				dh.createDoc(dataMap, "deliveryReceitp_air.xml", path + "\\"
						+ project.getContractId() + "空气和废气样品交接联单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "空气和废气样品交接联单.doc";
				realFileName = project.getContractId() + "空气和废气样品交接联单.doc";
			}
			if (exportType.equals("water")) {
				dh.createDoc(dataMap, "deliveryReceitp_water.xml", path + "\\"
						+ project.getContractId() + "水和废水样品交接联单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "水和废水样品交接联单.doc";
				realFileName = project.getContractId() + "水和废水样品交接联单.doc";
			}
			if (exportType.equals("solid")) {
				dh.createDoc(dataMap, "deliveryReceitp_solid.xml", path + "\\"
						+ project.getContractId() + "土壤样品交接联单.doc");
				fileName = path + "\\" + project.getContractId()
						+ "土壤样品交接联单.doc";
				realFileName = project.getContractId() + "土壤样品交接联单.doc";
			}
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

	public String viewPage() {
		Project project = projectService.getById(viewId);
		if (project.getGainSample().equals("1")) {
			Set<SelfSendSampleInfo> selfSendSampleInfos = project
					.getSelfSendSampleInfo();
			List<SelfSendSampleInfo> water = new ArrayList<SelfSendSampleInfo>();
			List<SelfSendSampleInfo> air = new ArrayList<SelfSendSampleInfo>();
			List<SelfSendSampleInfo> solid = new ArrayList<SelfSendSampleInfo>();
			List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
			List<Delivery_SampleType> waterType = new ArrayList<Delivery_SampleType>();
			List<Delivery_SampleType> airType = new ArrayList<Delivery_SampleType>();
			List<Delivery_SampleType> solidType = new ArrayList<Delivery_SampleType>();
			if (project != null) {
				Set<DeliveryReceitp> deliveryReceitps = project
						.getDeliveryReceitpInfo();
				for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
					if (deliveryReceitp.getSamplesType() == 0) {
						// 土壤
						solid.addAll(deliveryReceitp.getSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 1) {
						// 水和废水
						water.addAll(deliveryReceitp.getSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 2) {
						// 空气和废气
						air.addAll(deliveryReceitp.getSelfSendSampleInfo());
					}
				}
				for (SelfSendSampleInfo airItem : air) {
					Set<AnalysisProject> items = airItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!airProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 2) {
							airProject.add(item);
						}
					}

				}
				for (SelfSendSampleInfo waterItem : water) {
					Set<AnalysisProject> items = waterItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!waterProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 1) {
							waterProject.add(item);
						}
					}
				}
				for (SelfSendSampleInfo solidItem : solid) {
					Set<AnalysisProject> items = solidItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!solidProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 3) {
							solidProject.add(item);
						}
					}
				}

				// 以下为新增
				for (AnalysisProject waterAnalysisProject : waterProject) {

					Delivery_SampleType temp = delivery_SampleTypeService
							.findByAnalysis(project, waterAnalysisProject);
					if (temp != null) {
						waterType.add(temp);
					}
				}
				for (AnalysisProject airAnalysisProject : airProject) {
					Delivery_SampleType temp = delivery_SampleTypeService
							.findByAnalysis(project, airAnalysisProject);
					if (temp != null) {
						airType.add(temp);
					}
				}
				for (AnalysisProject solidAnalysisProject : solidProject) {
					Delivery_SampleType temp = delivery_SampleTypeService
							.findByAnalysis(project, solidAnalysisProject);
					if (temp != null) {
						solidType.add(temp);
					}
				}

				ActionContext.getContext().put("water", water);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("air", air);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solid", solid);
				ActionContext.getContext().put("solidProject", solidProject);
				ActionContext.getContext().put("project", project);
				ActionContext.getContext().put("waterType", waterType);
				ActionContext.getContext().put("airType", airType);
				ActionContext.getContext().put("solidType", solidType);
			}
		} else {
			Set<NonSelfSendSample> selfSendSampleInfos = project
					.getNonSelfSendSampleInfo();
			List<NonSelfSendSample> water = new ArrayList<NonSelfSendSample>();
			List<NonSelfSendSample> air = new ArrayList<NonSelfSendSample>();
			List<NonSelfSendSample> solid = new ArrayList<NonSelfSendSample>();
			List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
			List<Delivery_SampleType> waterType = new ArrayList<Delivery_SampleType>();
			List<Delivery_SampleType> airType = new ArrayList<Delivery_SampleType>();
			List<Delivery_SampleType> solidType = new ArrayList<Delivery_SampleType>();
			if (project != null) {
				Set<DeliveryReceitp> deliveryReceitps = project
						.getDeliveryReceitpInfo();
				for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
					if (deliveryReceitp.getSamplesType() == 0) {
						// 土壤
						solid.addAll(deliveryReceitp.getNonSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 1) {
						// 水和废水
						water.addAll(deliveryReceitp.getNonSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 2) {
						// 空气和废气
						air.addAll(deliveryReceitp.getNonSelfSendSampleInfo());
					}
				}
				for (NonSelfSendSample airItem : air) {
					Set<AnalysisProject> items = airItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!airProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 2) {
							airProject.add(item);
						}
					}

				}
				for (NonSelfSendSample waterItem : water) {
					Set<AnalysisProject> items = waterItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!waterProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 1) {
							waterProject.add(item);
						}
					}
				}
				for (NonSelfSendSample solidItem : solid) {
					Set<AnalysisProject> items = solidItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!solidProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 3) {
							solidProject.add(item);
						}
					}

				}
				
				
				
				for (AnalysisProject waterAnalysisProject : waterProject) {
					System.out.println("水质项目");
					Delivery_SampleType temp = delivery_SampleTypeService
							.findByAnalysis(project, waterAnalysisProject);
					if (temp != null) {
						System.out.println("测试测试测试water"+temp);
						waterType.add(temp);
					}
				}
				for (AnalysisProject airAnalysisProject : airProject) {
					System.out.println("空气项目");
					Delivery_SampleType temp = delivery_SampleTypeService
							.findByAnalysis(project, airAnalysisProject);
					if (temp != null) {
						System.out.println("测试测试测试air"+temp);
						airType.add(temp);
					}
				}
				for (AnalysisProject solidAnalysisProject : solidProject) {
					System.out.println("固体项目");
					Delivery_SampleType temp = delivery_SampleTypeService
							.findByAnalysis(project, solidAnalysisProject);
					if (temp != null) {
						System.out.println("测试测试测试solid"+temp);
						solidType.add(temp);
					}
				}
				ActionContext.getContext().put("water", water);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("air", air);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solid", solid);
				ActionContext.getContext().put("solidProject", solidProject);
				ActionContext.getContext().put("project", project);
				ActionContext.getContext().put("waterType", waterType);
				ActionContext.getContext().put("airType", airType);
				ActionContext.getContext().put("solidType", solidType);
			}
		}
		return "viewPage";
	}

	public String viewResultPage() {
		Project project = projectService.getById(viewId);
		if (project.getGainSample().equals("1")) {
			Set<SelfSendSampleInfo> selfSendSampleInfos = project
					.getSelfSendSampleInfo();
			List<SelfSendSampleInfo> water = new ArrayList<SelfSendSampleInfo>();
			List<SelfSendSampleInfo> air = new ArrayList<SelfSendSampleInfo>();
			List<SelfSendSampleInfo> solid = new ArrayList<SelfSendSampleInfo>();
			List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
			if (project != null) {
				Set<DeliveryReceitp> deliveryReceitps = project
						.getDeliveryReceitpInfo();
				for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
					if (deliveryReceitp.getSamplesType() == 0) {
						// 土壤
						solid.addAll(deliveryReceitp.getSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 1) {
						// 水和废水
						water.addAll(deliveryReceitp.getSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 2) {
						// 空气和废气
						air.addAll(deliveryReceitp.getSelfSendSampleInfo());
					}
				}
				for (SelfSendSampleInfo airItem : air) {
					Set<AnalysisProject> items = airItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!airProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 2) {
							airProject.add(item);
						}
					}

				}
				for (SelfSendSampleInfo waterItem : water) {
					Set<AnalysisProject> items = waterItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!waterProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 1) {
							waterProject.add(item);
						}
					}
				}
				for (SelfSendSampleInfo solidItem : solid) {
					Set<AnalysisProject> items = solidItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!solidProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 3) {
							solidProject.add(item);
						}
					}

				}
				ActionContext.getContext().put("water", water);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("air", air);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solid", solid);
				ActionContext.getContext().put("solidProject", solidProject);
				ActionContext.getContext().put("project", project);
			}
		} else {
			Set<NonSelfSendSample> selfSendSampleInfos = project
					.getNonSelfSendSampleInfo();
			List<NonSelfSendSample> water = new ArrayList<NonSelfSendSample>();
			List<NonSelfSendSample> air = new ArrayList<NonSelfSendSample>();
			List<NonSelfSendSample> solid = new ArrayList<NonSelfSendSample>();
			List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
			if (project != null) {
				Set<DeliveryReceitp> deliveryReceitps = project
						.getDeliveryReceitpInfo();
				for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
					if (deliveryReceitp.getSamplesType() == 0) {
						// 土壤
						solid.addAll(deliveryReceitp.getNonSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 1) {
						// 水和废水
						water.addAll(deliveryReceitp.getNonSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 2) {
						// 空气和废气
						air.addAll(deliveryReceitp.getNonSelfSendSampleInfo());
					}
				}
				for (NonSelfSendSample airItem : air) {
					Set<AnalysisProject> items = airItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!airProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 2) {
							airProject.add(item);
						}
					}

				}
				for (NonSelfSendSample waterItem : water) {
					Set<AnalysisProject> items = waterItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!waterProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 1) {
							waterProject.add(item);
						}
					}
				}
				for (NonSelfSendSample solidItem : solid) {
					Set<AnalysisProject> items = solidItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!solidProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 3) {
							solidProject.add(item);
						}
					}

				}
				ActionContext.getContext().put("water", water);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("air", air);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solid", solid);
				ActionContext.getContext().put("solidProject", solidProject);
				ActionContext.getContext().put("project", project);
			}
		}
		return "viewResultPage";
	}

	public String viewReportPage() {
		Project project = projectService.getById(viewId);
		if (project.getGainSample().equals("1")) {
			Set<SelfSendSampleInfo> selfSendSampleInfos = project
					.getSelfSendSampleInfo();
			List<SelfSendSampleInfo> water = new ArrayList<SelfSendSampleInfo>();
			List<SelfSendSampleInfo> air = new ArrayList<SelfSendSampleInfo>();
			List<SelfSendSampleInfo> solid = new ArrayList<SelfSendSampleInfo>();
			List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
			if (project != null) {
				Set<DeliveryReceitp> deliveryReceitps = project
						.getDeliveryReceitpInfo();
				for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
					if (deliveryReceitp.getSamplesType() == 0) {
						// 土壤
						solid.addAll(deliveryReceitp.getSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 1) {
						// 水和废水
						water.addAll(deliveryReceitp.getSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 2) {
						// 空气和废气
						air.addAll(deliveryReceitp.getSelfSendSampleInfo());
					}
				}
				for (SelfSendSampleInfo airItem : air) {
					Set<AnalysisProject> items = airItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!airProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 2) {
							airProject.add(item);
						}
					}

				}
				for (SelfSendSampleInfo waterItem : water) {
					Set<AnalysisProject> items = waterItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!waterProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 1) {
							waterProject.add(item);
						}
					}
				}
				for (SelfSendSampleInfo solidItem : solid) {
					Set<AnalysisProject> items = solidItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!solidProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 3) {
							solidProject.add(item);
						}
					}

				}
				ActionContext.getContext().put("water", water);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("air", air);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solid", solid);
				ActionContext.getContext().put("solidProject", solidProject);
				ActionContext.getContext().put("project", project);
			}
		} else {
			Set<NonSelfSendSample> selfSendSampleInfos = project
					.getNonSelfSendSampleInfo();
			List<NonSelfSendSample> water = new ArrayList<NonSelfSendSample>();
			List<NonSelfSendSample> air = new ArrayList<NonSelfSendSample>();
			List<NonSelfSendSample> solid = new ArrayList<NonSelfSendSample>();
			List<AnalysisProject> waterProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> airProject = new ArrayList<AnalysisProject>();
			List<AnalysisProject> solidProject = new ArrayList<AnalysisProject>();
			if (project != null) {
				Set<DeliveryReceitp> deliveryReceitps = project
						.getDeliveryReceitpInfo();
				for (DeliveryReceitp deliveryReceitp : deliveryReceitps) {
					if (deliveryReceitp.getSamplesType() == 0) {
						// 土壤
						solid.addAll(deliveryReceitp.getNonSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 1) {
						// 水和废水
						water.addAll(deliveryReceitp.getNonSelfSendSampleInfo());
					}
					if (deliveryReceitp.getSamplesType() == 2) {
						// 空气和废气
						air.addAll(deliveryReceitp.getNonSelfSendSampleInfo());
					}
				}
				for (NonSelfSendSample airItem : air) {
					Set<AnalysisProject> items = airItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!airProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 2) {
							airProject.add(item);
						}
					}

				}
				for (NonSelfSendSample waterItem : water) {
					Set<AnalysisProject> items = waterItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!waterProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 1) {
							waterProject.add(item);
						}
					}
				}
				for (NonSelfSendSample solidItem : solid) {
					Set<AnalysisProject> items = solidItem
							.getAnalysisProjectSet();
					for (AnalysisProject item : items) {
						if (!solidProject.contains(item)
								&& item.getAnalysisCategory()
										.getDeliveryReceitp() == 3) {
							solidProject.add(item);
						}
					}

				}
				ActionContext.getContext().put("water", water);
				ActionContext.getContext().put("waterProject", waterProject);
				ActionContext.getContext().put("air", air);
				ActionContext.getContext().put("airProject", airProject);
				ActionContext.getContext().put("solid", solid);
				ActionContext.getContext().put("solidProject", solidProject);
				ActionContext.getContext().put("project", project);
			}
		}
		return "viewReportPage";
	}

	public String otherViewPage() {
		List<DeliveryReceitp> deliveryReceitpList = deliveryReceitpService
				.findAll(" WHERE project=" + viewId);
		ActionContext.getContext().put("deliveryReceitpList",
				deliveryReceitpList);
		return "otherViewPage";
	}

	public String changePage() {
		DeliveryReceitp temp = deliveryReceitpService.getById(viewId);
		Project pj = temp.getProject();
		ActionContext.getContext().getValueStack().push(temp);
		String sampleId = "";
		String sampleName = "";
		if (pj.getGainSample().equals("0")) {
			Set<NonSelfSendSample> selfSendSampleSet = temp
					.getNonSelfSendSampleInfo();
			Iterator<NonSelfSendSample> it = selfSendSampleSet.iterator();
			while (it.hasNext()) {
				NonSelfSendSample info = it.next();
				sampleId += info.getId() + ",";
				sampleName += info.getSampleName() + ",";
			}
		}
		if (pj.getGainSample().equals("1")) {
			Set<SelfSendSampleInfo> selfSendSampleSet = temp
					.getSelfSendSampleInfo();
			Iterator<SelfSendSampleInfo> it = selfSendSampleSet.iterator();
			while (it.hasNext()) {
				SelfSendSampleInfo info = it.next();
				sampleId += info.getId() + ",";
				sampleName += info.getSampleName() + ",";
			}
		}
		sampleId = sampleId.substring(0, sampleId.length() - 1);
		sampleName = sampleName.substring(0, sampleName.length() - 1);
		String projectItemHide = "";
		Set<AnalysisProject> analysisProjectSet = temp.getAnalysisProject();
		Iterator<AnalysisProject> analyIt = analysisProjectSet.iterator();
		while (analyIt.hasNext()) {
			AnalysisProject analysisProjectTemp = analyIt.next();
			projectItemHide += analysisProjectTemp.getId() + ",";
		}
		ActionContext.getContext().put("projectItemHide", projectItemHide);
		ActionContext.getContext().put("sampleList", sampleId);
		ActionContext.getContext().put("sampleNameList", sampleName);
		ActionContext.getContext().put("projectId", temp.getProject().getId());
		return "changePage";
	}

	public Long getViewId() {
		return viewId;
	}

	public void setViewId(Long viewId) {
		this.viewId = viewId;
	}

	public String getSampleList() {
		return sampleList;
	}

	public void setSampleList(String sampleList) {
		this.sampleList = sampleList;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	public String getExportType() {
		return exportType;
	}

	public void setExportType(String exportType) {
		this.exportType = exportType;
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

	public String getProjectItemHide() {
		return projectItemHide;
	}

	public void setProjectItemHide(String projectItemHide) {
		this.projectItemHide = projectItemHide;
	}

	public String getTypeList() {
		return typeList;
	}

	public void setTypeList(String typeList) {
		this.typeList = typeList;
	}

	@Override
	public DeliveryReceitp getModel() {
		if (entity == null) {
			entity = new DeliveryReceitp();
		}
		return entity;
	}
}
