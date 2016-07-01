$(function() {
	$(".select3").uedSelect({
		width : 60
	});
	$(".select2").uedSelect({
		width : 700
	});
	function choose() {
		var index = $('select[name=sendWay]').find("option:selected").prop(
				"value");
		if (index == 0) {
			$('#dep').hide();
			$('#user').hide();
		}
		if (index == 1) {
			$('#dep').show();
			$('#user').hide();
		}
		if (index == 2) {
			$('#dep').hide();
			$('#user').show();
		}
	}
	choose();
	$('select[name=sendWay]').change(choose);
	$('#departChose')
			.focus(
					function() {
						asyncbox
								.open({
									title : '选择部门',
									url : 'departmentManage_department_choosePage.action',
									width : 500,
									height : 400,
									btnsbar : [ {
										text : '选　择', // 按钮文本
										action : 'choose' // 按钮 action
									// 值，用于按钮事件触发 唯一
									} ].concat($.btn.CANCEL),
									callback : function(action, opt) {
										if (action == 'choose') {
											var table = $(opt.document);
											var oChecks = table
													.find('tbody input[type=checkbox]:checked');
											var ids = '';
											var names = '';
											oChecks.each(function() {
												ids += $(this).attr(
														'data-search')
														+ ';';
												names += $(this).attr(
														'data-name')
														+ ';';
											});
											$('#departChose').prop('value',
													names);
											$('#departChoseHide').prop('value',
													ids);
										}
									}
								});
					});
	$("#userChose").focus(
			function() {
				asyncbox.open({
					title : '选择管理员',
					url : 'userManage_user_choosePageCheck.action',
					width : 700,
					height : 600,
					btnsbar : [ {
						text : '选　择',
						action : 'ok'
					} ].concat($.btn.CANCEL),
					callback : function(action, opt) {
						if (action == 'ok') {
							var oTable = opt.document
									.getElementById("userTable");
							var $_oTable = $(oTable);
							var ids = '';
							var names = '';
							$_oTable.find('tbody input[type=checkbox]:checked')
									.each(
											function() {

												ids += $(this).attr(
														'data-search')
														+ ';';
												names += $(this).attr(
														'data-name')
														+ ';';
											});
							$('#userChose').prop('value',
									$('#userChose').prop('value') + names);
							$('#userChoseHide').prop('value',
									$('#userChoseHide').prop('value') + ids);
						}
					}
				});
			});
	$('#autoCreate').click(function(){
		asyncbox
		.open({
			title : '高级编辑器',
			url : 'mainPage_highEdit.action',
			width : 500,
			height : 400,
			btnsbar : [ {
				text : '选　择', // 按钮文本
				action : 'choose' // 按钮 action
			// 值，用于按钮事件触发 唯一
			} ].concat($.btn.CANCEL),
			callback : function(action, opt) {
				if (action == 'choose') {
					
				}
			}
		});
	});

});