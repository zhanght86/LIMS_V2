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

<title>修改设备信息</title>

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
			<span>修改设备信息</span>
		</div>
		<form action="deviceManage_device_change.action" id="deviceAdd">
			<ul class="forminfo">
				<li><label>设备编号</label> <s:textfield
						cssClass="dfinput required" placeholder="必填项，请填写编号或者自动生成"
						name="identify" id="identity" disabled="true"></s:textfield><i>设备编号无法被修改</i></li>

				<li><label>设备名称</label> <s:textfield name="name"
						cssClass="dfinput required" placeholder="必填项，请输入设备名称"></s:textfield>
				</li>
				<li><label>设备管理员</label>
					<s:textfield cssClass="dfinput required" disabled="true" placeholder="必填项，请填写管理员编号" id="adminText"  name="admin.identify"></s:textfield>
					&nbsp;&nbsp;&nbsp;<input
					name="" type="button" class="scbtn" value="查找" id="searchAdmin" /></li>
				<li><label>供应商</label> <s:textfield cssClass="dfinput required" disabled="true" placeholder="必填项，请填写管理员编号" id="customerText"  name="supplier.identify"></s:textfield>&nbsp;&nbsp;&nbsp;<input name="" type="button"
					class="scbtn" value="查找" id="searchCustomer" /></li>
				<li><label>购买日期</label> 
				<s:textfield name="timeBuying" cssClass="dfinput" placeholder="点击选择时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></s:textfield>
				</li>
				<li><label>核心参数描述</label>
					<s:textarea name="coreDesp" placeholder="描述该设备核心参数，不超过1000个汉字" cssClass="textinput"></s:textarea>
					</li>
				<li><label>常用备品</label>
						<s:textarea name="commonlyUserdParts" placeholder="常用备品信息，不超过250个汉字" cssClass="textinput"></s:textarea>
				</li>

				<li><label>技术文档名称</label>
					<s:textfield cssClass="dfinput required" placeholder="必填项，请输入技术文档的名称" name="technicalDocument"></s:textfield>
				</li>
				<li><label>文档保管员</label>
					<s:textfield name="custodian.identify" placeholder="必填项，请填写保管员编号" disabled="true" cssClass="dfinput required" id="custodianText"></s:textfield>
					&nbsp;&nbsp;&nbsp;<input name=""
					type="button" class="scbtn" value="查找" id="searchCustodian" /></li>
				<s:hidden name="identify"/>
				<s:hidden name="adminId" id="adminText2"/>
				<s:hidden name="supplierId" id="customerText2" />
				<s:hidden name="custodianId" id="custodianText2" />
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
									var id=$(this).attr('data-search');
									$('#adminText').attr("value",text);
									$('#adminText2').attr("value",id);
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
									var id=$(this).attr('data-search');
									$('#custodianText2').attr("value",id);
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
									var id=$(this).attr('data-search');
									$('#customerText2').attr("value",id);
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
