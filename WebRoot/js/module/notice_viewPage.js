$(function(){
		$('.download').click(function(){
			var id = $(this).attr("data-id");
			asyncbox.confirm('是否下载附件？', '警告', function(action) {
				if (action == 'ok') {
					window.location.href="noticeManage_noticeManage_export.action?viewId="+id;
				}
			});
		});
	})