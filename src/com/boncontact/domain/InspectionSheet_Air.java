package com.boncontact.domain;

/**
 * 环境空气和无组织废气样品送检单
 * 
 * @author 瞿龙俊
 * 
 */
public class InspectionSheet_Air extends InspectionSheet_Result {
	/* 分析结果 */
	private double analysisResult;
	/* 标况体积 */
	private double standardVolume;
	/* 浓度 */
	private double concentration;

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

	@Override
	public String toString() {
		return "InspectionSheet_Air [analysisResult=" + analysisResult
				+ ", standardVolume=" + standardVolume + ", concentration="
				+ concentration + "]"+super.toString();
	}

}
