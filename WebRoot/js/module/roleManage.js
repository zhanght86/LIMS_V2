$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$('#newRole').click(function() {
		asyncbox.open({
			title: '新增角色信息',
			url: 'roleManage_role_addPage.action',
			width: 700,
			height: 400,
			btnsbar: [{
				text: '保　存', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var oForm=opt.document.getElementById("roleAdd");
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
	$('.limitman').click(function(){
		var id=$(this).attr("data-id");
		asyncbox.open({
			title: '设置权限',
			url: 'power_power_main.action',
			width: 350,
			height: 800,
			btnsbar: [{
				text: '保　存', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {
					var win=$(opt);
					var treeObj=opt.$.fn.zTree.getZTreeObj("power");
					var nodes = treeObj.getCheckedNodes(true);
					var ids="";
					for ( var i = 0; i < nodes.length; i++) {
						ids+=nodes[i].id+",";
					} 
					asyncbox.confirm('是否给当前角色设置权限？该权限列表会自动应用于该角色对应的用户！', '提示', function(action) {　
						if (action == 'ok') {
					$.ajax({
						url:"power_power_powerGiven.action",
						data:{'ids':ids,'viewId':id},
						async:false,
						success:function(data){
							var json = eval('('+data+')');
							if(json.info=="success"){
								asyncbox.alert('保存成功 !', '保存结果',function(){
									window.location.reload();
								});
								
							}if(json.info=="failed"){
								asyncbox.error('保存失败，请刷新页面之后重新尝试！', '保存结果');
							}
						}
					});
						}
					});
					return false;
				}　　　　　
			}
		});
	})
	$('.userList').click(function(){
		var id=$(this).attr("data-num");
		asyncbox.open({
			title: '查看用户信息',
			url: 'userManage_user_choosePageNoSelect.action?roleId='+id,
			width: 700,
			height: 400,
			btnsbar: $.btn.CANCEL
		});
	});
	$('.changeRole').click(function() {
		var id=$(this).attr("data-num");
		asyncbox.open({
			title: '修改角色信息',
			url: 'roleManage_role_changePage.action?id='+id,
			width: 700,
			height: 400,
			btnsbar: [{
				text: '修　改', // 按钮文本
				action: 'change' // 按钮 action 值，用于按钮事件触发 唯一
			}].concat($.btn.CANCEL),
			callback: function(action, opt) {　　　　　 // 判断 action 值。
				if (action == 'change') {　　　　　　　 // 在回调函数中 this.id 可以得到该窗口
					var oForm=opt.document.getElementById("roleAdd");
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
	$('#delMoreRole').click(function() {
		var ids="";
		$('#roleTable').find('tbody input[type="checkbox"]').each(function(){
			if($(this).prop('checked')){
				ids+=$(this).attr("data-num")+";";
			}
		});
		if(ids==""){
			asyncbox.alert('请先选择需要删除的角色数据！', '删除结果');
			return false;
		};
		asyncbox.confirm('是否批量删除所有选中的角色？请先删除绑定该角色的用户信息！', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"roleManage_role_deleteAll.action",
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
	$('.delRole').click(function() {
		var value=$(this).attr("data-num");
		var $_this=$(this);
		asyncbox.confirm('是否删除该角色信息？请先删除绑定该角色的用户信息！', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"roleManage_role_delete.action",
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
							asyncbox.error('删除失败，请先删除绑定该角色的用户！', '删除结果');
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
		if(str==""){
			asyncbox.alert('请输入查询条件，可以多条件同时查询！', '查询结果');
			return false;
		}
		window.location.href="roleManage_role_query.action?queryStr="+str;
	});
	$('#allResult').click(function(){
		window.location.href="roleManage_role_main.action";
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