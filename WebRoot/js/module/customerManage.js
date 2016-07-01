$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$(".select3").uedSelect({
		width: 150
	});
	$('#newCustomer').click(function() {
		asyncbox.open({
			title: '新增客户信息',
			url: 'customerManage_customer_addPage.action',
			width: 700,
			height: 700,
			btnsbar: [{
				text: '保　存', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var oForm=opt.document.getElementById("customerAdd");
					var $_oForm=$(oForm);
					var result = FieldValidation.validate($_oForm);
					if(!result){
						return false;
					}
					var options = {
							    dataType : 'json',
							    success : function(data,status){
							    	var json = eval('('+data+')');
							    	asyncbox.alert(json.info, '新增结果',function(){
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
	$('.changeCustomer').click(function() {
		var id=$(this).attr("data-num");
		asyncbox.open({
			title: '修改客户信息',
			url: 'customerManage_customer_changePage.action?id='+id,
			width: 700,
			height: 700,
			btnsbar: [{
				text: '修　改', // 按钮文本
				action: 'change' // 按钮 action 值，用于按钮事件触发 唯一
			}].concat($.btn.CANCEL),
			callback: function(action, opt) {　　　　　 // 判断 action 值。
				if (action == 'change') {　　　　　　　 // 在回调函数中 this.id 可以得到该窗口
					var oForm=opt.document.getElementById("customerAdd");
					var $_oForm=$(oForm);
					var result = FieldValidation.validate($_oForm);
					if(!result){
						return false;
					}
					var options = {
							    dataType : 'json',
							    success : function(data,status){
							    	var json = eval('('+data+')');
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
	
	
	
	$('.viewCustomer').click(function() {
		var id=$(this).attr("data-num");
		asyncbox.open({
			title: '查看客户信息',
			url: 'customerManage_customer_viewPage.action?id='+id,
			width: 700,
			height: 600,
			btnsbar:$.btn.CANCEL,
		});
	});
	
	$('#delMoreCustomer').click(function() {
		var ids="";
		$('#customerTable').find('tbody input[type="checkbox"]').each(function(){
			if($(this).prop('checked')){
				ids+=$(this).attr("data-num")+";";
			}
		});
		if(ids==""){
			asyncbox.alert('请先选择需要删除的客户数据！', '删除结果');
			return false;
		};
		asyncbox.confirm('是否删除全部客户信息？', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"customerManage_customer_deleteAll.action",
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
	$('.delCustomer').click(function() {
		var value=$(this).attr("data-num");
		var $_this=$(this);
		asyncbox.confirm('是否删除该客户信息？', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"customerManage_customer_delete.action",
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
		var dataStart=$('#dataStart').prop("value");
		var dataEnd=$('#dataEnd').prop("value");
		if(dataStart&&(!dataEnd)){
			asyncbox.alert('请输入登记结束时间！', '查询结果');
			return false;
		}
		if(dataEnd&&(!dataStart)){
			asyncbox.alert('请输入登记开始时间！', '查询结果');
			return false;
		}
		if($('#searchChoose').prop("value")=="choose"){
			 window.location.href="customerManage_customer_query.action?chooseBtn=1&&queryStr="+str;
			 return false;
		}
		 window.location.href="customerManage_customer_query.action?queryStr="+str;
	});
	$('#allResult').click(function(){
		window.location.href="customerManage_customer_main.action";
	});
	$('#allResultChoose').click(function(){
		window.location.href="customerManage_customer_choosePage.action";
	});
	$('.resetPWD').click(function(){
		var value=$(this).attr("data-num");
		var $_this=$(this);
		asyncbox.confirm('是否重置该客户密码？', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"customerManage_customer_resetPWD.action",
					data:{'id':value},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="resetSuccess"){
							asyncbox.alert('重置成功 !初始化密码为'+json.pwd, '重置结果');
						}else{
							asyncbox.error('重置失败，请刷新页面后重新尝试！', '删除结果');
						}
					}
					
				});
				　　
			}　　　　　
		});
	});
	$('#resetAllPWD').click(function(){
		var ids="";
		$('#customerTable').find('tbody input[type="checkbox"]').each(function(){
			if($(this).prop('checked')){
				ids+=$(this).attr("data-num")+";";
			}
		});
		if(ids==""){
			asyncbox.alert('请先选择需要重置密码的客户数据！', '重置结果');
			return false;
		};
		asyncbox.confirm('是否批量重置所有选中的客户密码？', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"customerManage_customer_resetAllPWD.action",
					data:{'ids':ids},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="resetSuccess"){
							asyncbox.alert('重置成功 !初始化密码为'+json.pwd, '重置结果');
						}else{
							asyncbox.error('重置失败，请刷新页面后重新尝试！', '删除结果');
						}
					}
				});　　　　　
　　　			
			}　　　　　
		});
	});
	$('.reverse').click(function() {
		var tableId = $(this).attr('reverseTo');
		reverse(tableId);
	});
	checkFun('customerTable');
	$('.choose').click(function(){
		window.choose=$(this).parent('td').siblings('td:eq(0)').html();
	});
	$('#page1').paging({
		'pageCount': $('#totalPage').html(),
		'initPage': 1,
		'showCount': 10,
		'fn': function (pageNum) {
			$('.countPage').html(pageNum);
			$.ajax({
				url : "customerManage_customer_page.action?pageNum="+pageNum,
				async : false,
				success : function(data) {
					var json = eval('(' + data + ')');
					$('#customerTable').find('tbody tr').hide();
					$('#customerTable').find('tbody tr').slice((pageNum-1)*(json.pageNum),pageNum*(json.pageNum)).each(function(){
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
	$('#page2').paging({
		'pageCount': $('#totalPage').html(),
		'initPage': 1,
		'showCount': 10,
		'fn': function (pageNum) {
			$('.countPage').html(pageNum);
			$.ajax({
				url : "customerManage_customer_page.action?pageNum="+pageNum,
				async : false,
				success : function(data) {
					var json = eval('(' + data + ')');
					$('#customerTable').find('tbody tr').hide();
					$('#customerTable').find('tbody tr').slice((pageNum-1)*(json.pageNum),pageNum*(json.pageNum)).each(function(){
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