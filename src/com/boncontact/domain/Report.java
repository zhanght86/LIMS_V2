package com.boncontact.domain;

import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

import com.sun.org.apache.regexp.internal.REProgram;

/**
 * 合同报告
 * 
 * @author 瞿龙俊
 * 
 */
public class Report {
	/* 逻辑主键 */
	private Long id;
	/* 业务主键 */
	private String identify;
	/* 报告类型 */
	private int type;
	/* 文件路径 */
	private String path;
	/* 封面路径 */
	private String coverPath;
	/* 项目编号 */
	private Project project;
	/* 报告编制人 */
	private User maker;
	/* 报告审核 */
	private ReportAudit reportAudit;
	/* 标记，0:未审核 1：一审通过，2：二审通过，3：签发通过 */
	private int result;
	/* 报告创建时间 */
	private Date createDate;

	/* 一审拒绝次数 */
	private String firstRejectNum;
	/* 二审拒绝次数 */
	private String secondRejectNum;
	/* 签发拒绝次数 */
	private String issuedRejectNum;

	private Set<ReportAudit> historyAudit = new TreeSet<ReportAudit>();

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public User getMaker() {
		return maker;
	}

	public void setMaker(User maker) {
		this.maker = maker;
	}

	public ReportAudit getReportAudit() {
		return reportAudit;
	}

	public void setReportAudit(ReportAudit reportAudit) {
		this.reportAudit = reportAudit;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}

	public String getFirstRejectNum() {
		return firstRejectNum;
	}

	public void setFirstRejectNum(String firstRejectNum) {
		this.firstRejectNum = firstRejectNum;
	}

	public String getSecondRejectNum() {
		return secondRejectNum;
	}

	public void setSecondRejectNum(String secondRejectNum) {
		this.secondRejectNum = secondRejectNum;
	}

	public String getIssuedRejectNum() {
		return issuedRejectNum;
	}

	public void setIssuedRejectNum(String issuedRejectNum) {
		this.issuedRejectNum = issuedRejectNum;
	}

	public Set<ReportAudit> getHistoryAudit() {
		return historyAudit;
	}

	public void setHistoryAudit(Set<ReportAudit> historyAudit) {
		this.historyAudit = historyAudit;
	}

}
