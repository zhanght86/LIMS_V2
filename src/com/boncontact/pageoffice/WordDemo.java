package com.boncontact.pageoffice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.*;
import com.opensymphony.xwork2.ActionSupport;
import com.zhuozhengsoft.pageoffice.*;

public class WordDemo extends ActionSupport implements ServletRequestAware, ServletResponseAware{ 

    private static final long serialVersionUID = -758686623642845302L;
    private HttpServletRequest request;
    private HttpServletResponse response; 
    private String message = "";
    
    public void setServletRequest(HttpServletRequest request) { 
        this.request = request; 
    }
    public void setServletResponse(HttpServletResponse response) { 
        this.response = response; 
    }
    
    public String getMessage(){
    	return message;
    }

    public String openword() throws Exception {
    	PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(ServletActionContext.getRequest());
    	poCtrl1.setServerPage("poserver.do"); //此行必须
    	// Create custom toolbar
    	poCtrl1.addCustomToolButton("保存", "SaveDocument()", 1);
    	poCtrl1.addCustomToolButton("-", "", 0);
    	poCtrl1.addCustomToolButton("打印", "ShowPrintDlg()", 6);
    	poCtrl1.addCustomToolButton("-", "", 0);
    	poCtrl1.addCustomToolButton("全屏切换", "SetFullScreen()", 4);
    	poCtrl1.addCustomToolButton("-", "", 0);
    	poCtrl1.addCustomToolButton("加盖印章", "AddSeal()", 5);
    	poCtrl1.addCustomToolButton("手写签批", "AddHandSign()", 5);
    	poCtrl1.addCustomToolButton("验证印章", "VerifySeal()", 5);
    	poCtrl1.setSaveFilePage("saveword.action");
    	poCtrl1.webOpen("doc/test.doc", OpenModeType.docNormalEdit, "张三");
    	poCtrl1.setTagId("PageOfficeCtrl1"); //此行必须
    	return "openword_"+SUCCESS;
    }
    
    public String saveword() throws Exception {
    	FileSaver fs = new FileSaver(request, response);
    	request.setAttribute("FileSaver", fs);
    	fs.saveToFile(request.getSession().getServletContext().getRealPath("doc/") + "/" + fs.getFileName());
    	fs.showPage(300, 300);
    	message = "显示自定义保存结果。";
    	return "saveword_"+SUCCESS;
    }

}