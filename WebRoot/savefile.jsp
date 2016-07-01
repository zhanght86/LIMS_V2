<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.zhuozhengsoft.pageoffice.*"%>
<%
	int id=0;
	String dir="";
	FileSaver fs = new FileSaver(request, response);
	if (request.getParameter("id") != null
			&& request.getParameter("id").trim().length() > 0)
		id = Integer.parseInt(request.getParameter("id").trim());
	if(id==1){
		dir = "originalRecordSave";
	}
	if(id==2){
		dir="reportSave";
	}
	String fileName=request.getParameter("title")!=null?request.getParameter("title"):"unknow File";
	String path = request.getSession().getServletContext()
			.getRealPath("/")
			+ dir;
	//String fileName = fs.getFileName();
	File file = new File(path);
	if (!file.exists() && !file.isDirectory()) {
		file.mkdirs();
	}
	fs.saveToFile(path + "\\" + fileName);
	fs.setCustomSaveResult(dir + "/" + fileName);
	fs.close();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>SaveFile</title>
</head>
<body>
	<h2>
		<font color=red><s:property value="message" /></font>
	</h2>
</body>
</html>
