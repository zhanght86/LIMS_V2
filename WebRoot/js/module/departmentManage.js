$(function() {
	$("#usual1 ul").idTabs();
	$('.tablelist tbody tr:odd').addClass('odd');
	$('#newDepartment').click(function() {
		asyncbox.open({
			title: '新增部门信息',
			url: 'departmentManage_department_addPage.action',
			width: 700,
			height: 350,
			btnsbar: [{
				text: '保　存', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt) {　　　　
				if (action == 'ok') {　　　　　　　 
					var oForm=opt.document.getElementById("departmentAdd");
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
	$('.changeDepartment').click(function() {
		var id=$(this).attr("data-num");
		asyncbox.open({
			title: '修改部门信息',
			url: 'departmentManage_department_changePage.action?id='+id,
			width: 700,
			height: 400,
			btnsbar: [{
				text: '修　改', // 按钮文本
				action: 'change' // 按钮 action 值，用于按钮事件触发 唯一
			}].concat($.btn.CANCEL),
			callback: function(action, opt) {　　　　　 // 判断 action 值。
				if (action == 'change') {　　　　　　　 // 在回调函数中 this.id 可以得到该窗口
					var oForm=opt.document.getElementById("departmentAdd");
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
	$('#delMoreDepartment').click(function() {
		var ids="";
		$('#departmentTable').find('tbody input[type="checkbox"]').each(function(){
			if($(this).prop('checked')){
				ids+=$(this).attr("data-num")+";";
			}
		});
		if(ids==""){
			asyncbox.alert('请先选择需要删除的部门！', '删除结果');
			return false;
		};
		asyncbox.confirm('是否批量删除所有选中的部门？删除部门将同时删除与该部门对应的角色!', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"departmentManage_department_deleteAll.action",
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
	$('.delDepartment').click(function() {
		var value=$(this).attr("data-num");
		var $_this=$(this);
		asyncbox.confirm('是否删除该部门信息？请先删除该部门下的角色，否则会导致删除失败!', '警告', function(action) {
			if (action == 'ok') {
				$.ajax({
					url:"departmentManage_department_delete.action",
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
							asyncbox.error('删除失败，请先删除该部门下的所有角色！', '删除结果');
						}
					}
					
				});
				　　
			}　　　　　
		});
	});
	$('.searchAdmin').click(function(){
		var departmentId=$(this).attr("data-depart");
		asyncbox.open({
			title: '选择部门主管',
			url: 'roleManage_role_choosePage.action?departmentId='+departmentId,
			width: 700,
			height: 600,
			btnsbar: [{
				text: '选　择', 
				action: 'ok' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt){
				if (action == 'ok') {
					var oTable=opt.document.getElementById("userTable");
					var $_oTable=$(oTable);
					$_oTable.find('tbody input[type=radio]').each(function(){
						if($(this).prop("checked")){
							var text=$(this).parents('td').next().next().html();
							var value=$(this).attr('data-search');
							asyncbox.confirm('是否将名称为【'+text+'】的角色设置为该部门主管？该角色所对应的用户将负责业务流程的分发！', '警告', function(action) {
								if (action == 'ok') {
									$.ajax({
										url:"departmentManage_department_giveManager.action",
										data:{'id':departmentId,managerId:value},
										async:false,
										success:function(data){
											var json = eval('('+data+')');
											if(json.info=="SUCCESS"){
												asyncbox.alert('添加成功 !', '添加结果',function(){
													window.location.reload();
												});
												
											}else{
												asyncbox.error('添加失败，请刷新页面之后重新尝试！', '删除结果');
											}
										}
										
									});
									　return false;　
								}　　　　　
							});
						}
					})
				}
			}
		});
	})
	
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
		window.location.href="departmentManage_department_query.action?queryStr="+str;
	});
	$('#allResult').click(function(){
		window.location.href="departmentManage_department_main.action";
	});
	$('.reverse').click(function() {
		var tableId = $(this).attr('reverseTo');
		reverse(tableId);
	});
	checkFun('departmentTable');
	$('#page1').paging({
		'pageCount': $('#totalPage').html(),
		'initPage': 1,
		'showCount': 10,
		'fn': function (pageNum) {
			$('.countPage').html(pageNum);
			$.ajax({
				url : "departmentManage_department_page.action?pageNum="+pageNum,
				async : false,
				success : function(data) {
					var json = eval('(' + data + ')');
					$('#departmentTable').find('tbody tr').hide();
					$('#departmentTable').find('tbody tr').slice((pageNum-1)*(json.pageNum),pageNum*(json.pageNum)).each(function(){
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