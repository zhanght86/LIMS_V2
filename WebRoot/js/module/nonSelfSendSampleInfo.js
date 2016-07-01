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
	
	$('.viewSelfSendInfo').click(function() {
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
	
	$('.addNonSelfSendInfo').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '登记样品信息',
			url : 'nonSelfSendSample_nonSelfSendSample_addPage.action?viewId=' + id,
			width : 1150,
			height : 550,
			btnsbar: [{
				text: '保　存', // 按钮文本
				action: 'save' // 按钮 action 值，用于按钮事件触发 唯一
			}].concat($.btn.CANCEL),
			callback: function(action, opt) {　　　　　 // 判断 action 值。
				if (action == 'save') {var oDoc=$(opt.document);
				var oTrs=oDoc.find('#departmentTable tbody tr');
				if(oTrs.length==1){
					asyncbox.error('对不起，您至少需要一条样品信息!','错误');
					return false;
				}
				asyncbox.confirm("是否保存样品登记表？", "提示", function(action) {
					if (action == "ok") {
						var str="";
						oTrs.each(function(){
							var nowIndex = $(this).find('td:eq(0)').html();
							if(nowIndex!=""){
								var id= $(this).data("id");
								str+=id+',';
							}
						});
						
						var date=oDoc.find('#date').prop('value');
						$.ajax({
							url:"nonSelfSendSample_nonSelfSendSample_add.action?viewId="+id,
							data:{'str':str,'dateTime':date},
							async:false,
							success:function(data){
								var json = eval('('+data+')');
								if(json.info=="success"){
									asyncbox.alert('样品登记成功 !', '登记结果',function(){
										window.location.reload();
									});
									
								}else{
									asyncbox.error('样品登记失败，请刷新页面之后重新尝试！', '登记结果');
								}
							}
						});
					}
					
				});
				return false;
				}
				if (action == "cancel"){
					window.location.reload();
				}
			}
		});
	})
	
	$('.changeSelfSendInfo').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '修改样品登记表',
			url : 'nonSelfSendSample_nonSelfSendSample_addPage.action?viewId=' + id,
			width : 1100,
			height : 550,
			btnsbar: [{
				text: '保　存', // 按钮文本
				action: 'save' // 按钮 action 值，用于按钮事件触发 唯一
			}].concat($.btn.CANCEL),
			callback: function(action, opt) {　　　　　 // 判断 action 值。
				if (action == 'save') {var oDoc=$(opt.document);
				var oTrs=oDoc.find('#departmentTable tbody tr');
				if(oTrs.length==1){
					asyncbox.error('对不起，您至少需要一条样品信息!','错误');
					return false;
				}
				asyncbox.confirm("是否修改样品登记表？", "提示", function(action) {　　　　　 // 判断 action 值。
					if (action == 'save') {var oDoc=$(opt.document);
					var oTrs=oDoc.find('#departmentTable tbody tr');
					if(oTrs.length==1){
						asyncbox.error('对不起，您至少需要一条样品信息!','错误');
						return false;
					}
					asyncbox.confirm("是否保存样品登记表？", "提示", function(action) {
						if (action == "ok") {
							var str="";
							oTrs.each(function(){
								var nowIndex = $(this).find('td:eq(0)').html();
								if(nowIndex!=""){
									var id= $(this).data("id");
									str+=id+',';
								}
							});
							var date=oDoc.find('#date').prop('value');
							$.ajax({
								url:"nonSelfSendSample_nonSelfSendSample_add.action",
								data:{'str':str,'dateTime':date},
								async:false,
								success:function(data){
									var json = eval('('+data+')');
									if(json.info=="success"){
										asyncbox.alert('样品修改成功 !', '修改结果',function(){
											window.location.reload();
										});
										
									}else{
										asyncbox.error('样品修改失败，请刷新页面之后重新尝试！', '修改结果');
									}
								}
							});
						}
						
					});
					return false;
					}
					if (action == "cancel"){
						window.location.reload();
					}
				});
				return false;
				}
				if (action == "cancel"){
					window.location.reload();
				}
			}
		});
	});
	$('.delSelfSendInfo').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('是否删除该项目的全部样品信息？该操作不可恢复!', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"nonSelfSendSample_nonSelfSendSample_deleteAll.action",
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
	
	$('.exportSelfSendInfo').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('是否将现场采样登记表导出为Word格式？', '警告', function(action) {　
			if (action == 'ok') {
				window.location.href="nonSelfSendSample_nonSelfSendSample_export.action?viewId="+id;
			}
		});
	});
	$('.reverse').click(function() {
		var tableId = $(this).attr('reverseTo');
		reverse(tableId);
	});
	
	$('.addDeliveryReceitp').click(function(){
		if($(this).parents('td').prev('td').children('a').length==1){
			asyncbox.error('无法进行交联，请先对样品信息进行登记！','结果');
			return false;
		}
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看交联单',
			url : 'nonSelfSendSample_deliveryReceitp_main.action?viewId=' + id,
			width : 700,
			height : 700,
			btnsbar: [{
				text: '一键生成', // 按钮文本
				action: 'save' // 按钮 action 值，用于按钮事件触发 唯一
			}].concat($.btn.CANCEL),
			callback: function(action, opt) {　　　　　 // 判断 action 值。
				if (action == 'save') {　　　　　　　 // 在回调函数中 this.id 可以得到该窗口
					var $body=$(opt.document);
					asyncbox.confirm('是否一键生成该项目的所有交联单？', '生成', function(action) {　
						if (action == 'ok') {
							$.ajax({
								url:"deliveryReceitp_deliveryReceitp_add.action?viewId="+id,
								async:false,
								success:function(data){
									var json = eval('('+data+')');
									if(json.info=="success"){
										asyncbox.alert("交联单生成成功！", '结果',function(){
											window.location.reload();
										});						
									}
									if(json.info=="failed"){
										asyncbox.error("交联单生成失败，请刷新之后重新尝试！", '结果');
									}
									return false;
								}
							});
						}
					});
					return false;
				}
			}
		});
	});
	
	$('.viewDeliveryReceitp').click(function(){
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
			title : '查看送检单信息',
			url : 'selfSendSampleInfo_inspectionSheet_viewPage.action?viewId=' + id,
			width : 1000,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	
	$('.delDeliveryReceitp').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('是否删除该项目的所有交接单？', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"deliveryReceitp_deliveryReceitp_deleteAll.action",
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
	
	$('.deleteInspectionSheet').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('是否删除该项目的所有送检单？', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"deliveryReceitp_inspectionSheet_deleteAll.action",
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
	})
	
	$('.addInspectionSheet').click(function(){
		if($(this).parents('td').prev('td').children('a.addDeliveryReceitp').html()=='一键生成'){
			asyncbox.error('无法生成送检单，请先填写交联单！','结果');
			return false;
		}
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '生成送检单',
			url : 'selfSendSampleInfo_inspectionSheet_main.action?viewId=' + id,
			width : 700,
			height : 500,
			btnsbar: [{
				text: '一键生成', // 按钮文本
				action: 'save' // 按钮 action 值，用于按钮事件触发 唯一
			}].concat($.btn.CANCEL),
			callback: function(action, opt) {　　　　　 // 判断 action 值。
				if (action == 'save') {　　　　　　　 // 在回调函数中 this.id 可以得到该窗口
					var doc=$(opt.document);
					var sheetId=doc.find("#type").find("option:selected").val();
					var oTable=doc.find("#analysisProjectTable").find("tbody input[type=checkbox]:checked");
					var ids="";
					oTable.each(function(){
						var id=$(this).parents('td').attr("data-id");
						ids+=id+",";
					});
					asyncbox.confirm('是否一键生成送检单？', '警告', function(action) {　
						if (action == 'ok') {
							$.ajax({
								url:"deliveryReceitp_inspectionSheet_add.action",
								data:{'ids':ids,'typeId':sheetId},
								async:false,
								success:function(data){
									var json = eval('('+data+')');
									if(json.info=="success"){
										asyncbox.alert('送检单保存成功 !', '删除结果',function(){
											window.location.reload();
										});	
									}
									if(json.info=="failed"){
										asyncbox.error('送检单保存失败，请刷新页面之后重新尝试！', '删除结果');
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
	
	$('.flow').click(function(){
		var id = $(this).attr("data-id");
		if($(this).parents('td').prev('td').children('a.addInspectionSheet').html()=='一键生成'){
			asyncbox.error('对不起，业务流转之前必须先创建送检单！','结果');
			return false;
		}
		asyncbox.confirm('您即将流转该项目，请注意以下事项：<br/> 1.请确认您已填写正确"自送样登记表"、"交联单"和"送检单"相关内容，流转之后无法修改。<br/>2.您可以在"项目列表"功能中查看已经流转的项目。','警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"selfSendSampleInfo_selfSendSampleInfo_flow.action",
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