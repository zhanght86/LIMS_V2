<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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


<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">合同管理</a></li>
			<li>合同起草</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1">环境监测业务合同</a></li>
					<li><a href="#tab2">环境监测服务合同</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="toolbar" style="width: 100%">
					<li class="click" id="createContract"><span><img
							src="images/t10.png" /></span>生成合同</li>
					<li class="click" id="reWrite"><span><img
							src="images/t01.png" /></span>重新起草</li>
				</ul>
				<h2 style="text-align:center; font-size:16px;">环 境 监 测 业 务 合 同</h2>
				<h2
					style="text-align:right; font-size:14px; margin:10px; padding-right:100px">
					编号：<label style="width:100px" id="addPageIdentify">保存合同时生成编号！</label>
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
								class="required"  /></td>
							<td colspan="2" width="88" style="text-align:center">邮编</td>
							<td colspan="3" width="242"><input type='text'
								style="width:100%; height:30px; background:#e9e3e3"
								name="customerCode"  /></td>
						</tr>
						<tr>
							<td width="73" style="text-align:center">地  址</td>
							<td colspan="4" width="263"><input type='text'
								style="width:100%; height:30px; background:#e9e3e3"
								name="customerAddress" /></td>
							<td colspan="2" width="88" style="text-align:center">电话</td>
							<td colspan="3" width="242"><input type='text'
								style="width:100%; height:30px; background:#e9e3e3"
								name="customerTel"
								 /></td>
						</tr>
						<tr>
							<td width="73" style="text-align:center">联系人</td>
							<td colspan="4" width="263"><input type='text'
								name="customerPeople"
								style="width:100%; height:30px; background:#e9e3e3"
								class="required"/></td>
							<td colspan="2" width="88" style="text-align:center">传真</td>
							<td colspan="3" width="242"><input type='text'
								name="customerFax"
								style="width:100%; height:30px; background:#e9e3e3" /></td>
						</tr>
						<tr>
							<td rowspan="9" id="itemContainer" width="46"
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
								class="required"  /></td>
						</tr>
						<tr>
							<td width="73" style="text-align:center">监测目的</td>
							<td colspan="9" width="593"><input type='text'
								name="projectAim"
								style="width:100%; height:30px; background:#e9e3e3"
								class="required" /></td>
						</tr>
						<tr>
							<td width="73" style="text-align:center">监测类别</td>
							<td colspan="9" width="593">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type='radio' name="projectType" id="type1" value="验收监测" checked="checked" /><label for="type1">验收监测</label>       
							<input type='radio' name="projectType" id="type2" value="环评监测" /><label for="type2">环评监测</label>        
							<input type='radio' name="projectType" id="type3" value="委托监测" /><label for="type3">委托监测</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type='radio' name="projectType" id="type4" value="执法监测" /><label for="type4">执法监测</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type='radio' name="projectType" id="type5" value="例行监测" /><label for="type5">例行监测</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type='radio' name="projectType" id="type6" value="应急监测" /><label for="type6">应急监测</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type='radio' name="projectType" id="type7" value="监督监测" /><label for="type7">监督监测</label>&nbsp;&nbsp;&nbsp;&nbsp;
						
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
							<td width="73"> 
							 <select class="select2" style="height:30px;width:100%; padding:0;margin:0" id="analysisCategory">
							 	<option value="-1">请选择</option>
							 	<s:iterator value="#analysisCategory" id="a">
							 	<option  value="${a.id}">${a.name}</option>
							 	</s:iterator>
							 </select> 
							</td>
							<td colspan="2" width="156">
							<input type='text'
								style="width:100%; height:30px; background:#e9e3e3;padding: 0;"
								class="siteNum" id="siteNum" />
							</td>
							<td colspan="3" width="151">
								<select class="select2" style="height:100%;width:100%; padding:0;margin:0" id="analysisProject">
							 		<option value="-1">请选择</option>
							 	</select> 
							</td>
							<td colspan="3" width="117">
							 <select class="select2" style="height:30px;width:100%; padding:0;margin:0" id="analysisFrequency">
							 	<option value="-1">请选择</option>
							 	<s:iterator value="#analysisFrequency" id="a">
							 	<option  value="${a.id}">${a.name}</option>
							 	</s:iterator>
							 </select> 
								</td>
							<td width="169"><input type='text'
								style="width:100%; height:30px; background:#e9e3e3;padding: 0;"
								class="other" id="other" /></td>
						</tr>

						<tr>
							<td width="500" colspan="10"
								style=" text-align:center; padding: 5px"><input name=""
								type="button" class="scbtn" value="新增一行" id="newRow" />&nbsp;&nbsp;&nbsp;<input
								name="" type="button" class="scbtn" value="移除一行" id="delRow" /></td>
						</tr>

						<tr>
							<td rowspan="2" width="73" style="text-align:center">检测方法</td>
							<td colspan="9" width="593">&nbsp;&nbsp;&nbsp;&nbsp;<input
								type='radio' name="projectWay" id="way1" value="0"
								checked="checked" /><label for="way1">以我单位通过计量认证、国家实验室认可的方法进行检测</label></td>
						</tr>
						<tr>
							<td colspan="9" width="593">&nbsp;&nbsp;&nbsp;&nbsp;<input
								type='radio' name="projectWay" id="way2" value="1" /><label
								for="way2">客户指定的方法：</label><input type='text'
								style="width:90.5%; height:30px; background:#e9e3e3; "
								name="projectWayText"  /></td>
						</tr>
						<tr>
							<td width="73" style="text-align:center">分包单位</td>
							<td colspan="3" width="219"><input type='text'
								style="width:100%; height:30px; background:#e9e3e3"
								name="subpackageName"/></td>
							<td colspan="4" width="176" style="text-align:center">分包项目</td>
							<td colspan="2" width="198"><input type='text'
								style="width:100%; height:30px; background:#e9e3e3"
								name="subProject" /></td>
						</tr>
						<tr>
							<td rowspan="2" width="46" style="text-align:center">报 告</td>
							<td width="73" style="text-align:center">交付方式</td>
							<td colspan="9" width="593">&nbsp;&nbsp;&nbsp;&nbsp;<input
								type='radio' name="paymentWay" id="payWay1" value="自取" /><label
								for="payWay1">自取</label>      <input type='radio'
								name="paymentWay" id="payWay2" value="挂号邮寄" checked="checked" /><label
								for="payWay2">挂号邮寄</label>      <input type='radio'
								name="paymentWay" id="payWay3" value="其他" /><label
								for="payWay3">其他</label>
							</td>
						</tr>
						<tr>
							<td width="73" style="text-align:center">完成时间</td>
							<td width="93"><input type='text'
								style="width:100%; height:30px; background:#e9e3e3"
								name="deadLine"  onfocus="WdatePicker({minDate:'%y-%M-{%d+1}'})"
								class="required" /></td>
							<td colspan="2" width="126" style="text-align:center">监测费用(￥)</td>
							<td colspan="3" width="374"><input type='text'
								style="width:100%; height:30px; background:#e9e3e3" name="cost"
								class="required decimal"/></td>
							<td colspan="3" width="374" id="paymentChinese">零元整</td>
						</tr>
						<tr>
							<td rowspan="2" width="46" style="text-align:center">客户<br />要求
							</td>
							<td colspan="10" width="666">&nbsp;&nbsp;&nbsp;&nbsp;是否需要进入本实验室监视与本次委托有关的检测活动:&nbsp;&nbsp;&nbsp;&nbsp;<input
								id="needView" name="inRoom" type="radio" value="1" /><label
								for="needView">&nbsp;需要</label>&nbsp;&nbsp;&nbsp;&nbsp;<input
								id="notneedView" name="inRoom" type="radio" value="0"
								checked="checked" /><label for="notneedView">&nbsp;不需要</label>
							</td>
						</tr>
						<tr>
							<td colspan="10" width="666">&nbsp;&nbsp;&nbsp;&nbsp;是否需要本实验室对本次委托有关资料保密：检测活动:&nbsp;&nbsp;&nbsp;&nbsp;<input
								id="needSec" name="secrecy" type="radio" value="1"
								checked="checked" /><label for="needSec">&nbsp;需要</label>&nbsp;&nbsp;&nbsp;&nbsp;<input
								id="needSec2" name="secrecy" type="radio" value="0" /><label
								for="needSec2">&nbsp;不需要</label></td>
						</tr>
						<tr>
							<td width="46" style="text-align:center">其他</td>
							<td colspan="10" width="666">其他约定或说明：<br /> <textarea
									name="other" rows=""
									style="width:99%; height:50px; margin:10px;background:#e9e3e3" ></textarea>
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
								value="邦达诚环境监测中心（江苏）有限公司"
								style="width:100%; height:30px; background:#e9e3e3"
								name="entrusted" class="required" /></td>
							<td colspan="2" width="88" style="text-align:center">邮编</td>
							<td colspan="3" width="242"><input type='text'
								value="213022"
								style="width:100%; height:30px; background:#e9e3e3"
								name="entrustedCode" class="required" /></td>
						</tr>
						<tr>
							<td width="73" style="text-align:center">地  址</td>
							<td colspan="4" width="263"><input type='text'
								value="常州市新北区环保产业园环保一路2号"
								style="width:100%; height:30px; background:#e9e3e3"
								name="entrustedAddress" class="required" /></td>
							<td colspan="2" width="88" style="text-align:center">电话</td>
							<td colspan="3" width="242"><input type='text'
								value="0519-89802621"
								style="width:100%; height:30px; background:#e9e3e3"
								name="entrustedTel" class="required" /></td>
						</tr>
						<tr>
							<td width="73" style="text-align:center">承办人</td>
							<td colspan="4" width="263"><label
								style="padding-left: 10px;">${ContractorsId }</label></td>
							<td colspan="2" width="88" style="text-align:center">传真</td>
							<td colspan="3" width="242"><input type='text'
								value="0519-89802605"
								style="width:100%; height:30px; background:#e9e3e3"
								name="entrustedFax" class="required" /></td>
						</tr>
					
					</table>
					<input type="text" name="str" id="itemTemp" />
				</form>
			</div>
			<div id="tab2" class="tabson">
				<ul class="toolbar" style="width: 100%">
					<li class="click" id="createServiceContract"><span><img
							src="images/t10.png" /></span>生成合同</li>
					<li class="click" id="reWriteService"><span><img
							src="images/t01.png" /></span>重新起草</li>

				</ul>
				<h2 style="text-align:center; font-size:16px;">环 境 监 测 服 务 合 同</h2>
				<h2
					style="text-align:right; font-size:14px; margin:10px; padding-right:100px">
					编号：<label style="width:100px">保存合同时生成编号！</label>
				</h2>

				<form action="" id="serviceForm" method="post">
					<table cellspacing="0" cellpadding="0" id="serviceTable">
						<col width="72" span="3" />
						<col width="93" />
						<col width="72" span="2" />
						<col width="96" />
						<col width="72" span="2" />
						<tr>
							<td width="72" style="text-align:center;padding:10px 0;">项目名称</td>
							<td colspan="8" width="621"><input type="text"
								style="width:99.5%; height:40px; background:#e9e3e3" name="name"
								class="required" data-alert="项目名称" /></td>
						</tr>
						<tr>
							<td align="center" width="72"
								style="text-align:center;padding:10px 0; height:100px">项目内容及<br />技术要求
							</td>
							<td colspan="8"><textarea name="context" rows=""
									style="width:99.5%; height:100px;background:#e9e3e3"></textarea></td>
						</tr>
						<tr>
							<td align="center" width="72"
								style="text-align:center;padding:10px 0;  height:100px">委托方的职责<br />（甲方）
							</td>
							<td colspan="8" width="621"><textarea name="clientResp"
									rows="" style="width:99.5%; height:100px;background:#e9e3e3">提供原辅材料用量、利用率,提供生产工艺流程及污染物排放情况,提供用水用煤等情况,提供污染物方案及对策,提供良好的监测条件。</textarea></td>
						</tr>
						<tr>
							<td align="center" width="72"
								style="text-align:center;padding:10px 0;  height:100px">服务方的职责<br />（乙方）
							</td>
							<td colspan="8" width="621"><textarea name="serviceResp"
									rows="" style="width:99.5%; height:100px;background:#e9e3e3">提供本地区环境质量状况,加以说明。
