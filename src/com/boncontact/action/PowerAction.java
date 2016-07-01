package com.boncontact.action;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.boncontact.base.BaseAction;
import com.boncontact.domain.Power;
import com.boncontact.domain.Role;
import com.boncontact.util.StringSplitUtils;
import com.boncontact.util.XMLOption;

@Component("power")
public class PowerAction extends BaseAction<Power> {
	private static final long serialVersionUID = 7953634082839580940L;
	private String ids;
	/* 用于存放JSON生成后的字符串结果 */
	private String jsonResult;
	private Long viewId;

	public String main() {
		return "main";
	}

	public String powerGiven() {
		try {
			String[] idList = StringSplitUtils.splite(ids, ",");
			Set<Power> powerSet = new LinkedHashSet<>();
			for (String string : idList) {
				if (string.length() == 2) {
					Power pw = powerService.getByIndetify(string);
					powerSet.add(pw);
				}
			}
			Role role = roleService.getById(viewId);
			if (role.getPowers().size() != 0) {
				role.setPowers(null);
				roleService.update(role);
			}
			role.setPowers(powerSet);
			roleService.update(role);
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			jsonResult = "{'info':'failed'}";
			System.out.println(e.toString());
		}
		return SUCCESS;
	}

	public String powerInit() {
		try {
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
			jsonResult = "{'info':'success'}";
		} catch (Exception e) {
			System.out.println(e.toString());
			jsonResult = "{'info':'failed'}";
		}
		return SUCCESS;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(String jsonResult) {
		this.jsonResult = jsonResult;
	}

	public Long getViewId() {
		return viewId;
	}

	public void setViewId(Long viewId) {
		this.viewId = viewId;
	}

}
