$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$(".select3").uedSelect({
		width: 150
	});
	$('#newInventory').click(function() {
		asyncbox.open({
			title: '新增商品信息',
			url: 'inventoryManage_inventory_addPage.action',
			width: 900,
			height: 700,
			btnsbar: [{
				text: '保　存', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {
					var oForm=opt.document.getElementById("inventoryAdd");
					var $_oForm=$(oForm);
					var result = FieldValidation.validate($_oForm);
					if(!result){
						return false;
					}
					var options = {
						    dataType : 'json',
						    success : function(data,status){
						    	var json = eval('('+data+')');
						    	if(json.info=="idError"){
						    		asyncbox.error("您输入的商品编号已经存在，请重新输入或者自动生成！", '设备编号已经存在');
						    		return false;
						    	}
						    	if(json.info=="SUCCESS"){
						    		asyncbox.alert("设备信息保存成功！", '保存结果',function(){
						    			window.location.reload();
						    		});
						    	}
						    	if(json.info=="ERROR"){
						    		asyncbox.alert("设备信息保存失败，请刷新后重试！", '保存结果',function(){
						    			window.location.reload();
						    		});
						    	}
						    }
				    };
					$_oForm.ajaxSubmit(options);
					return false;
				}　　　　　
			}
		});
	});
	$('#paramSys').click(function(){
		var ids="";
		$('#inventoryTable').find('tbody input[type="checkbox"]').each(function(){
			if($(this).prop('checked')){
				ids+=$(this).attr("data-num")+";";
			}
		});
		if(ids==""){
			asyncbox.alert('请先选择需要调整警戒值的商品数据！', '调整结果');
			return false;
		};
		asyncbox.open({
			title: '设置库存预警值',
			url: 'inventoryManage_inventory_changeParam.action',
			width: 700,
			height: 400,
			btnsbar: [{
				text: '更　改', // 按钮文本
				action: 'change' // 按钮 action 值，用于按钮事件触发 唯一
			}].concat($.btn.CANCEL),
			callback: function(action, opt){
				if (action == 'change'){
					var $_doc = $(opt.document);
					$_doc.find('.changeWay').each(function(){
						if($(this).prop("checked")){
							var index=$(this).attr('data-index');
							var Text=$_doc.find('.dfinput:eq('+index+')').prop("value");
							$.ajax({
							    type: 'POST',
							    url: 'inventoryManage_inventory_changeLower.action',
							    data: {
							    	ids:ids,
							    	changeWay:index,
							    	changeText:Text
							    },
							    dataType: 'json',
							    success: function(data){
							    	var json = eval('('+data+')');
							    	if(json.info=='SUCCESS'){
							    		asyncbox.alert("预警下限值修改成功", '修改结果！',function(){
								    		window.location.reload();
								    	});
							    	}
							    	if(json.info=='ERROR'){
							    		asyncbox.alert("预警下限值修改失败，请刷新之后重新尝试！", '修改结果');
							    	}
							    },
							    
							});
							
							
						}
					})
				}
			}
		});
	});
	$('.changeInventory').click(function() {
		var id=$(this).attr("data-num");
		asyncbox.open({
			title: '修改商品信息',
			url: 'inventoryManage_inventory_changePage.action?id='+id,
			width: 700,
			height: 700,
			btnsbar: [{
				text: '修　改', // 按钮文本
				action: 'change' // 按钮 action 值，用于按钮事件触发 唯一
			}].concat($.btn.CANCEL),
			callback: function(action, opt) {　　　　　 // 判断 action 值。
				if (action == 'change') {　　　　　　　 // 在回调函数中 this.id 可以得到该窗口
					var oForm=opt.document.getElementById("inventoryAdd");
					var $_oForm=$(oForm);
					var result = FieldValidation.validate($_oForm);
					if(!result){
						return false;
					}
					var options = {
							    dataType : 'json',
							    success : function(data,status){
							    	var json = eval('('+data+')');
							    	if(json.info=="error"){
							    		asyncbox.alert("商品信息修改失败，请刷新后重新尝试！", '修改结果');
							    		return false;
							    	}
							    	asyncbox.alert(json.info, '修改结果',function(){
							    		window.location.reload();
							    	});
							    },
							    resetForm: true
					    };
					$_oForm.ajaxSubmit(options);
					return false;
				}
			}
		});
	});
	
	$('.viewInventory').click(function() {
		var id=$(this).attr("data-num");
		asyncbox.open({
			title: '查看商品信息',
			url: 'inventoryManage_inventory_viewPage.action?id='+id,
			width: 700,
			height: 600,
			btnsbar:$.btn.CANCEL,
		});
	});
	$('.usAgeRecord').click(function(){
		alert("尚未完成！");
	})
	
	$('#delMoreInventory').click(function() {
		var ids="";
		$('#inventoryTable').find('tbody input[type="checkbox"]').each(function(){
			if($(this).prop('checked')){
				ids+=$(this).attr("data-num")+";";
			}
		});
		if(ids==""){
			asyncbox.alert('请先选择需要删除的设备数据！', '删除结果');
			return false;
		};
		asyncbox.confirm('是否批量删除所有选中的设备信息？同时将删除该设备的使用记录及该设备相关数据！', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"inventoryManage_inventory_deleteAll.action",
					data:{'ids':ids},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="deleteSuccess"){
							asyncbox.alert('删除成功 !', '删除结果',function(){
								window.location.reload();
							});
							
						}else{
							asyncbox.error('删除失败，请刷新页面之后重新尝试！', '删除结果');
						}
					}
				});　　　　　
　　　			
			}　　　　　
		});
	});
	$('.delInventory').click(function() {
		var value=$(this).attr("data-num");
		var $_this=$(this);
		asyncbox.confirm('是否删除该商品信息？同时将删除该商品相关数据，但已缴费记录不会被删除！', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"inventoryManage_inventory_delete.action",
					data:{'id':value},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="deleteSuccess"){
							asyncbox.alert('删除成功 !', '删除结果');
							$_this.parents('tr').remove();
							$('.tablelist tbody tr').removeClass('odd');
							$('.tablelist tbody tr:odd').addClass('odd');
						}else{
							asyncbox.error('删除失败，请刷新页面之后重新尝试！', '删除结果');
						}
					}
					
				});
				　　
			}　　　　　
		});
	});
	$('#seachBtn').click(function(){
		var str="";
		$('.seachform').find('input.scinput').each(function(){
			if($(this).prop("value")){
				str+=($(this).attr("data-search")+"="+$(this).prop("value")+";");
			};
		})
		$('.seachform').find('select.select3').each(function(){
			if($(this).find('option:checked').prop("value")!=0){
				str+=($(this).attr("data-search")+"="+$(this).find('option:checked').prop("value")+";");
			};
		})
		if(str==""){
			asyncbox.alert('请输入查询条件，可以多条件同时查询！', '查询结果');
			return false;
		};	
		 window.location.href="inventoryManage_inventory_query.action?queryStr="+str;
	});
	$('#allResult').click(function(){
		window.location.href="inventoryManage_inventory_main.action";
	});
	
	
	
	$('.reverse').click(function() {
		var tableId = $(this).attr('reverseTo');
		reverse(tableId);
	});
	checkFun('inventoryTable');
	$('#page1').paging({
		'pageCount': $('#totalPage').html(),
		'initPage': 1,
		'showCount': 10,
		'fn': function (pageNum) {
			$('.countPage').html(pageNum);
			$.ajax({
				url : "inventoryManage_inventory_page.action?pageNum="+pageNum,
				async : false,
				success : function(data) {
					var json = eval('(' + data + ')');
					$('#inventoryTable').find('tbody tr').hide();
					$('#inventoryTable').find('tbody tr').slice((pageNum-1)*(json.pageNum),pageNum*(json.pageNum)).each(function(){
						$(this).show();
					})
				}

			});
		},
		'liCss': {
			'display': 'inline-block',
			'border': '#8db5d7 1px solid',
			'padding': '2px 8px',
			'cursor': 'pointer',
			'margin': '0 2px',
			'color': '#000',
			'border-radius': '5px',
			'pointer-events': 'auto'
		},
		'liActive': {
			'border': '#ccc 1px solid',
			'font-weight': 'bold',
			'background': '#f5f5f5',
			'cursor': 'default',
			'pointer-events': 'none'
		},
		'liForbid': {
			'border': '#ccc 1px solid',
			'color': '#ccc',
			'cursor': 'default',
			'pointer-events': 'none'
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