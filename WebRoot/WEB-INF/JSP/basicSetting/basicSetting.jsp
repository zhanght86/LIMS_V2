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

<title>My JSP 'basicSetting.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="asyncbox/skins/ZCMS/asyncbox.css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="asyncbox/AsyncBox.v1.4.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/module/basicSetting.js" type="text/javascript"
	charset="utf-8"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="javascript:;">系统管理</a></li>
			<li>基础设置</li>
		</ul>
	</div>
	<div id="usual1" class="usual">
		<div class="formbody">
			<div class="formtitle" style="width: 100%">
				<span>基础设置（需重新启动系统）</span>
			</div>
			<div class="toolsli">
				<ul class="forminfo">
					
					<li><label style="width: 100px;">合同审核角色</label>  <div class="vocation">
							<s:select list="#roleList" listKey="id" listValue="name" name="contractAuditRole"  cssClass="select3"></s:select>
						</div>  &nbsp;&nbsp;&nbsp;<input
						name="" type="button" class="scbtn setting" value="保  存"
						data-type="contractAuditRole" /></li>
					<li><label style="width: 100px;">实验分析部门</label>
					<div class="vocation">
							<s:select list="#departmentList" listKey="id" listValue="name" name="syfxs"  cssClass="select3"></s:select>
						</div> &nbsp;&nbsp;&nbsp;<input name="" type="button"
						class="scbtn setting" value="保  存" data-type="syfxs" /></li>
					<li><label style="width: 100px;">实验分析角色</label> <div class="vocation">
							<s:select list="#roleList" listKey="id" listValue="name" name="syfxy"  cssClass="select3"></s:select>
						</div> &nbsp;&nbsp;&nbsp;<input
						name="" type="button" class="scbtn setting" value="保  存"
						data-type="syfxy" /></li>
					<li><label style="width: 100px;">现场采样部门</label> <div class="vocation">
							<s:select list="#departmentList" listKey="id" listValue="name" name="xcjcs"  cssClass="select3"></s:select>
						</div> &nbsp;&nbsp;&nbsp;<input
						name="" type="button" class="scbtn setting" value="保  存"
						data-type="xcjcs" /></li>
					

				</ul>
			</div>
			<div class="formtitle" style="width: 100%">
				<span>编码设置（需重新启动系统）</span>
			</div>
			<div class="toolsli">
				<form action="roleManage_role_add.action" id="roleAdd">
					<ul class="forminfo">
					<li><label>每页记录数</label> <s:textfield
							cssClass="dfinput" name="rows" cssStyle="width:200px"
							placeholder="必填项，请输入整数值"></s:textfield> &nbsp;&nbsp;&nbsp;<input
						name="" type="button" class="scbtn prefix" value="保  存"
						data-type="rows" /></li>
					<li><label>用户初始密码</label> <s:textfield
							cssClass="dfinput" name="initPassword" cssStyle="width:200px"
							placeholder="必填项，请输入默认密码"></s:textfield> &nbsp;&nbsp;&nbsp;<input
						name="" type="button" class="scbtn prefix" value="保  存"
						data-type="initPassword" /></li>
						<li><label>角色编号前缀</label> <s:textfield cssClass="dfinput"
								name="role" cssStyle="width:200px" placeholder="必填项，请输入角色编号前缀"></s:textfield>
							&nbsp;&nbsp;&nbsp;<input name="" type="button"
							class="scbtn prefix" value="保  存" data-type="role" /></li>
						<li>
						<li><label>用户编号前缀</label> <s:textfield cssClass="dfinput"
								name="user" cssStyle="width:200px" placeholder="必填项，请输入用户编号前缀"></s:textfield>
							&nbsp;&nbsp;&nbsp;<input name="" type="button"
							class="scbtn prefix" value="保  存" data-type="user" /></li>
						<li>
						<li><label>客户编号前缀</label> <s:textfield cssClass="dfinput"
								name="customer" cssStyle="width:200px"
								placeholder="必填项，请输入角色编号前缀"></s:textfield> &nbsp;&nbsp;&nbsp;<input
							name="" type="button" class="scbtn prefix" value="保  存"
							data-type="customer" /></li>
						<li>
						<li><label>部门编号前缀</label> <s:textfield cssClass="dfinput "
								name="department" cssStyle="width:200px"
								placeholder="必填项，请输入客户编号前缀"></s:textfield> &nbsp;&nbsp;&nbsp;<input
							name="" type="button" class="scbtn prefix" value="保  存"
							data-type="department" /></li>
						<li>
						<li><label>检测项目前缀</label> <s:textfield cssClass="dfinput"
								name="analysisType" cssStyle="width:200px"
								placeholder="必填项，请输入项目编号前缀"></s:textfield> &nbsp;&nbsp;&nbsp;<input
							name="" type="button" class="scbtn prefix" value="保  存"
							data-type="analysisType" /></li>
						<li>
						<li><label>合同编号前缀</label> <s:textfield cssClass="dfinput"
								name="contractNum" cssStyle="width:200px"
								placeholder="必填项，请输入合同编号前缀"></s:textfield> &nbsp;&nbsp;&nbsp;<input
							name="" type="button" class="scbtn prefix" value="保  存"
							data-type="contractNum" /></li>
						<li>
					</ul>
				</form>

			</div>
			<div class="formtitle" style="width: 100%">
				<span>系统设置（需重新启动项目）</span>
			</div>
			<div class="toolsli">
				<ul class="toollist">
					<li><a href="javascript:;" id="resetPower"><img
							src="images/i07.png" /></a>
						<h2>权限重置</h2></li>
					<li style="width: auto;"><a href="javascript:;"
						id="dataBaseSetting"><img src="images/database.jpg" /></a>
						<h2>数据库配置</h2></li>
					<!-- <li style="width: auto;"><a href="javascript:;"
						id="resetPower"><img src="images/backup.jpg" /></a>
						<h2>备份数据</h2></li> -->
				</ul>

			</div>
		</div>
	</div>
</body>
</html>
