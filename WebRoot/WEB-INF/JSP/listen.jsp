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

<title>密码修改</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.form.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$('#save').click(function(){
			asyncbox.confirm('是否保存当前监听对象？', '警告', function(action) {
				if (action == 'ok') {
					$.ajax({
						url:"mainPage_listenSetting.action",
						data:$('#listenChange').serialize(), 
						async:false,
						success:function(data){
							var json = eval('('+data+')');
							if(json.info=="success"){
								asyncbox.alert('保存成功 !', '删除结果',function(){
									window.location.reload();
								});
								
							}else{
								asyncbox.error('保存失败，请刷新页面之后重新尝试！', '删除结果');
							}
						}
					});
				}
			});
		});
	});
</script>
</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li>设置监听</li>
		</ul>
	</div>

	<div class="formbody">

		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">设置监听对象</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<div class="formbody">
					<b>监听对象：系统会根据您设置的监听对象，周期性的向您推送您的工作任务！</b>
					<form action="userPWDManage_userPWD_change.action"
						id="listenChange">
						<table class="tablelist" style="width: 800px; margin: 20px;">
							<tr>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj1" value="1"><label for="obj1">&nbsp;项目样品交接</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj2" value="2"><label for="obj2">&nbsp;任务分配下达</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj3" value="3"><label for="obj3">&nbsp;检测结果填写</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj4" value="4"><label for="obj4">&nbsp;检测结果复核</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj5" value="5"><label for="obj5">&nbsp;检测结果审核</label></td>
							</tr>
							<tr>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj6" value="6"><label for="obj6">&nbsp;合同报告编制</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj7" value="7"><label for="obj7">&nbsp;报告编制审核</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj8" value="8"><label for="obj8">&nbsp;报告签发审核</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj9" value="9"><label for="obj9">&nbsp;报告签收发放</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj10" value="10"><label
									for="obj10">&nbsp;质量控制统计</label></td>
							</tr>
							<tr>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj11" value="11"><label
									for="obj11">&nbsp;实验分析审核</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj12" value="12"><label
									for="obj12">&nbsp;监测报告审核</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj13" value="13"><label
									for="obj13">&nbsp;合同评审</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj14" value="14"><label
									for="obj14">&nbsp;任务下达</label></td>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj15" value="15"><label
									for="obj15">&nbsp;自送样登记</label></td>

							</tr>
							<tr>
								<td style="height: 50px;"><input type="checkbox"
									name="listenObj" id="obj16" value="16"><label
									for="obj16">&nbsp;现场采样登记</label></td>
							</tr>
						</table>
						<input type="button" class="btn" id="save" style="margin: 20px;"
							value="保存设置">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
