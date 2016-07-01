$(function() {
	$('.analyst')
			.click(
					function() {
						var id = $("#pId").attr('value');
						var typeId = $(this).data("id");
						var $_this = $(this);
						asyncbox
								.open({
									title : '选择实验室分析人员',
									url : 'userManage_user_chooseAnalysisPage.action?viewId='
											+ id,
									width : 550,
									height : 400,
									btnsbar : [ {
										text : '保　存',
										action : 'ok'
									} ].concat($.btn.CANCEL),
									callback : function(action, opt) {
										if (action == 'ok') {
											var obody = $(opt.document);
											var oChecks = obody
													.find('#userTable input[type=radio]:checked');
											var ids = oChecks
													.attr("data-search");
											var names = oChecks.parents('td')
													.next().next().html();
											var tempName = names;
											names = "【" + names + "】";
											asyncbox
													.confirm(
															'是否将'
																	+ names
																	+ '设置为该项目的实验负责人？',
															'提示',
															function(action) {
																if (action == 'ok') {
																	$
																			.ajax({
																				url : "taskDistribution_taskDistribution_analyst.action?view="
																						+ id
																						+ "&typeId="
																						+ typeId,
																				data : {
																					'ids' : ids,
																					'viewId' : id
																				},
																				async : false,
																				success : function(
																						data) {
																					var json = eval('('
																							+ data
																							+ ')');
																					if (json.info == "success") {
																						asyncbox
																								.alert(
																										'分配成功 !',
																										'结果',
																										function() {
																											window.location.reload();
																										});

																					} else {
																						asyncbox
																								.error(
																										'分配失败，请刷新页面之后重新尝试！',
																										'结果');
																					}
																				}
																			});
																}
															});
										}
									}
								});
					});
	$('.checkMember')
			.click(
					function() {
						var id = $("#pId").attr('value');
						var typeId = $(this).data("id");
						var $_this = $(this);
						asyncbox
								.open({
									title : '选择实验室复核人员',
									url : 'userManage_user_chooseAnalysisPage.action?viewId='
											+ id,
									width : 550,
									height : 400,
									btnsbar : [ {
										text : '保　存',
										action : 'ok'
									} ].concat($.btn.CANCEL),
									callback : function(action, opt) {
										if (action == 'ok') {
											var obody = $(opt.document);
											var oChecks = obody
													.find('#userTable input[type=radio]:checked');
											var ids = oChecks
													.attr("data-search");
											var names = oChecks.parents('td')
													.next().next().html();
											var tempName = names;
											names = "【" + names + "】";
											asyncbox
													.confirm(
															'是否将'
																	+ names
																	+ '设置为该项目的实验复核人？',
															'提示',
															function(action) {
																if (action == 'ok') {
																	$
																			.ajax({
																				url : "taskDistribution_taskDistribution_check.action",
																				data : {
																					'ids' : ids,
																					'viewId' : id,
																					'typeId':typeId
																				},
																				async : false,
																				success : function(
																						data) {
																					var json = eval('('
																							+ data
																							+ ')');
																					if (json.info == "success") {
																						asyncbox
																								.alert(
																										'分配成功 !',
																										'结果',
																										function() {
																											window.location.reload();
																										});

																					} else {
																						asyncbox
																								.error(
																										'分配失败，请刷新页面之后重新尝试！',
																										'结果');
																					}
																				}
																			});
																}
															});
										}
									}
								});
					});

	$('.delCheck').click(function() {
		var id = $(this).attr('data-id');
		var $_this = $(this);
		asyncbox.confirm('是否删除当前项目的实验复核人？', '提示', function(action) {
			if (action == 'ok') {
				$.ajax({
					url : "taskDistribution_taskDistribution_delete.action",
					data : {
						'viewId' : id,
						'delType' : 'check'
					},
					async : false,
					success : function(data) {
						var json = eval('(' + data + ')');
						if (json.info == "success") {
							asyncbox.alert('删除成功 !', '结果', function() {
								window.location.reload();
							});

						} else {
							asyncbox.error('删除失败，请刷新页面之后重新尝试！', '结果');
						}
					}
				});
			}
		});
	});
	$('.delAnalyst').click(function() {
		var id = $(this).attr('data-id');
		var $_this = $(this);
		asyncbox.confirm('是否删除当前项目的实验分析员？', '提示', function(action) {
			if (action == 'ok') {
				$.ajax({
					url : "taskDistribution_taskDistribution_delete.action",
					data : {
						'viewId' : id,
						'delType' : 'analyst'
					},
					async : false,
					success : function(data) {
						var json = eval('(' + data + ')');
						if (json.info == "success") {
							asyncbox.alert('删除成功 !', '结果', function() {
								window.location.reload();
							});

						} else {
							asyncbox.error('删除失败，请刷新页面之后重新尝试！', '结果');
						}
					}
				});
			}
		});
	});
});