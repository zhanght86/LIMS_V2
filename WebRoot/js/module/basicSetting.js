$(function(){
	$(".select3").uedSelect({
		width : 200
	});
	$('#resetPower').click(function(){
		asyncbox.confirm('<b style="color:red;">警告！您正在初始化全部权限，初始化该操作会导致已经设置的权限失效，请谨慎操作！是否初始化？</b>', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"power_power_powerInit.action",
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert('初始化成功 !', '初始化结果',function(){
								window.location.reload();
							});
						}
						if(json.info=="failed"){
							asyncbox.error('初始化失败，请刷新页面之后重新尝试！', '删除结果');
						}
					}
				});　　　　　
			}　　　　　
		});
	});
	$('#dataBaseSetting').click(function(){
		asyncbox.open({
			title : '数据库配置',
			url : 'basicSetting_basicSetting_dataBaseSetting.action',
			width : 550,
			height : 400,
			btnsbar: [{
				text: '保　存', // 按钮文本
				action: 'save' // 按钮 action 值，用于按钮事件触发 唯一
			}].concat($.btn.CANCEL),
			callback : function(action, opt) {
				if(action=='save'){
					var oForm=opt.document.getElementById("databaseInfo");
					var $_oForm=$(oForm);
					var result = FieldValidation.validate($_oForm);
					if(!result){
						return false;
					}
					asyncbox.confirm('是否配置数据库？配置完成之后需要重启项目服务器才能生效！', '警告', function(action) {　
						if (action == 'ok') {
							$.ajax({
								url:"basicSetting_basicSetting_dataBaseOpt.action",
								data:$_oForm.serialize(), 
								async:false,
								success:function(data){
									var json = eval('('+data+')');
									if(json.info=="success"){
										asyncbox.alert("保存成功，请重新启动服务器！", '结果',function(){
											window.location.reload();
										});						
									}
									if(json.info=="failed"){
										asyncbox.error("保存失败，请刷新之后重新尝试！", '结果');
									}
									return false;
								}
							});　　
						}　　　　　
					});
					return false;
				}
				
			}
		});　　
	});
	$('.prefix').click(function(){
		var type=$(this).attr("data-type");
		var prefix=$(this).prev().val();
		asyncbox.confirm('是否重新设置该分类编号前缀？已经生成的编号不进行变更!', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"basicSetting_basicSetting_prefixSetting.action",
					data:{'type':type,'prefix':prefix},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("保存成功！", '结果',function(){
								window.location.reload();
							});						
						}
						if(json.info=="failed"){
							asyncbox.error("保存失败，请刷新之后重新尝试！", '结果');
						}
						return false;
					}
				});　　
			}　　　　　
		});
	});
	$('.setting').click(function(){
		var type=$(this).attr("data-type");
		var prefix=$(this).prev().find('option:checked').attr("value");
		asyncbox.confirm('是否保存设置？', '警告', function(action) {　
			if (action == 'ok') {
				$.ajax({
					url:"basicSetting_basicSetting_infoSetting.action",
					data:{'type':type,'prefix':prefix},
					async:false,
					success:function(data){
						var json = eval('('+data+')');
						if(json.info=="success"){
							asyncbox.alert("保存成功！", '结果',function(){
								window.location.reload();
							});						
						}
						if(json.info=="failed"){
							asyncbox.error("保存失败，请刷新之后重新尝试！", '结果');
						}
						return false;
					}
				});　　
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