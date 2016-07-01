package com.boncontact.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
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
import com.boncontact.domain.DeliveryReceitp;
import com.boncontact.domain.Project;
import com.boncontact.domain.ProjectBook;
import com.boncontact.domain.Report;
import com.boncontact.domain.ReportAudit;
import com.opensymphony.xwork2.ActionContext;

/**
 * 报告签收、发放
 * 
 * @author 瞿龙俊
 * 
 */
@Component("reportReceipt")
public class ReportReceiptAction extends BaseAction<Report> {
	private static final long serialVersionUID = -1405461694515854203L;
	private Report entity;
	// 文件名，包括路径
	private String fileName;
	// 真实文件名，不包括路径
	private String realFileName;
	private Long viewId;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;

	public String main() {
		List<Project> projectList = projectService.findAll(" WHERE process= 10");
		ActionContext.getContext().put("projectList", projectList);
		return "main";
	}

	public String refer() {
		try {
			Report rp = reportService.getById(viewId);
			Project pj = rp.getProject();
			if (pj != null) {
				rp.setResult(5);
				reportService.update(rp);
				int flag = 0;
				Set<Report> report = pj.getReportSet();
				for (Report rep : report) {
					if (rep.getResult() != 5) {
						flag = 1;
					}
				}
				if (flag == 0) {
					pj.setProcess(11);
					ProjectBook pb = pj.getProjectBook();
					Long id = (Long) ActionContext.getContext().getSession()
							.get("userId");
					pb.setSalesmanSign(userService.getById(id));
					pb.setSalesmanSignDate(new Date());
					pj.setProjectBook(pb);
					projectService.update(pj);
					jsonResult = "{'info':'successAll'}";
					return SUCCESS;
				}
			}
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String exportAudit() {
		Report report = reportService.getById(viewId);
		Project pj = report.getProject();
		Set<DeliveryReceitp> deliveryReceitp = pj.getDeliveryReceitpInfo();
		Iterator<DeliveryReceitp> it = deliveryReceitp.iterator();
		String type = "";
		if (it.hasNext()) {
			type = it.next().getMonitoringType() + "监测";
		}
		ReportAudit ra = report.getReportAudit();
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
		dataMap.put("identify", report.getIdentify());
		dataMap.put("name", report.getMaker().getName());
		dataMap.put("typeName", type);
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
		dataMap.put("g1", ra.getFirstInstance7() == 1 ? str : str2);
		dataMap.put("g2", ra.getFirstInstance7() == 2 ? str : str2);
		dataMap.put("g3", ra.getFirstInstance7() == 3 ? str : str2);
		dataMap.put("oneOther", ra.getFirstOther());
		dataMap.put("oneName", ra.getFirstUser().getName());
		dataMap.put("dtOne", ra.getFirstDate());
		dataMap.put("h1", ra.getSecondInstance1() == 1 ? str : str2);
		dataMap.put("h2", ra.getSecondInstance1() == 2 ? str : str2);
		dataMap.put("h3", ra.getSecondInstance1() == 3 ? str : str2);
		dataMap.put("i1", ra.getSecondInstance2() == 1 ? str : str2);
		dataMap.put("i2", ra.getSecondInstance2() == 2 ? str : str2);
		dataMap.put("i3", ra.getSecondInstance2() == 3 ? str : str2);
		dataMap.put("j1", ra.getSecondInstance3() == 1 ? str : str2);
		dataMap.put("j2", ra.getSecondInstance3() == 2 ? str : str2);
		dataMap.put("j3", ra.getSecondInstance3() == 3 ? str : str2);
		dataMap.put("k1", ra.getSecondInstance4() == 1 ? str : str2);
		dataMap.put("k2", ra.getSecondInstance4() == 2 ? str : str2);
		dataMap.put("k3", ra.getSecondInstance4() == 3 ? str : str2);
		dataMap.put("l1", ra.getSecondInstance5() == 1 ? str : str2);
		dataMap.put("l2", ra.getSecondInstance5() == 2 ? str : str2);
		dataMap.put("l3", ra.getSecondInstance5() == 3 ? str : str2);
		dataMap.put("m1", ra.getSecondInstance6() == 1 ? str : str2);
		dataMap.put("m2", ra.getSecondInstance6() == 2 ? str : str2);
		dataMap.put("m3", ra.getSecondInstance6() == 3 ? str : str2);
		dataMap.put("twoOther", ra.getSecondOhter());
		dataMap.put("twoName", ra.getSecondUser().getName());
		dataMap.put("dtTwo", ra.getSecondDate());
		dataMap.put("n1", ra.getIssueAudit1() == 1 ? str : str2);
		dataMap.put("n2", ra.getIssueAudit1() == 2 ? str : str2);
		dataMap.put("n3", ra.getIssueAudit1() == 3 ? str : str2);
		dataMap.put("o1", ra.getIssueAudit2() == 1 ? str : str2);
		dataMap.put("o2", ra.getIssueAudit2() == 2 ? str : str2);
		dataMap.put("o3", ra.getIssueAudit2() == 3 ? str : str2);
		dataMap.put("p1", ra.getIssueAudit3() == 1 ? str : str2);
		dataMap.put("p2", ra.getIssueAudit3() == 2 ? str : str2);
		dataMap.put("p3", ra.getIssueAudit3() == 3 ? str : str2);
		dataMap.put("threeOther", ra.getIssueOther());
		dataMap.put("threeName", ra.getIssueUser().getName());
		dataMap.put("dtThree", ra.getIssueDate());
		dataMap.put("q1", ra.getIssueOpinion() == 1 ? str : str2);
		dataMap.put("q2", ra.getIssueOpinion() == 2 ? str : str2);
		dataMap.put("q3", ra.getIssueOpinion() == 3 ? str : str2);
		dataMap.put("dt", "");
		dataMap.put("dt2", "");
		dataMap.put("dt3", "");
		DocumentHandler dh = new DocumentHandler();
		dh.createDoc(dataMap, "reportAudit.xml",
				path + "\\" + pj.getContractId() + "监测报告报表审核签发记录表.doc");
		fileName = path + "\\" + pj.getContractId() + "监测报告报表审核签发记录表.doc";
		realFileName = pj.getContractId() + "监测报告报表审核签发记录表.doc";
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

	@Override
	public Report getModel() {
		if (entity == null) {
			entity = new Report();
		}
		return entity;
	}
}
