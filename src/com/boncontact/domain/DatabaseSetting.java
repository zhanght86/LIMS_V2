package com.boncontact.domain;

public class DatabaseSetting {
	/*数据库类型*/
	private String databaseType;
	/* 数据库名称 */
	private String name;
	/* 用户名 */
	private String user;
	/* 密码 */
	private String password;
	/* 数据库驱动 */
	private String driverClass;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDriverClass() {
		return driverClass;
	}

	public void setDriverClass(String driverClass) {
		this.driverClass = driverClass;
	}
	

	public String getDatabaseType() {
		return databaseType;
	}

	public void setDatabaseType(String databaseType) {
		this.databaseType = databaseType;
	}

	@Override
	public String toString() {
		return "DatabaseSetting [databaseType=" + databaseType + ", name="
				+ name + ", user=" + user + ", password=" + password
				+ ", driverClass=" + driverClass + "]";
	}

	
	
}
