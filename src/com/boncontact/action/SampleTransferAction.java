package com.boncontact.action;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.DeliveryReceitp;
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
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;

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
			Project pj = projectService.getById(viewId);
			Set<DeliveryReceitp> deliveryReceitpSet = pj
					.getDeliveryReceitpInfo();
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			for (DeliveryReceitp deliveryReceitp : deliveryReceitpSet) {
				// deliveryReceitp.setReceiverUser(userService.getById(id));
				if (pj.getGainSample().equals("1")) {
					Set<SelfSendSampleInfo> selfSendSampleInfos = deliveryReceitp
							.getSelfSendSampleInfo();
					for (SelfSendSampleInfo selfSendSampleInfo : selfSendSampleInfos) {
						selfSendSampleInfo.setDeliver(1);
						selfSendSampleInfoService.update(selfSendSampleInfo);
					}
				} else {
					Set<NonSelfSendSample> selfSendSampleInfos = deliveryReceitp
							.getNonSelfSendSampleInfo();
					for (NonSelfSendSample selfSendSampleInfo : selfSendSampleInfos) {
						selfSendSampleInfo.setDeliver(1);
						nonSelfSendSampleService.update(selfSendSampleInfo);
					}
				}

				deliveryReceitpService.update(deliveryReceitp);
			}
			Set<InspectionSheet> inspectionSheetSet = pj.getInspectionSheet();
			for (InspectionSheet inspectionSheet : inspectionSheetSet) {
				inspectionSheet.setReceiver(userService.getById(id));
				inspectionSheetService.update(inspectionSheet);
			}
			jsonResult = "{'info':'success'}";
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
			SelfSendSampleInfo selfSendSample = selfSendSampleInfoService
					.getById(viewId);
			if (selfSendSample != null) {
				selfSendSample.setDeliver(1);
				selfSendSampleInfoService.update(selfSendSample);
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
			SelfSendSampleInfo selfSendSample = selfSendSampleInfoService
					.getById(viewId);
			if (selfSendSample != null) {
				selfSendSample.setDeliver(0);
				selfSendSampleInfoService.update(selfSendSample);
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
			if (pj.getGainSample().equals("1")) {
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
			}
			Set<InspectionSheet> inspectionSheets=pj.getInspectionSheet();
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

}
