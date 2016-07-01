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
	$('.viewRecordAudit').on('click',function(){
		var id = $(this).attr("data-id");
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
	$('.viewDeliveryReceitp').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看交联单信息',
			url : 'selfSendSampleInfo_deliveryReceitp_viewResultPage.action?viewId=' + id,
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
			url : 'nonSelfSendSample_deliveryReceitp_viewResultPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.writeInspectionSheet').click(function(){
		var typeNum = $(this).data("type");// 送检单的类型
		var itemId = $(this).data("id");// 监测项目的id
		var viewId = $(this).data("projectid");
		if (typeNum == 0) {
			asyncbox
					.open({// 水质
						title : '水质样品送检单',
						top:0,
						url : 'selfSendSampleInfo_inspectionSheet_writeWaterDetailPage.action?viewId='
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
						url : 'selfSendSampleInfo_inspectionSheet_writeSoilDetailPage.action?viewId='
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
						url : 'selfSendSampleInfo_inspectionSheet_writeSolidDetailPage.action?viewId='
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
						url : 'selfSendSampleInfo_inspectionSheet_writeAirDetailPage.action?viewId='
								+ viewId
								+ '&itemId='
								+ itemId,
								width : 1100,
								height : 700,
						btnsbar : $.btn.CANCEL,
					});
		}
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
	$('.uploadRecord').click(function(){
		var id=$(this).data("id");
		asyncbox.open({
			title : '填写原始记录文件',
			url : 'detectionResult_detectionResult_addPage.action?projectId=' + id,
			width : 1200,
			height : 700,
			btnsbar: $.btn.CANCEL,
			callback : function(action, opt) {
				if(action=='cancel'){
					window.location.reload();
				}
				if(action=='close'){
					window.location.reload();
				}
			}
		});
	});
	$('.referRecord').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.confirm('是否提交当前项目的送检单和原始记录表？提交之后将无法对送检单进行修改，也无法修改原始记录表！','警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"detectionResult_detectionResult_refer.action",
					data:{'viewId':id},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("提交成功！", '结果',function(){
								window.location.reload();
							});						
						}
						if(json.info=="failed"){
							asyncbox.error("提交失败，请刷新之后重新尝试！", '结果');
						}
						if(json.info=="error"){
							asyncbox.error("提交失败，您的送检单中存在尚未登记结果的样品信息！", '结果');
						}
						if(json.info=="emptyPath"){
							asyncbox.error("您尚未提交原始记录，无法提交！", '结果');
						}
						return false;
					}
				});
			}
		});
	});
	$('.delRecord').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.confirm('是否删除当前已经存在的原始记录表？','警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"detectionResult_detectionResult_deleteRecord.action",
					data:{'viewId':id},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("删除成功！", '结果',function(){
								window.location.reload();
							});						
						}
						if(json.info=="failed"){
							asyncbox.error("删除失败，请刷新之后重新尝试！", '结果');
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
	$('.changeRecord').on('click',function(){
		var id=$(this).attr("data-id");
		asyncbox.open({
			title : '查看原始记录表',
			url : 'detectionResult_detectionResult_changePage.action?viewId=' + id,
			width : 1100,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
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
	
	$('.flow').click(function(){
		var tag=true;
		$(this).parents('div.tools').next('table').find('tbody tr').each(function(){
			if($(this).find('td:eq(5)').html()!="已提交"){
				asyncbox.error("对不起，您还有尚未提交的检测结果，请先进行提交！","结果");
				tag=false;
				return false;
			}
		});
		if(tag==false){
			return false;
		}
		var id = $(this).attr("data-id");
		asyncbox.confirm('您即将流转该项目，请注意以下事项：<br/> 1.当前项目即将流转至"项目复核"阶段，复核人为任务下达时指定的人员。<br/>2.您填写的不同送检单可能会被系统自动拆分成多份送达复核员手中。<br/>3.您可以在"项目列表"功能中查看已经流转的项目。','警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"detectionResult_detectionResult_flow.action",
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
						return false;
					}
				});
			}
		});
	});
	
	checkFun('auditTable');

	$('#page1')
			.paging(
					{
						'pageCount' : $('#totalPage').html(),
						'initPage' : 1,
						'showCount' : 10,
						'fn' : function(pageNum) {
							$('.countPage').html(pageNum);
							$
									.ajax({
										url : "contractManage_contractAudit_page.action?pageNum="
												+ pageNum,
										async : false,
										success : function(data) {
											var json = eval('(' + data + ')');
											$('#auditTable').find('tbody tr')
													.hide();
											$('#auditTable')
													.find('tbody tr')
													.slice(
															(pageNum - 1)
																	* (json.pageNum),
															pageNum
																	* (json.pageNum))
													.each(function() {
														$(this).show();
													})
										}

									});
						},
						'liCss' : {
							'display' : 'inline-block',
							'border' : '#8db5d7 1px solid',
							'padding' : '2px 8px',
							'cursor' : 'pointer',
							'margin' : '0 2px',
							'color' : '#000',
							'border-radius' : '5px',
							'pointer-events' : 'auto'
						},
						'liActive' : {
							'border' : '#ccc 1px solid',
							'font-weight' : 'bold',
							'background' : '#f5f5f5',
							'cursor' : 'default',
							'pointer-events' : 'none'
						},
						'liForbid' : {
							'border' : '#ccc 1px solid',
							'color' : '#ccc',
							'cursor' : 'default',
							'pointer-events' : 'none'
						}
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