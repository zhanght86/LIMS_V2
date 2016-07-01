package com.boncontact.domain;

/**
 * 检测分类
 * 
 * @author 瞿龙俊
 * 
 */
public class AnalysisType {
	private Long id;
	/* 分类编号 */
	private String identify;
	/* 分类名称 */
	private String name;
	/* 分类描述 */
	private String desp;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesp() {
		return desp;
	}

	public void setDesp(String desp) {
		this.desp = desp;
	}

	@Override
	public String toString() {
		return "AnalysisType [id=" + id + ", identify=" + identify + ", name="
				+ name + ", desp=" + desp + "]";
	}

}
