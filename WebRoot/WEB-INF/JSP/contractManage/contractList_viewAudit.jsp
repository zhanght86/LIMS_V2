<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<body class="common" >
	<div class="formbody">
		<form action="" id="auditForm">
			<div class="formtitle">
				<span>合同(委托书)评审记录</span>
			</div>
			<ul class="forminfo" >
				<li><label>委托单位</label>
				<label class="viewLabel">${client }</label>
				</li>
				<li><label>承接单位</label>
				<label class="viewLabel">${service }</label>
				</li>
				<li><label>合同内容</label>
				<label class="viewLabel">${contractContext }</label>
				</li>
				<li></li>
			</ul>
			<div class="formtitle" >
				<span>评审内容</span>
			</div>
			<ul class="forminfo">
				<li style="line-height: 34px"><label style="width: 500px">1.客户要求与合同内容相符：</label>
					<c:if test="${contractSame==1 }">
					<label class="viewLabel" style="color: blue;">是</label>
					</c:if>
					<c:if test="${contractSame==0 }">
					<label class="viewLabel" style="color: red;">否</label>
					</c:if>
				</li>

				<li style="line-height: 34px"><label style="width: 500px">2.人力、物力、信息资源等条件均可以满足合同中的要求：</label>
				<c:if test="${resourceSatisfaction==1 }">
					<label class="viewLabel" style="color: blue;">是</label>
					</c:if>
					<c:if test="${resourceSatisfaction==0 }">
					<label class="viewLabel" style="color: red;">否</label>
					</c:if>
				</li>
				<li style="line-height: 34px"><label style="width: 500px">3.确定的监测方案与测试方法是否可以满足客户的要求：</label>
				<c:if test="${custSatisfaction==1 }">
					<label class="viewLabel" style="color: blue;">是</label>
					</c:if>
					<c:if test="${custSatisfaction==0 }">
					<label class="viewLabel" style="color: red;">否</label>
					</c:if>
				</li>
				<li style="line-height: 34px"><label style="width: 500px">4.本项目是否有分包内容、
						分包单位评审是否合格：</label>
					<c:if test="${subpackage==1 }">
					<label class="viewLabel" style="color: blue;">有</label>
					</c:if>
					<c:if test="${subpackage==0 }">
					<label class="viewLabel" style="color: blue;">无</label>
					</c:if>
					<c:if test="${subcontractUnit==1 }">
					<label class="viewLabel" style="color: blue;">合格</label>
					</c:if>
					<c:if test="${subcontractUnit==0 }">
					<label class="viewLabel" style="color: red;">不合格</label>
					</c:if>
				
				</li>
				<li style="line-height: 34px"><label style="width: 500px">5.合同额是否满足工作量要求：</label>
				<c:if test="${paymentSatisfaction==1 }">
					<label class="viewLabel" style="color: blue;">是</label>
					</c:if>
					<c:if test="${paymentSatisfaction==0 }">
					<label class="viewLabel" style="color: red;">否</label>
					</c:if>
				</li>
				<li style="line-height: 34px"><label style="width: 500px">6.提交报告时间是否合适：</label>
				<c:if test="${timeSatisfaction==1 }">
					<label class="viewLabel" style="color: blue;">是</label>
					</c:if>
					<c:if test="${timeSatisfaction==0 }">
					<label class="viewLabel" style="color: red;">否</label>
					</c:if>
				</li>
				<li></li>
			</ul>
			<div class="formtitle" >
				<span>其他</span>
			</div>
			<ul class="forminfo" >
				<li><label style="width:100px">其他评审内容及有关说明</label>
				<label class="viewLabel">${other }</label>
			</li>
			<li></li>
			</ul>
			<div class="formtitle" >
				<span>评审结论</span>
			</div>
			<ul class="forminfo" >
				<li><label style="width:100px">评审结论</label>
				<label class="viewLabel">${auditResult }</label>
			</li>
			</ul>
		</form>
	</div>
</body>

</html>
