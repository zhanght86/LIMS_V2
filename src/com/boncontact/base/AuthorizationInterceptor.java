package com.boncontact.base;

import java.io.PrintWriter;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.boncontact.domain.Power;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class AuthorizationInterceptor extends MethodFilterInterceptor {

	private static final long serialVersionUID = 6813447438168027416L;
	private static final String[] powerList = { "mainPage_main",
			"notice_notice_main", "commonTemplet_commonTemplet_main",
			"feedBack_feedBack_addPage", "performance_performance_main",
			"sampleTransfer_sampleTransfer_main",
			"taskDistribution_taskDistribution_main",
			"detectionResult_detectionResult_main",
			"resultReview_resultReview_main", "resultAudit_resultAudit_main",
			"report_report_main", "reportAudit_reportAudit_main",
			"reportIssued_reportIssued_main",
			"reportReceipt_reportReceipt_main",
			"qualityControl_qualityControl_main",
			"resultAuditSecond_resultAuditSecond_main",
			"reportAuditSecond_reportAuditSecond_main",
			"contractManage_contractList_main.action",
			"contractManage_contractList_contractSList",
			"contractManage_contract_addPage",
			"contractManage_contractChange_main",
			"contractManage_contractAudit_main",
			"contractManage_projectPlan_main",
			"selfSendSampleInfo_selfSendSampleInfo_main",
			"nonSelfSendSample_nonSelfSendSample_main",
			"userPWDManage_userPWD_main", "departmentManage_department_main",
			"roleManage_role_main", "userManage_user_main",
			"noticeManage_noticeManage_main",
			"analysisProject_analysisProject_main",
			"basicSetting_basicSetting_main" };

	@Override
	@SuppressWarnings("unchecked")
	public String doIntercept(ActionInvocation invocation) throws Exception {
		Map session = invocation.getInvocationContext().getSession();
		Long userId = (Long) session.get("userId");
		// 获取Action名称
		String actionName = invocation.getInvocationContext().getName();
		// 获取Action后面带的参数
		Map parameters = invocation.getInvocationContext().getParameters();
		System.out.println(actionName);
		Set<Power> powerSet = (Set<Power>) session.get("powerList");
		if (userId != null) {
			int flag = 0;
			int flag2 = 0;
			for (String powerString : powerList) {
				if (powerString.equals(actionName)) {
					flag2 = 1;
				}
			}
			for (Power power : powerSet) {
				if (flag2 == 1 && (power.getPowerAction().equals(actionName))) {
					flag = 1;
					break;
				}
			}
			if (flag2 == 0 || flag == 1) {
				invocation.invoke();
			} else {
				return "limitPower";
			}
		} else {
			HttpServletResponse response = ServletActionContext.getResponse();
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<script type='text/javascript'>");
			out.println("window.open ('mainPage_login.action','_top')");
			out.println("</script>");
			out.println("</html>");
		}
		return null;
	}
}
