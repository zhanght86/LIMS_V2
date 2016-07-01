package com.boncontact.domain;

import java.util.Date;

/**
 * 报告审核
 * 
 * @author 瞿龙俊
 * 
 */
public class ReportAudit {
	private Long id;
	/* 报告实体 */
	private Report report;
	/* 报告报表及各种记录是否齐全 */
	private int firstInstance1;
	/* 监测内容与任务书是否一致 */
	private int firstInstance2;
	/* 监测数据与原始记录是否一致 */
	private int firstInstance3;
	/* 数据处理和填报是否满足要求 */
	private int firstInstance4;
	/* 监测分析方法是否现行有效 */
	private int firstInstance5;
	/* 极端数据是否符合逻辑 */
	private int firstInstance6;
	/* 标准引用和结论是否准确 */
	private int firstInstance7;
	/* 报告报表及各种记录是否齐全 */
	private int secondInstance1;
	/* 监测过程是否满足规范要求 */
	private int secondInstance2;
	/* 监测分析方法是否现行有效 */
	private int secondInstance3;
	/* 监测数据是否正常 */
	private int secondInstance4;
	/* 监测报告是否满足时效性要求 */
	private int secondInstance5;
	/* 标准引用和结论是否准确 */
	private int secondInstance6;
	/* 报告报表及各种记录是否齐全 */
	private int issueAudit1;
	/* 监测数据是否合理 */
	private int issueAudit2;
	/* 标准引用和结论是否准确 */
	private int issueAudit3;
	/* 一审其他方面 */
	private String firstOther;
	/* 二审其他方面 */
	private String secondOhter;
	/* 签发人其他方面 */
	private String issueOther;
	/* 签发意见 */
	private int issueOpinion;
	/* 一审日期 */
	private Date firstDate;
	/* 二审日期 */
	private Date secondDate;
	/* 签发日期 */
	private Date issueDate;
	/* 一审员 */
	private User firstUser;
	/* 二审员 */
	private User secondUser;
	/* 签发员 */
	private User issueUser;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
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

	public int getFirstInstance7() {
		return firstInstance7;
	}

	public void setFirstInstance7(int firstInstance7) {
		this.firstInstance7 = firstInstance7;
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

	public int getIssueAudit1() {
		return issueAudit1;
	}

	public void setIssueAudit1(int issueAudit1) {
		this.issueAudit1 = issueAudit1;
	}

	public int getIssueAudit2() {
		return issueAudit2;
	}

	public void setIssueAudit2(int issueAudit2) {
		this.issueAudit2 = issueAudit2;
	}

	public int getIssueAudit3() {
		return issueAudit3;
	}

	public void setIssueAudit3(int issueAudit3) {
		this.issueAudit3 = issueAudit3;
	}

	public String getFirstOther() {
		return firstOther;
	}

	public void setFirstOther(String firstOther) {
		this.firstOther = firstOther;
	}

	public String getSecondOhter() {
		return secondOhter;
	}

	public void setSecondOhter(String secondOhter) {
		this.secondOhter = secondOhter;
	}

	public String getIssueOther() {
		return issueOther;
	}

	public void setIssueOther(String issueOther) {
		this.issueOther = issueOther;
	}

	public int getIssueOpinion() {
		return issueOpinion;
	}

	public void setIssueOpinion(int issueOpinion) {
		this.issueOpinion = issueOpinion;
	}

	public Date getFirstDate() {
		return firstDate;
	}

	public void setFirstDate(Date firstDate) {
		this.firstDate = firstDate;
	}

	public Date getSecondDate() {
		return secondDate;
	}

	public void setSecondDate(Date secondDate) {
		this.secondDate = secondDate;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	public User getFirstUser() {
		return firstUser;
	}

	public void setFirstUser(User firstUser) {
		this.firstUser = firstUser;
	}

	public User getSecondUser() {
		return secondUser;
	}

	public void setSecondUser(User secondUser) {
		this.secondUser = secondUser;
	}

	public User getIssueUser() {
		return issueUser;
	}

	public void setIssueUser(User issueUser) {
		this.issueUser = issueUser;
	}

	@Override
	public String toString() {
		return "ReportAudit [id=" + id + ", report=" + report
				+ ", firstInstance1=" + firstInstance1 + ", firstInstance2="
				+ firstInstance2 + ", firstInstance3=" + firstInstance3
				+ ", firstInstance4=" + firstInstance4 + ", firstInstance5="
				+ firstInstance5 + ", firstInstance6=" + firstInstance6
				+ ", firstInstance7=" + firstInstance7 + ", secondInstance1="
				+ secondInstance1 + ", secondInstance2=" + secondInstance2
				+ ", secondInstance3=" + secondInstance3 + ", secondInstance4="
				+ secondInstance4 + ", secondInstance5=" + secondInstance5
				+ ", secondInstance6=" + secondInstance6 + ", issueAudit1="
				+ issueAudit1 + ", issueAudit2=" + issueAudit2
				+ ", issueAudit3=" + issueAudit3 + ", firstOther=" + firstOther
				+ ", secondOhter=" + secondOhter + ", issueOther=" + issueOther
				+ ", issueOpinion=" + issueOpinion + ", firstDate=" + firstDate
				+ ", secondDate=" + secondDate + ", issueDate=" + issueDate
				+ ", firstUser=" + firstUser + ", secondUser=" + secondUser
				+ ", issueUser=" + issueUser + "]";
	}

}
