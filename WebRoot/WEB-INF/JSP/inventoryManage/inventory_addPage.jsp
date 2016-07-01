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

<title>新增品类信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>新增品类信息</span>
		</div>
		<form action="inventoryManage_inventory_add.action" id="inventoryAdd">
			<ul class="forminfo">
				<li><label>商品编号</label> <input name="identify" type="text "
					class="dfinput required" id="identity" placeholder="必填项，提交之后无法被修改" />&nbsp;&nbsp;&nbsp;<input
					name="" type="button" class="scbtn" value="自动生成" id="autoCreate" /></li>
				<li><label>商品名称</label> <input name="name" type="text "
					class="dfinput required" placeholder="必填项，请输入商品名称" /></li>
				<li><label>商品规格</label> <input name="standard" type="text "
					class="dfinput" placeholder="请输入商品规格" id="adminText"/></li>
					<li><label>商品单位</label> <input name="unit" type="text "
					class="dfinput" placeholder="请输入商品单位" id="adminText"/></li>
				<li><label>商品分类</label><div class="vocation">
						<select class="select3" name="type">
							<option value="药品">药品</option>
							<option value="替换品">替换品</option>
							<option value="耗材">耗材</option>
						</select>
					</div></li>
					<li><label>商品单价</label> <input name="price" type="text "
					class="dfinput decimal" placeholder="必填项，请输入商品单价，单位：元" value="0.0"/></li>
				<li><label>下限预警值</label> <input name="lowerValue" type="text "
					class="dfinput decimal" placeholder="必填项，请输入商品数量的下限预警值" value="0"/></li>
				<li><label>商品数量</label> <input name="amount" type="text "
					class="dfinput decimal" placeholder="必填项，请输入商品数量" value="0" /></li>
				<li><label>注意事项</label> <textarea name="attention"
						placeholder="描述该商品的注意事项，不超过1000个汉字" class="textinput" rows=""
						cols=""></textarea></li>
				<li><label>库存环境要求</label> <textarea name="envirRequire"
						placeholder="该商品库存要求，不超过250个汉字" class="textinput" rows="" cols=""></textarea>
				</li>
			</ul>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 350
			});
			$('#autoCreate').click(function() {
				$.ajax({
					url : "inventoryManage_inventory_autoCreate.action",
					async : false,
					success : function(data) {
						var json = eval('(' + data + ')');
						$('#identity').attr('value', json.identify);
					}

				});
			});
		});
	</script>
</body>
</html>
