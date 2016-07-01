package com.boncontact.domain;

/**
 * 土壤、底质样品送检单
 * 
 * @author 瞿龙俊
 * 
 */
public class InspectionSheet_Soil extends InspectionSheet_Result {
	/* 采样断面 */
	private String samplingSection;
	/* 分析结果 */
	private double analysisResult;
	/* 备注 */
	private String remarks;

	public String getSamplingSection() {
		return samplingSection;
	}

	public void setSamplingSection(String samplingSection) {
		this.samplingSection = samplingSection;
	}

	public double getAnalysisResult() {
		return analysisResult;
	}

	public void setAnalysisResult(double analysisResult) {
		this.analysisResult = analysisResult;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	public String toString() {
		return "InspectionSheet_Soil [samplingSection=" + samplingSection
				+ ", analysisResult=" + analysisResult + ", remarks=" + remarks
				+ "]"+super.toString();
	}
	

}
