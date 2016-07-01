package com.boncontact.action;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.DatabaseSetting;
import com.boncontact.util.PropertiesConfig;
import com.opensymphony.xwork2.ActionContext;

/**
 * @author 瞿龙俊
 * 
 */
@Component("basicSetting")
public class BasicSettingAction extends BaseAction<DatabaseSetting> {
	private static final long serialVersionUID = 7688237994850004158L;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private DatabaseSetting entity;
	private String type;
	private String prefix;

	public String main() {
		try {
			ActionContext.getContext()
					.put("role",
							PropertiesConfig.readData("/identifier.properties",
									"role"));
			ActionContext.getContext()
					.put("user",
							PropertiesConfig.readData("/identifier.properties",
									"user"));
			ActionContext.getContext().put(
					"customer",
					PropertiesConfig.readData("/identifier.properties",
							"customer"));
			ActionContext.getContext().put(
					"department",
					PropertiesConfig.readData("/identifier.properties",
							"department"));
			ActionContext.getContext().put(
					"analysisType",
					PropertiesConfig.readData("/identifier.properties",
							"analysisType"));
			ActionContext.getContext().put("roleList", roleService.findAll(""));
			ActionContext.getContext().put("departmentList",
					departmentService.findAll(""));
			ActionContext.getContext().put("rows",
					PropertiesConfig.readData("/identifier.properties", "rows"));
			ActionContext.getContext().put(
					"initPassword",
					PropertiesConfig.readData("/identifier.properties",
							"initPassword"));
			ActionContext.getContext().put(
					"contractAuditRole",
					PropertiesConfig.readData("/setting.properties",
							"contractAuditRole"));
			ActionContext.getContext().put("syfxs",
					PropertiesConfig.readData("/setting.properties", "syfxs"));
			ActionContext.getContext().put("xcjcs",
					PropertiesConfig.readData("/setting.properties", "xcjcs"));
			ActionContext.getContext().put("syfxy",
					PropertiesConfig.readData("/setting.properties", "syfxy"));
			ActionContext.getContext().put(
					"contractNum",
					PropertiesConfig.readData("/identifier.properties",
							"contractNum"));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "main";
	}

	public String dataBaseSetting() {
		return "dataBaseSetting";
	}

	public String dataBaseOpt() {
		try {
			PropertiesConfig.writeData("/jdbc.properties", "driverClass",
					entity.getDriverClass());
			PropertiesConfig.writeData("/jdbc.properties", "user",
					entity.getUser());
			PropertiesConfig.writeData("/jdbc.properties", "password",
					entity.getPassword());
			PropertiesConfig.writeData("/jdbc.properties", "jdbcUrl",
					"jdbc:mysql://localhost:3306/" + entity.getName()
							+ "?useUnicode=true&characterEncoding=utf8");
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String prefixSetting() {
		try {
			PropertiesConfig.writeData("/identifier.properties", type, prefix);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String infoSetting() {
		try {
			PropertiesConfig.writeData("/setting.properties", type, prefix);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	@Override
	public DatabaseSetting getModel() {
		if (entity == null) {
			entity = new DatabaseSetting();
		}
		return entity;
	}

}
