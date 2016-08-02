package com.boncontact.domain;

/**
 * 分析项目管理
 * 
 * @author 瞿龙俊
 * 
 */
public class AnalysisProject implements Comparable<AnalysisProject>{
	private Long id;
	/* 项目名称 */
	private String name;
	/* 项目类别 */
	private int type;
	/* 其他 */
	private String other;
	
	private AnalysisCategory analysisCategory;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}
	

	public AnalysisCategory getAnalysisCategory() {
		return analysisCategory;
	}

	public void setAnalysisCategory(AnalysisCategory analysisCategory) {
		this.analysisCategory = analysisCategory;
	}

	@Override
	public String toString() {
		return "AnalysisProject [id=" + id + ", name=" + name + ", type="
				+ type + ", other=" + other + ", analysisCategory="
				+ analysisCategory + "]";
	}

	@Override
	public int compareTo(AnalysisProject o) {
		// TODO 自动生成的方法存根
		return this.getId() < o.getId() ? 0 : 1;
	}

}
