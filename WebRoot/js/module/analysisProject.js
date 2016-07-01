$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$(".select3").uedSelect({
		width : 150
	});
	$('#newAnalysisProject').click(function() {
		asyncbox.open({
			title: '新增项目信息',
			url: 'analysisProject_analysisProject_addPage.action',
			width: 700,
			height: 400,
			btnsbar: [{
				text: '保　存', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var oForm=opt.document.getElementById("analysisProjectAdd");
					var $_oForm=$(oForm);
					var result = FieldValidation.validate3($_oForm);
					if(!result){
						return false;
					}
					$.ajax({
						url : "analysisProject_analysisProject_add.action",
						data:$_oForm.serialize(),
						async : false,
						success : function(data) {
							var json = eval('(' + data + ')');
							if(json.info=='success'){
						    	asyncbox.alert('检测项目添加成功！', '通知',function(){
						    		window.location.reload();
						    	});
					    	}else{
					    		asyncbox.error('检测项目添加失败，请刷新后重新尝试！', '通知');
					    	}
							return false;
						}
					});
					return false;
				}
				　　　　　
			}
		});
	});
	$('.changeAnalysisProject').click(function() {
		var id=$(this).attr("data-num");
		asyncbox.open({
			title: '修改项目信息',
			url: 'analysisProject_analysisProject_changePage.action?viewId='+id,
			width: 700,
			height: 400,
			btnsbar: [{
				text: '修　改', // 按钮文本
				action: 'change' // 按钮 action 值，用于按钮事件触发 唯一
			}].concat($.btn.CANCEL),
			callback: function(action, opt) {　　　　　 // 判断 action 值。
				if (action == 'change') {　　　　　　　 // 在回调函数中 this.id 可以得到该窗口
					var oForm=opt.document.getElementById("analysisProjectAdd");
					var $_oForm=$(oForm);
					var result = FieldValidation.validate($_oForm);
					if(!result){
						return false;
					}
					$.ajax({
						url : "analysisProject_analysisProject_change.action",
						data:$_oForm.serialize(),
						async : false,
						success : function(data) {
							var json = eval('(' + data + ')');
							if(json.info=='success'){
						    	asyncbox.alert('检测项目修改成功！', '通知',function(){
						    		window.location.reload();
						    	});
					    	}else{
					    		asyncbox.error('检测项目修改失败，请刷新后重新尝试！', '通知');
					    	}
							return false;
						}
					});
					return false;
				}
			}
		});
	});
	$('#delMoreAnalysisProject').click(function() {
		var ids="";
		$('#analysisProjectTable').find('tbody input[type="checkbox"]').each(function(){
			if($(this).prop('checked')){
				ids+=$(this).attr("data-num")+";";
			}
		});
		if(ids==""){
			asyncbox.alert('请先选择需要删除的检测项数据！', '删除结果');
			return false;
		};
		asyncbox.confirm('是否批量删除所有选中的检测项？', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"analysisProject_analysisProject_deleteAll.action",
					data:{'ids':ids},
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
	$('.delAnalysisProject').click(function() {
		var value=$(this).attr("data-id");
		var $_this=$(this);
		asyncbox.confirm('是否删除该检测项目信息？', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"analysisProject_analysisProject_delete.action",
					data:{'viewId':value},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
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
		});
		$('.seachform').find('select.select3').each(function(){
			if($(this).find('option:checked').prop("value")!=-1){
				str+=($(this).attr("data-search")+"="+$(this).find('option:checked').prop("value")+";");
			};
		})
		if(str==""){
			asyncbox.alert('请输入查询条件，可以多条件同时查询！', '查询结果');
			return false;
		}
		window.location.href="analysisProject_analysisProject_query.action?queryStr="+str;
	});
	
	
	$('#allResult').click(function(){
		window.location.href="analysisProject_analysisProject_main.action";
	});
	$('.reverse').click(function() {
		var tableId = $(this).attr('reverseTo');
		reverse(tableId);
	});
	checkFun('analysisProjectTable');
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