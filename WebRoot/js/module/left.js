$(function() {
	// 导航切换
	$(".menuson li").click(function() {
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	$('.title').click(function() {
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if ($ul.is(':visible')) {
			$(this).next('ul').slideUp();
		} else {
			$(this).next('ul').slideDown();
		}
	});
	function powerLimit() {
		var str = "${identifyList }";
		var strArray = new Array();
		strArray = str.split(",");
		var aLi = $('.menuson').find('li');
		aLi.each(function() {
			var id = $(this).attr("data-id");
			if (strArray.indexOf(id) == -1) {
				$(this).hide();
			}
		});
	}
	powerLimit();
});