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
<title>库存品类清单</title>
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
<script src="js/module/inventoryManage.js" type="text/javascript"
	charset="utf-8"></script>

</head>


<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">库存管理</a></li>
			<li>库存品类清单</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1">库存品类清单</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">

				<ul class="seachform">
					<li><label>商品编号</label> <input name="" placeholder="请输入商品编号"
						type="text" class="scinput" data-search='identify' /></li>
					<li><label>商品名称</label> <input name="" placeholder="请输入商品名称"
						type="text" class="scinput" data-search='name' /></li>
					<li><label>商品类别</label>
						<div class="vocation">
							<select class="select3" data-search='type'>
								<option value="0" selected="selected">不限</option>
								<option>药品</option>
								<option>替换品</option>
								<option>耗材</option>
							</select>
						</div></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" value="查询" id="seachBtn" /></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" value="全部" id="allResult" /></li>
				</ul>
				<div class="tools">
					<ul class="toolbar">
						<li class="click" id="newInventory"><span><img
								src="images/t01.png" /></span>新增</li>
								<li class="click" id="paramSys"><span><img
								src="images/t09.png" /></span>警戒参数管理</li>
						<li class="click" id="delMoreInventory"><span><img
								src="images/t02.png" /></span>批量删除</li>
						<li class="reverse" reverseTo="inventoryTable"><span><img
								src="images/t03.png" /></span>反向选择</li>
						<li class="export"><span><img src="images/t04.png" /></span>库存报表</li>
					</ul>
					<ul class="toolbar1">
						<li class="help"><a href="help.html" target="_blank"><span><img
									src="images/t08.png" /></span>帮助</a></li>
					</ul>
				</div>
				<table class="tablelist" id="inventoryTable">
					<thead>
						<tr>
							<th><input name="" type="checkbox" value="" /></th>
							<th>设备编号<i class="sort"><img src="images/px.gif" /></i></th>
								<th>商品名称</th>
								<th>规格</th>
								<th>单位</th>
								<th>商品类别</th>
								<th>库存量下限值</th>
								<th>单价(单位:元)</th>
								<th>数量</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#inventoryList" id="i">
							<tr>
								<td><input name="" type="checkbox" data-num="${i.id}"
									value="" /></td>
								<td>${i.identify }</td>
								<td>${i.name }</td>
								<td>${i.standard }</td>
								<td>${i.unit }</td>
								<td>${i.type }</td>
								<td>${i.lowerValue }</td>
								<td>${i.price }</td>
								<td>${i.amount }</td>
								<td><a href="javascript:;"
									class="tablelink viewInventory" data-num="${i.id }">查看详情</a> <a
									href="javascript:;" class="tablelink changeInventory"
									data-num="${i.id }">修改</a> <a href="javascript:;"
									class="tablelink delInventory" data-num="${i.id }"> 删除</a></td>
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
