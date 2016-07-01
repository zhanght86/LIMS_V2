$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		})
		$('.updateDetail').on('click',function(){
			asyncbox.open({
				title: '更新历史',
				url: 'login_login_updateHistory.action',
				width: 700,
				height: 700,
				btnsbar: $.btn.CANCEL
			});
			
		});
		
		$('.about').on('click',function(){
			asyncbox.open({
				title:'关于本系统',
				url: 'login_login_about.action',
				width:600,
				height:300,
				btnsbar: $.btn.CANCEL
			});
		});
		
		$('#login').click(function() {
			if ($('input[class=loginuser]').prop("value") == "") {
				asyncbox.error("用户名不能为空！", "登录失败");
				return false;
			}
			if ($('input[class=loginpwd]').prop("value") == "") {
				asyncbox.error("密码不能为空！", "登录失败");
				return false;
			}
			$.ajax({
				url : "login_login_login.action",
				data : $('#loginForm').serialize(),
				async : false,
				success : function(data) {
					var json = eval('(' + data + ')');
					if (json.info == "success") {
						window.location.href = "mainPage_main.action";
					}
					if (json.info == "failed") {
						asyncbox.error("服务器连接异常，请刷新之后重新尝试！", '服务器错误');
					}
					if (json.info == "noUser") {
						asyncbox.error("您输入的用户名不存在，请重新输入！", '登陆失败');
					}
					if (json.info == "errorPassword") {
						asyncbox.error("您输入的密码不正确，请重新输入！", '登陆失败');
					}
					return false;
				}
			});
		});
		
		$('#regist').click(function(){
			asyncbox.open({
				title: '新增用户信息',
				url: 'userManage_user_addPage.action',
				width: 700,
				height: 700,
				btnsbar: [{
					text: '保　存', 
					action: 'ok' 
				}].concat($.btn.CANCEL),
				callback: function(action,opt) {
					if (action == 'ok') {
						var oForm=opt.document.getElementById("userAdd");
						var $_oForm=$(oForm);
						var result = FieldValidation.validate3($_oForm);
						var identify=$_oForm.find("#identity").prop("value");
						if(!result){
							return false;
						}
						$.ajax({
							url:"userManage_user_add.action",
							data:$_oForm.serialize(),
							async:false,
							success:function(data){
								var json = eval('('+data+')');
								if(json.info=="success"){
									asyncbox.alert("注册成功！您的账号为"+identify+"，初始密码为:"+json.initPWD+"，请尽快修改您的密码信息！", '结果');						
								}
								if(json.info=="failed"){
									asyncbox.error("注册失败，请刷新之后重新尝试！", '结果');
								}
								if(json.info=="idError"){
									asyncbox.error("对不起，该用户编号已经存在，请重新生成！", '结果');
								}
								return false;
							}
						});
						
						return false;
					}
				}
			});
		});
		
		$('#feedBack').click(function(){
			asyncbox.open({
				title: '问题反馈',
				url: 'feedBack_feedBack_addPage.action',
				width: 700,
				height: 600,
				btnsbar: $.btn.CANCEL
			});
		});
		
		$('#forget')
				.click(
						function() {
							asyncbox
									.open({
										title : '找回密码界面',
										url : 'login_login_forgetPage.action',
										width : 600,
										height : 400,
										btnsbar : [ {
											text : '修　改',
											action : 'save'
										} ].concat($.btn.CANCEL),
										callback : function(action, opt) {
											if (action == 'save') {
												var oFom = $(opt.document)
														.find("#userAdd");
												var result = FieldValidation
														.validate3(oFom);
												if (!result) {
													return false;
												}
												if (oFom.find(
														'input[name=password]')
														.prop("value") != oFom
														.find(
																'input[name=newPassword]')
														.prop("value")) {
													asyncbox
															.error(
																	"您两次输入的密码不一致，请重新输入！",
																	'修改失败');
													return false;
												}
												var identify = oFom.find(
														'input[name=identify]')
														.prop("value")
												asyncbox
														.confirm(
																"是否修改用户名为"
																		+ identify
																		+ "的密码？",
																'警告',
																function(action) {
																	if (action == 'ok') {
																		$
																				.ajax({
																					url : "login_login_forget.action",
																					data : oFom
																							.serialize(),
																					async : false,
																					success : function(
																							data) {
																						var json = eval('('
																								+ data
																								+ ')');
																						if (json.info == "noUser") {
																							asyncbox
																									.error(
																											"您输入的用户名不存在，请重新输入！",
																											'修改失败');
																						}
																						if (json.info == "errorInfo") {
																							asyncbox
																									.error(
																											"您输入的用户姓名或者身份证信息不正确，请重新输入！",
																											'修改失败');
																						}
																						if (json.info == "success") {
																							asyncbox
																									.alert(
																											"密码修改成功，请牢记密码！",
																											'修改成功',
																											function() {
																												window.location
																														.reload();
																											});
																						}
																						if (json.info == "failed") {
																							asyncbox
																									.error(
																											"服务器连接异常，请刷新之后重新尝试！",
																											'服务器错误');
																						}
																					}
																				});
																	}
																});

												return false;
											}

										}
									});
						});

	});