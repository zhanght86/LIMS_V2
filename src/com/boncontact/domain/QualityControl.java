package com.boncontact.domain;

import java.util.Date;

/**
 * 质量统计
 * 
 * @author 瞿龙俊
 * 
 */
public class QualityControl {
	private Long id;
	/* 分析项目名称 */
	private AnalysisProject analysisProject;
	/* 样品数 */
	private int SampleNum;
	/* 现场平行样 */
	private int parallelSample;
	/* 实验室平行样个数 */
	private int laboratorySampleNum;
	/* 实验室平行样样品编号 */
	private SelfSendSampleInfo laboratorySample;
	/* 实验室平行样样品编号-非自送样 */
	private NonSelfSendSample nonLaboratorySample;
	/* 加标回收样 */
	private int spikedRecoverySampleNum;
	/* 加标回收样样品编号 */
	private SelfSendSampleInfo spikedRecoverySample;
	/* 加标回收样样品编号-非自送样 */
	private NonSelfSendSample nonSpikedRecoverySample;
	
	/*实验室平行样样品编号*/
	private String laboratorySampleIdentifys;
	/*加标回收样*/
	private String spikedSampleIdentifys;
	/* 盲样 */
	private int blindSample;
	/*制表人*/
	private User createUser;
	/*时间*/
	private Date createDate;
	/* 项目名称 */
	private Project project;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public AnalysisProject getAnalysisProject() {
		return analysisProject;
	}

	public void setAnalysisProject(AnalysisProject analysisProject) {
		this.analysisProject = analysisProject;
	}

	public int getSampleNum() {
		return SampleNum;
	}

	public void setSampleNum(int sampleNum) {
		SampleNum = sampleNum;
	}

	public int getParallelSample() {
		return parallelSample;
	}

	public void setParallelSample(int parallelSample) {
		this.parallelSample = parallelSample;
	}

	public int getLaboratorySampleNum() {
		return laboratorySampleNum;
	}

	public void setLaboratorySampleNum(int laboratorySampleNum) {
		this.laboratorySampleNum = laboratorySampleNum;
	}

	public SelfSendSampleInfo getLaboratorySample() {
		return laboratorySample;
	}

	public void setLaboratorySample(SelfSendSampleInfo laboratorySample) {
		this.laboratorySample = laboratorySample;
	}

	public int getSpikedRecoverySampleNum() {
		return spikedRecoverySampleNum;
	}

	public void setSpikedRecoverySampleNum(int spikedRecoverySampleNum) {
		this.spikedRecoverySampleNum = spikedRecoverySampleNum;
	}

	public SelfSendSampleInfo getSpikedRecoverySample() {
		return spikedRecoverySample;
	}

	public void setSpikedRecoverySample(SelfSendSampleInfo spikedRecoverySample) {
		this.spikedRecoverySample = spikedRecoverySample;
	}

	public int getBlindSample() {
		return blindSample;
	}

	public void setBlindSample(int blindSample) {
		this.blindSample = blindSample;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}
	

	public NonSelfSendSample getNonLaboratorySample() {
		return nonLaboratorySample;
	}

	public void setNonLaboratorySample(NonSelfSendSample nonLaboratorySample) {
		this.nonLaboratorySample = nonLaboratorySample;
	}

	public NonSelfSendSample getNonSpikedRecoverySample() {
		return nonSpikedRecoverySample;
	}

	public void setNonSpikedRecoverySample(NonSelfSendSample nonSpikedRecoverySample) {
		this.nonSpikedRecoverySample = nonSpikedRecoverySample;
	}

	public String getLaboratorySampleIdentifys() {
		return laboratorySampleIdentifys;
	}

	public void setLaboratorySampleIdentifys(String laboratorySampleIdentifys) {
		this.laboratorySampleIdentifys = laboratorySampleIdentifys;
	}

	public String getSpikedSampleIdentifys() {
		return spikedSampleIdentifys;
	}

	public void setSpikedSampleIdentifys(String spikedSampleIdentifys) {
		this.spikedSampleIdentifys = spikedSampleIdentifys;
	}

	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
