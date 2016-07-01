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
<title>客户管理</title>
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
<script src="js/module/customerManage.js" type="text/javascript"
	charset="utf-8"></script>

</head>


<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">系统管理</a></li>
			<li>客户管理</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1">客户信息管理</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">

				<ul class="seachform">
					<li><label>客户编号</label> <input name="" placeholder="请输入客户编号"
						type="text" class="scinput" data-search='identify' /></li>
					<li><label>客户姓名</label> <input name="" placeholder="请输入客户姓名"
						type="text" class="scinput" data-search='name' /></li>
					<li><label>联系人</label> <input name="" placeholder="请输入联系人姓名"
						type="text" class="scinput" data-search='linkMan' /></li>
					<li><label>联系电话</label> <input name="" placeholder="请输入联系电话"
						type="text" class="scinput" data-search='tel' /></li>
				</ul>
				<ul class="seachform">
					<li><label>是否VIP</label>
						<div class="vocation">
							<select class="select3" data-search='leaguer'>
								<option value="0" selected="selected">不限</option>
								<option value="是">是</option>
								<option value="否">否</option>
							</select>
						</div></li>

					<li><label>列入时间</label>
						<div class="vocation">
							<input placeholder="列入起始时间" type="text"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="scinput"
								style="width:150px" id="dataStart" data-search='entryTimeStart' />
							至 <input placeholder="列入结束时间" type="text"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="scinput"
								id="dataEnd" style="width:150px" data-search='entryTimeEnd' />
						</div></li>

					<li><label>客户类型</label>
						<div class="vocation">
							<select class="select3" data-search='curType'>
								<option value="0">不限</option>
								<option value="设备供应商">设备供应商</option>
								<option value="备品供应商">备品供应商</option>
								<option value="咨询供应商">咨询供应商</option>
								<option value="服务购买者">服务购买者</option>
							</select>
						</div></li>

					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" value="查询" id="seachBtn" /></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" value="全部" id="allResult" /></li>
				</ul>
				<div class="tools">
					<ul class="toolbar">
						<li class="click" id="newCustomer"><span><img
								src="images/t01.png" /></span>新增</li>
						<li class="click" id="resetAllPWD"><span><img
								src="images/t09.png" /></span>批量重置密码</li>
						<li class="click" id="delMoreCustomer"><span><img
								src="images/t02.png" /></span>批量删除</li>
						<li class="reverse" reverseTo="customerTable"><span><img
								src="images/t03.png" /></span>反向选择</li>
						<li class="export"><span><img src="images/t04.png" /></span>数据导出</li>
					</ul>
					<ul class="toolbar1">
						<li class="help"><a href="help.html" target="_blank"><span><img
									src="images/t08.png" /></span>帮助</a></li>
					</ul>
				</div>
				<table class="tablelist" id="customerTable">
					<thead>
						<tr>
							<th><input name="" type="checkbox" value="" /></th>
							<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
							<th>客户姓名</th>
							<th>客户类型</th>
							<th>是否VIP</th>
							<th>列入时间</th>
							<th>联系人</th>
							<th>联系电话</th>
							<th>职务</th>
							<th>电子邮件</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#customerList" id="c">
							<tr>
								<td><input name="" type="checkbox" data-num="${c.id}"
									value="" /></td>
								<td>${c.identify }</td>
								<td>${c.name }</td>
								<td>${c.curType }</td>
								<td>${c.leaguer }</td>
								<td>${c.entryTime }</td>
								<td>${c.linkMan }</td>
								<td>${c.tel }</td>
								<td>${c.linkManPosition }</td>
								<td>${c.email }</td>
								<td><a href="javascript:;" class="tablelink viewCustomer"
									data-num="${c.id }">查看详情</a> <a href="javascript:;"
									class="tablelink changeCustomer" data-num="${c.id }">修改</a> <a
									href="javascript:;" class="tablelink delCustomer"
									data-num="${c.id }"> 删除</a> <a href="javascript:;"
									class="tablelink resetPWD" data-num="${c.id }"> 重置密码 </a></td>
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
