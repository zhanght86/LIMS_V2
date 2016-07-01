$(function() {
	$("#usual1 ul").idTabs();
	$('#changePwd').click(function() {
		var oldPWD =$('#oldPWD').prop("value");
		var newPWD = $('#newPWD').prop("value");
		var newRepeatPWD = $('#newRepeatPWD').prop("value");
		if(newPWD!=newRepeatPWD){
			asyncbox.error('您两次输入的密码不一致，请重新输入!', '修改密码');
			return;
		}
		if(newPWD.length<5){
			asyncbox.error('密码必须是五位或五位以上的数字或字母组合，请重新输入!', '修改密码');
			return;
		}
		$.ajax({
			url:"userPWDManage_userPWD_changePWD.action",
			data:$('#userPWDChange').serialize(),
			async:false,
			success:function(data){
				var json = eval('('+data+')');
				if(json.info == "pwdError"){
					asyncbox.error('您当前密码输入不正确!', '修改密码');
					return false;
				}
				if(json.info=="success"){
					asyncbox.alert("密码修改成功！","修改密码",function(){
						window.location.reload();
					})
				}
			}
		});　
		
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