$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
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
								width : 1000,
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
								width : 1000,
								height : 600,
								btnsbar : $.btn.CANCEL,
								callback : function(action, opt) {
								}
							});
				}
			});
	$('.viewProjectBook').click(function() {
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看合同任务书',
			url : 'contractManage_projectBook_viewProjectBook.action?viewId=' + id,
			width : 950,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('.delQualityControl').click(function(){
		var id=$(this).attr('data-id');
		asyncbox.confirm('是否删除全部质量控制统计记录？', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"qualityControl_qualityControl_deleteAll.action",
					data:{'viewId':id},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("全部删除成功！", '结果',function(){
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
	$('.viewSelfSendInfo').click(function() {
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看样品信息',
			url : 'selfSendSampleInfo_selfSendSampleInfo_viewPage.action?viewId=' + id,
			width : 1100,
			height : 550,
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
			height : 550,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	
	$('.addQualityControl').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '填写质量控制统计信息',
			url : 'qualityControl_qualityControl_addPage.action?viewId=' + id,
			width : 1200,
			height : 600,
			btnsbar : [ {
				text : '完成',
				action : 'ok'
			} ].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if(action=="ok"){
					$.ajax({
						url:"qualityControl_qualityControl_finishQuery.action",
						data:{'viewId':id},
						async:false,
						success:function(data){
							var json = eval('('+data+')');					
							if(json.info=="success"){
								asyncbox.alert("质量控制统计完成！", '结果',function(){
									window.location.reload();
								});						
							}
							if(json.info=="failed"){
								asyncbox.error("质量控制统计失败，请刷新之后重新尝试！", '结果');
							}
							return false;
						}
					});
					return false;
				}　
			}
		});
	})
	
	

	
	$('.exportQualityControl').click(function(){
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
	$('.flow').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('您即将流转该项目，请注意以下事项：<br/> 1.请确认您已填写正确"质量控制统计表"相关内容，流转之后无法修改。<br/>2.您可以在"项目列表"功能中查看已经流转的项目。','警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"qualityControl_qualityControl_flow.action",
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