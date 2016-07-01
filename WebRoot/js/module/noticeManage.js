$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$(".select3").uedSelect({
		width: 150
	});
	$('#newNotice').click(function() {
		asyncbox.open({
			title: '新增系统公告',
			url: 'noticeManage_noticeManage_addPage.action',
			width: 900,
			height: 750,
			btnsbar: [{
				text: '保　存', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var oForm=opt.document.getElementById("NoticeForm");
					var $_oForm=$(oForm);
					var result = FieldValidation.validate3($_oForm);
					if(!result){
						return false;
					}
					opt.uploadFile();
					return false;
				}
				if(action=="cancel"){
					window.location.reload();
				}　　　
				if(action=="close"){
					window.location.reload();
				}　　　　
			}
		});
	});
	$('.viewNotice').click(function() {
		var id=$(this).attr("data-id");
		asyncbox.open({
			title: '查看公告',
			url: 'noticeManage_noticeManage_viewPage.action?viewId='+id,
			width: 1100,
			height: 600,
			btnsbar: $.btn.CANCEL
		});
	});
	$('.download').click(function(){
		var id = $(this).attr("data-id");
		asyncbox.confirm('是否下载附件？', '警告', function(action) {
			if (action == 'ok') {
				window.location.href="noticeManage_noticeManage_export.action?viewId="+id;
			}
		});
	});
	$('#delNoticeAll').click(function() {
		var ids="";
		$('#roleTable').find('tbody input[type="checkbox"]').each(function(){
			if($(this).prop('checked')){
				ids+=$(this).attr("data-id")+";";
			}
		});
		if(ids==""){
			asyncbox.alert('请先选择需要删除的公告！', '删除结果');
			return false;
		};
		asyncbox.confirm('是否批量删除所有选中公告信息？', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"noticeManage_noticeManage_deleteAll.action",
					data:{'ids':ids},
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
	$('.delNotice').click(function() {
		var value=$(this).attr("data-id");
		var $_this=$(this);
		asyncbox.confirm('是否删除该公告？删除之后其他用户将无法查看该公告信息！', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"noticeManage_noticeManage_delete.action",
					data:{'viewId':value},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=='success'){
							asyncbox.alert('删除成功 !', '删除结果',function(){
								$_this.parents('tr').remove();
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
	$('#seachBtn').click(function(){
		var str="";
		$('.seachform').find('input.scinput').each(function(){
			if($(this).prop("value")){
				str+=($(this).attr("data-search")+"="+$(this).prop("value")+";");
			};
		})
		$('.seachform').find('select.select3').each(function(){
			if($(this).find('option:checked').prop("value")!=-1){
				str+=($(this).attr("data-search")+"="+$(this).find('option:checked').prop("value")+";");
			};
		})
		if(str==""){
			asyncbox.alert('请输入查询条件，可以多条件同时查询！', '查询结果');
			return false;
		}
		window.location.href="noticeManage_noticeManage_query.action?queryStr="+str;
	});
	
	$('#allResult').click(function(){
		window.location.href="noticeManage_noticeManage_main.action";
	});
	$('.reverse').click(function() {
		var tableId = $(this).attr('reverseTo');
		reverse(tableId);
	});
	checkFun('roleTable');
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
					$('#roleTable').find('tbody tr').hide();
					$('#roleTable').find('tbody tr').slice((pageNum-1)*(json.pageNum),pageNum*(json.pageNum)).each(function(){
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