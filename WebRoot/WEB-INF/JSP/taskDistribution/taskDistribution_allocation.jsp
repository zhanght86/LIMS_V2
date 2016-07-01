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

<title>任务分配</title>

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

</head>

<body class="common">
	<div class="formbody">
		<div class="formtitle" style="width: 900px">
			<span>任务人员分配</span>
		</div>
		<form action="" id="deliveryAdd">
			<ul class="forminfo">
				<li><input type="hidden" id="projectId" value="${projectId }" /> </li>
				<li><label >实验室分析员</label>
					<div class="vocation">
						<textarea rows="" cols="" class="textinput" placeholder="点击选择实验分析人员"></textarea>
					</div></li>
				
			</ul>
		</form>
	</div>
	
	<script type="text/javascript">
		$(function() {
			$(".select3").uedSelect({
				width : 350
			});
			$('#type').change(function(){
				var index=$(this).find('option:selected').val();
				if(index==2){
					$('#status').hide();
					$('#projectItem').prop('value',"");
					$('#projectItemHide').prop('value',""); 
				}else{
					$('#status').show();
					$('#projectItem').prop('value',"");
					$('#projectItemHide').prop('value',""); 
				}
			});
			$('#sampleId').click(function(){
				var id=$('#projectId').prop("value");
				asyncbox.open({
					title: '选择样品信息',
					url: 'selfSendSampleInfo_selfSendSampleInfo_choosePage.action?viewId='+id,
					width: 650,
					height: 600,
					btnsbar: [{
						text: '选　择', 
						action: 'ok' 
					}].concat($.btn.CANCEL),
					callback: function(action,opt){
						if (action == 'ok') {
							var oTable=opt.document.getElementById("selfSendSampleInfoTable");
							var $_oTable=$(oTable);
							var str="";
							var ids="";
							var oChecks=$_oTable.find('tbody input[type=checkbox]:checked');
							var nowIndex=0;
							oChecks.each(function(){
								var text=$(this).parents('td').next().next().html();
								var id=$(this).parents('td').next().attr("data-id");
								if(nowIndex==oChecks.length-1){
									str+=text;
								}else{
									str+=text+",";
								}
								nowIndex++;
								ids+=id+",";
							});
							$('#sampleId').prop('value',str);
							$('#sampeHide').prop('value',ids);
						}
					}
				});
			});
			
			$('#projectItem').click(function(){
				var type = $('#type').find('option:selected').index();
				asyncbox.open({
					title: '选择监测项目信息',
					url: 'analysisProject_analysisProject_choosePage.action?viewId='+type,
					width: 650,
					height: 600,
					btnsbar: [{
						text: '选　择', 
						action: 'ok' 
					}].concat($.btn.CANCEL),
					callback: function(action,opt){
						if (action == 'ok') {
							var oTable=opt.document.getElementById("analysisProjectTable");
							var $_oTable=$(oTable);
							var str="";
							var ids="";
							var oChecks=$_oTable.find('tbody input[type=checkbox]:checked');
							var nowIndex=0;
							oChecks.each(function(){
								var text=$(this).parents('td').next().html();
								var id=$(this).parents('td').attr("data-id");
								if(nowIndex==oChecks.length-1){
									str+=text;
								}else{
									str+=text+",";
								}
								nowIndex++;
								ids+=id+",";
							});
							$('#projectItem').prop('value',str);
							$('#projectItemHide').prop('value',ids); 
						}
					}
				});
			});
		});
	</script>
</body>
</html>
