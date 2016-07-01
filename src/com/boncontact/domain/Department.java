package com.boncontact.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 部门实体
 * @author 瞿龙俊
 *
 */
/**
 * @author 瞿龙俊
 * 
 */
/**
 * @author 瞿龙俊
 *
 */
public class Department {

	// 主键Id
	private Long id;
	// 业务主键
	private String identify;
	// 部门名称
	private String name;
	// 部门描述
	private String desp;
	// 部门主管
	private Role manager;

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

	public Role getManager() {
		return manager;
	}

	public void setManager(Role manager) {
		this.manager = manager;
	}
	@Override
	public String toString() {
		return "Department [id=" + id + ", identify=" + identify + ", name="
				+ name + ", desp=" + desp + ", manager=" + manager + "]";
	}

	

	
	
}
