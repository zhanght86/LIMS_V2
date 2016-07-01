$(function() {
	$('.viewContract')
			.click(
					function() {
						var id = $(this).attr("data-id");
						var type = $(this).attr("data-type");
						if (type == 0) {
							asyncbox
									.open({
										title : '查看业务合同',
										url : 'contractManage_contractList_viewTContract.action?viewId='
												+ id,
										top:0,
										width : 1100,
										height : 600,
										btnsbar : $.btn.CANCEL,
										callback : function(action, opt) {
										}
									});
						}
						if (type == 1) {
							asyncbox
									.open({
										title : '查看服务合同',
										url : 'contractManage_contractList_viewSContract.action?viewId='
												+ id,
										width : 1100,
										top:0,
										height : 600,
										btnsbar : $.btn.CANCEL,
										callback : function(action, opt) {
										}
									});
						}
					});
	
	$('.exportContract').click(function(){
		var id=$(this).attr("data-id");
		var type = $(this).attr("data-type");
		asyncbox.confirm('是否下载该合同？', '警告', function(action) {　
			if (action == 'ok') {
				if(type==0){
					window.location.href="contractManage_contract_export.action?viewId="+id;
				}
				if(type==1){
					// window.location.href="contractManage_serviceContract_exportSContract.action?viewId="+id;
				}
			}
		});
	});
	$('.viewProjectBook').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看合同任务书',
			url : 'contractManage_projectBook_viewProjectBook.action?viewId=' + id,
			width : 1100,
			top:0,
			height : 600,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.exportProjectBook').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('是否下载该任务书？', '警告', function(action) {　
			if (action == 'ok') {
				window.location.href="contractManage_projectBook_export.action?viewId="+id;
			}
		});
	});
	$('.viewSampling').click(function(){
		var id = $(this).attr("data-id");
		var type = $(this).attr("data-type");
		if(type==0){
			asyncbox.open({
				title : '查看样品信息',
				url : 'selfSendSampleInfo_selfSendSampleInfo_receivePage.action?viewId=' + id,
				width : 700,
				top:0,
				height : 550,
				btnsbar : $.btn.CANCEL,
				callback : function(action, opt) {
				}
			});
		}
		if(type==1){
			asyncbox.open({
				title : '查看样品信息',
				url : 'nonSelfSendSample_nonSelfSendSample_receivePage.action?viewId=' + id,
				width : 700,
				top:0,
				height : 550,
				btnsbar : $.btn.CANCEL,
				callback : function(action, opt) {
				}
			});
		}
		
		
	});
	$('.exportSampling').click(function(){
		var id = $(this).attr("data-id");
		var type = $(this).attr("data-type");
		if(type==0){
			asyncbox.open({
				title : '查看样品信息',
				url : 'selfSendSampleInfo_selfSendSampleInfo_viewPage.action?viewId=' + id,
				width : 1100,
				height : 550,
				top:0,
				btnsbar : $.btn.CANCEL,
				callback : function(action, opt) {
				}
			});
		}
		if(type==1){
			asyncbox.open({
				title : '查看样品信息',
				url : 'nonSelfSendSample_nonSelfSendSample_viewPage.action?viewId=' + id,
				width : 1100,
				height : 550,
				top:0,
				btnsbar : $.btn.CANCEL,
				callback : function(action, opt) {
				}
			});
		}
	});
	$('.viewDeliveryReceitp').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看交联单信息',
			url : 'selfSendSampleInfo_deliveryReceitp_viewPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			top:0,
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
			top:0,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.viewInspection').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.open({
			title : '查看送检单单信息',
			url : 'selfSendSampleInfo_inspectionSheet_viewPage.action?viewId=' + id,
			top:0,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.downRecord').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.confirm('是否下载该原始记录表？', '警告', function(action) {　
			if (action == 'ok') {
				window.location.href="detectionResult_detectionResult_export.action?viewId="+id;
			}　　　　　
		});
	});
	$('.viewOther').click(function(){
		var other=$(this).attr('data-other');
		asyncbox.alert("备注:"+other,"备注");
	})
	$('.exportQualityControl').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看质量控制统计信息',
			url : 'qualityControl_qualityControl_viewPage.action?viewId=' + id,
			width : 1100,
			height : 700,
			top:0,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
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
			top:0,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.downReportAudiit').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.open({
			title : '查看报告审核记录',
			url : 'reportAudit_reportAudit_viewPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			top:0,
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
			top:0,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.exportResultAudit').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.open({
			title : '查看实验分析审核记录',
			url : 'resultAudit_resultAudit_viewPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			top:0,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	})
	$('.viewContractAudit').click(function(){
		var id = $(this).attr("data-id");
		asyncbox
				.open({
					title : '查看合同审核记录',
					url : 'contractManage_contractAudit_viewPage.action?viewId='
							+ id,
					width : 800,
					top:0,
					height : 600,
					btnsbar : $.btn.CANCEL
				});
	});
	$('.exportContractAudit').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('是否将服务合同评审记录表导出为Word格式？', '警告', function(action) {　
			if (action == 'ok') {
				window.location.href="contractManage_contractAudit_export.action?viewId="+id;
			}
		});
	});
	$('.viewContractChange').click(function(){
			var id = $(this).attr("data-id");
			asyncbox
					.open({
						title : '查看合同变更记录',
						url : 'contractManage_contractChange_viewPage.action?viewId='
								+ id,
						width : 850,
						top:0,
						height : 600,
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
					top:0,
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