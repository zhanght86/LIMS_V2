package com.boncontact.domain;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * 交接单
 * 
 * @author 瞿龙俊
 * 
 */
public class DeliveryReceitp {
	private Long id;
	/* 样品类型：0：土壤 ，1：水和废水 2：空气和废气 */
	private int samplesType;
	/* 采样日期 */
	private Date samplingDate;
	/* 监测类型 */
	private String monitoringType;
	/* 项目总数 */
	private int itemNum;
	/* 交接日期 */
	private Date transferDate;
	/* 送样人 */
	private User transferUser;
	/* 接样人 */
	private User receiverUser;
	/* 返回日期 */
	private Date backDate;
	/* 返回人 */
	private User backUser;
	/* 自送样列表 */
	private Set<SelfSendSampleInfo> selfSendSampleInfo = new LinkedHashSet<SelfSendSampleInfo>();
	/* 非自送样列表 */
	private Set<NonSelfSendSample> nonSelfSendSampleInfo = new LinkedHashSet<NonSelfSendSample>();
	/* 项目 */
	private Project project;
	/* 分析项目 */
	private Set<AnalysisProject> analysisProject = new LinkedHashSet<AnalysisProject>();
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getSamplesType() {
		return samplesType;
	}
	public void setSamplesType(int samplesType) {
		this.samplesType = samplesType;
	}
	public Date getSamplingDate() {
		return samplingDate;
	}
	public void setSamplingDate(Date samplingDate) {
		this.samplingDate = samplingDate;
	}
	public String getMonitoringType() {
		return monitoringType;
	}
	public void setMonitoringType(String monitoringType) {
		this.monitoringType = monitoringType;
	}
	public int getItemNum() {
		return itemNum;
	}
	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}
	public Set<SelfSendSampleInfo> getSelfSendSampleInfo() {
		return selfSendSampleInfo;
	}
	public void setSelfSendSampleInfo(Set<SelfSendSampleInfo> selfSendSampleInfo) {
		this.selfSendSampleInfo = selfSendSampleInfo;
	}
	public Set<NonSelfSendSample> getNonSelfSendSampleInfo() {
		return nonSelfSendSampleInfo;
	}
	public void setNonSelfSendSampleInfo(
			Set<NonSelfSendSample> nonSelfSendSampleInfo) {
		this.nonSelfSendSampleInfo = nonSelfSendSampleInfo;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public Set<AnalysisProject> getAnalysisProject() {
		return analysisProject;
	}
	public void setAnalysisProject(Set<AnalysisProject> analysisProject) {
		this.analysisProject = analysisProject;
	}
	public Date getTransferDate() {
		return transferDate;
	}
	public void setTransferDate(Date transferDate) {
		this.transferDate = transferDate;
	}
	public User getTransferUser() {
		return transferUser;
	}
	public void setTransferUser(User transferUser) {
		this.transferUser = transferUser;
	}
	public User getReceiverUser() {
		return receiverUser;
	}
	public void setReceiverUser(User receiverUser) {
		this.receiverUser = receiverUser;
	}
	public Date getBackDate() {
		return backDate;
	}
	public void setBackDate(Date backDate) {
		this.backDate = backDate;
	}
	public User getBackUser() {
		return backUser;
	}
	public void setBackUser(User backUser) {
		this.backUser = backUser;
	}
	@Override
	public String toString() {
		return "DeliveryReceitp [id=" + id + ", samplesType=" + samplesType
				+ ", samplingDate=" + samplingDate + ", monitoringType="
				+ monitoringType + ", itemNum=" + itemNum + ", transferDate="
				+ transferDate + ", transferUser=" + transferUser
				+ ", receiverUser=" + receiverUser + ", backDate=" + backDate
				+ ", backUser=" + backUser + ", selfSendSampleInfo="
				+ selfSendSampleInfo + ", nonSelfSendSampleInfo="
				+ nonSelfSendSampleInfo + ", project=" + project
				+ ", analysisProject=" + analysisProject + "]";
	}

	
}
