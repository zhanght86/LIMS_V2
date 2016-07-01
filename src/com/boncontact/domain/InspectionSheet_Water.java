package com.boncontact.domain;

/**
 * 水质样品送检单
 * 
 * @author 瞿龙俊
 * 
 */
public class InspectionSheet_Water extends InspectionSheet_Result {
	/* 样品性质 */
	private String sampleProperties;
	/* 分析结果 */
	private double analysisResult;
	public String getSampleProperties() {
		return sampleProperties;
	}

	public void setSampleProperties(String sampleProperties) {
		this.sampleProperties = sampleProperties;
	}

	public double getAnalysisResult() {
		return analysisResult;
	}

	public void setAnalysisResult(double analysisResult) {
		this.analysisResult = analysisResult;
	}

	@Override
	public String toString() {
		return "InspectionSheet_Water [sampleProperties=" + sampleProperties
				+ ", analysisResult=" + analysisResult + "]"+super.toString();
	}

}
