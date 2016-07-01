package com.boncontact.base;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.domain.InspectionSheet;
import com.boncontact.domain.MessageListen;
import com.boncontact.domain.MessageQueue;
import com.boncontact.domain.Project;
import com.boncontact.domain.Report;
import com.boncontact.domain.Role;
import com.boncontact.domain.User;
import com.opensymphony.xwork2.ActionContext;

@Component("pushMessage")
public class PushMessage extends BaseAction<MessageQueue> {
	private static final long serialVersionUID = 283711995122834270L;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private int i = 0;
	private Long viewId;
	public String message() {
		try {
			Thread.sleep(5000);
			Long id = (Long) ActionContext.getContext().getSession()
					.get("userId");
			User user = userService.getById(id);
			List<MessageQueue> messageQueueList = messageQueueService
					.findAll(" WHERE flag = 0 AND receiver =" + id);
			List<MessageListen> messageListens = messageListenService
					.findAll(" WHERE receiver=" + id);
			for (MessageListen listenType : messageListens) {
				List<Project> projectList = new ArrayList<Project>();
				switch (listenType.getType().intValue()) {
				case 1:
					// 项目样品交接
					projectList = projectService.findAll(" WHERE process=4");
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=1 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待交接样品，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(1);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 2:
					// 任务分配下达
					projectList = projectService.findAll(" WHERE process=5");
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=2 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待分配任务，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(2);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 3:
					// 检测结果填写
					List<InspectionSheet> inspectionSheetList = inspectionSheetService
							.findAll(" WHERE analyst=" + id + " and step<2");
					for (InspectionSheet inspectionSheet : inspectionSheetList) {
						Project temp = inspectionSheet.getProject();
						if (temp.getProcess() == 6
								&& !projectList.contains(temp)) {
							projectList.add(temp);
						}
					}
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=3 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待提交检测结果的项目，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(3);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 4:
					// 检测结果复核
					List<InspectionSheet> inspectionSheetList2 = inspectionSheetService
							.findAll(" WHERE review=" + id + " and step=2");
					for (InspectionSheet inspectionSheet : inspectionSheetList2) {
						Project temp = inspectionSheet.getProject();
						if (temp.getProcess() == 6
								&& !projectList.contains(temp)) {
							projectList.add(temp);
						}
					}
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=4 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待复核的检测结果，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(4);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 5:
					// 检测结果审核
					projectList = projectService.findAll("WHERE process=7");
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=5 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待审核的检测结果，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(5);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 6:
					// 合同报告编制
					projectList = projectService.findAll("WHERE process=9");
					List<Project> levelPj = new ArrayList<Project>();
					for (Project project : projectList) {

						int flag = 0;
						Set<Report> rp = project.getReportSet();
						if (rp.size() == 0) {
							flag = 1;
						}
						for (Report report : rp) {
							if (report.getResult() == 0) {
								flag = 1;
							}
						}
						if (flag == 1) {
							levelPj.add(project);
						}
					}
					for (Project project : levelPj) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=6 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待编制合同，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(6);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 7:
					// 报告编制审核(xx)
					projectList = projectService.findAll(" WHERE process=9");
					List<Project> levelPj2 = new ArrayList<Project>();
					for (Project project : projectList) {
						int flag = 0;
						Set<Report> rp = project.getReportSet();
						for (Report report : rp) {
							if (report.getResult() == 1) {
								flag = 1;
							}
						}
						if (flag == 1) {
							levelPj2.add(project);
						}
					}
					for (Project project : levelPj2) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=7 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待审核的报告，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(7);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 8:
					// 报告签发审核
					projectList = projectService.findAll(" WHERE process=9");
					List<Project> levelPj3 = new ArrayList<Project>();
					for (Project project : projectList) {
						int flag = 0;
						Set<Report> rp = project.getReportSet();
						for (Report report : rp) {
							if (report.getResult() == 3) {
								flag = 1;
							}
						}
						if (flag == 1) {
							levelPj3.add(project);
						}
					}
					for (Project project : levelPj3) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=8 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待签发的报告，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(8);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 9:
					// 报告签收发放
					projectList = projectService.findAll(" WHERE process=10");
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=9 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待签收报告，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(9);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 10:
					// 质量控制统计
					projectList = projectService.findAll(" WHERE process=3");
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=10 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待质量控制的项目，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(10);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 11:
					// 实验分析审核
					projectList = projectService.findAll("WHERE process=8");
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=11 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待审核的实验结果，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(11);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 12:
					// 监测报告审核
					projectList = projectService.findAll(" WHERE process=9");
					List<Project> levelPj4 = new ArrayList<Project>();
					for (Project project : projectList) {
						int flag = 0;
						Set<Report> rp = project.getReportSet();
						for (Report report : rp) {
							if (report.getResult() == 2) {
								flag = 1;
							}
						}
						if (flag == 1) {
							levelPj4.add(project);
						}
					}
					for (Project project : levelPj4) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=12 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待交接样品，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(12);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;

				case 13:
					// 合同评审
					Role auditRole = userService.getById(id).getRole();
					projectList = projectService
							.findAll(" WHERE contractAuditRole='"
									+ auditRole.getId()
									+ "' AND sContractId!=null AND process=0");
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=13 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待评审合同，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(13);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 14:
					// 任务下达
					projectList = projectService
							.findAll(" WHERE process=1 ORDER BY contractId DESC");
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=14 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有待下达任务，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(14);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 15:
					// 自送样登记
					projectList = projectService
							.findAll(" WHERE process=2 AND gainSample=1");
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=15 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有自送样需要登记，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(15);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				case 16:
					// 现场采样
					projectList = projectService
							.findAll(" WHERE process=2 AND gainSample=0");
					for (Project project : projectList) {
						List<MessageQueue> mqList = messageQueueService
								.findAll(" WHERE type=16 AND receiver="
										+ user.getId() + " AND itemId="
										+ project.getId());
						if (mqList.size() != 0) {
							break;
						}
						MessageQueue mq = new MessageQueue();
						mq.setItemId(project.getId());
						mq.setReceiver(user);
						mq.setMessage("您有现场采样需要登记，请及时查看！");
						mq.setPushDate(new Date());
						mq.setType(16);
						mq.setFlag(0);
						messageQueueService.save(mq);
						messageQueueList.add(mq);
					}
					break;
				default:
					break;
				}
			}
			if (messageQueueList.size() != 0) {
				jsonResult = "{'info':'getMessage','num':"
						+ messageQueueList.size() + "}";
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}
	public String ignoreMessage(){
		try{
			MessageQueue mq=messageQueueService.getById(viewId);
			mq.setFlag(1);
			messageQueueService.update(mq);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}
	
	public String ignoreMessageAll(){
		try{
			Long id = (Long) ActionContext.getContext().getSession().get("userId");
			List<MessageQueue> messageQueueList = messageQueueService
					.findAll(" WHERE flag=0 AND receiver = " + id + " ORDER BY id DESC");
			for (MessageQueue messageQueue : messageQueueList) {
				messageQueue.setFlag(1);
				messageQueueService.update(messageQueue);
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}
	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}
	public Long getViewId() {
		return viewId;
	}
	public void setViewId(Long viewId) {
		this.viewId = viewId;
	}

}
