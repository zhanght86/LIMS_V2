$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$(".select3").uedSelect({
		width : 150
	});
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
										width : 1100,
										height : 700,
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
										height : 700,
										btnsbar : $.btn.CANCEL,
										callback : function(action, opt) {
										}
									});
						}
					});
	$('.viewAudit').click(function() {
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看评审记录',
			url : 'contractManage_projectPlan_viewAudit.action?viewId=' + id,
			width : 700,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});

	$('.changeContract')
			.click(
					function() {
						var id = $(this).attr("data-id");
						asyncbox
								.open({
									title : '合同变更登记',
									url : 'contractManage_contractChange_addPage.action?viewId='
											+ id,
									width : 800,
									height : 700,
									btnsbar : [ {
										text : '变　更',
										action : 'save'
									}, {
										text : '导　出',
										action : 'export'
									} ].concat($.btn.CANCEL),
									callback : function(action, opt) {
										var $body = $(opt.document);
										var table = $body.find('#changeForm');
										var query = $body.find('#columnChange')
												.find('option:selected').attr(
														"data-query");
										if (action == 'save') {
											$
													.ajax({
														url : "contractManage_contractChange_add.action?query="
																+ query,
														data : table
																.serialize(),
														async : false,
														success : function(data) {
															var json = eval('('
																	+ data
																	+ ')');
															if (json.info == "success") {
																asyncbox
																		.alert(
																				"业务登记成功！",
																				'结果',
																				function() {
																					window.location
																							.reload();
																				});
															}
															if (json.info == "failed") {
																asyncbox
																		.error(
																				"业务登记失败，请刷新之后重新尝试！",
																				'结果');
															}
															return false;
														}
													});
											return false;
										}
									}
								});
					});
	$('.changeHistory')
			.click(
					function() {
						var id = $(this).attr("data-id");
						asyncbox
								.open({
									title : '查看合同变更记录',
									url : 'contractManage_contractChange_viewPage.action?viewId='
											+ id,
									width : 1000,
									height : 600,
									btnsbar : $.btn.CANCEL,
									callback : function(action, opt) {
									}
								});
					})
	$('.reverse').click(function() {
		var tableId = $(this).attr('reverseTo');
		reverse(tableId);
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
										url : "contractManage_contractList_page.action?pageNum="
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