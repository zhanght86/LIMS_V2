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

<title>新增用户信息</title>

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
			<span>新增设备信息</span>
		</div>
		<form action="deviceManage_device_add.action" id="deviceAdd">
			<ul class="forminfo">
				<li><label>设备编号</label> <input name="identify" type="text "
					class="dfinput required" id="identity" placeholder="必填项，提交之后无法被修改" />&nbsp;&nbsp;&nbsp;<input
					name="" type="button" class="scbtn" value="自动生成" id="autoCreate" /></li>

				<li><label>设备名称</label> <input name="name" type="text "
					class="dfinput required" placeholder="必填项，请输入设备名称" /></li>
				<li><label>设备管理员</label> <input name="adminId" type="text "
					class="dfinput required" placeholder="必填项，请填写管理员编号" id="adminText"/>&nbsp;&nbsp;&nbsp;<input
					name="" type="button" class="scbtn" value="查找" id="searchAdmin" /></li>
				<li><label>供应商</label> <input name="supplierId" type="text "
					class="dfinput required" placeholder="必填项，请填写客户编号" id="customerText"/>&nbsp;&nbsp;&nbsp;<input
					name="" type="button" class="scbtn" value="查找" id="searchCustomer" /></li>
				<li><label>购买日期</label> <input name="timeBuying" type="text"
					class="dfinput" placeholder="点击选择时间"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></li>
				<li><label>核心参数描述</label> <textarea name="coreDesp"
						placeholder="描述该设备核心参数，不超过1000个汉字" class="textinput" rows=""
						cols=""></textarea></li>
				<li><label>常用备品</label> <textarea name="commonlyUserdParts"
						placeholder="常用备品信息，不超过250个汉字" class="textinput" rows="" cols=""></textarea>
				</li>

				<li><label>技术文档名称</label> <input name="technicalDocument"
					type="text" class="dfinput required" placeholder="必填项，请输入技术文档的名称" /></li>
				<li><label>文档保管员</label> <input name="custodianId" type="text "
					class="dfinput required" placeholder="必填项，请填写保管员编号" id="custodianText"/>&nbsp;&nbsp;&nbsp;<input
					name="" type="button" class="scbtn" value="查找" id="searchCustodian" /></li>
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
			$('#searchAdmin').click(function(){
				asyncbox.open({
					title: '选择管理员',
					url: 'userManage_user_choosePage.action',
					width: 700,
					height: 600,
					btnsbar: [{
						text: '选　择', 
						action: 'ok' 
					}].concat($.btn.CANCEL),
					callback: function(action,opt){
						if (action == 'ok') {
							var oTable=opt.document.getElementById("userTable");
							var $_oTable=$(oTable);
							$_oTable.find('tbody input[type=radio]').each(function(){
								if($(this).prop("checked")){
									var text=$(this).parents('td').next().html();
									$('#adminText').attr("value",text);
								}
							})
						}
					}
				});
			})
			$('#searchCustodian').click(function(){
				asyncbox.open({
					title: '选择档案保管员',
					url: 'userManage_user_choosePage.action',
					width: 700,
					height: 500,
					btnsbar: [{
						text: '选　择', 
						action: 'ok' 
					}].concat($.btn.CANCEL),
					callback: function(action,opt){
						if (action == 'ok') {
							var oTable=opt.document.getElementById("userTable");
							var $_oTable=$(oTable);
							$_oTable.find('tbody input[type=radio]').each(function(){
								if($(this).prop("checked")){
									var text=$(this).parents('td').next().html();
									$('#custodianText').attr("value",text);
								}
							})
						}
					}
				});
			})
			$('#searchCustomer').click(function(){
				asyncbox.open({
					title: '选择供应商',
					url: 'customerManage_customer_choosePage.action',
					width: 700,
					height: 500,
					btnsbar: [{
						text: '选　择', 
						action: 'ok' 
					}].concat($.btn.CANCEL),
					callback: function(action,opt){
						if (action == 'ok') {
							var oTable=opt.document.getElementById("userTable");
							var $_oTable=$(oTable);
							$_oTable.find('tbody input[type=radio]').each(function(){
								if($(this).prop("checked")){
									var text=$(this).parents('td').next().html();
									$('#customerText').attr("value",text);
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
