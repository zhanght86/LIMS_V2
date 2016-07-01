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
	$('.viewInspectionSheet').click(function(){
		var id = $(this).attr("data-id");
		var type=$(this).attr("data-type");
		if(type==0){
			asyncbox.open({// 水质
				title : '水质样品送检单',
				url : 'selfSendSampleInfo_inspectionSheet_viewWaterDetailPage.action?viewId=' + id,
				width : 650,
				height : 600,
				btnsbar : $.btn.CANCEL,
				callback : function(action, opt) {
					if(action=='cancel'){
						window.location.reload();
					}
					if(action=='close'){
						window.location.reload();
					}
				}
			});
		}
		if(type==1){
			asyncbox.open({// 土壤
				title : '土壤、底质样品送检单',
				url : 'selfSendSampleInfo_inspectionSheet_viewSoilDetailPage.action?viewId=' + id,
				width : 850,
				height : 600,
				btnsbar : $.btn.CANCEL,
				callback : function(action, opt) {
					if(action=='cancel'){
						window.location.reload();
					}
					if(action=='close'){
						window.location.reload();
					}
				}
			});
		}
		if(type==2){
			asyncbox.open({// 固定污染源
				title : '固定污染源有组织废气样品送检单',
				url : 'selfSendSampleInfo_inspectionSheet_viewSolidDetailPage.action?viewId=' + id,
				width : 950,
				height : 600,
				btnsbar : $.btn.CANCEL,
				callback : function(action, opt) {
					if(action=='cancel'){
						window.location.reload();
					}
					if(action=='close'){
						window.location.reload();
					}
				}
			});
		}
		if(type==3){// 环境空气
			asyncbox.open({
				title : '环境空气和无组织废气样品送检单',
				url : 'selfSendSampleInfo_inspectionSheet_viewAirDetailPage.action?viewId=' + id,
				width : 850,
				height : 600,
				btnsbar : $.btn.CANCEL,
				callback : function(action, opt) {
					if(action=='cancel'){
						window.location.reload();
					}
					if(action=='close'){
						window.location.reload();
					}
				}
			});
		}
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
	$('.auditReport').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.confirm('是否接收该监测报告？若您想再次下载监测报告，请前往项目列表下载', '提示', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"reportReceipt_reportReceipt_refer.action",
					data:{'viewId':id},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("您已成功接收该监测报告！", '结果',function(){
								window.location.reload();
							});
						};
						if(json.info=="successAll"){
							asyncbox.alert("您已成功接收该监测报告，当前合同所有流程已经完成！", '结果',function(){
								window.location.reload();
							});
						};
						if(json.info=="failed"){
							asyncbox.alert("接收监测报告失败,请刷新页面之后重新尝试!", '结果');
						};
						return false;
					}
				});
			}
		});
	});
	$('.downReport').click(function(){
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
	$('.downReportAudiit').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看报告审核记录',
			url : 'reportAudit_reportAudit_viewPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	})

	
	
	
	$('.downRecord').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.confirm('是否下载该原始记录表？', '警告', function(action) {　
			if (action == 'ok') {
				window.location.href="detectionResult_detectionResult_export.action?viewId="+id;
			}　　　　　
		});
	});
	$('.export').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.confirm('是否下载该送检单？', '警告', function(action) {　
			if (action == 'ok') {
				window.location.href="detectionResult_detectionResult_exportInspectionSheet.action?viewId="+id;
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