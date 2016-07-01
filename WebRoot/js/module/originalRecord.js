$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$(".select3").uedSelect({
		width: 150
	});
	$('#newTemplet').click(function() {
		asyncbox.open({
			title: '新增原始记录',
			url: 'originalRecord_originalRecord_addPage.action',
			width: 750,
			height: 500,
			btnsbar: [{
				text: '保　存', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var oForm=opt.document.getElementById("templetAdd");
					var $_oForm=$(oForm);
					var result = FieldValidation.validate($_oForm);
					if(!result){
						return false;
					}
					$(opt.document.body).find('#sumbitBtn').trigger("click");
					return false;
				}
				if(action=="close"){
					window.location.reload();
				}　
				if(action=="cancel"){
					window.location.reload();
				}　
			}
		});
	});
	$('.addAll').on('click',function(){
		asyncbox.open({
			title: '批量导入原始记录',
			url: 'originalRecord_originalRecord_addAllPage.action',
			width: 750,
			height: 500,
			btnsbar: [{
				text: '保　存', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var oForm=opt.document.getElementById("templetAdd");
					var $_oForm=$(oForm);
					var result = FieldValidation.validate($_oForm);
					if(!result){
						return false;
					}
					$(opt.document.body).find('#sumbitBtn').trigger("click");
					return false;
				}
				if(action=="close"){
					window.location.reload();
				}　
				if(action=="cancel"){
					window.location.reload();
				}　
			}
		});
	});
	
	$('.viewRecord').on('click',function(){
		var id = $(this).attr("data-id");
		asyncbox.open({
			title : '查看原始记录表',
			url : 'originalRecord_originalRecord_viewPage.action?viewId=' + id,
			width : 1200,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	
	
	$('#delMoreTemplet').click(function() {
		var ids="";
		$('#templetTable').find('tbody input[type="checkbox"]').each(function(){
			if($(this).prop('checked')){
				ids+=$(this).attr("data-id")+";";
			}
		});
		if(ids==""){
			asyncbox.error('请先选择需要删除的原始记录数据！', '删除结果');
			return false;
		};
		asyncbox.confirm('是否批量删除所有选中的记录表模版？', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"originalRecord_originalRecord_deleteAll.action",
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
	
	$('.delRecord').click(function() {
		var value=$(this).attr("data-id");
		var $_this=$(this);
		asyncbox.confirm('是否删除该原始记录表模板？删除之后将无法恢复！', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"originalRecord_originalRecord_delete.action",
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
		})
		var ids=$("#depSel option:selected").attr('value');
		if(ids!='-1'){
			str+='u.id='+ids;
		}
		if(str==""){
			asyncbox.alert('请输入查询条件，可以多条件同时查询！', '查询结果');
			return false;
		}
		window.location.href="originalRecord_originalRecord_query.action?queryStr="+str;
	});
	
	
	
	
	$('#allResult').click(function(){
		window.location.href="originalRecord_originalRecord_main.action";
	});
	
	
	$('.reverse').click(function() {
		var tableId = $(this).attr('reverseTo');
		reverse(tableId);
	});
	checkFun('templetTable');
	
	$('#page1').paging({
		'pageCount': $('#totalPage').html(),
		'initPage': 1,
		'showCount': 10,
		'fn': function (pageNum) {
			$('.countPage').html(pageNum);
			$.ajax({
				url : "commonTemplet_commonTemplet_page.action?pageNum="+pageNum,
				async : false,
				success : function(data) {
					var json = eval('(' + data + ')');
					$('#templetTable').find('tbody tr').hide();
					$('#templetTable').find('tbody tr').slice((pageNum-1)*(json.pageNum),pageNum*(json.pageNum)).each(function(){
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