提供建设项目环境影响报告表。</textarea></td>
						</tr>
						<tr>
							<td align="center" width="90"
								style="text-align:center;padding:20px 0;">项目完成期限及<br />咨询费用
							</td>
							<td colspan="8" width="621">甲方及时支付乙方技术咨询服务费，乙方在收到服务费和甲方提供完整﹑真实的相关项目资料后
								<input type="text"
								style="width:50px; height:20px; background:#e9e3e3;"
								name="times" data-alert="报告提交时间" class="required" />个工作日之内完成环境影响报告表。<br />
								甲方付乙方技术咨询服务费:                  (￥<input type="text"
								style="width:50px; height:20px; background:#e9e3e3;" name="cost"
								data-alert="费用" class="required" />元) <br />
							</td>
						</tr>
						<tr>
							<td colspan="3"
								style="border-bottom:1px solid #FFF;vertical-align:top;">
								<div>
									<label>委托方：</label> <input name="client" type="text"
										style="width:100%; height:30px; background:#e9e3e3;"
										data-alert="委托方" class="required" />
								</div>
								<div>
									<label>地&nbsp;&nbsp;&nbsp;址：</label> <input
										name="clientAddress" type="text"
										style="width:100%; height:30px; background:#e9e3e3;"
										data-alert="委托方地址" class="required" />
								</div>
								<div>
									<label>电&nbsp;&nbsp;&nbsp;话：</label> <input name="clientTel"
										type="text"
										style="width:100%; height:30px; background:#e9e3e3;"
										data-alert="委托方电话" class="required" />
								</div>
								</div>
							</td>
							<td colspan="3"
								style="border-bottom:1px solid #FFF;vertical-align:top;">
								<div>
									<label>服务方：</label> <input name="service" type="text"
										style="width:100%; height:30px; background:#e9e3e3;"
										data-alert="服务方" class="required" />
								</div>
								<div>
									<label>地&nbsp;&nbsp;&nbsp;址：</label> <input
										name="serviceAddress" type="text"
										style="width:100%; height:30px; background:#e9e3e3;"
										data-alert="服务方地址" class="required" />
								</div>
								<div>
									<label>电&nbsp;&nbsp;&nbsp;话：</label> <input name="serviceTel"
										type="text"
										style="width:100%; height:30px; background:#e9e3e3;"
										data-alert="服务方电话" class="required" />
								</div>
								<div>
									<label>开户银行：</label> <input type="text" name="serviceBank"
										style="width:100%; height:30px; background:#e9e3e3;"
										data-alert="开户银行" class="required" />
								</div>
								<div>
									<label>账&nbsp;&nbsp;&nbsp;号：</label> <input type="text"
										name="serviceCard"
										style="width:100%; height:30px; background:#e9e3e3;"
										data-alert="开户银行账号" class="required" />
								</div>
							</td>
							<td colspan="3"
								style="border-bottom:1px solid #FFF;vertical-align:top;">
								<div>
									<label>项目承担单位：</label> <input type="text" name="bearUnit"
										style="width:100%; height:30px; background:#e9e3e3;"
										data-alert="项目承担单位" class="required" />
								</div>
								<div>
									<label>地&nbsp;&nbsp;&nbsp;址：</label> <input type="text"
										name="bearUnitAddress"
										style="width:100%; height:30px; background:#e9e3e3;"
										data-alert="项目承担单位地址" class="required" />
								</div>
								<div>
									<label>电&nbsp;&nbsp;&nbsp;话：</label> <input type="text"
										name="bearUnitTel"
										style="width:100%; height:30px; background:#e9e3e3;"
										data-alert="项目承担单位电话" class="required" />
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
									<label style="float:left">项目负责人：</label><label
										style="float:right">签字&nbsp;&nbsp;（盖章）</label>
								</div>
								<div>
									<label style="float:right">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;
									</label>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
