$(function() {
	$("#usual1 ul").idTabs();
	$(".select3").uedSelect({
		width : 150,
		margin:0
	});
	$(".select2").uedSelect({
		width:'100%',
		margin:0
	});
	
	$('#analysisCategory').on('change',function(){
		var id=$(this).find('option:checked').val();
		if(id!=null){
			$.ajax({
				url:"contractManage_contract_analysisCategory.action?analysisCategoryId="+id,
				async:false,
				success:function(data){
					var json = eval('('+data+')');
					if(json.info=="success"){
						var itemArray=json.list;
						$('#analysisProject').empty();
						$('#analysisProject').append('<option value="-1">请选择</option>');
						for(var i=0;i<itemArray.length;i++){
							$('#analysisProject').append('<option value="'+itemArray[i].id+'">'+itemArray[i].name+'</option>');
						}
						  $("#analysisProject").find("option:eq(0)").prop("selected",true);
					}
					if(json.info=="failed"){
						asyncbox.error("合同保存失败，请刷新之后重新尝试！", '保存结果');
					}
					return false;
				}
			});
		}
	});
	
	var index = 1;
	//金额小写转大写
	$('input[name=cost]').on('input propertychange', function () {
	    var chinese = atoc($(this).val());
	    $('#paymentChinese').html(chinese);
	});
	
	$('#newRow').click(function() {
		if(index<8){
			var analysisCategoryName=$('#analysisCategory').find('option:selected').html();
			var analysisCategoryId=$('#analysisCategory').val();
			var analysisProjectName=$('#analysisProject').find('option:selected').html();
			var analysisProjectId=$('#analysisProject').val();
			var analysisFrequencyName=$('#analysisFrequency').find('option:selected').html();
			var analysisFrequencyId=$('#analysisFrequency').val();
			var siteNum=$('#siteNum').val();
			var other=$('#other').val();
			if(analysisCategoryId==-1){
				asyncbox.error('对不起，您必须选择一个环境要素！', '警告');
				return false;
			}
			if(analysisProjectId == -1){
				asyncbox.error('对不起，您必须选择一个监测项目！', '警告');
				return false;
			}
			if(analysisFrequencyId==-1){
				asyncbox.error('对不起，您必须选择一个监测频次！', '警告');
				return false;
			}
			
			var container = $('#itemContainer');
			var a = $(this).parents('tr').prev();
			var oTr=$("<tr class='itemsResult'></tr>");
			var oTd1=$('<td width="73" data-id="'+analysisCategoryId+'">'+analysisCategoryName+'</td>');
			var oTd2=$('<td colspan="2" width="156">'+siteNum+'</td>');
			var oTd3=$('<td colspan="3" width="151" data-id="'+analysisProjectId+'">'+analysisProjectName+'</td>');
			var oTd4=$('<td colspan="3" width="117" data-id="'+analysisFrequencyId+'">'+analysisFrequencyName+'</td>');
			var oTd5=$('<td width="169">'+other+'</td>');
			oTr.append(oTd1);
			oTr.append(oTd2);
			oTr.append(oTd3);
			oTr.append(oTd4);
			oTr.append(oTd5);
			a.after(oTr);
			var value = container.attr('rowspan');
			container.attr('rowspan', parseInt(value) + 1)
			index++;
			
		}else{
			asyncbox.error('警告：当前已到达最大检测项个数！', '警告');
		}
	});
	$('input[name=projectWayText]').hide();
	$('input[name=projectWay]').click(function(){
		var chose=$(this).prop("id");
		if(chose=="way1"){
			$('input[name=projectWayText]').hide();
		}
		if(chose=="way2"){
			$('input[name=projectWayText]').show();
		}
	});
	$('#delRow').click(function() {
		if(index!=1){
			var container = $('#itemContainer');
			var a = $(this).parents('tr').prev();
			a.remove();
			var value = container.attr('rowspan');
			container.attr('rowspan', parseInt(value) - 1)
			index--;
		}else{
			asyncbox.error('警告：该合同至少需要1个检测项！', '警告');
		}
	});
	$('#reWrite').click(function(){
		asyncbox.confirm('是否重新起草业务合同？填写项将会被清空！', '警告', function(action) {　
			if (action == 'ok') {
				document.getElementById("contractForm").reset();
			}　　　　　
		});
	});
	$('#reWriteService').click(function(){
		asyncbox.confirm('是否重新起草服务合同？填写项将会被清空！', '警告', function(action) {　
			if (action == 'ok') {
				document.getElementById("serviceForm").reset();
			}　　　　　
		});
	});
	$('#createContract').click(function(){
		var result = FieldValidation.validate2($('#contractTable'));
		if(!result){
			return false;
		}
		
		var str='';
		$('.itemsResult').each(function(){
			var obj='environmentElement:'+$(this).find('td:eq(0)').data("id")+',siteNum:'+$(this).find('td:eq(1)').html()+',project:'+$(this).find('td:eq(2)').data("id")+',frequency:'+$(this).find('td:eq(3)').data("id")+',other:'+$(this).find('td:eq(4)').html()+';';
			str+=obj;
		});
		$('#itemTemp').prop('value',str);
		asyncbox.open({
			title: '生成合同',
			url: 'contract_template.action',
			data:$('#contractForm').serialize(), 
			width: 1100,
			height: 700,
			btnsbar: $.btn.CANCEL
		});
		
	});
	
	
	$('#createServiceContract').click(function(){
		var result = FieldValidation.validate3($('#serviceForm'));
		if(!result){
			return false;
		}
		asyncbox.open({
			title: '生成合同',
			url: 'contractManage_serviceContract_createService.action',
			data:$('#serviceForm').serialize(), 
			width: 1100,
			height: 700,
			btnsbar: [{
				text: '保　存', 
				action: 'save' 
			},{
				text: '导　出', 
				action: 'out' 
			},{
				text: '打　印', 
				action: 'print' 
			},{
				text: '进入流程', 
				action: 'into' 
			}].concat($.btn.CANCEL),
			callback: function(action,opt){
				if(action=='save'){
					$.ajax({
						url:"contractManage_serviceContract_save.action",
						async:false,
						success:function(data){
							var json = eval('('+data+')');
							if(json.info=="success"){
								asyncbox.alert("合同保存成功！", '保存结果');
								var oLabel=$(opt.document);
								oLabel.find('#serviceCreateIdentify').html(json.identify);
							}
							if(json.info=="failed"){
								asyncbox.error("合同保存失败，请刷新之后重新尝试！", '保存结果');
							}
							return false;
						}
					});
					return false;
				}
				
				if (action == 'out') {
					
					var oLabel=$(opt.document);
					var temp = oLabel.find('#serviceCreateIdentify').html();
					if(temp=='请先保存合同!'){
						asyncbox.alert("导出之前，您必须先保存合同！", '流转结果');
						return false;
					}
					window.location.href="contractManage_serviceContract_export.action";
					return false;
				}
				
				if (action == 'print') {
					var oLabel=$(opt.document);
					var temp = oLabel.find('#serviceCreateIdentify').html();
					if(temp=='请先保存合同!'){
						asyncbox.alert("打印之前，您必须先保存合同！", '流转结果');
						return false;
					}
					opt.printTable();
					return false;
				}
				
				if(action=='into'){
					var oLabel=$(opt.document);
					var temp = oLabel.find('#serviceCreateIdentify').html();
					if(temp=='请先保存合同!'){
						asyncbox.alert("进入流程之前，您必须先保存合同！", '流转结果');
						return false;
					}
					$.ajax({
						url:"contractManage_serviceContract_flow.action",
						async:false,
						success:function(data){
							var json = eval('('+data+')');
							if(json.info=="success"){
								asyncbox.alert("创建项目成功，该合同已经进入审批阶段！", '流转结果');
							}
							if(json.info=="failed"){
								asyncbox.error("创建项目失败，请到合同列表界面重新尝试进入流程！", '流转结果');
							}
						}
					});
					return false;
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