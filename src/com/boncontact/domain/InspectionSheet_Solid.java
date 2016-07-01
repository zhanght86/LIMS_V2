package com.boncontact.domain;

/**
 * 固定污染源有组织废气样品送检单
 * 
 * @author 瞿龙俊
 * 
 */
public class InspectionSheet_Solid extends InspectionSheet_Result {

	/* 分析结果 */
	private double analysisResult;
	/* 标况体积 */
	private double standardVolume;
	/* 浓度 */
	private double concentration;
	/* 标干流量 */
	private double standardDryFlow;
	/* 排放量 */
	private double discharge;

	public double getAnalysisResult() {
		return analysisResult;
	}

	public void setAnalysisResult(double analysisResult) {
		this.analysisResult = analysisResult;
	}

	public double getStandardVolume() {
		return standardVolume;
	}

	public void setStandardVolume(double standardVolume) {
		this.standardVolume = standardVolume;
	}

	public double getConcentration() {
		return concentration;
	}

	public void setConcentration(double concentration) {
		this.concentration = concentration;
	}

	public double getStandardDryFlow() {
		return standardDryFlow;
	}

	public void setStandardDryFlow(double standardDryFlow) {
		this.standardDryFlow = standardDryFlow;
	}

	public double getDischarge() {
		return discharge;
	}

	public void setDischarge(double discharge) {
		this.discharge = discharge;
	}

	@Override
	public String toString() {
		return "InspectionSheet_Solid [analysisResult=" + analysisResult
				+ ", standardVolume=" + standardVolume + ", concentration="
				+ concentration + ", standardDryFlow=" + standardDryFlow
				+ ", discharge=" + discharge + "]"+super.toString();
	}

}
