package com.boncontact.domain;

/**
 * 库存品类实体
 * 
 * @author 瞿龙俊
 * 
 */
public class Inventory {
	// 主键
	private Long id;
	// 业务主键
	private String identify;
	// 商品名称
	private String name;
	// 商品规格
	private String standard;
	// 商品单位
	private String unit;
	// 商品单价
	private double price;
	// 商品分类
	private String type;
	// 商品下限值
	private double lowerValue;
	// 商品数量
	private double amount;
	// 注意事项
	private String attention;
	// 库存环境要求
	private String envirRequire;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getLowerValue() {
		return lowerValue;
	}

	public void setLowerValue(double lowerValue) {
		this.lowerValue = lowerValue;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getAttention() {
		return attention;
	}

	public void setAttention(String attention) {
		this.attention = attention;
	}

	public String getEnvirRequire() {
		return envirRequire;
	}

	public void setEnvirRequire(String envirRequire) {
		this.envirRequire = envirRequire;
	}



}
