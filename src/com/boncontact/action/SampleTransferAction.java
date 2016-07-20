package com.boncontact.action;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.DeliveryReceitp;
import com.boncontact.domain.Delivery_SampleType;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.NonSelfSendSample;
import com.boncontact.domain.Project;
import com.boncontact.domain.SelfSendSampleInfo;
import com.opensymphony.xwork2.ActionContext;

/**
 * 样品交接（样品保管员）
 * 
 * @author 瞿龙俊
 * 
 */
@Component("sampleTransfer")
public class SampleTransferAction extends BaseAction<Project> {
	private static final long serialVersionUID = 1625720355129364762L;
	private Long viewId;
	private String ids;
	private String desp;
	private int saveWay;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;

	private int condition;
	private String tag;
	private String additives;

	public String main() {
		List<Project> projectList = projectService.findAll(" WHERE process=4");
		ActionContext.getContext().put("projectList", projectList);
		ActionContext.getContext().put("totalRecord", projectList.size());
		ActionContext.getContext().put("totalPage",
				(int) Math.ceil(projectList.size() / (double) pageRowCount));
		return "main";
	}

	public String receive() {
		try {
			if (viewId != null) {
				Project pj = projectService.getById(viewId);
				//重新设计送检单接收信息，不应该是project字段，而应该是交联单字段
				
				//pj.setSample_Tag(tag);
				//pj.setPackage_condition(condition);
				//System.out.println(additives);
				//pj.setSolid_Additives(additives);
				projectService.update(pj);
				jsonResult = "{'info':'success'}";
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String receiveNonItem() {
		try {
			System.out.println(viewId);
			NonSelfSendSample nonSelfSendSample = nonSelfSendSampleService
					.getById(viewId);
			if (nonSelfSendSample != null) {
				nonSelfSendSample.setDeliver(1);
				nonSelfSendSampleService.update(nonSelfSendSample);
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

	public String receiveBackNonItem() {
		try {
			System.out.println(viewId);
			NonSelfSendSample nonSelfSendSample = nonSelfSendSampleService
					.getById(viewId);
			if (nonSelfSendSample != null) {
				nonSelfSendSample.setDeliver(0);
				nonSelfSendSampleService.update(nonSelfSendSample);
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

	public String receiveItem() {
		try {
			System.out.println(viewId);
			System.out.println("desp" + desp);
			System.out.println("saveWay" + saveWay);
			/*
			 * SelfSendSampleInfo selfSendSample = selfSendSampleInfoService
			 * .getById(viewId);
			 */
			Delivery_SampleType delivery_SampleType = delivery_SampleTypeService
					.getById(viewId);
			if (delivery_SampleType != null) {
				// selfSendSample.setDeliver(1);
				// selfSendSample.setDesp(desp);
				// selfSendSample.setSaveWay(saveWay);
				// selfSendSampleInfoService.update(selfSendSample);
				delivery_SampleType.setDesp(desp);
				delivery_SampleType.setSaveWay(saveWay+"");
				delivery_SampleType.setDeliver("1");
				delivery_SampleTypeService.update(delivery_SampleType);
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

	public String receiveBackItem() {
		try {
			Delivery_SampleType delivery_SampleType = delivery_SampleTypeService
					.getById(viewId);
			if (delivery_SampleType != null) {
				delivery_SampleType.setDeliver("0");
//				selfSendSampleInfoService.update(selfSendSample);
				delivery_SampleType.setDesp("");
				delivery_SampleType.setSaveWay("0");
				delivery_SampleTypeService.update(delivery_SampleType);
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

	public String flow() {
		try {
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			Project pj = projectService.getById(viewId);
			Set<DeliveryReceitp> deliveryReceitpSet = pj
					.getDeliveryReceitpInfo();
			Set<Delivery_SampleType> delivery_SampleTypes = pj.getSampleTypeSet();
			for (Delivery_SampleType delivery_SampleType : delivery_SampleTypes) {
				if(delivery_SampleType.getDeliver() == "0"){
					jsonResult = "{'info':'error'}";
					return SUCCESS;
				}
			}
			
			for (DeliveryReceitp deliveryReceitp : deliveryReceitpSet) {
				if(deliveryReceitp!=null){
					deliveryReceitp.setReceiverUser(userService.getById(id));
					deliveryReceitpService.update(deliveryReceitp);
				}
			}
			
			
			
			
			/*if (pj.getGainSample().equals("1")) {
				for (DeliveryReceitp deliveryReceitp : deliveryReceitpSet) {
					Set<SelfSendSampleInfo> selfSendSampleInfos = deliveryReceitp
							.getSelfSendSampleInfo();
					for (SelfSendSampleInfo selfSendSampleInfo : selfSendSampleInfos) {
						if (selfSendSampleInfo.getDeliver() != 1) {
							jsonResult = "{'info':'error'}";
							return SUCCESS;
						}
					}
					deliveryReceitp.setReceiverUser(userService.getById(id));
					deliveryReceitpService.update(deliveryReceitp);
				}
			} else {
				for (DeliveryReceitp deliveryReceitp : deliveryReceitpSet) {
					Set<NonSelfSendSample> selfSendSampleInfos = deliveryReceitp
							.getNonSelfSendSampleInfo();
					for (NonSelfSendSample selfSendSampleInfo : selfSendSampleInfos) {
						if (selfSendSampleInfo.getDeliver() != 1) {
							jsonResult = "{'info':'error'}";
							return SUCCESS;
						}
					}
					deliveryReceitp.setReceiverUser(userService.getById(id));
					deliveryReceitpService.update(deliveryReceitp);
				}
			}*/
			Set<InspectionSheet> inspectionSheets = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheets) {
				inspectionSheet.setReceiver(userService.getById(id));
				inspectionSheetService.update(inspectionSheet);
			}
			pj.setProcess(5);
			projectService.update(pj);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
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

	public String getDesp() {
		return desp;
	}

	public void setDesp(String desp) {
		this.desp = desp;
	}

	public int getSaveWay() {
		return saveWay;
	}

	public void setSaveWay(int saveWay) {
		this.saveWay = saveWay;
	}

	public int getCondition() {
		return condition;
	}

	public void setCondition(int condition) {
		this.condition = condition;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getAdditives() {
		return additives;
	}

	public void setAdditives(String additives) {
		this.additives = additives;
	}

}
