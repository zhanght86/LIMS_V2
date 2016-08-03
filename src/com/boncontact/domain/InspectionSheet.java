package com.boncontact.domain;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * 送检单基础类，通用部分
 * 
 * @author 瞿龙俊
 * 
 */
public class InspectionSheet {
	private Long id;
	/* 送检单类型 0：水质，1：土壤，2：固定污染源，3：环境空气 */
	private int sheetType;
	/* 采样日期 */
	private Date samplingDate;
	/* 送样日期 */
	private Date sendSample;
	/* 送样者 */
	private User sendUser;
	/* 接样者 */
	private User receiver;
	/* 其他 */
	private String other;
	/* 分析员 */
	private User analyst;
	/* 分析日期 */
	private Date analysisDate;
	/* 复核者 */
	private User review;
	/* 审核者 */
	private User audit;
	/* 所属项目 */
	private Project project;
	/* 分析项目实体 */
	private AnalysisProject analysisProject;
	/* 样品编号 */
	private Set<InspectionSheet_Result> result = new LinkedHashSet<InspectionSheet_Result>();
	/* 原始记录表地址 */
	private String resultPath;
	/* 当前送检单流程0:创建送检单，1：填写完成送检单，2：复核完成送检单 */
	private long step;
	/*一审拒绝次数*/
	private String firstReject;
	/*二审拒绝次数*/
	private String secondReject;
	/*复核拒绝次数*/
	private String reviewReject;
	private String itemReject;
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getSamplingDate() {
		return samplingDate;
	}

	public void setSamplingDate(Date samplingDate) {
		this.samplingDate = samplingDate;
	}

	public Date getSendSample() {
		return sendSample;
	}

	public void setSendSample(Date sendSample) {
		this.sendSample = sendSample;
	}

	public User getSendUser() {
		return sendUser;
	}

	public void setSendUser(User sendUser) {
		this.sendUser = sendUser;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public User getAnalyst() {
		return analyst;
	}

	public void setAnalyst(User analyst) {
		this.analyst = analyst;
	}

	public Date getAnalysisDate() {
		return analysisDate;
	}

	public void setAnalysisDate(Date analysisDate) {
		this.analysisDate = analysisDate;
	}

	public User getReview() {
		return review;
	}

	public void setReview(User review) {
		this.review = review;
	}

	public User getAudit() {
		return audit;
	}

	public void setAudit(User audit) {
		this.audit = audit;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public AnalysisProject getAnalysisProject() {
		return analysisProject;
	}

	public void setAnalysisProject(AnalysisProject analysisProject) {
		this.analysisProject = analysisProject;
	}

	public int getSheetType() {
		return sheetType;
	}

	public void setSheetType(int sheetType) {
		this.sheetType = sheetType;
	}

	public String getResultPath() {
		return resultPath;
	}

	public void setResultPath(String resultPath) {
		this.resultPath = resultPath;
	}

	public Set<InspectionSheet_Result> getResult() {
		return result;
	}

	public void setResult(Set<InspectionSheet_Result> result) {
		this.result = result;
	}

	public long getStep() {
		return step;
	}

	public void setStep(long step) {
		this.step = step;
	}
	

	public String getFirstReject() {
		return firstReject;
	}

	public void setFirstReject(String firstReject) {
		this.firstReject = firstReject;
	}

	public String getSecondReject() {
		return secondReject;
	}

	public void setSecondReject(String secondReject) {
		this.secondReject = secondReject;
	}

	public String getReviewReject() {
		return reviewReject;
	}

	public void setReviewReject(String reviewReject) {
		this.reviewReject = reviewReject;
	}

	public String getItemReject() {
		return itemReject;
	}

	public void setItemReject(String itemReject) {
		this.itemReject = itemReject;
	}

	@Override
	public String toString() {
		return "InspectionSheet [id=" + id + ", sheetType=" + sheetType
				+ ", samplingDate=" + samplingDate + ", sendSample="
				+ sendSample + ", sendUser=" + sendUser + ", receiver="
				+ receiver + ", other=" + other + ", analyst=" + analyst
				+ ", analysisDate=" + analysisDate + ", review=" + review
				+ ", audit=" + audit + ", project=" + project
				+ ", analysisProject=" + analysisProject + ", result=" + result
				+ ", resultPath=" + resultPath + "]";
	}


}
