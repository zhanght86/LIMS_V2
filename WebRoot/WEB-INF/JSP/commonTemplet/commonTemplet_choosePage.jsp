<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>角色管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="css/My97DatePicker/WdatePicker.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/paging-V1.3-final.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.form.js" charset="utf-8"></script>
<script src="js/module/commonTemplet.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/ajaxfileupload.js" charset="utf-8"></script>

</head>

<body style="width: 800px;overflow-x:hidden; ">	
	<div class="formbody">
		<div id="usual1" class="usual" style="width: 800px">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">模板库</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				 <table class="tablelist" id="templetTable" style="width: 800px">
					<thead>
						<tr>
							<th>记录表编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>程序文件</th>
							<th>记录表名称</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#commonTempletList" id="c">
							<tr>
								<td>${c.identify}</td>
								<td>${c.filesId}</td>
								<td>${c.name}</td>
								<td><a href="javascript:;" data-search="${c.id }" class="tablelink download">下载</a>
								</td> 
							</tr>
						</s:iterator>
					</tbody>
				</table> 
				
				<div class="pagin" style="width: 800px">
					<div class="message">
						共<i class="blue">${totalRecord}</i>条记录，当前显示第&nbsp;<i
							class="blue countPage">1&nbsp;</i>/<i class="blue" id="totalPage">${totalPage
							}</i>页
					</div>
					<div class="page" id="page1"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
