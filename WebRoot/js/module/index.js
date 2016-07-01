$(function() {
	$('#changePwd').click(function() {
		asyncbox.open({
			title : '修改用户密码',
			url : 'userPWDManage_userPWD_changePage.action',
			width : 600,
			height : 390,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});

	})
	$('#historyLogin').click(function() {
		asyncbox.open({
			title : '查看登录历史记录',
			url : 'login_historyLogin_viewPage.action',
			width : 800,
			height : 500,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	$('#newNotice').click(function() {
		asyncbox.open({
			title : '新增系统公告',
			url : 'noticeManage_noticeManage_addPage.action',
			width : 900,
			height : 750,
			btnsbar : [ {
				text : '保　存',
				action : 'ok'
			} ].concat($.btn.CANCEL),
			callback : function(action, opt) {
				if (action == 'ok') {
					var oForm = opt.document.getElementById("NoticeForm");
					var $_oForm = $(oForm);
					var result = FieldValidation.validate3($_oForm);
					if (!result) {
						return false;
					}
					opt.uploadFile();
					return false;
				}
				if (action == "cancel") {
					window.location.reload();
				}
				if (action == "close") {
					window.location.reload();
				}
			}
		});
	});
	$('.viewNotice').click(function() {
		var id = $(this).attr('data-id');
		asyncbox.open({
			title : '查看公告',
			url : 'noticeManage_noticeManage_viewPage.action?viewId=' + id,
			width : 1100,
			height : 600,
			btnsbar : $.btn.CANCEL
		});
	});

	var now = new Date();
	hour = now.getHours();
	if (hour < 6) {
		$('#nowTime').html("凌晨好");
	} else {
		if (hour < 9) {
			$('#nowTime').html("早上好");
		} else {
			if (hour < 12) {
				$('#nowTime').html("上午好");
			} else {
				if (hour < 14) {
					$('#nowTime').html("中午好");
				} else {
					if (hour < 17) {
						$('#nowTime').html("下午好");
					} else {
						if (hour < 19) {
							$('#nowTime').html("傍晚好");
						} else {
							$('#nowTime').html("晚上好");
						}
					}
				}
			}
		}
	}
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