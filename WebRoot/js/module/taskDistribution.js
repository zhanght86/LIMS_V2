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
	$(".rejectCount").on("click",function(){
		//alert("次数");
		//rejectCount
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '审核拒绝统计',
			url : 'taskDistribution_taskDistribution_rejectCount.action?viewId=' + id,
			width : 800,
			height : 300,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
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
						width : 900,
						height : 600,
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
						width : 900,
						height : 600,
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
						width : 900,
						height : 600,
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
						width : 900,
						height : 600,
						btnsbar : $.btn.CANCEL,
					});
		}
	});
	$('.analyst').on('click',function(){
		var item=$(this).parent().siblings('td:eq(1)').html();
		var viewId=$(this).data("id");
		asyncbox
		.open({
			title : '选择实验分析人员',
			top:0,
			url : 'userManage_user_chooseAnalysisPage.action?viewId=',
			width : 600,
			height : 400,
			btnsbar: [{
				text: '设　置', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var obody=$(opt.document.body);
					var selList = obody.find('#userTable tbody .choose:checked');
					if(selList.size()==1){
						var id =$(selList[0]).data("search");
						var name=$(selList[0]).data("name");
						asyncbox.confirm('是否将用户【'+name+'】设置为检测项目【'+item+'】的分析员？','设置分析员', function(action) {　
							if (action == 'ok') {
								$.ajax({
									url:"taskDistribution_taskDistribution_analyst.action",
									data:{'viewId':viewId,'analystId':id},
									async:false,
									success:function(data){
										var json = eval('('+data+')');
										if(json.info=="success"){
											asyncbox.alert("分析员设置成功！！", '结果',function(){
												window.location.reload();
											});						
										}
										if(json.info=="failed"){
											asyncbox.error("分析员设置失败，请刷新之后重新尝试！", '结果');
										}
										return false;
									}
								});
							}
						});
					}else{
						asyncbox.error("请先选择一个分析员！","设置失败")
					}
					return false;
				}　　　　　
			}
		});
	});
	$('.delAnalyst').on('click',function(){
		var item=$(this).parent().siblings('td:eq(1)').html();
		var viewId=$(this).data("id");
		asyncbox.confirm('是否清除检测项目【'+item+'】的分析员？','设置分析员', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"taskDistribution_taskDistribution_delAnalyst.action",
					data:{'viewId':viewId},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("分析员清除成功！", '结果',function(){
								window.location.reload();
							});						
						}
						if(json.info=="failed"){
							asyncbox.error("分析员清除失败，请刷新之后重新尝试！", '结果');
						}
						return false;
					}
				});
			}
		});
	});
	$('.review').on('click',function(){
		var item=$(this).parent().siblings('td:eq(1)').html();
		var viewId=$(this).data("id");
		asyncbox
		.open({
			title : '选择实验复核人员',
			top:0,
			url : 'userManage_user_chooseAnalysisPage.action?viewId=',
			width : 600,
			height : 400,
			btnsbar: [{
				text: '设　置', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var obody=$(opt.document.body);
					var selList = obody.find('#userTable tbody .choose:checked');
					if(selList.size()==1){
						var id =$(selList[0]).data("search");
						var name=$(selList[0]).data("name");
						asyncbox.confirm('是否将用户【'+name+'】设置为检测项目【'+item+'】的复核员？','设置复核员', function(action) {　
							if (action == 'ok') {
								$.ajax({
									url:"taskDistribution_taskDistribution_review.action",
									data:{'viewId':viewId,'analystId':id},
									async:false,
									success:function(data){
										var json = eval('('+data+')');
										if(json.info=="success"){
											asyncbox.alert("复核员设置成功！！", '结果',function(){
												window.location.reload();
											});						
										}
										if(json.info=="failed"){
											asyncbox.error("复核员设置失败，请刷新之后重新尝试！", '结果');
										}
										return false;
									}
								});
							}
						});
					}else{
						asyncbox.error("请先选择一个复核员！","设置失败")
					}
					return false;
				}　　　　　
			}
		});
	});
	$('.delReview').on('click',function(){
		var item=$(this).parent().siblings('td:eq(1)').html();
		var viewId=$(this).data("id");
		asyncbox.confirm('是否清除检测项目【'+item+'】的复核员？','设置复核员', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"taskDistribution_taskDistribution_delReview.action",
					data:{'viewId':viewId},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("复核员清除成功！", '结果',function(){
								window.location.reload();
							});						
						}
						if(json.info=="failed"){
							asyncbox.error("复核员清除失败，请刷新之后重新尝试！", '结果');
						}
						return false;
					}
				});
			}
		});
	});
	
	$('.audit').on('click',function(){
		var item=$(this).parent().siblings('td:eq(1)').html();
		var viewId=$(this).data("id");
		asyncbox
		.open({
			title : '选择实验审核人员',
			top:0,
			url : 'userManage_user_chooseAnalysisPage.action?viewId=',
			width : 600,
			height : 400,
			btnsbar: [{
				text: '设　置', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var obody=$(opt.document.body);
					var selList = obody.find('#userTable tbody .choose:checked');
					if(selList.size()==1){
						var id =$(selList[0]).data("search");
						var name=$(selList[0]).data("name");
						asyncbox.confirm('是否将用户【'+name+'】设置为检测项目【'+item+'】的审核员？','设置审核员', function(action) {　
							if (action == 'ok') {
								$.ajax({
									url:"taskDistribution_taskDistribution_audit.action",
									data:{'viewId':viewId,'analystId':id},
									async:false,
									success:function(data){
										var json = eval('('+data+')');
										if(json.info=="success"){
											asyncbox.alert("审核员设置成功！！", '结果',function(){
												window.location.reload();
											});						
										}
										if(json.info=="failed"){
											asyncbox.error("审核员设置失败，请刷新之后重新尝试！", '结果');
										}
										return false;
									}
								});
							}
						});
					}else{
						asyncbox.error("请先选择一个审核员！","设置失败")
					}
					return false;
				}　　　　　
			}
		});
	});
	$('.delAudit').on('click',function(){
		var item=$(this).parent().siblings('td:eq(1)').html();
		var viewId=$(this).data("id");
		asyncbox.confirm('是否清除检测项目【'+item+'】的审核员？','设置审核员', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"taskDistribution_taskDistribution_delAudit.action",
					data:{'viewId':viewId},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("审核员清除成功！", '结果',function(){
								window.location.reload();
							});						
						}
						if(json.info=="failed"){
							asyncbox.error("审核员清除失败，请刷新之后重新尝试！", '结果');
						}
						return false;
					}
				});
			}
		});
	});
	
	$('.analystAll').on('click',function(){
		var ids="";
		var item="";
		var aChecks = $(this).parents('.tools').next('.tablelist').find('tbody input[type=checkbox]:checked');
		if(aChecks.size()==0){
			asyncbox.error("批量设置要求至少选择一个分析项目！","批量设置")
			return false;
		}
		for(var i=0;i<aChecks.size();i++){
			ids+=$(aChecks[i]).data("id")+",";
			item+=$(aChecks[i]).data("name")+",";
		}
		asyncbox
		.open({
			title : '选择实验分析人员',
			top:0,
			url : 'userManage_user_chooseAnalysisPage.action?viewId=',
			width : 600,
			height : 400,
			btnsbar: [{
				text: '设　置', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var obody=$(opt.document.body);
					var selList = obody.find('#userTable tbody .choose:checked');
					if(selList.size()==1){
						var id =$(selList[0]).data("search");
						var name=$(selList[0]).data("name");
						asyncbox.confirm('是否将用户【'+name+'】设置为如下检测项目【'+item+'】的分析员？','设置分析员', function(action) {　
							if (action == 'ok') {
								$.ajax({
									url:"taskDistribution_taskDistribution_analystAll.action",
									data:{'ids':ids,'analystId':id},
									async:false,
									success:function(data){
										var json = eval('('+data+')');
										if(json.info=="success"){
											asyncbox.alert("分析员设置成功！！", '结果',function(){
												window.location.reload();
											});						
										}
										if(json.info=="failed"){
											asyncbox.error("分析员设置失败，请刷新之后重新尝试！", '结果');
										}
										return false;
									}
								});
							}
						});
					}else{
						asyncbox.error("请先选择一个分析员！","设置失败")
					}
					return false;
				}　　　　　
			}
		});
	});
	
	$('.reviewAll').on('click',function(){
		var ids="";
		var item="";
		var aChecks = $(this).parents('.tools').next('.tablelist').find('tbody input[type=checkbox]:checked');
		if(aChecks.size()==0){
			asyncbox.error("批量设置要求至少选择一个分析项目！","批量设置")
			return false;
		}
		for(var i=0;i<aChecks.size();i++){
			ids+=$(aChecks[i]).data("id")+",";
			item+=$(aChecks[i]).data("name")+",";
		}
		asyncbox
		.open({
			title : '选择实验复核人员',
			top:0,
			url : 'userManage_user_chooseAnalysisPage.action?viewId=',
			width : 600,
			height : 400,
			btnsbar: [{
				text: '设　置', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var obody=$(opt.document.body);
					var selList = obody.find('#userTable tbody .choose:checked');
					if(selList.size()==1){
						var id =$(selList[0]).data("search");
						var name=$(selList[0]).data("name");
						asyncbox.confirm('是否将用户【'+name+'】设置为如下检测项目【'+item+'】的复核员？','设置复核员', function(action) {　
							if (action == 'ok') {
								$.ajax({
									url:"taskDistribution_taskDistribution_reviewAll.action",
									data:{'ids':ids,'analystId':id},
									async:false,
									success:function(data){
										var json = eval('('+data+')');
										if(json.info=="success"){
											asyncbox.alert("复核员设置成功！！", '结果',function(){
												window.location.reload();
											});						
										}
										if(json.info=="failed"){
											asyncbox.error("复核员设置失败，请刷新之后重新尝试！", '结果');
										}
										return false;
									}
								});
							}
						});
					}else{
						asyncbox.error("请先选择一个复核员！","设置失败")
					}
					return false;
				}　　　　　
			}
		});
	});
	
	
	$('.auditAll').on('click',function(){
		var ids="";
		var item="";
		var aChecks = $(this).parents('.tools').next('.tablelist').find('tbody input[type=checkbox]:checked');
		if(aChecks.size()==0){
			asyncbox.error("批量设置要求至少选择一个分析项目！","批量设置")
			return false;
		}
		for(var i=0;i<aChecks.size();i++){
			ids+=$(aChecks[i]).data("id")+",";
			item+=$(aChecks[i]).data("name")+",";
		}
		asyncbox
		.open({
			title : '选择实验审核人员',
			top:0,
			url : 'userManage_user_chooseAnalysisPage.action?viewId=',
			width : 600,
			height : 400,
			btnsbar: [{
				text: '设　置', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var obody=$(opt.document.body);
					var selList = obody.find('#userTable tbody .choose:checked');
					if(selList.size()==1){
						var id =$(selList[0]).data("search");
						var name=$(selList[0]).data("name");
						asyncbox.confirm('是否将用户【'+name+'】设置为如下检测项目【'+item+'】的审核员？','设置审核员', function(action) {　
							if (action == 'ok') {
								$.ajax({
									url:"taskDistribution_taskDistribution_auditAll.action",
									data:{'ids':ids,'analystId':id},
									async:false,
									success:function(data){
										var json = eval('('+data+')');
										if(json.info=="success"){
											asyncbox.alert("审核员设置成功！！", '结果',function(){
												window.location.reload();
											});						
										}
										if(json.info=="failed"){
											asyncbox.error("审核员设置失败，请刷新之后重新尝试！", '结果');
										}
										return false;
									}
								});
							}
						});
					}else{
						asyncbox.error("请先选择一个审核员！","设置失败")
					}
					return false;
				}　　　　　
			}
		});
	});
	
	
	$('.flow').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('您即将流转该项目，请注意以下事项：<br/> 1.请确认您已正确分配了实验分析计划，流转之后无法修改。<br/>2.您可以在"项目列表"功能中查看已经流转的项目。','警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"taskDistribution_taskDistribution_flow.action",
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
							asyncbox.error("您有尚未分配实验分析、复核或者审核人员的送检单，请先进行分配！", '结果');
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