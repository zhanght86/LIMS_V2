<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page
	import="com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*,javax.servlet.*,javax.servlet.http.*,java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<%
	/* Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");//载入驱动程序类别
	String strUrl = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="
			+ this.getServletContext().getRealPath("demodata/")
			+ "\\demo.mdb";
	Connection conn = DriverManager.getConnection(strUrl);
	Statement stmt = conn.createStatement();
	String id = request.getParameter("ID");
	ResultSet rs = stmt.executeQuery("select * from resumes where ID = " + id); */
	
	SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");

	//-----------  PageOffice 服务器端编程开始  -------------------//
	WordDocument doc = new WordDocument();
	DataRegion dataReg = doc.openDataRegion("PO_table");
	//dataReg.setEditing(true);
	Table table = dataReg.openTable(1);
	/* if (rs.next()) {

		table.openCellRC(1, 2).setValue(rs.getString("Name"));
		table.openCellRC(1, 4).setValue(formatDate.format(formatDate.parse(rs.getString("BirthDate"))));
		String photoUrl = rs.getString("PhotoUrl");
		if (photoUrl != null && photoUrl != "") {
			//显示图片
			table.openCellRC(1, 5).setValue("[image]" + photoUrl + "[/image]");
		}
		table.openCellRC(2, 2).setValue(rs.getString("Sex"));
		table.openCellRC(2, 4).setValue(rs.getString("EduGrade"));
		table.openCellRC(3, 2).setValue(rs.getString("Profession"));
		table.openCellRC(3, 4).setValue(rs.getString("Job"));
		table.openCellRC(4, 2).setValue(rs.getString("Experience"));
		table.openCellRC(5, 2).setValue(rs.getString("PersonalAbility"));
		table.openCellRC(6, 3).setValue(rs.getString("Address"));
		table.openCellRC(7, 3).setValue(rs.getString("Email"));
		table.openCellRC(8, 3).setValue(rs.getString("Phone"));
	}
	rs.close();
	stmt.close();
	conn.close(); */
	table.openCellRC(1, 2).setValue("张三");
	table.openCellRC(1, 4).setValue(formatDate.format(new Date()));
	String photoUrl = "images/backup.jpg";
	if (photoUrl != null && photoUrl != "") {
		//显示图片
		table.openCellRC(1, 5).setValue("[image]" + photoUrl + "[/image]");
	}
	table.openCellRC(2, 2).setValue("男");
	table.openCellRC(2, 4).setValue("大学本科");
	table.openCellRC(3, 2).setValue("Profession");
	table.openCellRC(3, 4).setValue("JOB");
	table.openCellRC(4, 2).setValue("Experience");
	table.openCellRC(5, 2).setValue("PersonalAbility");
	table.openCellRC(6, 3).setValue("Address");
	table.openCellRC(7, 3).setValue("Email");
	table.openCellRC(8, 3).setValue("Phone");
	

	// 设置PageOffice组件服务页面

	PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
	poCtrl1.setServerPage("poserver.do"); //此行必须

	// 添加自定义工具条按钮
	poCtrl1.addCustomToolButton("保存", "Save()", 1);
	//隐藏工具栏
	poCtrl1.setMenubar(false);

	// 设置保存文档的服务器页面
	poCtrl1.setSaveDataPage("savefile.jsp");
	////获取数据对象
	poCtrl1.setWriter(doc);
	// 打开文档
	poCtrl1.webOpen("doc/test2.doc", OpenModeType.docNormalEdit, "Tom");
	poCtrl1.setTagId("PageOfficeCtrl1"); //此行必须
	//-----------  PageOffice 服务器端编程结束  -------------------//
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<title></title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema"
			content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="form1" method="post">

			<!-- *********************pageoffice组件的使用 **************************-->
			<script type="text/javascript">
				//保存
				function Save() {
					 document.getElementById("PageOfficeCtrl1").WebSave();
			         if (document.getElementById("PageOfficeCtrl1").CustomSaveResult == "ok") {
			         	alert('保存成功');
			         }
				}
			</script>
			<po:PageOfficeCtrl id="PageOfficeCtrl1" />
			<!-- *********************pageoffice组件的使用 **************************-->

		</form>
	</body>
</HTML>
