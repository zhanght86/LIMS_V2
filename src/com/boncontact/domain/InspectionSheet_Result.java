package com.boncontact.domain;

import java.util.Date;

public class InspectionSheet_Result {
	/* 编号 */
	private Long id;
	/* 非样品信息 */
	private SelfSendSampleInfo sampleInfo;
	/* 自送样样品信息 */
	private NonSelfSendSample NonSelfSampleInfo;
	/*flag:标记当前是否已经填写过*/
	private Date saveDate;
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public SelfSendSampleInfo getSampleInfo() {
		return sampleInfo;
	}

	public void setSampleInfo(SelfSendSampleInfo sampleInfo) {
		this.sampleInfo = sampleInfo;
	}

	public NonSelfSendSample getNonSelfSampleInfo() {
		return NonSelfSampleInfo;
	}

	public void setNonSelfSampleInfo(NonSelfSendSample nonSelfSampleInfo) {
		NonSelfSampleInfo = nonSelfSampleInfo;
	}
	

	public Date getSaveDate() {
		return saveDate;
	}

	public void setSaveDate(Date saveDate) {
		this.saveDate = saveDate;
	}

	@Override
	public String toString() {
		return "InspectionSheet_Result [id=" + id + ", sampleInfo="
				+ sampleInfo + ", NonSelfSampleInfo=" + NonSelfSampleInfo
				+ ", saveDate=" + saveDate + "]";
	}


}
