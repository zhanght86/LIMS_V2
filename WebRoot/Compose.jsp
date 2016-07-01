<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.wordwriter.*,com.zhuozhengsoft.pageoffice.*,java.sql.*,java.text.NumberFormat,java.util.Locale,java.text.SimpleDateFormat,java.util.Date"
	pageEncoding="gb2312"%>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<%
	String err = "";
	/* String id = request.getParameter("ID").trim();
	PageOfficeCtrl poCtrl = new PageOfficeCtrl(request); */
	PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
	//创建WordDocment对象
	WordDocument doc = new WordDocument();
	//打开数据区域
	DataRegion datareg = doc.openDataRegion("PO_table");

	SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
	NumberFormat formater = NumberFormat
			.getCurrencyInstance(Locale.CHINA);

	//给数据区域赋值
	doc.openDataRegion("PO_ID").setValue("1");

	//设置数据区域的可编辑性
	doc.openDataRegion("PO_UserName").setEditing(true);
	doc.openDataRegion("PO_DeptName").setEditing(true);
	doc.openDataRegion("PO_SalTotal").setEditing(true);
	doc.openDataRegion("PO_SalDeduct").setEditing(true);
	doc.openDataRegion("PO_SalCount").setEditing(true);
	doc.openDataRegion("PO_DataTime").setEditing(true);
	doc.openDataRegion("PO_UserName").setValue("张三");
	doc.openDataRegion("PO_DeptName").setValue("管理部门");
	doc.openDataRegion("SalTotal").setValue("￥0.00");
	doc.openDataRegion("SalDeduct").setValue("￥0.00");
	doc.openDataRegion("SalCount").setValue("￥0.00");
	doc.openDataRegion("DataTime").setValue("");

	//poCtrl.addCustomToolButton("保存", "Save()", 1);
	//poCtrl.setSaveDataPage("SaveData.jsp?ID=" + id);
	poCtrl.setWriter(doc);

	poCtrl.setServerPage("poserver.do");
	poCtrl.webOpen("doc/template.doc", OpenModeType.docSubmitForm,
			"someBody");
	poCtrl.setTagId("PageOfficeCtrl1");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<script type="text/javascript">
	function Save() {
		document.getElementById("PageOfficeCtrl1").WebSave();
		//alert(document.getElementById("PageOfficeCtrl1").CustomSaveResult);
		if (document.getElementById("PageOfficeCtrl1").CustomSaveResult == "ok")//获取的是保存页面的返回值
			alert("保存成功");
		else
			alert("保存失败");
	}
</script>
</head>
<body>
	<form id="form1">
		<div style="width: auto; height: 600px;">
			<%=err%>
			<po:PageOfficeCtrl id="PageOfficeCtrl1">
			</po:PageOfficeCtrl>
		</div>
	</form>
</body>
</html>
