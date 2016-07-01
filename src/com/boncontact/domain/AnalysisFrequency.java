package com.boncontact.domain;

/**
 * 监测频次
 * 
 * @author 瞿龙俊
 * 
 */
public class AnalysisFrequency {
	/*编号*/
	private Long id;
	/*频次*/
	private String name;
	/*备注*/
	private String other;

	@Override
	public String toString() {
		return "AnalysisFrequency [id=" + id + ", name=" + name + ", other="
				+ other + "]";
	}

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

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

}
