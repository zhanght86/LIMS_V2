package com.boncontact.base;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.domain.Department;
import com.boncontact.domain.Encode;
import com.boncontact.domain.Power;
import com.boncontact.domain.Role;
import com.boncontact.domain.User;
import com.boncontact.util.FileReader;
import com.boncontact.util.XMLOption;

@Component("admin_init")
public class Admin extends BaseAction<User> {

	private static final long serialVersionUID = 9092506433912812345L;

	public String init() throws Exception {
		// Power初始化
		List<Power> powerNow = powerService.findAll("");
		if (powerNow.size() != 0) {
			for (Power power : powerNow) {
				powerService.delete(power.getId());
			}
		}
		List<Power> powerList = XMLOption.readXML();
		for (Power power : powerList) {
		
			powerService.save(power);
		}
		// 管理员组
		Department department = new Department();
		department.setIdentify("BM0000");
		department.setName("管理员组");
		department.setDesp("系统管理员分组");
		departmentService.save(department);
		// 创建超级管理员角色
		Role role = new Role();
		role.setDepartment(department);
		role.setIdentify("JS0000");
		role.setName("超级管理员");
		role.setDesp("超级管理员角色");
		Set<Power> powerSet = new LinkedHashSet<Power>();
		List<Power> powerListAll = powerService.findAll("");
		powerSet.addAll(powerListAll);
		role.setPowers(powerSet);
		roleService.save(role);
		// 创建超级管理员用户
		User user = new User();
		user.setIdentify("admin");
		user.setName("admin");
		user.setRole(role);
		user.setPassword("admin");
		userService.save(user);

		Encode encode = new Encode();
		encode.setUserId(0);
		encode.setDepartment(0);
		encode.setRole(0);
		encode.setContracId(0);
		encode.setSelfSendSample(0);
		encode.setNonSelfSendSample(0);
		encode.setNonSelfSendSamplePre("A");
		encode.setAirReport(0);
		encode.setVoiceReport(0);
		encode.setWaterReport(0);
		encode.setSoilReport(0);
		encode.setSmokeReport(0);
		encode.setAnalysisType(0);
		encodeService.save(encode);
		return null;
	}
	public String originInit(){
		FileReader fr=new FileReader();
		
		return null;
	}
}
