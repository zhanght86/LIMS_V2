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

<title>设置预警值</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body class="common" style="widows: 500px">
	<div class="formbody">
		<div class="formtitle">
			<span><input type="radio" class="changeWay" name="changeWay" data-index=0 checked="checked"> 设置方式：设置固定值</span>
		</div>
		<ul class="seachform">
			<li><label>预警下限值：</label> <input type="text" class="dfinput" id="textWay"> </li>
		</ul>
		<div class="formtitle">
			<span><input type="radio" class="changeWay" data-index=1 name="changeWay"> 设置方式：设置函数式</span>
		</div>
		<ul class="seachform">
			<li><label>预警函数式：</label> <input disabled="true" type="text" id="fnWay" class="dfinput"> </li>
		</ul>
		<ul>
			<li>注意事项：</li>
			<li>1.预警值和预警函数一次只能设置一个</li>
			<li>2.设置预警值会将所有选中品类均设置为相同值</li>
			<li>3.预警函数写法：当前值使用'x'表示，并写出只包含'+','-','/','*','(',')'的计算式，例如"(x+5)*0.3"</li>
		</ul>
	</div>
	<script type="text/javascript">
	$(function(){
		$('.changeWay').click(function(){
			var index=$(this).attr('data-index');
			$('.dfinput').prop('disabled',true)
			$('.dfinput:eq('+index+')').prop('disabled',false);
		});
		
	});
	</script>
</body>
</html>
