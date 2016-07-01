package com.boncontact.domain;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * 公司通用模版Action
 * 
 * @author 瞿龙俊
 * 
 */
public class CommonTemplet {
	private Long id;
	/* 程序文件 */
	private String filesId;
	/* 记录表编号 */
	private String identify;
	/* 记录表名称 */
	private String name;
	/* 使用科室 */
	private Set<Department> useDepartment = new LinkedHashSet<Department>();
	/* 下载路径 */
	private String path;

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

	public Set<Department> getUseDepartment() {
		return useDepartment;
	}

	public void setUseDepartment(Set<Department> useDepartment) {
		this.useDepartment = useDepartment;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFilesId() {
		return filesId;
	}

	public void setFilesId(String filesId) {
		this.filesId = filesId;
	}

	@Override
	public String toString() {
		return "CommonTemplet [id=" + id + ", filesId=" + filesId
				+ ", identify=" + identify + ", name=" + name
				+ ", useDepartment=" + useDepartment + ", path=" + path + "]";
	}

}
