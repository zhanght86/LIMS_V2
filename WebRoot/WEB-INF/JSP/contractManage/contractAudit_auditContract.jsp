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

<title>My JSP 'contractAudit_auditContract.jsp' starting page</title>

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
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$(".select3").uedSelect({
			width : 250
		});
	})
</script>

</head>

<body class="common" style="width: 1000px">
	<div class="formbody">
		<form action="" id="auditForm">
			<div class="formtitle" style="width: 1000px">
				<span>合同(委托书)评审记录</span>
			</div>
			<ul class="forminfo" style="width: 1000px">
				<li><label>委托单位</label>
				<input type="text" class="dfinput required" data-alert="委托单位" placeholder="必填项" value="${wtdw }" name="client"/>
				</li>
				<li><label>承接单位</label>
				<textarea class="textinput" name="service" data-alert="承接单位"  placeholder="合同承接单位，包括合作单位，不超过500字">邦达诚环境监测中心（江苏）有限公司</textarea>
				</li>
				<li><label>合同内容</label>
				<textarea class="textinput" name="contractContext" data-alert="合同内容" placeholder="详细描述合同内容，不超过500字"></textarea>
				</li>
			</ul>
			<div class="formtitle" style="width: 1000px">
				<span>评审内容</span>
			</div>
			<ul class="forminfo" id="auditRadio">
				<li style="line-height: 34px"><label style="width: 500px">1.客户要求与合同内容相符</label>
					<input type="radio" name="contractSame" value="1" checked="checked" />&nbsp;&nbsp;是 <input
					type="radio" name="contractSame" value="0"
					style="margin-left: 50px" />&nbsp;&nbsp;否</li>

				<li style="line-height: 34px"><label style="width: 500px">2.人力、物力、信息资源等条件均可以满足合同中的要求</label>
					<input type="radio" name="resourceSatisfaction" value="1" checked="checked" />&nbsp;&nbsp;是
					<input type="radio" name="resourceSatisfaction" value="0"
					style="margin-left: 50px" />&nbsp;&nbsp;否</li>
				<li style="line-height: 34px"><label style="width: 500px">3.确定的监测方案与测试方法是否可以满足客户的要求</label>
					<input type="radio" name="custSatisfaction" value="1" checked="checked" />&nbsp;&nbsp;是
					<input type="radio" name="custSatisfaction" value="0"
					style="margin-left: 50px" />&nbsp;&nbsp;否</li>
				<li style="line-height: 34px"><label style="width: 500px">4.本项目是否有分包内容、
						分包单位评审是否合格</label> <input type="radio" name="subpackage" value="1" />&nbsp;&nbsp;有
					<input type="radio" name="subpackage" value="0"
					style="margin-left: 50px" checked="checked" />&nbsp;&nbsp;无 <input type="radio"
					name="subcontractUnit" value="1" style="margin-left: 50px" checked="checked" />&nbsp;&nbsp;合格
					<input type="radio" name="subcontractUnit" value="0"
					style="margin-left: 50px" />&nbsp;&nbsp;不合格</li>
				<li style="line-height: 34px"><label style="width: 500px">5.合同额是否满足工作量要求</label>
					<input type="radio" name="paymentSatisfaction" value="1"  checked="checked"/>&nbsp;&nbsp;是
					<input type="radio" name="paymentSatisfaction" value="0"
					style="margin-left: 50px" />&nbsp;&nbsp;否</li>
				<li style="line-height: 34px"><label style="width: 500px">6.提交报告时间是否合适</label>
					<input type="radio" name="timeSatisfaction" value="1" checked="checked" />&nbsp;&nbsp;是
					<input type="radio" name="timeSatisfaction" value="0"
					style="margin-left: 50px" />&nbsp;&nbsp;否</li>
				<li></li>
			</ul>
			<div class="formtitle" style="width: 1000px">
				<span>其他</span>
			</div>
			<ul class="forminfo" style="width: 1000px">
				<li><label style="width:100px">其他评审内容及有关说明</label>
				<%-- <s:textarea name="other" placeholder="备注其他评审内容，不超过1000字"
						cssClass="textinput"  cssStyle="height:100px"></s:textarea> --%>
				<textarea class="textinput "  name="other" placeholder="备注其他评审内容，不超过1000字" style="height:100px"></textarea>
			</li>
			</ul>
			<div class="formtitle" style="width: 1000px">
				<span>评审结论</span>
			</div>
			<ul class="forminfo" style="width: 1000px">
				<li><label style="width:100px">评审结论</label>
				<%-- <s:textarea name="auditResult" placeholder="给出合同评审结论，不超过500字" cssClass="textinput"
						 cssStyle="height:100px"></s:textarea> --%>
			<textarea class="textinput required" data-alert="评审结论" name="auditResult" placeholder="给出合同评审结论，不超过500字" style="height:100px"></textarea>
			</li>
			</ul>
		</form>
	</div>
</body>

</html>
