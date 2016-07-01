<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'power.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="zTree/css/demo.css" type="text/css">
<link rel="stylesheet" href="zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript" src="zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="zTree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="zTree/js/jquery.ztree.excheck-3.5.js"></script>
<SCRIPT type="text/javascript">
	var setting = {
		check : {
			enable : true
		},
		data : {
			simpleData : {
				enable : true
			}
		}
	};

	var zNodes = [ {
		id : 1,
		pId : 0,
		name : "首页",
		open : true
	}, {
		id : 11,
		pId : 1,
		name : "首页"
	},{
		id : 12,
		pId : 1,
		name : "系统公告",
	}, {
		id : 13,
		pId : 1,
		name : "模版库",
	}, {
		id : 2,
		pId : 0,
		name : "综合管理",
		//checked : true,
		open : true
	}, {
		id : 21,
		pId : 2,
		name : "绩效管理"
	}, {
		id : 3,
		pId : 0,
		name : "任务管理",
		open : true
	}, {
		id : 31,
		pId : 3,
		name : "项目样品交接"
	}, {
		id : 32,
		pId : 3,
		name : "任务分配下达"
	}, {
		id : 33,
		pId : 3,
		name : "检测结果填写"
	}, {
		id : 34,
		pId : 3,
		name : "检测结果复核"
	}, {
		id : 35,
		pId : 3,
		name : "检测结果审核"
	}, {
		id : 4,
		pId : 0,
		name : "报告管理",
		open : true
	},{
		id : 41,
		pId : 4,
		name : "合同报告编制"
	},{
		id : 42,
		pId : 4,
		name : "报告编制审核"
	},{
		id : 43,
		pId : 4,
		name : "报告签发审核"
	},{
		id : 44,
		pId : 4,
		name : "报告签收发放"
	}, {
		id : 5,
		pId : 0,
		name : "质量控制",
		open : true
	},{
		id : 51,
		pId : 5,
		name : "质量控制统计"
	},{
		id : 52,
		pId : 5,
		name : "实验分析审核"
	},{
		id : 53,
		pId : 5,
		name : "监测报告审核"
	}, {
		id : 6,
		pId : 0,
		name : "合同管理",
		open : true
	},{
		id : 61,
		pId : 6,
		name : "业务合同列表"
	},{
		id : 62,
		pId : 6,
		name : "服务合同列表"
	},{
		id : 63,
		pId : 6,
		name : "合同起草"
	},{
		id : 64,
		pId : 6,
		name : "服务合同变更"
	},{
		id : 65,
		pId : 6,
		name : "业务合同变更"
	},{
		id : 66,
		pId : 6,
		name : "合同评审"
	},{
		id : 67,
		pId : 6,
		name : "任务下达"
	},{
		id : 68,
		pId : 6,
		name : "自送样登记"
	},{
		id : 69,
		pId : 6,
		name : "现场采样登记"
	}, {
		id : 7,
		pId : 0,
		name : "系统管理",
		open : true
	},{
		id : 71,
		pId : 7,
		name : "修改密码"
	},{
		id : 72,
		pId : 7,
		name : "部门管理"
	},{
		id : 73,
		pId : 7,
		name : "角色管理"
	},{
		id : 74,
		pId : 7,
		name : "用户管理"
	},{
		id : 75,
		pId : 7,
		name : "公告管理"
	},{
		id : 76,
		pId : 7,
		name : "检测项目管理"
	},{
		id : 77,
		pId : 7,
		name : "基础设置"
	}];
	$(document).ready(function() {
		$.fn.zTree.init($("#power"), setting, zNodes);
	});
</SCRIPT>
</head>

<body style="overflow: hidden;">
	<ul id="power" class="ztree"></ul>
</body>

</html>
