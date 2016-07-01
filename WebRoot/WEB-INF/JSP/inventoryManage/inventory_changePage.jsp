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

<title>修改商品信息</title>

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
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="css/My97DatePicker/WdatePicker.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle">
			<span>修改商品信息</span>
		</div>
		<form action="inventoryManage_inventory_change.action" id="inventoryAdd">
			<ul class="forminfo">
				<li><label>商品编号</label> <s:textfield
						cssClass="dfinput required" name="identify" disabled="true"></s:textfield></li>
				<li><label>商品名称</label> <s:textfield
						cssClass="dfinput required" name="name" placeholder="必填项，请输入商品名称"></s:textfield>
				</li>
				<li><label>商品规格</label> <s:textfield cssClass="dfinput"
						name="standard" placeholder="请输入商品规格"></s:textfield></li>
				<li><label>商品单位</label> 
				<s:textfield cssClass="dfinput"
						placeholder="请输入商品单位" name="unit"></s:textfield></li>
				<li><label>商品分类</label>
					<div class="vocation">
						<s:select list="{'药品','替换品','耗材'}" name="type" cssClass="select3"></s:select>
					</div></li>
				<li><label>商品单价</label> <s:textfield name="price"
						cssClass="dfinput decimal" placeholder="必填项，请输入商品单价，单位：元"></s:textfield>
				</li>
				<li><label>下限预警值</label> <s:textfield name="lowerValue"
						cssClass="dfinput decimal" placeholder="必填项，请输入商品数量的下限预警值"></s:textfield>
				</li>
				<li><label>商品数量</label> <s:textfield name="amount"
						cssClass="dfinput decimal" placeholder="必填项，请输入商品数量"></s:textfield>
				</li>
				<li><label>注意事项</label> <s:textarea name="attention"
						cssClass="textinput" placeholder="描述该商品的注意事项，不超过1000个汉字"></s:textarea>
				</li>
				<li><label>库存环境要求</label> <s:textarea name="envirRequire"
						cssClass="textinput" placeholder="该商品库存要求，不超过250个汉字"></s:textarea>
				</li>
				<s:hidden name="identify" />
				<s:hidden name="id"/>
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
					url : "deviceManage_device_autoCreate.action",
					async : false,
					success : function(data) {
						var json = eval('(' + data + ')');
						$('#identity').attr('value', json.identify);
					}

				});
			});
			$('#searchAdmin')
					.click(
							function() {
								asyncbox
										.open({
											title : '选择管理员',
											url : 'userManage_user_choosePage.action',
											width : 700,
											height : 600,
											btnsbar : [ {
												text : '选　择',
												action : 'ok'
											} ].concat($.btn.CANCEL),
											callback : function(action, opt) {
												if (action == 'ok') {
													var oTable = opt.document
															.getElementById("userTable");
													var $_oTable = $(oTable);
													$_oTable
															.find(
																	'tbody input[type=radio]')
															.each(
																	function() {
																		if ($(
																				this)
																				.prop(
																						"checked")) {
																			var text = $(
																					this)
																					.parents(
																							'td')
																					.next()
																					.html();
																			var id = $(
																					this)
																					.attr(
																							'data-search');
																			$(
																					'#adminText')
																					.attr(
																							"value",
																							text);
																			$(
																					'#adminText2')
																					.attr(
																							"value",
																							id);
																		}
																	})
												}
											}
										});
							})
			$('#searchCustodian')
					.click(
							function() {
								asyncbox
										.open({
											title : '选择档案保管员',
											url : 'userManage_user_choosePage.action',
											width : 700,
											height : 500,
											btnsbar : [ {
												text : '选　择',
												action : 'ok'
											} ].concat($.btn.CANCEL),
											callback : function(action, opt) {
												if (action == 'ok') {
													var oTable = opt.document
															.getElementById("userTable");
													var $_oTable = $(oTable);
													$_oTable
															.find(
																	'tbody input[type=radio]')
															.each(
																	function() {
																		if ($(
																				this)
																				.prop(
																						"checked")) {
																			var text = $(
																					this)
																					.parents(
																							'td')
																					.next()
																					.html();
																			var id = $(
																					this)
																					.attr(
																							'data-search');
																			$(
																					'#custodianText2')
																					.attr(
																							"value",
																							id);
																			$(
																					'#custodianText')
																					.attr(
																							"value",
																							text);

																		}
																	})
												}
											}
										});
							})
			$('#searchCustomer')
					.click(
							function() {
								asyncbox
										.open({
											title : '选择供应商',
											url : 'customerManage_customer_choosePage.action',
											width : 700,
											height : 500,
											btnsbar : [ {
												text : '选　择',
												action : 'ok'
											} ].concat($.btn.CANCEL),
											callback : function(action, opt) {
												if (action == 'ok') {
													var oTable = opt.document
															.getElementById("userTable");
													var $_oTable = $(oTable);
													$_oTable
															.find(
																	'tbody input[type=radio]')
															.each(
																	function() {
																		if ($(
																				this)
																				.prop(
																						"checked")) {
																			var text = $(
																					this)
																					.parents(
																							'td')
																					.next()
																					.html();
																			var id = $(
																					this)
																					.attr(
																							'data-search');
																			$(
																					'#customerText2')
																					.attr(
																							"value",
																							id);
																			$(
																					'#customerText')
																					.attr(
																							"value",
																							text);
																		}
																	})
												}
											}
										});
							})
		});
	</script>
</body>
</html>
