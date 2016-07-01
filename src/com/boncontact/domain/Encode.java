package com.boncontact.domain;

/**
 * 编码表
 * 
 * @author 瞿龙俊
 * 
 */
public class Encode {
	private Long id;
	/*用户Id*/
	private int userId;
	private int department;
	private int role;
	/* 合同编号 */
	private int contracId;
	/* 自送样编号 */
	private int selfSendSample;
	/* 非自送样编号前缀 */
	private String nonSelfSendSamplePre;
	/* 非自送样编号 */
	private int nonSelfSendSample;
	/* 气 监测报告 */
	private int airReport;
	/* 声 监测报告 */
	private int voiceReport;
	/* 水 监测报告 */
	private int waterReport;
	/* 土壤 监测报告 */
	private int soilReport;
	/* 烟 监测报告 */
	private int smokeReport;
	/*检测分类*/
	private int analysisType;
	
	
	private int YS;
	private int HP;
	private int WT;
	private int ZF;
	private int LX;
	private int YJ;
	private int JD;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getContracId() {
		return contracId;
	}

	public void setContracId(int contracId) {
		this.contracId = contracId;
	}

	public int getSelfSendSample() {
		return selfSendSample;
	}

	public void setSelfSendSample(int selfSendSample) {
		this.selfSendSample = selfSendSample;
	}

	public int getAirReport() {
		return airReport;
	}

	public void setAirReport(int airReport) {
		this.airReport = airReport;
	}

	public int getVoiceReport() {
		return voiceReport;
	}

	public void setVoiceReport(int voiceReport) {
		this.voiceReport = voiceReport;
	}

	public int getWaterReport() {
		return waterReport;
	}

	public void setWaterReport(int waterReport) {
		this.waterReport = waterReport;
	}

	public int getSoilReport() {
		return soilReport;
	}

	public void setSoilReport(int soilReport) {
		this.soilReport = soilReport;
	}

	public int getSmokeReport() {
		return smokeReport;
	}

	public void setSmokeReport(int smokeReport) {
		this.smokeReport = smokeReport;
	}

	public String getNonSelfSendSamplePre() {
		return nonSelfSendSamplePre;
	}

	public void setNonSelfSendSamplePre(String nonSelfSendSamplePre) {
		this.nonSelfSendSamplePre = nonSelfSendSamplePre;
	}

	public int getNonSelfSendSample() {
		return nonSelfSendSample;
	}

	public void setNonSelfSendSample(int nonSelfSendSample) {
		this.nonSelfSendSample = nonSelfSendSample;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getDepartment() {
		return department;
	}

	public void setDepartment(int department) {
		this.department = department;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public int getAnalysisType() {
		return analysisType;
	}

	public void setAnalysisType(int analysisType) {
		this.analysisType = analysisType;
	}

	public int getYS() {
		return YS;
	}

	public void setYS(int yS) {
		YS = yS;
	}

	public int getHP() {
		return HP;
	}

	public void setHP(int hP) {
		HP = hP;
	}

	public int getWT() {
		return WT;
	}

	public void setWT(int wT) {
		WT = wT;
	}

	public int getZF() {
		return ZF;
	}

	public void setZF(int zF) {
		ZF = zF;
	}

	public int getLX() {
		return LX;
	}

	public void setLX(int lX) {
		LX = lX;
	}

	public int getYJ() {
		return YJ;
	}

	public void setYJ(int yJ) {
		YJ = yJ;
	}

	public int getJD() {
		return JD;
	}

	public void setJD(int jD) {
		JD = jD;
	}
	
	
	

}
