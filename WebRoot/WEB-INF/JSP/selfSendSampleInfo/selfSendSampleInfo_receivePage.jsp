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

<title>查看自送样登记表</title>

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
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script src="js/paging-V1.3-final.js" type="text/javascript"
	charset="utf-8"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="css/My97DatePicker/WdatePicker.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.qrcode.js"></script>
<script type="text/javascript" src="js/qrcode.js"></script>
</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle" style="width: 950px">
			<span>质量控制统计表</span>
		</div>
		<table class="tablelist" style="width: 950px">
			<tr style="border: 1px solid black;">
				<td width="47" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>序号 </strong>
					</p></td>
				<td width="136" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>分析项目名称 </strong>
					</p></td>
				<td width="81" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>样品数 </strong>
					</p></td>
				<td width="94" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>现场平行样(个)</strong>
					</p></td>
				<td colspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>实验室平行样 </strong>
					</p></td>
				<td colspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>加标回收样 </strong>
					</p></td>
				<td width="100" rowspan="2" style="border: 1px solid black"><p
						align="center">
						<strong>盲样(个)</strong>
					</p></td>
			</tr>
			<tr style="border: 1px solid black">
				<td width="130" style="border: 1px solid black"><p
						align="center">
						<strong>个数 </strong>
					</p></td>
				<td width="132" style="border: 1px solid black"><p
						align="center">
						<strong>样品编号 </strong>
					</p></td>
				<td width="102" style="border: 1px solid black"><p
						align="center">
						<strong>个数 </strong>
					</p></td>
				<td width="118" style="border: 1px solid black"><p
						align="center">
						<strong>样品编号 </strong>
					</p></td>
			</tr>
			<s:iterator value="#qualityControlList" id="q" status="L">
				<tr style="border: 1px solid black">
					<td width="47" valign="top" style="border: 1px solid black"><p
							align="center">${L.index+1 }</p></td>
					<td width="136" valign="top" style="border: 1px solid black"><p
							align="center">${q.analysisProject.name }</p></td>
					<td width="81" valign="top" style="border: 1px solid black"><p
							align="center">${q.sampleNum }</p></td>
					<td width="94" valign="top" style="border: 1px solid black"><p
							align="center">${q.parallelSample }</p></td>
					<td width="130" valign="top" style="border: 1px solid black"><p
							align="center">${q.laboratorySampleNum }</p></td>
					<c:if test="${not empty laboratorySampleIdentifys }">
						<td width="132" valign="top" style="border: 1px solid black"><p
								align="center">${q.laboratorySampleIdentifys }</p></td>
					</c:if>
					<c:if test="${empty laboratorySampleIdentifys}">
					<td width="132" valign="top" style="border: 1px solid black"><p
								align="center"></p></td>
					</c:if>
					<td width="102" valign="top" style="border: 1px solid black"><p
							align="center">${q.spikedRecoverySampleNum }</p></td>

					<c:if test="${not empty spikedSampleIdentifys }">
						<td width="132" valign="top" style="border: 1px solid black"><p
								align="center">${q.spikedSampleIdentifys }</p></td>
					</c:if>
					<c:if test="${ empty spikedSampleIdentifys }">
						<td width="132" valign="top" style="border: 1px solid black"><p
								align="center"></p></td>
					</c:if>

					<td width="100" valign="top" style="border: 1px solid black"><p
							align="center">${q.blindSample }</p></td>
				</tr>
			</s:iterator>
		</table>
	</div>



	<div class="formbody">
		<div class="formtitle" style="width: 950px">
			<span>自送样记录</span>
		</div>
		<table class="tablelist" id="receiveTable" style="width: 950px">
			<thead>
				<tr>
					<th style="text-align: center;">样品编号</th>
					<th style="text-align: center;">样品名称</th>
					<th style="text-align: center;">样品状态</th>
					<th style="text-align: center;">测试项目</th>
					<th style="text-align: center;">备注</th>
					<th style="text-align: center;">状态</th>
					<th style="text-align: center;">操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#selfSendSampleInfoList" id="s" status="L">
					<tr>
						<td style="text-align: center;">${s.identify }</td>
						<td style="text-align: center;">${s.sampleName }</td>
						<td style="text-align: center;">${s.sampleState }</td>
						<td ><s:iterator
								value="#s.analysisProjectSet" id="it">
									${it.name },
							</s:iterator></td>
						<td style="text-align: center;">${s.other }</td>
						<td style="text-align: center;"><c:if test="${s.deliver=='0' }">
								未接收
							</c:if> <c:if test="${s.deliver=='1' }">
								已接收
							</c:if></td>
						<td style="text-align: center;"><c:if test="${s.deliver=='0' }">
								<a href="javascript:;" data-id="${s.id }" class="tablelink receiveItem">接收</a>
								<a href="javascript:;" data-id="${s.id }" class="tablelink receiveBackItem" style="display: none;">取消接收</a>
							</c:if>
							<c:if test="${s.deliver=='1' }">
							<a href="javascript:;" data-id="${s.id }" class="tablelink receiveItem" style="display: none;">接收</a>
								<a href="javascript:;" data-id="${s.id }" class="tablelink receiveBackItem">取消接收</a>
							</c:if></td>
					</tr>
				</s:iterator>

			</tbody>
		</table>
	</div>
	<div class="formbody">
		<div class="formtitle" style="width: 950px">
			<span>自送样信息</span>
		</div>

		<ul class="forminfo">
			<li><label>送样单位</label><label class="viewLabel">${client
					}</label></li>
			<li><label>送样日期</label><label class="viewLabel">${nowDate
					}</label></li>
			<li><label>记录人</label><label class="viewLabel">${userName
					}</label></li>
		</ul>


	</div>
</body>
<script type="text/javascript">
	$('.receiveItem').on('click',function(){
		var identify=$(this).parent().siblings('td:eq(0)').html();
		var id=$(this).data("id");
		var me=$(this);
		asyncbox.confirm('是否接收编号为'+identify+'的样品？', '提示', function(action) {
			if (action == 'ok') {
				$.ajax({
					url : "sampleTransfer_sampleTransfer_receiveItem.action",
					data : {
						'viewId' : id,
					},
					async : false,
					success : function(data) {
						var json = eval('(' + data + ')');
						if (json.info == "success") {
							asyncbox.alert('编号为'+identify+'的样品接收成功 !', '结果', function() {
								me.parent().prev().html('已接收');
								me.siblings('.receiveBackItem').show();
								me.hide();
							});
						}
						if(json.info=='failed') {
							asyncbox.error('样品接收失败，请刷新页面之后重新尝试！', '结果');
						}
					}
				});
			}
		});
	});
	$('.receiveBackItem').on('click',function(){
		var identify=$(this).parent().siblings('td:eq(0)').html();
		var id=$(this).data("id");
		var me=$(this);
		asyncbox.confirm('是否取消接收编号为'+identify+'的样品？', '提示', function(action) {
			if (action == 'ok') {
				$.ajax({
					url : "sampleTransfer_sampleTransfer_receiveBackItem.action",
					data : {
						'viewId' : id,
					},
					async : false,
					success : function(data) {
						var json = eval('(' + data + ')');
						if (json.info == "success") {
							asyncbox.alert('编号为'+identify+'的样品取消接收成功 !', '结果', function() {
								me.parent().prev().html('未接收');
								me.siblings('.receiveItem').show();
								me.hide();
								
							});
						}
						if(json.info=='failed') {
							asyncbox.error('样品取消接收失败，请刷新页面之后重新尝试！', '结果');
						}
					}
				});
			}
		});
	});
</script>
</html>
