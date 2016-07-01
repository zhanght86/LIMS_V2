package com.boncontact.util;

public class ContractWork {
	//合同编号
	private String contractIdentify;
	//报告编号
	private String reportId;
	//委托单位
	private String client;
	//监测项目
	private String items;
	//地址
	private String address;
	//委托人
	private String people;
	//电话
	private String tel;
	//合同时间
	private String time;
	//费用
	private String pay;
	public String getContractIdentify() {
		return contractIdentify;
	}
	public void setContractIdentify(String contractIdentify) {
		this.contractIdentify = contractIdentify;
	}
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	@Override
	public String toString() {
		return "ContractWork [contractIdentify=" + contractIdentify
				+ ", reportId=" + reportId + ", client=" + client + ", items="
				+ items + ", address=" + address + ", people=" + people
				+ ", tel=" + tel + ", time=" + time + ", pay=" + pay + "]";
	}
	
	
}
