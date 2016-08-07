package com.boncontact.domain;

/**
 * 合同监测内容项实体
 * 
 * @author 瞿龙俊
 * 
 */
public class ContractMonitoringItem implements Comparable<ContractMonitoringItem>{
	// 主键
	private Long id;
	// 环境要素
	//private String environmentElement;
	// 监测点个数
	private int siteNum;
	// 监测项目
	//private String project;
	
	//环境要素
	private AnalysisCategory analysisCategory;
	//新的监测项目
	private AnalysisProject analysisProject;
	//新的监测频次
	private AnalysisFrequency analysisFrequency;
	
	// 监测频次
	//private String frequency;
	// 备注
	private String other;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	

	public AnalysisCategory getAnalysisCategory() {
		return analysisCategory;
	}

	public void setAnalysisCategory(AnalysisCategory analysisCategory) {
		this.analysisCategory = analysisCategory;
	}

	public AnalysisProject getAnalysisProject() {
		return analysisProject;
	}

	public void setAnalysisProject(AnalysisProject analysisProject) {
		this.analysisProject = analysisProject;
	}

	public AnalysisFrequency getAnalysisFrequency() {
		return analysisFrequency;
	}

	public void setAnalysisFrequency(AnalysisFrequency analysisFrequency) {
		this.analysisFrequency = analysisFrequency;
	}

	public int getSiteNum() {
		return siteNum;
	}

	public void setSiteNum(int siteNum) {
		this.siteNum = siteNum;
	}

	

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	@Override
	public String toString() {
		return "ContractMonitoringItem [id=" + id + ", siteNum=" + siteNum
				+ ", analysisCategory=" + analysisCategory
				+ ", analysisProject=" + analysisProject
				+ ", analysisFrequency=" + analysisFrequency + ", other="
				+ other + "]";
	}

	@Override
	public int compareTo(ContractMonitoringItem o) {
		// TODO 自动生成的方法存根
		if(this.getId() == null) return 1;
		return this.getId() > o.getId() ? 1 : 0;
	}





	
}
