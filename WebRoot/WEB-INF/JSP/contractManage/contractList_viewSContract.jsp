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

<title>My JSP 'contract_createService.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<link href="css/cssReset.css" rel="stylesheet" type="text/css">
<link href="css/createService.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div id="content">
		<h2 style="text-align:center; font-size:16px;">环 境 监 测 服 务 合 同</h2>
		<h2
			style="text-align:right; font-size:14px; margin:10px; padding-right:100px">
			编号：<label style="width:100px" id="serviceCreateIdentify">${identify
				}</label>
		</h2>
		<table cellspacing="0" cellpadding="0" id="serviceForm">
			<col width="72" span="3" />
			<col width="93" />
			<col width="72" span="2" />
			<col width="96" />
			<col width="72" span="2" />
			<tr>
				<td width="72" style="text-align:center;padding:10px 0;">项目名称</td>
				<td colspan="8" width="621" style="padding-left:10px"><label>${name
						}</label></td>
			</tr>
			<tr>
				<td align="center" width="72"
					style="text-align:center;padding:10px 0; height:200px">项目内容及<br />技术要求
				</td>
				<td colspan="8" style="padding-left:10px"><label>${context
						}</label></td>
			</tr>
			<tr>
				<td align="center" width="72"
					style="text-align:center;padding:10px 0;  height:150px">委托方的职责<br />（甲方）
				</td>
				<td colspan="8" width="621" style="padding-left:10px"><label>${clientResp
						}</label></td>
			</tr>
			<tr>
				<td align="center" width="72"
					style="text-align:center;padding:10px 0;  height:150px">服务方的职责<br />（乙方）
				</td>
				<td colspan="8" width="621" style="padding-left:10px"><label>${serviceResp
						}</label></td>
			</tr>
			<tr>
				<td align="center" width="90"
					style="text-align:center;padding:20px 0; height:80px">项目完成期限及<br />咨询费用
				</td>
				<td colspan="8" width="621" style="padding-left:10px">甲方及时支付乙方技术咨询服务费，乙方在收到服务费和甲方提供完整﹑真实的相关项目资料后
					<label> ${times } </label> 个工作日之内完成环境影响报告表。<br /> <br />
					甲方付乙方技术咨询服务费:    ${costUpper }        (￥ <label> ${cost } </label>
					元) <br />
				</td>
			</tr>
			<tr>
				<td colspan="3" class="lastTd">
					<div>
						<label>委托方：</label> <label>${client }</label>
					</div>
					<div>
						<label>地&nbsp;&nbsp;&nbsp;址：</label> <label>${clientAddress
							}</label>
					</div>
					<div>
						<label>电&nbsp;&nbsp;&nbsp;话：</label> <label>${clientTel }</label>
					</div>
					</div>
				</td>
				<td colspan="3" class="lastTd">
					<div>
						<label>服务方：</label> <label>${service }</label>
					</div>
					<div>
						<label>地&nbsp;&nbsp;&nbsp;址：</label> <label>${serviceAddress
							}</label>
					</div>
					<div>
						<label>电&nbsp;&nbsp;&nbsp;话：</label> <label>${serviceTel }</label>
					</div>
					<div>
						<label>开户银行：</label> <label>${serviceBank }</label>
					</div>
					<div>
						<label>账&nbsp;&nbsp;&nbsp;号：</label> <label>${serviceCard
							}</label>
					</div>
				</td>
				<td colspan="3" class="lastTd">
					<div>
						<label>项目承担单位：</label> <label>${bearUnit }</label>
					</div>
					<div>
						<label>地&nbsp;&nbsp;&nbsp;址：</label> <label>${bearUnitAddress
							}</label>
					</div>
					<div>
						<label>电&nbsp;&nbsp;&nbsp;话：</label> <label>${bearUnitTel
							}</label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<div style="vertical-align:bottom; margin-top:30px">
						<label style="float:left">代&nbsp;&nbsp;&nbsp;表：</label><label
							style="float:right">签字&nbsp;&nbsp;（盖章）</label>
					</div>
					<div>
						<label style="float:right; vertical-align:bottom">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;
						</label>
					</div>
				</td>
				<td colspan="3">
					<div>
						<label style="float:left">代&nbsp;&nbsp;&nbsp;表：</label><label
							style="float:right">签字&nbsp;&nbsp;（盖章）</label>
					</div>
					<div>
						<label style="float:right">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;
						</label>
					</div>
				</td>
				<td colspan="3">
					<div>
						<label style="float:left">项目负责人：</label><label style="float:right">签字&nbsp;&nbsp;（盖章）</label>
					</div>
					<div>
						<label style="float:right">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;
						</label>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
