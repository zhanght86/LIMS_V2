$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$('.viewSample').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '接收样品',
			url : 'selfSendSampleInfo_selfSendSampleInfo_receivePage.action?viewId=' + id,
			width : 1100,
			height : 550,
			btnsbar : [ {
				text : '接　收',
				action : 'ok'
			} ].concat($.btn.CANCEL),
			callback : function(action, opt) {
				if(action=='ok'){
					asyncbox.confirm('是否接收全部样品？', '提示', function(action) {
						if (action == 'ok') {
							$.ajax({
								url : "sampleTransfer_sampleTransfer_receive.action",
								data : {
									'viewId' : id,
									'delType' : 'analyst'
								},
								async : false,
								success : function(data) {
									var json = eval('(' + data + ')');
									if (json.info == "success") {
										asyncbox.alert('当前项目样品全部接收成功 !', '结果', function() {
											var body=$(opt.document.body);
											var trList = body.find('#receiveTable tbody tr');
											for(var i=0;i<trList.size();i++){
												$(trList[i]).find('td:eq(5)').html('已接收');
												$(trList[i]).find('td:eq(6)').find('.receiveItem').hide();
												$(trList[i]).find('td:eq(6)').find('.receiveBackItem').show();
											}
										});
										
									}
									if(json.info=='failed') {
										asyncbox.error('样品接收失败，请刷新页面之后重新尝试！', '结果');
									}
								}
							});
						}
					});
					return false;
				}
			}
		});
	});
	$('.viewNonSample').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '接收样品',
			url : 'nonSelfSendSample_nonSelfSendSample_receivePage.action?viewId=' + id,
			width : 1100,
			height : 550,
			btnsbar : [ {
				text : '接　收',
				action : 'ok'
			} ].concat($.btn.CANCEL),
			callback : function(action, opt) {
				if(action=='ok'){
					asyncbox.confirm('是否接收全部样品？', '提示', function(action) {
						if (action == 'ok') {
							$.ajax({
								url : "sampleTransfer_sampleTransfer_receive.action",
								data : {
									'viewId' : id,
									'delType' : 'analyst'
								},
								async : false,
								success : function(data) {
									var json = eval('(' + data + ')');
									if (json.info == "success") {
										asyncbox.alert('样品全部接收成功 !', '结果', function() {
											var body=$(opt.document.body);
											var trList = body.find('#receiveTable tbody tr');
											for(var i=0;i<trList.size();i++){
												$(trList[i]).find('td:eq(6)').html('已接收');
												$(trList[i]).find('td:eq(7)').find('.receiveItem').hide();
												$(trList[i]).find('td:eq(7)').find('.receiveBackItem').show();
											}
										});
									}
									if(json.info=='failed') {
										asyncbox.error('样品接收失败，请刷新页面之后重新尝试！', '结果');
									}
								}
							});
						}
					});
					return false;
				}
			}
		});
	});
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
	$('.viewInspectionSheet').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看送检单单信息',
			url : 'selfSendSampleInfo_inspectionSheet_viewPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.viewQualityControl').on('click',function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看质量控制统计信息',
			url : 'qualityControl_qualityControl_viewPage.action?viewId=' + id,
			width : 1200,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.flow').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('您即将流转该项目，请注意以下事项：<br/> 1.请确认您已全部接收了样品，业务流转之后您将无法对该项目的样品进行接收操作！<br/>2.您可以在"项目列表"功能中查看已经流转的项目。','警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"sampleTransfer_sampleTransfer_flow.action",
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
						if(json.info=="error"){
							asyncbox.error("您尚有交接单未接收，请先进行接收！", '结果');
						}
						return false;
					}
				});
			}
		});
	});
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