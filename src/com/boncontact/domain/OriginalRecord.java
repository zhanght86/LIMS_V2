package com.boncontact.domain;

/**
 * 原始记录管理
 * 
 * @author 瞿龙俊
 * 
 */
public class OriginalRecord {
	private Long id;
	private String name;// 原始记录文件名
	private String path;// 服务器路径
	private AnalysisCategory category; // 所属环境要素

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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public AnalysisCategory getCategory() {
		return category;
	}

	public void setCategory(AnalysisCategory category) {
		this.category = category;
	}

}
