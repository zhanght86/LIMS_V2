<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>My JSP 'trafficContractChange_addPage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<link href="css/serviceContract.css" rel="stylesheet" type="text/css" />
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
<script type="text/javascript" src="js/sum2chinese.js" charset="utf-8"	></script>
<script src="js/module/contractManage.js" type="text/javascript"
	charset="utf-8"></script>
<style type="text/css">
#contractTable {
	border: 1px solid #000;
	width: 100%;
}

#contractTable td {
	border: 1px solid #000;
	height: 30px;
	vertical-align: middle;
	font-size: 14px;
}
</style>

</head>

<body style="min-width: 0">
	<h2 style="text-align:center; font-size:16px;">环 境 监 测 业 务 合 同</h2>
	<h2
		style="text-align:right; font-size:14px; margin:10px; padding-right:100px">
		编号：<label style="width:100px" id="addPageIdentify">${contract.identify }</label>
	</h2>
	<form action="" id="contractForm" method="post">
		<table cellspacing="0" cellpadding="0" id="contractTable">
			<col width="46" />
			<col width="73" />
			<col width="93" />
			<col width="63" span="2" />
			<col width="44" span="4" />
			<col width="29" />
			<col width="169" />
			<tr>
				<td rowspan="3" width="46" style="text-align:center"><ul>
						<li>甲</li>
						<li>方</li>
						<li>信</li>
						<li>息</li>
					</ul></td>
				<td width="73" style="text-align:center">委托单位</td>
				<td colspan="4" width="263"><input type='text'
					name="customerName"
					style="width:100%; height:30px; background:#e9e3e3"
					class="required" placeholder=" 委托单位名称"
					value="${contract.customerName }" /></td>
				<td colspan="2" width="88" style="text-align:center">邮编</td>
				<td colspan="3" width="242"><input type='text'
					style="width:100%; height:30px; background:#e9e3e3"
					name="customerCode" placeholder=" 6位邮政编码"
					value="${contract.customerCode}" /></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">地  址</td>
				<td colspan="4" width="263"><input type='text'
					style="width:100%; height:30px; background:#e9e3e3"
					name="customerAddress" class="required"
					value="${contract.customerAddress}" /></td>
				<td colspan="2" width="88" style="text-align:center">电话</td>
				<td colspan="3" width="242"><input type='text'
					style="width:100%; height:30px; background:#e9e3e3"
					name="customerTel" placeholder=" 客户联系电话，手机号或座机号"
					value="${contract.customerTel}" /></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">联系人</td>
				<td colspan="4" width="263"><input type='text'
					name="customerPeople"
					style="width:100%; height:30px; background:#e9e3e3"
					class="required" value="${contract.customerPeople}" /></td>
				<td colspan="2" width="88" style="text-align:center">传真</td>
				<td colspan="3" width="242"><input type='text'
					name="customerFax"
					style="width:100%; height:30px; background:#e9e3e3"
					value="${contract.customerFax}" /></td>
			</tr>
			<tr>
				<td rowspan="${rowSpan }" id="itemContainer" width="46"
					style="text-align:center;"><ul>
						<li>监</li>
						<li>测</li>
						<li>内</li>
						<li>容</li>
					</ul></td>
				<td width="73" style="text-align:center">项目名称</td>
				<td colspan="9" width="593"><input type='text'
					name="projectName"
					style="width:100%; height:30px; background:#e9e3e3;cursor:text;"
					class="required" placeholder=" 请输入项目的名称"
					value="${contract.projectName}" /></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">监测目的</td>
				<td colspan="9" width="593"><input type='text'
					name="projectAim"
					style="width:100%; height:30px; background:#e9e3e3"
					class="required" value="${contract.projectAim}" /></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">监测类别</td>
				<td colspan="9" width="593">&nbsp;&nbsp;&nbsp;&nbsp;<input
					type='radio' name="projectType" id="type1" value="委托监测"
					checked="checked" /><label for="type1">委托监测</label>       <input
					type='radio' name="projectType" id="type2" value="验收监测" /><label
					for="type2">验收监测</label>        <input type='radio'
					name="projectType" id="type3" value="委托分析" /><label for="type3">委托分析</label>
					       <input type='radio' name="projectType" id="type4" value="其他" /><label
					for="type4">其他</label>    
				</td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">环境要素</td>
				<td colspan="2" width="156" style="text-align:center">监测点（个）</td>
				<td colspan="3" width="151" style="text-align:center">监测项目</td>
				<td colspan="3" width="117" style="text-align:center">监测频次</td>
				<td width="169" style="text-align:center">备注</td>
			</tr>
			<tr class="itemsList">
				<td width="73"><select class="select2"
					style="height:30px;width:100%; padding:0;margin:0"
					id="analysisCategory">
						<option value="-1">请选择</option>
						<s:iterator value="#analysisCategory" id="a">
							<option value="${a.id}">${a.name}</option>
						</s:iterator>
				</select></td>
				<td colspan="2" width="156"><input type='text'
					style="width:100%; height:30px; background:#e9e3e3;padding: 0;"
					class="siteNum" id="siteNum" /></td>
				<td colspan="3" width="151"><select class="select2"
					style="height:100%;width:100%; padding:0;margin:0"
					id="analysisProject">

				</select></td>
				<td colspan="3" width="117"><select class="select2"
					style="height:30px;width:100%; padding:0;margin:0"
					id="analysisFrequency">
						<s:iterator value="#analysisFrequency" id="a">
							<option value="${a.id}">${a.name}</option>
						</s:iterator>
				</select></td>
				<td width="169"><input type='text'
					style="width:100%; height:30px; background:#e9e3e3;padding: 0;"
					class="other" id="other" /></td>
			</tr>
			<s:iterator value="#contract.items" id="i">
				<tr class="itemsResult" data-id="${i.id}">
					<td width="73" data-id="${i.analysisCategory.id }">${i.analysisCategory.name }</td>
					<td colspan="2" width="156">${i.siteNum }</td>
					<td colspan="3" width="151" data-id="${i.analysisProject.id }">${i.analysisProject.name }</td>
					<td colspan="3" width="117" data-id="${i.analysisFrequency.id }">${i.analysisFrequency.name }</td>
					<td width="169">${i.other }</td>
				</tr>
			</s:iterator>
			

			<tr>
				<td width="500" colspan="10"
					style=" text-align:center; padding: 5px"><input name=""
					type="button" class="scbtn" value="新增一行" id="newRow" />&nbsp;&nbsp;&nbsp;<input
					name="" type="button" class="scbtn" value="移除一行" id="delRow" /></td>
			</tr>

			<tr>
				<td rowspan="2" width="73" style="text-align:center">检测方法</td>
				<td colspan="10" width="593">&nbsp;&nbsp;&nbsp;&nbsp; <s:if
						test="#contract.projectWay==0">
						<input type='radio' name="projectWay" id="way1" value="0"
							checked="checked" />
					</s:if> <s:else>
						<input type='radio' name="projectWay" id="way1" value="0" />
					</s:else> <label for="way1">以我单位通过计量认证、国家实验室认可的方法进行检测</label></td>
			</tr>
			<tr>
				<td colspan="10" width="593">&nbsp;&nbsp;&nbsp;&nbsp; <s:if
						test="#contract.projectWay==1">
						<input type='radio' name="projectWay" id="way2" value="1"
							checked="checked" />
						<label for="way2" checked="checked">客户指定的方法：</label>
						<input type='text'
							style="width:90.5%; height:30px; background:#e9e3e3; "
							name="projectWayText" placeholder="请输入客户指定的监测方式"
							value="${contract.projectWayText}" />
					</s:if> <s:else>
						<input type='radio' name="projectWay" id="way2" value="1" />
						<label for="way2" checked="checked">客户指定的方法：</label>
						<input type='text'
							style="width:90.5%; height:30px; background:#e9e3e3; "
							name="projectWayText" placeholder="请输入客户指定的监测方式" />
					</s:else>
				</td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">分包单位</td>
				<td colspan="3" width="219"><input type='text'
					style="width:100%; height:30px; background:#e9e3e3"
					name="subpackageName" value="${contract.subpackageName}" /></td>
				<td colspan="4" width="176" style="text-align:center">分包项目</td>
				<td colspan="3" width="198"><input type='text'
					style="width:100%; height:30px; background:#e9e3e3"
					name="subProject" value="${contract.subProject}" /></td>
			</tr>
			<tr>
				<td rowspan="2" width="46" style="text-align:center">报 告</td>
				<td width="73" style="text-align:center">交付方式</td>
				<td colspan="9" width="593">&nbsp;&nbsp;&nbsp;&nbsp; <s:if
						test="#contract.paymentWay=='自取'">
						<input type='radio' name="paymentWay" id="payWay1" value="自取"
							checked="checked" />
						<label for="payWay1">自取</label>  
				</s:if> <s:else>
						<input type='radio' name="paymentWay" id="payWay1" value="自取" />
						<label for="payWay1">自取</label>  
				</s:else> <s:if test="#contract.paymentWay=='挂号邮寄'">
						<input type='radio' name="paymentWay" id="payWay2" value="挂号邮寄"
							checked="checked" />
						<label for="payWay2">挂号邮寄</label>
					</s:if> <s:else>
						<input type='radio' name="paymentWay" id="payWay2" value="挂号邮寄" />
						<label for="payWay2">挂号邮寄</label>
					</s:else> <s:if test="#contract.paymentWay=='其他'">
						<input type='radio' name="paymentWay" id="payWay3" value="其他"
							checked="checked" />
						<label for="payWay3">其他</label>
					</s:if> <s:else>
						<input type='radio' name="paymentWay" id="payWay3" value="其他" />
						<label for="payWay3">其他</label>
					</s:else>
				</td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">完成时间</td>
				<td width="93"><input type='text'
					style="width:100%; height:30px; background:#e9e3e3" name="deadLine"
					onfocus="WdatePicker({minDate:'%y-%M-{%d+1}'})" class="required"
					value="${contract.deadLine}" /></td>
				<td colspan="2" width="126" style="text-align:center">监测费用(￥)</td>
				<td colspan="3" width="374"><input type='text'
					style="width:100%; height:30px; background:#e9e3e3" name="cost"
					class="required decimal" value="${contract.cost}" /></td>
				<td colspan="3" width="374" id="paymentChinese">零元整</td>
			</tr>
			<tr>
				<td rowspan="2" width="46" style="text-align:center">客户<br />要求
				</td>
				<td colspan="10" width="666">&nbsp;&nbsp;&nbsp;&nbsp;是否需要进入本实验室监视与本次委托有关的检测活动:&nbsp;&nbsp;&nbsp;&nbsp;
					<s:if test="#contract.inRoom==1">
						<input id="needView" name="inRoom" type="radio" value="1"
							checked="checked" />
						<label for="needView">&nbsp;需要</label>&nbsp;&nbsp;&nbsp;&nbsp;
				</s:if> <s:else>
						<input id="needView" name="inRoom" type="radio" value="1" />
						<label for="needView">&nbsp;需要</label>&nbsp;&nbsp;&nbsp;&nbsp;
				</s:else> <s:if test="#contract.inRoom==0">
						<input id="notneedView" name="inRoom" type="radio" value="0"
							checked="checked" />
						<label for="notneedView">&nbsp;不需要</label>
					</s:if> <s:else>
						<input id="notneedView" name="inRoom" type="radio" value="0" />
						<label for="notneedView">&nbsp;不需要</label>
					</s:else>
				</td>
			</tr>
			<tr>
				<td colspan="10" width="666">&nbsp;&nbsp;&nbsp;&nbsp;是否需要本实验室对本次委托有关资料保密：检测活动:&nbsp;&nbsp;&nbsp;&nbsp;
					<s:if test="#contract.secrecy==1">
						<input id="needSec" name="secrecy" type="radio" value="1"
							checked="checked" />
						<label for="needSec">&nbsp;需要</label>&nbsp;&nbsp;&nbsp;&nbsp;
				</s:if> <s:else>
						<input id="needSec" name="secrecy" type="radio" value="1" />
						<label for="needSec">&nbsp;需要</label>&nbsp;&nbsp;&nbsp;&nbsp;
				</s:else> <s:if test="#contract.secrecy==0">
						<input id="needSec2" name="secrecy" type="radio" value="0" checked="checked"/>
						<label for="needSec2">&nbsp;不需要</label>
					</s:if> <s:else>
						<input id="needSec2" name="secrecy" type="radio" value="0" />
						<label for="needSec2">&nbsp;不需要</label>
					</s:else>
				</td>
			</tr>
			<tr>
				<td width="46" style="text-align:center">其他</td>
				<td colspan="10" width="666">其他约定或说明：<br /> <textarea
						name="other" rows=""
						style="width:90%; height:50px; margin:10px;background:#e9e3e3">${contract.other}</textarea>
				</td>
			</tr>
			<tr>
				<td rowspan="3" width="46" style="text-align:center"><ul>
						<li>乙</li>
						<li>方</li>
						<li>信</li>
						<li>息</li>
					</ul></td>
				<td width="73" style="text-align:center">受托单位</td>
				<td colspan="4" width="263"><input type='text'
					value="${contract.entrusted}"
					style="width:100%; height:30px; background:#e9e3e3"
					name="entrusted" class="required" /></td>
				<td colspan="2" width="88" style="text-align:center">邮编</td>
				<td colspan="3" width="242"><input type='text'
					value="${contract.entrustedCode}"
					style="width:100%; height:30px; background:#e9e3e3"
					name="entrustedCode" class="required" /></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">地  址</td>
				<td colspan="4" width="263"><input type='text'
					value="${contract.entrustedAddress}"
					style="width:100%; height:30px; background:#e9e3e3"
					name="entrustedAddress" class="required" /></td>
				<td colspan="2" width="88" style="text-align:center">电话</td>
				<td colspan="3" width="242"><input type='text'
					value="${contract.entrustedTel}"
					style="width:100%; height:30px; background:#e9e3e3"
					name="entrustedTel" class="required" /></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">承办人</td>
				<td colspan="4" width="263"><label style="padding-left: 10px;">${contract.contractors.name
						}</label></td>
				<td colspan="2" width="88" style="text-align:center">传真</td>
				<td colspan="3" width="242"><input type='text'
					value="${contract.entrustedFax}"
					style="width:100%; height:30px; background:#e9e3e3"
					name="entrustedFax" class="required" /></td>
			</tr>
		</table>
		<input type="hidden" name="str" id="itemTemp" />
		<input type="hidden" name="id" value="${contract.id }">
		<input type="hidden" name="identify" value="${contract.identify }">
		<input type="hidden" name="projectId" value="${oldProjectId}">
		<input type="hidden" name="userNum" value="${contract.contractors.id}">
		<%-- <s:hidden name="id"></s:hidden> --%>
		<%-- <s:hidden name="identify"></s:hidden> --%>
	</form>


<script type="text/javascript">
	$(function(){
		var chinese = atoc($('input[name=cost]').val());
	    $('#paymentChinese').html(chinese);
	    $('input[name=projectWayText]').show();
	});
</script>
</body>

</html>
