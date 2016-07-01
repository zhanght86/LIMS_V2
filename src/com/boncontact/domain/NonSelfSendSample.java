package com.boncontact.domain;

import java.util.Date;
import java.util.Set;

/**
 * 非自送样信息
 * 
 * @author 瞿龙俊
 * 
 */
public class NonSelfSendSample {
	private Long id;
	/* 非自送样编号 */
	private String identify;
	/* 采样地 */
	private String samplingPosition;
	/*样品状态*/
	private String sampleState;
	/* 样品名称 */
	private String sampleName;
	/* 测试项目 */
	private AnalysisProject analysisProject;
	/* 测试项目集合 */
	private Set<AnalysisProject> analysisProjectSet;
	/* 其他 */
	private String other;
	/* 采样日期 */
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

	public String getSamplingPosition() {
		return samplingPosition;
	}

	public void setSamplingPosition(String samplingPosition) {
		this.samplingPosition = samplingPosition;
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

	public String getSampleState() {
		return sampleState;
	}

	public void setSampleState(String sampleState) {
		this.sampleState = sampleState;
	}
	

	public Set<AnalysisProject> getAnalysisProjectSet() {
		return analysisProjectSet;
	}

	public void setAnalysisProjectSet(Set<AnalysisProject> analysisProjectSet) {
		this.analysisProjectSet = analysisProjectSet;
	}

	@Override
	public String toString() {
		return "NonSelfSendSample [id=" + id + ", identify=" + identify
				+ ", samplingPosition=" + samplingPosition + ", sampleState="
				+ sampleState + ", sampleName=" + sampleName
				+ ", analysisProject=" + analysisProject + ", other=" + other
				+ ", date=" + date + ", user=" + user + ", deliver=" + deliver
				+ ", project=" + project + "]";
	}

	
	

}
