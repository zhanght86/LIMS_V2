package com.boncontact.domain;

/**
 * 送检单中的样品类型
 * 
 * @author 瞿龙俊
 * 
 */
public class Delivery_SampleType {
	private Long id;
	// 项目
	private Project project;
	// 分析项目
	private AnalysisProject analysis;
	// 类型
	private String type;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public AnalysisProject getAnalysis() {
		return analysis;
	}

	public void setAnalysis(AnalysisProject analysis) {
		this.analysis = analysis;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Delivery_SampleType [id=" + id + ", project=" + project
				+ ", analysis=" + analysis + ", type=" + type + "]";
	}
	
}
