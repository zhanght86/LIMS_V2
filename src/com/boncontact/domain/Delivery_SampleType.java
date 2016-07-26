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
	
	
	private String desp;
	private String saveWay;
	
	private String deliver;

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

	public String getDesp() {
		return desp;
	}

	public void setDesp(String desp) {
		this.desp = desp;
	}

	public String getSaveWay() {
		return saveWay;
	}

	public void setSaveWay(String saveWay) {
		this.saveWay = saveWay;
	}
	

	public String getDeliver() {
		return deliver;
	}

	public void setDeliver(String deliver) {
		this.deliver = deliver;
	}

	@Override
	public String toString() {
		return "Delivery_SampleType [id=" + id + ", project=" + project
				+ ", analysis=" + analysis + ", type=" + type + "]";
	}
	
}
