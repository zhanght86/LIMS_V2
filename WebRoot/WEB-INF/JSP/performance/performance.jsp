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

<title>绩效管理</title>

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
<script type="text/javascript" src="js/Chart.min.js"></script>
<script src="js/module/performance.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">综合管理</a></li>
			<li>绩效管理</li>
		</ul>
	</div>

	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">绩效管理</a></li>
				</ul>
			</div>
			<p style="margin: 10px 0">注意：测试版中绩效查询只支持单点查询部分功能，更多功能敬请期待正式版！</p>
			<div id="tab1" class="tabson">
				<ul class="seachform" id="perform">
					<li><label>用户编号</label> <input name="" placeholder="请输入编号"
						type="text" class="scinput" data-search="identify" /></li>
					<li><label>统计模块</label>
						<div class="vocation">
							<select class="select3" data-search='model' id="model">
								<option value="0" selected="selected">选择模块</option>
								<option value="1">合同起草</option>
								<option value="2">质量控制</option>
								<option value="3">任务下达</option>
								<option value="4">交联单填写</option>
								<option value="5">合同变更</option>
								<option value="6">样品分析</option>
								<option value="7">样品复核</option>
								<option value="8">样品分析一审</option>
								<option value="9">样品分析二审</option>
							</select>
						</div></li>
					<li><label>统计区间</label>
						<div class="vocation">
							<input placeholder="统计起始时间" type="text"
								onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"
								class="scinput" style="width:150px" id="finishStratTime"
								data-search='entryTimeStart' /> 至 <input placeholder="统计结束时间"
								type="text"
								onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"
								class="scinput" id="finishEndTime" style="width:150px"
								data-search='entryTimeEnd' />
						</div></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="seachBtn" value="查询" /></li>
					<li><label>&nbsp;</label> <input name="" type="button"
						class="scbtn" id="allResult" value="全部" /></li>
				</ul>
				
					<table class="tablelist" id="roleTable">
						<thead>
							<tr>
								<th>编号</th>
								<th>用户姓名</th>
								<th>合同编号</th>
								<th>查看项目</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#projectList" id="pj" status="L">
								<tr>
									<td>${L.index+1 }</td>
									<td>${username.name }</td>
									<td>${pj.contractId }</td>
									<td><a href="javascript:;" class="tablelink viewProject"
										data-id="${pj.id}">查看</a></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<!-- <div style="display: inline-block;">
						<canvas id="canvas" height="250" width="250"></canvas>
					</div> -->
			</div>
		</div>
	</div>
</body>
</html>
