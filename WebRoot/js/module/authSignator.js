$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$(".select3").uedSelect({
		width : 150
	});
	$('#newSignator').click(function() {
		asyncbox.open({
			title: '新增授权签字人',
			url: 'authSignator_authSignator_addPage.action',
			width: 700,
			height: 400,
			btnsbar: [{
				text: '保　存', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var oForm=opt.document.getElementById("authSignatorAdd");
					$.ajax({
						url : "authSignator_authSignator_add.action",
						data:$(oForm).serialize(),
						async : false,
						success : function(data) {
							var json = eval('(' + data + ')');
							if(json.info=='success'){
						    	asyncbox.alert('授权签字人添加成功！', '通知',function(){
						    		oForm.reset();
						    		window.location.reload();
						    	});
					    	}else{
					    		asyncbox.error('授权签字人添加失败，请刷新后重新尝试！', '通知');
					    	}
							return false;
						}
					});
				
					return false;
				}
				　　　　　
			}
		});
	});
	$('.delSignator').on('click',function(){
		var value=$(this).attr("data-id");
		asyncbox.confirm('是否删除该授权签字人？', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"authSignator_authSignator_delete.action",
					data:{'viewId':value},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
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
	
	$('#page1').paging({
		'pageCount': $('#totalPage').html(),
		'initPage': 1,
		'showCount': 10,
		'fn': function (pageNum) {
			$('.countPage').html(pageNum);
			$.ajax({
				url : "roleManage_role_page.action?pageNum="+pageNum,
				async : false,
				success : function(data) {
					var json = eval('(' + data + ')');
					$('#analysisProjectTable').find('tbody tr').hide();
					$('#analysisProjectTable').find('tbody tr').slice((pageNum-1)*(json.pageNum),pageNum*(json.pageNum)).each(function(){
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