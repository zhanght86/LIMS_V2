<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>显示消息队列</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
</head>
<body class="common" style="width: 500px">
	<div class="formbody">
		<table class="tablelist" id="userTable" style="width: 450px">
			<thead>
				<tr>
					<th>消息时间</th>
					<th>提示</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#messageQueueList" id="m">
					<tr>
						<td>${m.pushDate }</td>
						<td>${m.message }</td>
						<td><a href="javascript:;" class="tablelink ignoreMessage"
							data-id="${m.id}">忽略</a></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		$(function() {
			$('.ignoreMessage').click(function() {
				var $_this = $(this);
				var id = $(this).attr('data-id');
				$.ajax({
					url : "pushMessage_ignoreMessage.action",
					data : {
						'viewId' : id
					},
					async : false,
					success : function(data) {
						var json = eval('(' + data + ')');
						if (json.info == "success") {
							$_this.parents('tr').remove();
						}
					}
				});
			});
		});
	</script>
</body>
</html>
