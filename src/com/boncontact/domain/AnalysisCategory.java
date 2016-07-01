package com.boncontact.domain;

public class AnalysisCategory {
	/*编号*/
	private Long id;
	/*环境元素名称*/
	private String name;
	/*其他*/
	private String other;
	/*交联单类型：1：水和废水。2：空气和废气，3：土壤*/
	private int deliveryReceitp;
	/*送检单类型 1:水质样品送检单,2:环境空气和无组织废气,3:土壤、底质样品,4:固定污染源有组织废气*/
	private int inspectionSheet;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	
	public int getDeliveryReceitp() {
		return deliveryReceitp;
	}
	public void setDeliveryReceitp(int deliveryReceitp) {
		this.deliveryReceitp = deliveryReceitp;
	}
	public int getInspectionSheet() {
		return inspectionSheet;
	}
	public void setInspectionSheet(int inspectionSheet) {
		this.inspectionSheet = inspectionSheet;
	}
	@Override
	public String toString() {
		return "AnalysisCategory [id=" + id + ", name=" + name + ", other="
				+ other + "]";
	}
	
}
