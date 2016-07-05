package com.boncontact.domain;

import java.util.Date;
import java.util.Set;

/**
 * 自送样信息
 * 
 * @author 瞿龙俊
 * 
 */
public class SelfSendSampleInfo implements Comparable<SelfSendSampleInfo> {
	private Long id;
	/* 自送样编号 */
	private String identify;
	/* 样品状态 */
	private String sampleState;
	/* 样品名称 */
	private String sampleName;
	/* 样品状态、颜色 */
	private String state;
	/* 测试项目 */
	private AnalysisProject analysisProject;
	/* 测试项目集合 */
	private Set<AnalysisProject> analysisProjectSet;
	/* 其他 */
	private String other;
	/* 送样单位 */
	private String client;
	/* 送样日期 */
	private Date date;
	/* 记录人 */
	private User user;
	/* 是否已经交付，0：尚未交付，1：已交付 */
	private int deliver;
	/* 项目Project */
	private Project project;

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

	public String getSampleState() {
		return sampleState;
	}

	public void setSampleState(String sampleState) {
		this.sampleState = sampleState;
	}

	public String getSampleName() {
		return sampleName;
	}

	public void setSampleName(String sampleName) {
		this.sampleName = sampleName;
	}

	public AnalysisProject getAnalysisProject() {
		return analysisProject;
	}

	public void setAnalysisProject(AnalysisProject analysisProject) {
		this.analysisProject = analysisProject;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getDeliver() {
		return deliver;
	}

	public void setDeliver(int deliver) {
		this.deliver = deliver;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Set<AnalysisProject> getAnalysisProjectSet() {
		return analysisProjectSet;
	}

	public void setAnalysisProjectSet(Set<AnalysisProject> analysisProjectSet) {
		this.analysisProjectSet = analysisProjectSet;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public int compareTo(SelfSendSampleInfo o) {
		// TODO 自动生成的方法存根
		return this.getId() > o.getId() ? 1 : 0;
	}

}
