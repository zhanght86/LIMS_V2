$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$(".select3").uedSelect({
		width : 150
	});
	$('#seachBtn')
			.click(
					function() {
						var str = "";
						$('.serviceSearchForm')
								.find('input.scinput')
								.each(
										function() {
											if ($(this).prop("value")) {
												str += ($(this).attr(
														"data-search")
														+ "="
														+ $(this).prop("value") + ";");
											}
											;
										})
						$('.serviceSearchForm').find('select.select3').each(
								function() {
									if ($(this).find('option:checked').prop(
											"value") != 3) {
										str += ($(this).attr("data-search")
												+ "="
												+ $(this)
														.find('option:checked')
														.prop("value") + ";");
									}
									;
								})
						if (str == "") {
							asyncbox.alert('请输入查询条件，可以多条件同时查询！', '查询结果');
							return false;
						}
						;
						var dataStart = $('#finishStratTime').prop("value");
						var dataEnd = $('#finishEndTime').prop("value");
						if (dataStart && (!dataEnd)) {
							asyncbox.alert('请输入交付结束时间！', '查询结果');
							return false;
						}
						if (dataEnd && (!dataStart)) {
							asyncbox.alert('请输入交付开始时间！', '查询结果');
							return false;
						}
						window.location.href = "contractManage_contractList_queryS.action?queryStr="
								+ str;
					});
	$('#allResult').click(function() {
		window.location.href = "contractManage_contractList_contractSList.action";
	});
	$('.export').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.confirm('是否导出该合同？', '警告', function(action) {　
			if (action == 'ok') {
				window.location.href="contractManage_serviceContract_exportSContract.action?viewId="+id;
			}
		});
	});
	$('.into').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('是否将该合同进入流程？', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"contractManage_serviceContract_flowInto.action?viewId="+id,
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("创建项目成功，该合同已经进入审批阶段！", '流转结果',function(){
								window.location.reload();
							});
						}
						if(json.info=="failed"){
							asyncbox.error("创建项目失败，请到合同列表界面重新尝试进入流程！", '流转结果');
						}
					}
				});
			}　　　　　
		});
	});

	$('.viewSContract')
			.click(
					function() {
						var id = $(this).attr("data-id");
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
					});
	$('.stopContract')
			.click(
					function() {
						var id = $(this).attr("data-id");
						var opt = $(this).attr("data-opt");
						if (opt == 'delete') {
							asyncbox
									.confirm(
											'警告！该合同尚未进入流程，是否删除该合同？删除该合同将无法恢复！',
											'警告',
											function(action) {
												if (action == 'ok') {
													$
															.ajax({
																url : "contractManage_contractList_deleteContract.action?contractType=1&&viewId="
																		+ id,
																async : false,
																success : function(
																		data) {
																	var json = eval('('
																			+ data
																			+ ')');
																	if (json.info == 'success') {
																		asyncbox
																				.alert(
																						'合同删除成功！',
																						'结果',
																						function() {
																							window.location
																									.reload();
																						});
																	}
																	if (json.info == 'error') {
																		asyncbox
																				.alert(
																						'合同中止失败！如果该合同已经进入流程，请刷新后重试！',
																						'结果');
																	}
																}

															});
												}
											});
						}
						if (opt == 'view') {

						}
						if (opt == 'stop') {
							asyncbox
									.confirm(
											'警告！是否中止该合同的流程？中止合同会导致该合同失效，中止之后无法恢复！',
											'警告',
											function(action) {
												if (action == 'ok') {
													$
															.ajax({
																url : "contractManage_contractList_stopContract.action?contractType=1&&viewId="
																		+ id,
																async : false,
																success : function(
																		data) {
																	var json = eval('('
																			+ data
																			+ ')');
																	if (json.info == 'success') {
																		asyncbox
																				.alert(
																						'合同中止成功！',
																						'结果',
																						function() {
																							window.location
																									.reload();
																						});
																	}
																	if (json.info == 'error') {
																		asyncbox
																				.alert(
																						'合同中止失败！如果该合同已经进入流程，请刷新后重试！',
																						'结果');
																	}
																}

															});
												}
											});
						}
					});
	
	$('.viewProject').click(function(){
		var id = $(this).attr("data-id");
		asyncbox
				.open({
					title : '查看项目详情',
					url : 'contractManage_contractList_viewProject.action?viewId='
							+ id,
					width : 1100,
					height : 600,
					btnsbar : $.btn.CANCEL,
					callback : function(action, opt) {
					}
				});
	});

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
											$('#serviceTable').find('tbody tr')
													.hide();
											$('#serviceTable')
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