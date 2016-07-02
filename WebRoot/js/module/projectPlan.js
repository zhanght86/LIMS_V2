$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$(".select3").uedSelect({
		width : 150
	});
	$('#seachBtn').click(
					function() {
						var str = "";
						$('.trafficSerachForm')
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
						$('.trafficSerachForm').find('select.select3').each(
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
						window.location.href = "contractManage_contractList_query.action?queryStr="
								+ str;
					});
	$('#allResult').click(function() {
		window.location.href = "contractManage_contractList_main.action";
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
//	$('.registration')
//			.click(
//					function() {
//						var id = $(this).attr("data-id");
//						asyncbox
//								.open({
//									title : '业务登记',
//									url : 'contractManage_projectPlan_registration.action?viewId='
//											+ id,
//									width : 800,
//									height : 550,
//									btnsbar : [ {
//										text : '保　存',
//										action : 'save'
//									} ].concat($.btn.CANCEL),
//									callback : function(action, opt) {
//										var $body=$(opt.document);
//										var table=$body.find('#registForm');
//										if(action=='save'){
//											$.ajax({
//												url:"contractManage_projectPlan_save.action",
//												data:table.serialize(), 
//												async:false,
//												success:function(data){
//													var json = eval('('+data+')');
//													if(json.info=="success"){
//														asyncbox.alert("业务登记成功！", '结果',function(){
//															window.location.reload();
//														});						
//													}
//													if(json.info=="failed"){
//														asyncbox.error("业务登记失败，请刷新之后重新尝试！", '结果');
//													}
//													return false;
//												}
//											});
//											return false;
//										}
//									}
//								});
//					});
	
	
//	$('.changeRegistration')
//	.click(
//			function() {
//				var id = $(this).attr("data-id");
//				asyncbox
//						.open({
//							title : '修改业务登记',
//							url : 'contractManage_projectPlan_changeRegistration.action?viewId='
//									+ id,
//							width : 800,
//							height : 550,
//							btnsbar : [ {
//								text : '修　改',
//								action : 'save'
//							} ].concat($.btn.CANCEL),
//							callback : function(action, opt) {
//								var $body=$(opt.document);
//								var table=$body.find('#registForm');
//								if(action=='save'){
//									$.ajax({
//										url:"contractManage_projectPlan_change.action",
//										data:table.serialize(), 
//										async:false,
//										success:function(data){
//											var json = eval('('+data+')');
//											if(json.info=="success"){
//												asyncbox.alert("业务修改成功！", '结果',function(){
//													window.location.reload();
//												});						
//											}
//											if(json.info=="failed"){
//												asyncbox.error("业务修改失败，请刷新之后重新尝试！", '结果');
//											}
//											return false;
//										}
//									});
//									return false;
//								}
//							}
//						});
//			});
	
	
	
//	$('.viewRegistration').click(function() {
//		var id = $(this).attr("data-id");
//		asyncbox.open({
//			title : '查看业务登记记录',
//			url : 'contractManage_projectPlan_viewRegistration.action?viewId=' + id,
//			width : 700,
//			height : 550,
//			btnsbar : $.btn.CANCEL,
//			callback : function(action, opt) {
//			}
//		});
//	});
//	$('.delRegistration').click(function(){
//		var id = $(this).attr("data-id");
//		asyncbox.confirm('是否删除该业务登记信息？该操作不可恢复!', '警告', function(action) {　
//			if (action == 'ok') {
//				$.ajax({
//					url:"contractManage_projectPlan_delete.action",
//					data:{'viewId':id},
//					async:false,
//					success:function(data){
//						var json = eval('('+data+')');
//						if(json.info=="success"){
//							asyncbox.alert('删除成功 !', '删除结果',function(){
//								window.location.reload();
//							});	
//						}
//						if(json.info=="failed"){
//							asyncbox.error('删除失败，请刷新页面之后重新尝试！', '删除结果');
//						}
//					}
//				});　　　　　
//			}　　　　　
//		});
//	});
	$('.assignment').click(function(){
		var id = $(this).attr("data-id");
		asyncbox
				.open({
					title : '创建任务书',
					url : 'contractManage_projectBook_main.action?viewId='
							+ id,
					width : 900,
					height : 550,
					btnsbar : [ {
						text : '保　存',
						action : 'save'
					} ].concat($.btn.CANCEL),
					callback : function(action, opt) {
						if(action=='save'){
							var $body=$(opt.document);
							var table=$body.find('#projectBookForm');
//							if($("#depSel").val()==0){
//								alert("请选择承接科室");
//								return false;
//							}
							
							var result = FieldValidation.validate3(table);
							if(!result){
								return false;
							}
							$.ajax({
								url:"contractManage_projectBook_save.action?",
								data:table.serialize(), 
								async:false,
								success:function(data){
									var json = eval('('+data+')');
									if(json.info=="success"){
										asyncbox.alert("任务书创建成功！", '结果',function(){
											window.location.reload();
										});						
									}
									if(json.info=="failed"){
										asyncbox.error("任务书创建失败，请刷新之后重新尝试！", '结果');
									}
									return false;
								}
							});
							return false;
						}
					}
				});
	});
	$('.delProjectBook').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('是否删除该合同任务书？该操作不可恢复!', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"contractManage_projectBook_delete.action",
					data:{'viewId':id},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert('删除成功 !', '删除结果',function(){
								window.location.reload();
							});	
						}
						if(json.info=="failed"){
							asyncbox.error('删除失败，请刷新页面之后重新尝试！', '删除结果');
						}
					}
				});　　　　　
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
	
	$('.changeProjectBook').click(function(){
		var id = $(this).attr("data-id");
		asyncbox
				.open({
					title : '修改合同任务书',
					url : 'contractManage_projectBook_changeProjectBook.action?viewId='
							+ id,
					width : 800,
					height : 550,
					btnsbar : [ {
						text : '修　改',
						action : 'save'
					} ].concat($.btn.CANCEL),
					callback : function(action, opt) {
						var $body=$(opt.document);
						var table=$body.find('#projectBookForm');
						var result = FieldValidation.validate3(table);
						if(!result){
							return false;
						}
						if(action=='save'){
							$.ajax({
								url:"contractManage_projectBook_change.action",
								data:table.serialize(), 
								async:false,
								success:function(data){
									var json = eval('('+data+')');
									if(json.info=="success"){
										asyncbox.alert("合同任务书修改成功！", '结果',function(){
											window.location.reload();
										});						
									}
									if(json.info=="failed"){
										asyncbox.error("合同任务书修改失败，请刷新之后重新尝试！", '结果');
									}
									return false;
								}
							});
							return false;
						}
					}
				});
		
	});
	
	$('#depSel').on('change',function(){
		var id=$(this).val();
		if(id!=null){
			$.ajax({
				url:"contractManage_projectBook_userList.action?depId="+id,
				async:false,
				success:function(data){
					$('#projectChargeId').empty();
					var json = eval('('+data+')');
					if(json.info=="success"){
						var itemArray=json.list;
						for ( var i = 0; i < itemArray.length; i++) {
							var obj = itemArray[i];
							$('#projectChargeId').append('<option value="'+itemArray[i].id+'">'+itemArray[i].name+'</option>');
						}
					}
					if(json.info=="failed"){
						asyncbox.error("合同保存失败，请刷新之后重新尝试！", '保存结果');
					}
					return false;
				}
			});
		}
		
		
	});
	
	$('.exportProjectBook').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('是否将任务书导出为Word格式？', '警告', function(action) {　
			if (action == 'ok') {
				window.location.href="contractManage_projectBook_export.action?viewId="+id;
			}
		});
	});
	
	$('.reverse').click(function() {
		var tableId = $(this).attr('reverseTo');
		reverse(tableId);
	});
	
	$('.flow').click(function(){
		var id = $(this).attr("data-id");
		if($(this).parents('td').prev('td').children('a.assignment').html()=='任务书'){
			asyncbox.error('对不起，您尚未填写任务书，无法完成流转！','流转失败');
			return false;
		}
		asyncbox.confirm('您即将流转该项目，请注意以下事项：<br/> 1.请确认您已填写正确"任务登记表"和"任务说明书"相关内容，流转之后无法修改。<br/>2.系统将根据您填写的"承接科室"内容自动进入"自送样"环节或者"非自送样"环节。<br/>3.您可以在"项目列表"功能中查看已经流转的项目。','警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"contractManage_projectBook_flow.action",
					data:{'viewId':id},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("项目流转成功！", '流转成功',function(){
								window.location.reload();
							});						
						}
						if(json.info=="failed"){
							asyncbox.error("项目流转失败，请刷新之后重新尝试！", '流转失败');
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