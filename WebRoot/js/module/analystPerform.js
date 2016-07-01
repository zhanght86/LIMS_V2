$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$(".select3").uedSelect({
		width : 150
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
	
	$('.viewProject')
			.click(
					function() {
						var id = $(this).attr("data-id");
						asyncbox
								.open({
									title : '查看项目详情',
									url : 'contractManage_contractList_viewProject.action?viewId='
											+ id,
											width : 1200,
											height : 800,
									btnsbar : $.btn.CANCEL,
									callback : function(action, opt) {
									}
								});
					});
	$('#projectShow').on('click', function() {
		$('#showSheet').hide();
		$('#showProject').show();
	});
	$('#sheetShow').on('click', function() {
		$('#showSheet').show();
		$('#showProject').hide();
	});
	$('#seachBtn')
			.click(
					function() {
						var str = "";
						if ($('#analyst').find('option:selected').prop("value") == -1) {
							asyncbox.error('请先选择一个实验分析人员');
							return false;
						}
						$('.seachform')
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
						$('.seachform').find('select.select3').each(
								function() {
									if ($(this).find('option:checked').prop(
											"value") != -1) {
										str += ($(this).attr("data-search")
												+ "="
												+ $(this)
														.find('option:checked')
														.prop("value") + ";");
									}
									;
								})
						if (str == "") {
							asyncbox.error('请输入查询条件，可以多条件同时查询！', '查询结果');
							return false;
						}
						;
						var dataStart = $('#finishStratTime').prop("value");
						var dataEnd = $('#finishEndTime').prop("value");
						/*if (dataStart && (!dataEnd)) {
							asyncbox.error('请输入统计结束时间！', '查询结果');
							return false;
						}
						if (dataEnd && (!dataStart)) {
							asyncbox.error('请输入统计开始时间！', '查询结果');
							return false;
						}*/
						window.location.href = "analystPerform_analystPerform_query.action?queryStr="
								+ str;

					});
})