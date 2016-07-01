<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>原始记录管理</title>

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
<script src="js/module/originalRecord.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">系统管理</a></li>
			<li>原始记录管理</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">原始记录</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="seachform">
					<li><label>记录名称</label> <input name="" placeholder="请输入名称关键字"
						type="text" class="scinput" data-search="c.name" /></li>
					<li><label>环境要素</label>
						<div class="vocation">
							<s:select id="depSel" cssClass="select3 dfinput"
								list="#categories" listKey="id" listValue="name" headerKey="-1"
								headerValue="所有环境要素" />
						</div></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="seachBtn" value="查询" /></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="allResult" value="全部" /></li>

				</ul>
				<div class="tools">
					<ul class="toolbar">
						<li class="click" id="newTemplet"><span><img
								src="images/t01.png" /></span>新增</li>
						<li class="click" id="delMoreTemplet"><span><img
								src="images/t02.png" /></span>批量删除</li>
						<li class="click reverse" reverseTo="templetTable"><span><img
								src="images/t03.png" /></span>反向选择</li>
						<%-- <li class="click addAll" ><span><img
								src="images/t04.png" /></span>批量导入</li> --%>
					</ul>
					<ul class="toolbar1">
						<li class="help"><a href="help.html" target="_blank"><span><img
									src="images/t08.png" /></span>帮助</a></li>
					</ul>
				</div>

				<table class="tablelist" id="templetTable">
					<thead>
						<tr>
							<th style="text-align: center;"><input name=""
								type="checkbox" value="" /></th>
							<th>记录名称<i class="sort"><img
									src="images/px.gif" /></i></th>
							<th style="text-align: center;">环境要素</th>
							<th style="text-align: center;">查看</th>
							<th style="text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#record" id="re">
							<tr>
								<td style="text-align: center;"><input name="recordChoose"
									type="checkbox" value="" data-id="${re.id }" /></td>
								<td>${re.name }</td>
								<td style="text-align: center;">${re.category.name }</td>
								<td style="text-align: center;"><a href="javascript:;"
									class="tablelink viewRecord" data-id="${re.id }">查看</a></td>
								<td style="text-align: center;"><a href="javascript:;"
									class="tablelink delRecord" data-id="${re.id }">删除</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>

				<div class="pagin">
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
