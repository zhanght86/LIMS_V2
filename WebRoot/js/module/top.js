$(function() {
	// 顶部导航切换
	$(".nav li a").click(function() {
		$(".nav li a.selected").removeClass("selected");
		$(this).addClass("selected");
	});

	$('#outLogin').click(function() {
		$.ajax({
			url : "mainPage_outLogin.action",
			async : false,
			success : function(data) {
				var json = eval('(' + data + ')');
				if (json.info == "success") {
					window.parent.location.href = "mainPage_login.action";
				}
			}
		});
	});
	$('#commonTools').click(function() {
		asyncbox.open({
			title : '查看业务合同',
			url : 'contractManage_contractList_viewTContract.action',
			width : 1100,
			height : 700,
			btnsbar : $.btn.CANCEL,
			callback : function(action, opt) {
			}
		});
	});
	setTimeout(function() {
		push();
	}, 200);
	/* 30轮询读取函数 */
	var method = setInterval(function() {
		push();
	}, 30000);
	function push() {
		clearInterval(method);
		$.ajax({
			type : "POST",
			url : "pushMessage.action",
			data : {
				t : 3
			},
			beforeSend : function() {
			},
			success : function(data) {
				var obj = eval("(" + data + ")");
				if (obj.info == 'getMessage') {
					if (obj.num != $('#messageNum').html()) {
						if (obj.num > $('#messageNum').html()) {
							playSound();
						}
						;
						$('#messageNum').html(obj.num);

					}
				}
				method = setInterval(function() {
					push();
				}, 30000);
				if (obj.sixin != 0) {
					$(".tongzhi").html(obj.sixin).show();
				} else {
					$(".tongzhi").html(0).hide();
				}
			}
		});
	}
	function playSound() {
		var borswer = window.navigator.userAgent.toLowerCase();
		if (borswer.indexOf("ie") >= 0) {
			// IE内核浏览器
			var strEmbed = '<embed name="embedPlay" src="message.wav" autostart="true" hidden="true" loop="false"></embed>';
			if ($("body").find("embed").length <= 0)
				$("body").append(strEmbed);
			var embed = document.embedPlay;

			// 浏览器不支持 audion，则使用 embed 播放
			embed.volume = 100;
			embed.play();
		} else {
			// 非IE内核浏览器
			var strAudio = "<audio id='audioPlay' src='message.wav' hidden='true'>";
			if ($("body").find("audio").length <= 0)
				$("body").append(strAudio);
			var audio = document.getElementById("audioPlay");

			// 浏览器支持 audion
			audio.play();
		}
	}
	$('.newInfo').click(
			function() {

				var a = window.parent.parent.frames["rightFrame"].document
						.testMessage();

			});
});