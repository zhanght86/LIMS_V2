$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$('#seachBtn')
			.click(
					function() {
						var str = "";
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
						if (str == "") {
							asyncbox.alert('请输入查询条件，可以多条件同时查询！', '查询结果');
							return false;
						}
						window.location.href = "contractManage_contractAudit_query.action?queryStr="
								+ str;
					});

	$('#allResult').click(function() {
		window.location.href = "contractManage_contractAudit_main.action";
	});

	$('.viewContract')
			.click(
					function() {
						var id = $(this).attr("data-id");
						asyncbox
								.open({
									title : '查看服务合同',
									url : 'contractManage_contractAudit_viewSContract.action?viewId='
											+ id,
									width : 1100,
									height : 700,
									btnsbar : $.btn.CANCEL,
									callback : function(action, opt) {
									}
								});
					});
	$('.exportAudit').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('是否将服务合同评审记录表导出为Word格式？', '警告', function(action) {　
			if (action == 'ok') {
				window.location.href="contractManage_contractAudit_export.action?viewId="+id;
			}
		});
	})
	$('.viewAudit').click(function(){
		var id = $(this).attr("data-id");
		asyncbox
				.open({
					title : '查看合同审核记录',
					url : 'contractManage_contractAudit_viewPage.action?viewId='
							+ id,
					width : 1000,
					height : 600,
					btnsbar : $.btn.CANCEL
				});
	});
	$('.auditContract')
			.click(
					function() {
						var id = $(this).attr("data-id");
						asyncbox
								.open({
									title : '审核合同',
									url : 'contractManage_contractAudit_auditContract.action?viewId='
											+ id,
									width : 1100,
									height : 700,
									btnsbar : [ {
										text : '保    存',
										action : 'export'
									} ].concat($.btn.CANCEL),
									callback : function(action, opt) {
										if (action == 'export') {
											var oBody = $(opt.document);
											var oForm = oBody
													.find("#auditForm");
											var result = FieldValidation
													.validate3(oForm);
											if (!result) {
												return false;
											}
											var finalResult=0;
											var　ORadios=oBody.find("#auditRadio").find("input[type=radio]:checked");
											ORadios.each(function(){
												if($(this).prop("value")!=1){
													if($(this).prop("name")!="subpackage"){
														finalResult=1;
													}
												}
											});
											var str="";
											if(finalResult==0){
												str="审核通过";
											}else{
												str="审核不通过";
											}
											asyncbox
													.confirm(
															'是否保存审核意见？您的审核意见为<b style="color:red;">【'+str+'】</b>',
															'警告',
															function(action) {
																if (action == 'ok') {																	
																	$.ajax({
																		url:"contractManage_contractAudit_aduit.action",
																		data:oForm.serialize(), 
																		async:false,
																		success:function(data){
																			var json = eval('('+data+')');
																			if(json.info=="success"){
																				asyncbox.alert("审核成功！", '结果',function(){
																					window.location.reload();
																				});						
																			}
																			if(json.info=="failed"){
																				asyncbox.error("审核失败，请刷新之后重新尝试！", '结果');
																			}
																			return false;
																		}
																	});
																}
															});
											return false;
										}
										if (action == 'cancel') {
											window.location.reload();
										}
										if (action == 'close') {
											window.location.reload();
										}
									}
								});
					});
	$('.flow').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('您即将流转该项目，请注意以下事项：<br/> 1.请确认您已确认评审结果，流转之后无法修改。<br/>2.您可以在"项目列表"功能中查看已经流转的项目。','警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"contractManage_contractAudit_flow.action",
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
						if(json.info=="roleError"){
							asyncbox.error("您无权限进行项目流转，请使用授权账户登陆!", '结果');
						}
						return false;
					}
				});
			}
		});
	});
	$('.delAudit').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.confirm('是否删除当前合同审核记录？','警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"contractManage_contractAudit_delete.action",
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