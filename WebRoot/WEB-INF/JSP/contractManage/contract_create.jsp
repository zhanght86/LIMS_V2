<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>合同起草</title>
<meta charset="utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/cssReset.css" rel="stylesheet" type="text/css" />
<link href="css/cssReset.css" rel="stylesheet" type="text/css"
	media="print" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/module/contractManage.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" charset="utf-8"
	src="js/jquery.PrintArea.js"></script>
<link href="css/trafficContract.css" rel="stylesheet" type="text/css">
<link href="css/trafficContract.css" rel="stylesheet" type="text/css"
	media="print">
<script type="text/javascript">
	$(function() {
		function print() {
			$("#content").printArea();
		}
		window.printTable = print;
	});
</script>
</head>

<body>
	<div id="content">
		<h2 style="text-align:center; font-size:16px; margin:10px">环 境 监
			测 业 务 合 同</h2>
		<h2
			style="text-align:right; font-size:14px; margin:10px; padding-right:100px">
			编号：<label style="width:100px" id="createPageIdentify">请先保存合同!</label>
		</h2>
		<table cellspacing="0" cellpadding="0">
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
				<td colspan="4" width="263"><label>${customerName }</label></td>
				<td colspan="2" width="88" style="text-align:center">邮编</td>
				<td colspan="3" width="242"><label>${customerCode }</label></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">地  址</td>
				<td colspan="4" width="263"><label>${customerAddress }</label></td>
				<td colspan="2" width="88" style="text-align:center">电话</td>
				<td colspan="3" width="242"><label>${customerTel }</label></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">联系人</td>
				<td colspan="4" width="263"><label>${customerPeople }</label></td>
				<td colspan="2" width="88" style="text-align:center">传真</td>
				<td colspan="3" width="242"><label>${customerFax }</label></td>
			</tr>
			<tr>
				<td rowspan="${rowSpan }" width="46" style="text-align:center;"><ul>
						<li>监</li>
						<li>测</li>
						<li>内</li>
						<li>容</li>
					</ul></td>
				<td width="73" style="text-align:center">项目名称</td>
				<td colspan="9" width="593"><label>${projectName }</label></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">监测目的</td>
				<td colspan="9" width="593" style="padding: 10px"><label>${projectAim }</label></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">监测类别</td>
				<td colspan="9" width="593"><label>${projectType }</label></td>
			</tr>
			
			<tr>
				<td width="73" style="text-align:center">环境要素</td>
				<td colspan="2" width="156" style="text-align:center">监测点（个）</td>
				<td colspan="3" width="151" style="text-align:center">监测项目</td>
				<td colspan="3" width="117" style="text-align:center">监测频次</td>
				<td width="169" style="text-align:center">备注</td>
			</tr>
			<s:iterator value="#items" id="i">
			<tr>
				<td width="73"><label>${i.analysisCategory.name }</label></td>
				<td colspan="2" width="156"><label>${i.siteNum }</label></td>
				<td colspan="3" width="151"><label>${i.analysisProject.name }</label></td>
				<td colspan="3" width="117"><label>${i.analysisFrequency.name }</label></td>
				<td width="169"><label>${i.other }</label></td>
			</tr>
			</s:iterator>

			<tr>
				<td width="73" style="text-align:center">检测方法</td>
				<td colspan="9" width="593"><c:if test="${projectWay==0 }">
						<label>以我单位通过计量认证、国家实验室认可的方法进行检测。</label>
					</c:if> <c:if test="${projectWay==1 }">
						<label>${projectWayText }</label>
					</c:if></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">分包单位</td>
				<td colspan="3" width="219"><label>${subpackageName }</label></td>
				<td colspan="4" width="176" style="text-align:center">分包项目</td>
				<td colspan="2" width="198"><label>${subProject }</label></td>
			</tr>
			<tr>
				<td rowspan="2" width="46" style="text-align:center">报 告</td>
				<td width="73" style="text-align:center">交付方式</td>
				<td colspan="9" width="593"><label>${paymentWay }</label></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">完成时间</td>
				<td width="93"><label>${data }</label></td>
				<td colspan="2" width="126" style="text-align:center">监测费用</td>
				<td colspan="6" width="374"><label>￥${costNumSmall} ${costNum }</label></td>
			</tr>
			<tr>
				<td rowspan="2" width="46" style="text-align:center">客户<br />要求
				</td>
				<td colspan="10" width="666">&nbsp;&nbsp;&nbsp;&nbsp;<c:if
						test="${inRoom==0 }">不</c:if>需要进入本实验室监视与本次委托有关的检测活动
				</td>
			</tr>
			<tr>
				<td colspan="10" width="666">&nbsp;&nbsp;&nbsp;&nbsp;<c:if
						test="${secrecy==0 }">不</c:if>需要本实验室对本次委托有关资料保密
				</td>
			</tr>
			<tr>
				<td width="46" style="text-align:center">其他</td>
				<td colspan="10" width="666" style="padding: 10px">其他约定或说明：<br /> <label style="margin:10px 0; display: inline-block;">${other
						}</label>
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
				<td colspan="4" width="263"><label>${entrusted }</label></td>
				<td colspan="2" width="88" style="text-align:center">邮编</td>
				<td colspan="3" width="242"><label>${entrustedCode }</label></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">地  址</td>
				<td colspan="4" width="263"><label>${entrustedAddress }</label></td>
				<td colspan="2" width="88" style="text-align:center">电话</td>
				<td colspan="3" width="242"><label>${entrustedTel }</label></td>
			</tr>
			<tr>
				<td width="73" style="text-align:center">承办人</td>
				<td colspan="4" width="263"><label>${ContractorsName }</label></td>
				<td colspan="2" width="88" style="text-align:center">传真</td>
				<td colspan="3" width="242"><label>${entrustedFax }</label></td>
			</tr>
			<!-- <tr>
				<td style="padding: 10px" colspan="11" width="712">我方保证所提供的相关信息、资料的真实性，并承担相应责任。我方同意监测及其它服务按此合同进行，并支付费用和提供必要的合作。<br/><br/>
				委托单位：（公章）                                     委托代理人：                                      日期：      年     月     日
				</td>
			</tr> -->
		</table>
	</div>
</body>
</html>
