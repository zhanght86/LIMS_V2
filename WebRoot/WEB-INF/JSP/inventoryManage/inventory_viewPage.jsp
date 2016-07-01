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

<title>新增设备信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>查看商品信息</span>
		</div>
			<ul class="forminfo">
				<li>
					<label>商品编号</label>
					<label class="viewLabel">${identify }</label>
				</li>
				<li>
					<label>商品名称</label>
					<label class="viewLabel">${name }</label>
				</li>
				<li>
					<label>商品规格</label>
					<label class="viewLabel">${standard }</label>
				</li>
				<li>
					<label>商品单位</label>
					<label class="viewLabel">${unit }</label>
				</li>
				<li>
					<label>商品单价</label>
					<label class="viewLabel">${price }</label>
				</li>
				<li>
					<label>商品分类</label>
					<label class="viewLabel">${type }</label>
				</li>
				<li>
					<label>下限预警值</label>
					<label class="viewLabel">${lowerValue }</label>
				</li>
				<li>
					<label>商品数量</label>
					<label class="viewLabel">${amount }</label>
				</li>
				<li>
					<label>注意事项</label>
					<label class="viewLabel">${attention }</label>
				</li>
				<li>
					<label>库存环境要求</label>
					<label class="viewLabel">${envirRequire }</label>
				</li>
			</ul>
	</div>
</body>
</html>
