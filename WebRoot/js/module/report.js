$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	
	$('.viewProjectBook').click(function() {
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看合同任务书',
			url : 'contractManage_projectBook_viewProjectBook.action?viewId=' + id,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	
	$('.viewSelfSendInfo').click(function() {
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看样品信息',
			url : 'selfSendSampleInfo_selfSendSampleInfo_viewPage.action?viewId=' + id,
			width : 1100,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.viewNonSelfSendInfo').click(function() {
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看样品信息',
			url : 'nonSelfSendSample_nonSelfSendSample_viewPage.action?viewId=' + id,
			width : 1100,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	
	$('.viewDeliveryReceitp').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看交联单信息',
			url : 'selfSendSampleInfo_deliveryReceitp_viewPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.viewNonDeliveryReceitp').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看交联单信息',
			url : 'nonSelfSendSample_deliveryReceitp_viewPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.viewInspectionSheet').click(function(){
		var typeNum = $(this).data("type");// 送检单的类型
		var itemId = $(this).data("id");// 监测项目的id
		var viewId = $(this).data("projectid");
		if (typeNum == 0) {
			asyncbox
					.open({// 水质
						title : '水质样品送检单',
						top:0,
						url : 'selfSendSampleInfo_inspectionSheet_viewWaterDetailPage.action?viewId='
								+ viewId
								+ '&itemId='
								+ itemId,
						width : 1100,
						height : 700,
						btnsbar : $.btn.CANCEL,
					});
		}
		if (typeNum == 1) {
			asyncbox
					.open({// 土壤
						title : '土壤、底质样品送检单',
						top:0,
						url : 'selfSendSampleInfo_inspectionSheet_viewSoilDetailPage.action?viewId='
								+ viewId
								+ '&itemId='
								+ itemId,
								width : 1100,
								height : 700,
						btnsbar : $.btn.CANCEL,
					});
		}
		if (typeNum == 2) {
			asyncbox
					.open({// 固定污染源
						title : '固定污染源有组织废气样品送检单',
						top:0,
						url : 'selfSendSampleInfo_inspectionSheet_viewSolidDetailPage.action?viewId='
								+ viewId
								+ '&itemId='
								+ itemId,
								width : 1100,
								height : 700,
						btnsbar : $.btn.CANCEL,
					});
		}
		if (typeNum == 3) {// 环境空气
			asyncbox
					.open({
						title : '环境空气和无组织废气样品送检单',
						top:0,
						url : 'selfSendSampleInfo_inspectionSheet_viewAirDetailPage.action?viewId='
								+ viewId
								+ '&itemId='
								+ itemId,
								width : 1100,
								height : 700,
						btnsbar : $.btn.CANCEL,
					});
		}
	});
	$('.viewRecordAudit').on('click',function(){
		var id = $(this).attr("data-projectId");
		asyncbox.open({
			title : '查看实验分析审核记录',
			url : 'resultAudit_resultAudit_viewPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.viewHistoryAudit').on("click",function(){
		var id = $(this).attr("data-projectId");
		asyncbox.open({
			title : '查看历史审核记录',
			url : 'report_report_viewHistoryAudit.action?viewId=' + id,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
		
	});
	$('.viewQualityControl').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看质量控制统计信息',
			url : 'qualityControl_qualityControl_viewPage.action?viewId=' + id,
			width : 1100,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	
	$('.createReport').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '创建报告',
			url : 'report_report_addPage.action?viewId=' + id,
			width : 1500,
			height : 750,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
				if(action=='close'){
					window.location.reload();
				}
				if(action=='cancel'){
					window.location.reload();
				}
			}
		});
	});
	
	$('.setReportCover').on('click',function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '创建报告封面',
			url : 'report_report_addCoverPage.action?viewId=' + id,
			width : 1500,
			height : 750,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
				if(action=='close'){
					window.location.reload();
				}
				if(action=='cancel'){
					window.location.reload();
				}
			}
		});
	});
	
	$('.viewReportCover').on('click',function(){
		var id=$(this).attr("data-id");
		asyncbox.open({
			title : '查看报告封面',
			url : 'report_report_viewCoverPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	
	$('.viewReportAudit').on('click',function(){
		var id=$(this).attr("data-id");
		asyncbox.open({
			title : '查看报告审核记录',
			url : 'reportAudit_reportAudit_viewPage.action?viewId=' + id,
			width : 1100,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	})
	
	$('.deleteReportCover').on('click',function(){
		var id=$(this).attr("data-id");
		asyncbox.confirm('是否删除该合同封面？', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"report_report_deleteReportCover.action",
					data:{'viewId':id},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert('删除成功 !', '删除结果',function(){
								window.location.reload();
							});	
						}
						if(json.info=="failed"){
							asyncbox.error('删除失败，请刷新页面之后重新尝试！', '删除结果');
						}
					}
				});
			}
		});
	})
	
	$('.flow').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('您即将流转该项目，请注意以下事项：<br/> 1.请确认您已正确上传监测报告，流转之后无法修改。<br/>2.您至少需要上传一份合同报告。<br/>3.系统会自动为您的每一个《监测报告》生成一个对应的《监测报告报表审核签发记录表》，并进入流程流转。<br/>4.您可以在"项目列表"功能中查看已经流转的项目。','警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"report_report_flow.action",
					data:{'viewId':id},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("项目流转成功！", '结果',function(){
								window.location.reload();
							});						
						}
						if(json.info=="failed"){
							asyncbox.error("项目流转失败，请刷新之后重新尝试！", '结果');
						}
						if(json.info=="noone"){
							asyncbox.error("对不起，您至少需要生成一份报告！", '结果');
						}
						if(json.info=="nooneCover"){
							asyncbox.error("对不起，编号为"+json.identify+"的报告尚未创建报告封面，无法流转！", '结果');
							
						}
						return false;
					}
				});
			}
		});
	});
	
	

	
	$('.downRecord').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.open({
			title : '查看原始记录表',
			url : 'detectionResult_detectionResult_viewPage.action?viewId=' + id,
			width : 1100,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.viewReport').on('click',function(){
		var id=$(this).attr("data-id");
		asyncbox.open({
			title : '查看报告',
			url : 'report_report_viewPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	
	$('.changeReport').on('click',function(){
		var id=$(this).attr("data-id");
		var projectId=$(this).attr("data-projectId");
		asyncbox.open({
			title : '修改报告',
			url : 'report_report_changePage.action?viewId=' + id+"&projectId="+projectId,
			width : 1500,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	
	$('.deleteReport').on('click',function(){
		var id=$(this).attr("data-id");
		asyncbox.confirm('是否删除该合同？删除该合同将失去该流水号！', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"report_report_deleteReport.action",
					data:{'viewId':id},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert('删除成功 !', '删除结果',function(){
								window.location.reload();
							});	
						}
						if(json.info=="failed"){
							asyncbox.error('删除失败，请刷新页面之后重新尝试！', '删除结果');
						}
					}
				});
			}
		});
	});
	
	
	$('.export').click(function(){
		var viewId=$(this).attr('data-projectId');
		var itemId=$(this).attr("data-id");
		asyncbox.confirm('是否下载该送检单？', '警告', function(action) {　
			if (action == 'ok') {
				window.location.href="selfSendSampleInfo_inspectionSheet_export.action?viewId="+viewId+"&itemId="+itemId;
			}　　　　　
		});
	});
	$('.model').click(function(){
		asyncbox.open({
			title : '查看原始记录表',
			url : 'commonTemplet_commonTemplet_choosePage.action?type=0',
			width : 850,
			height : 500,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	function testMessage() {
		asyncbox
				.open({
					title : '消息队列',
					url : 'mainPage_showMessageQueue.action',
					width : 520,
					height : 500,
					btnsbar : [ {
						text : '全部忽略',
						action : 'delete'
					} ].concat($.btn.CANCEL),
					callback : function(action, opt) {
						if (action == 'delete') {
							$
									.ajax({
										url : "pushMessage_ignoreMessageAll.action",
										async : false,
										success : function(data) {
											var json = eval('(' + data + ')');
											if (json.info == "success") {
												asyncbox.alert('全部忽略成功 !',
														'忽略结果');
												window.parent.parent.frames["topFrame"].location
														.reload();
											}
										}
									});
						}
					}
				});
	}
	document.testMessage = testMessage;
});