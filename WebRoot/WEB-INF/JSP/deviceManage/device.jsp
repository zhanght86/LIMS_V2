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
<title>设备管理</title>
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
<script src="js/module/deviceManage.js" type="text/javascript"
	charset="utf-8"></script>

</head>


<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">库存管理</a></li>
			<li>设备管理</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1">设备管理</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">

				<ul class="seachform">
					<li><label>设备编号</label> <input name="" placeholder="请输入设备编号"
						type="text" class="scinput" data-search='identify' /></li>
					<li><label>设备名称</label> <input name="" placeholder="请输入设备名称"
						type="text" class="scinput" data-search='name' /></li> 
					<li><label>设备管理员编号</label> <input name="" placeholder="请输入用户编号"
						type="text" class="scinput" data-search='admin' id="searchAdmin"/></li>
					<li><label>供应商</label>
					<input name="" placeholder="请选择供应商"
						type="text" class="scinput" data-search='supplier' id="searchCustomer"/>
						</li>
						<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" value="查询" id="seachBtn" /></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" value="全部" id="allResult" /></li>
				</ul>
				
				
				
				<div class="tools">
					<ul class="toolbar">
						<li class="click" id="newDevice"><span><img
								src="images/t01.png" /></span>新增</li>
						<li class="click" id="delMoreDevice"><span><img
								src="images/t02.png" /></span>批量删除</li>
						<li class="reverse" reverseTo="userTable"><span><img
								src="images/t03.png" /></span>反向选择</li>
						<li class="export"><span><img src="images/t04.png" /></span>数据导出</li>
					</ul>
					<ul class="toolbar1">
						<li class="help"><a href="help.html" target="_blank"><span><img
									src="images/t08.png" /></span>帮助</a></li>
					</ul>
				</div>
				<table class="tablelist" id="userTable">
					<thead>
						<tr>
							<th><input name="" type="checkbox" value="" /></th>
							<th>设备编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>设备名称</th>
							<th>管理员</th>
							<th>供应商</th>
							<th>购买时间</th>
							<th>文档保管员</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#deviceList" id="d">
							<tr>
								<td><input name="" type="checkbox" data-num="${d.id}"
									value="" /></td>
								<td>${d.identify }</td>
								<td>${d.name }</td>
								<td>${d.admin.name }</td>
								<td>${d.supplier.name }</td>
								<td>${d.timeBuying }</td>
								<td>${d.custodian.name }</td>
								<td><a href="javascript:;"
									class="tablelink usAgeRecord" data-num="${d.id }"> 使用记录 </a> <a href="javascript:;" class="tablelink viewDevice"
									data-num="${d.id }">查看详情</a> <a href="javascript:;"
									class="tablelink changeDevice" data-num="${d.id }">修改</a> <a
									href="javascript:;" class="tablelink delDevice"
									data-num="${d.id }"> 删除</a></td>
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
