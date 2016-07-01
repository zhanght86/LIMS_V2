package com.boncontact.domain;

import java.util.Date;

/**
 * 原始记录审核 一审、二审
 * 
 * @author 瞿龙俊
 * 
 */
public class RecordAudit {
	/* 逻辑编号 */
	private Long id;
	/* 原始记录是否填写完整 */
	private int firstInstance1;
	/* 监测数据有效位数是否规范 */
	private int firstInstance2;
	/* 原始记录修改是否符合规范 */
	private int firstInstance3;
	/* 送检单结果与记录是否一致 */
	private int firstInstance4;
	/* 原始记录审核是否完整 */
	private int firstInstance5;
	/* 标准曲线是否符合规范 */
	private int firstInstance6;
	/* 一审其他方面 */
	private String firstOther;
	/* 质控样品比例是否满足要求 */
	private int secondInstance1;
	/* 监测过程是否满足规范要求 */
	private int secondInstance2;
	/* 监测分析方法是否现行有效 */
	private int secondInstance3;
	/* 回收率是否合格 */
	private int secondInstance4;
	/* 平行样偏差是否满足要求 */
	private int secondInstance5;
	/* 空白样测试结果是否满足要求 */
	private int secondInstance6;
	/* 二审其他方面 */
	private String secondOther;
	/* 备注 */
	private String remarks;
	/* 一审人 */
	private User firstAudit;
	/* 二审人 */
	private User secondAudit;
	/* 一审日期 */
	private Date firstAuditDate;
	/* 二审日期 */
	private Date secondAuditDate;
	/* 项目编号 */
	private Project project;

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getFirstInstance1() {
		return firstInstance1;
	}

	public void setFirstInstance1(int firstInstance1) {
		this.firstInstance1 = firstInstance1;
	}

	public int getFirstInstance2() {
		return firstInstance2;
	}

	public void setFirstInstance2(int firstInstance2) {
		this.firstInstance2 = firstInstance2;
	}

	public int getFirstInstance3() {
		return firstInstance3;
	}

	public void setFirstInstance3(int firstInstance3) {
		this.firstInstance3 = firstInstance3;
	}

	public int getFirstInstance4() {
		return firstInstance4;
	}

	public void setFirstInstance4(int firstInstance4) {
		this.firstInstance4 = firstInstance4;
	}

	public int getFirstInstance5() {
		return firstInstance5;
	}

	public void setFirstInstance5(int firstInstance5) {
		this.firstInstance5 = firstInstance5;
	}

	public int getFirstInstance6() {
		return firstInstance6;
	}

	public void setFirstInstance6(int firstInstance6) {
		this.firstInstance6 = firstInstance6;
	}

	public String getFirstOther() {
		return firstOther;
	}

	public void setFirstOther(String firstOther) {
		this.firstOther = firstOther;
	}

	public int getSecondInstance1() {
		return secondInstance1;
	}

	public void setSecondInstance1(int secondInstance1) {
		this.secondInstance1 = secondInstance1;
	}

	public int getSecondInstance2() {
		return secondInstance2;
	}

	public void setSecondInstance2(int secondInstance2) {
		this.secondInstance2 = secondInstance2;
	}

	public int getSecondInstance3() {
		return secondInstance3;
	}

	public void setSecondInstance3(int secondInstance3) {
		this.secondInstance3 = secondInstance3;
	}

	public int getSecondInstance4() {
		return secondInstance4;
	}

	public void setSecondInstance4(int secondInstance4) {
		this.secondInstance4 = secondInstance4;
	}

	public int getSecondInstance5() {
		return secondInstance5;
	}

	public void setSecondInstance5(int secondInstance5) {
		this.secondInstance5 = secondInstance5;
	}

	public int getSecondInstance6() {
		return secondInstance6;
	}

	public void setSecondInstance6(int secondInstance6) {
		this.secondInstance6 = secondInstance6;
	}

	public String getSecondOther() {
		return secondOther;
	}

	public void setSecondOther(String secondOther) {
		this.secondOther = secondOther;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public User getFirstAudit() {
		return firstAudit;
	}

	public void setFirstAudit(User firstAudit) {
		this.firstAudit = firstAudit;
	}

	public User getSecondAudit() {
		return secondAudit;
	}

	public void setSecondAudit(User secondAudit) {
		this.secondAudit = secondAudit;
	}

	public Date getFirstAuditDate() {
		return firstAuditDate;
	}

	public void setFirstAuditDate(Date firstAuditDate) {
		this.firstAuditDate = firstAuditDate;
	}

	public Date getSecondAuditDate() {
		return secondAuditDate;
	}

	public void setSecondAuditDate(Date secondAuditDate) {
		this.secondAuditDate = secondAuditDate;
	}

	@Override
	public String toString() {
		return "RecordAudit [id=" + id + ", firstInstance1=" + firstInstance1
				+ ", firstInstance2=" + firstInstance2 + ", firstInstance3="
				+ firstInstance3 + ", firstInstance4=" + firstInstance4
				+ ", firstInstance5=" + firstInstance5 + ", firstInstance6="
				+ firstInstance6 + ", firstOther=" + firstOther
				+ ", secondInstance1=" + secondInstance1 + ", secondInstance2="
				+ secondInstance2 + ", secondInstance3=" + secondInstance3
				+ ", secondInstance4=" + secondInstance4 + ", secondInstance5="
				+ secondInstance5 + ", secondInstance6=" + secondInstance6
				+ ", secondOther=" + secondOther + ", remarks=" + remarks
				+ ", firstAudit=" + firstAudit + ", secondAudit=" + secondAudit
				+ ", firstAuditDate=" + firstAuditDate + ", secondAuditDate="
				+ secondAuditDate + ", project=" + project + "]";
	}

}
