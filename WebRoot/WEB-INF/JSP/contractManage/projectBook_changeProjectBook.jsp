<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>My JSP 'projectBook.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/cssReset.css" rel="stylesheet" type="text/css" />
<link href="css/projectBook.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script src="js/validCheck.js" type="text/javascript" charset="utf-8"></script>
<script src="js/module/projectPlan.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body>
	<h2
		style="text-align:center; font-size:24px; font-family: '黑体';margin-top: 10px">任
		务 书</h2>
	<h2
		style="text-align:right; font-size:14px; margin:10px; padding-right:100px">
		编号：<label style="width:100px" id="addPageIdentify">${identify
			}</label>
	</h2>
	<form action="" id="projectBookForm">
		<table border="1" cellspacing="0" cellpadding="0" width="108%">
			<tr>
				<td width="16%"><p align="center">委托单位</p></td>
				<td width="83%" colspan="5" valign="top"><p align="center">${client}</p>
				</td>
			</tr>
			<tr>
				<td width="16%"><p align="center">项目名称</p></td>
				<td width="83%" colspan="5" valign="top">
					<p align="center">${projectName}</p>
				</td>
			</tr>
			<tr>
				<td width="16%"><p align="center">目的</p></td>
				<td width="83%" colspan="5" valign="top"><input type='text'
					name="aim" style="width:100%; height:30px; background:#e9e3e3"
					value="${aim }" /></td>
			</tr>
			<tr>
				<td width="16%"><p align="center">地址</p></td>
				<td width="32%" colspan="2" valign="top"><p align="center">
						<input type='text' name="address"
							style="width:100%; height:30px; background:#e9e3e3"
							value="${address}" />
					</p></td>
				<td width="9%"><p align="center">邮编</p></td>
				<td width="42%" colspan="2" valign="top"><p align="center">
						<input type='text' name="code"
							style="width:100%; height:30px; background:#e9e3e3"
							value="${code }" />
					</p></td>
			</tr>
			<tr>
				<td width="16%"><p align="center">联系人</p></td>
				<td width="32%" colspan="2" valign="top"><p align="center">
						<input type='text' name="contact"
							style="width:100%; height:30px; background:#e9e3e3"
							value="${contact}" />
					</p></td>

				<td width="9%"><p align="center">电话</p></td>
				<td width="42%" colspan="2" valign="top"><p align="center">
						<input type='text' name="tel"
							style="width:100%; height:30px; background:#e9e3e3"
							value="${tel }" />
					</p></td>
			</tr>
			<c:if test="${contractType==0 }">
				<tr>
					<td width="16%" rowspan="3"><p align="center">委托内容</p></td>
					<td width="83%" colspan="5" valign="top"><c:if
							test="${contractType==0 }">
							<table>
								<tr>
									<td width="73" style="text-align:center">环境要素</td>
									<td colspan="2" width="156" style="text-align:center">监测点（个）</td>
									<td colspan="3" width="151" style="text-align:center">监测项目</td>
									<td colspan="3" width="117" style="text-align:center">监测频次</td>
									<td width="169" style="text-align:center">备注</td>
								</tr>
								<c:forEach var="i" items="${ project.tContractId.items}">
									<tr>
										<td width="73"><label>${i.analysisCategory.name }</label></td>
										<td colspan="2" width="156"><label>${i.siteNum }</label></td>
										<td colspan="3" width="151"><label>${i.analysisProject.name
												}</label></td>
										<td colspan="3" width="117"><label>${i.analysisFrequency.name
												}</label></td>
										<td width="169"><label>${i.other }</label></td>
									</tr>
								</c:forEach>
							</table>
						</c:if> <c:if test="${contractType==1 }">
							<textarea name="context"
								style="width:100%; height:100px;background:#e9e3e3"
								class="required" data-alert="委托内容"></textarea>
						</c:if></td>
				</tr>
				<tr>
					<td width="14%"><p align="center">检测方法</p></td>
					<c:if test="${projectWay==0 }">
						<td width="69%" colspan="4"><p>&nbsp;以我单位通过计量认证或实验室认可的方法进行检测</p></td>
					</c:if>
					<c:if test="${projectWay==1 }">
						<td width="69%" colspan="4"><p>&nbsp;客户指定的方法：${customerText
								}</p></td>
					</c:if>
				</tr>
				<tr>
					<td width="14%"><p align="center">送样方法</p></td>
					<td colspan="9" width="593">&nbsp;&nbsp;&nbsp;&nbsp;<input
								type='radio' name="gainSample" id="type1" value="1"
								checked="checked" /><label for="type1">自行送样</label>       <input
								type='radio' name="gainSample" id="type2" value="0" /><label
								for="type2">现场采样</label>  
							</td>
				</tr>
			</c:if>

			<c:if test="${contractType==1 }">
				<tr>
					<td width="16%" rowspan="4"><p align="center">委托内容</p></td>
					<td width="83%" colspan="5" valign="top"><c:if
							test="${contractType==0 }">
							<table>
								<tr>
									<td width="73" style="text-align:center">环境要素</td>
									<td colspan="2" width="156" style="text-align:center">监测点（个）</td>
									<td colspan="3" width="151" style="text-align:center">监测项目</td>
									<td colspan="3" width="117" style="text-align:center">监测频次</td>
									<td width="169" style="text-align:center">备注</td>
								</tr>
								<c:forEach var="i" items="${ project.tContractId.items}">
									<tr>
										<td width="73"><label>${i.analysisCategory.name }</label></td>
										<td colspan="2" width="156"><label>${i.siteNum }</label></td>
										<td colspan="3" width="151"><label>${i.analysisProject.name
												}</label></td>
										<td colspan="3" width="117"><label>${i.analysisFrequency.name
												}</label></td>
										<td width="169"><label>${i.other }</label></td>
									</tr>
								</c:forEach>
							</table>
						</c:if> <c:if test="${contractType==1 }">
							<textarea name="context"
								style="width:100%; height:100px;background:#e9e3e3"
								class="required" data-alert="委托内容"></textarea>
						</c:if></td>
				</tr>
				<tr>
					<td width="14%" rowspan="2"><p align="center">检测方法</p></td>
					<c:choose>
						<c:when test="${projectWay==0 }">
							<td width="69%" colspan="4">
								<p>
									<input type="radio" name="projectWay" value="0"
										checked="checked" />&nbsp;以我单位通过计量认证或实验室认可的方法进行检测
								</p>
							</td>
						</c:when>
						<c:otherwise>
							<td width="69%" colspan="4">
								<p>
									<input type="radio" name="projectWay" value="0" />&nbsp;以我单位通过计量认证或实验室认可的方法进行检测
								</p>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td width="14%"><p align="center">送样方法</p></td>
					<td colspan="9" width="593">&nbsp;&nbsp;&nbsp;&nbsp;<input
								type='radio' name="gainSample" id="type1" value="1"
								checked="checked" /><label for="type1">自行送样</label>       <input
								type='radio' name="gainSample" id="type2" value="0" /><label
								for="type2">现场采样</label>  
							</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${projectWay==1 }">
							<td width="69%" colspan="4"><p>
									<input type="radio" name="projectWay" value="1"
										checked="checked" />客户指定的方法：<input type='text'
										name="customerText"
										style="width:60%; height:30px; background:#e9e3e3"
										value="${customerText }" />
								</p></td>
						</c:when>
						<c:otherwise>
							<td width="69%" colspan="4"><p>
									<input type="radio" name="projectWay" value="1" />客户指定的方法：<input
										type='text' name="customerText"
										style="width:60%; height:30px; background:#e9e3e3" />
								</p></td>
						</c:otherwise>
					</c:choose>

				</tr>
			</c:if>

			<tr>
				<td width="16%"><p align="center">任务下达人</p></td>
				<td width="32%" colspan="2"><p align="center">${taskUnder.name
						}</p></td>
				<td width="17%" colspan="2"><p align="center">日期</p></td>
				<td width="33%"><p align="center">${taskUnderDate }</p></td>
			</tr>
			<tr>
				<td width="16%"><p align="center">承接科室</p></td>
				<td width="32%" colspan="2"><p align="center">
						<select style="width:100%; height:30px; background:#e9e3e3"
							name="departmentId" id="depSel">
							<option value="0">请选择</option>
							<s:iterator value="#departmentList" id="d">
								<option value="${d.id }">${d.name }</option>
							</s:iterator>
						</select>
					</p></td>
				<td width="17%" colspan="2"><p align="center">项目负责人</p></td>
				<td width="33%">
				<select style="width:100%; height:30px; background:#e9e3e3" name="projectChargeId" id="projectChargeId">
				</select>
				</td>
			</tr>
			<tr>
				<td width="16%"><p align="center">报告编制人</p></td>
				<td width="32%" colspan="2"><p align="center">&nbsp;</p></td>
				<td width="17%" colspan="2"><p align="center">日期</p></td>
				<td width="33%"><p align="center">&nbsp;</p></td>
			</tr>
			<tr>
				<td width="16%"><p align="center">报告一审人</p></td>
				<td width="32%" colspan="2"><p align="center">&nbsp;</p></td>
				<td width="17%" colspan="2"><p align="center">日期</p></td>
				<td width="33%"><p align="center">&nbsp;</p></td>
			</tr>
			<tr>
				<td width="16%"><p align="center">报告二审人</p></td>
				<td width="32%" colspan="2"><p align="center">&nbsp;</p></td>
				<td width="17%" colspan="2"><p align="center">日期</p></td>
				<td width="33%"><p align="center">&nbsp;</p></td>
			</tr>
			<tr>
				<td width="16%"><p align="center">报告签发人</p></td>
				<td width="32%" colspan="2"><p align="center">&nbsp;</p></td>
				<td width="17%" colspan="2"><p align="center">日期</p></td>
				<td width="33%"><p align="center">&nbsp;</p></td>
			</tr>
			<tr>
				<td width="16%"><p align="center">业务员签收</p></td>
				<td width="32%" colspan="2"><p align="center">&nbsp;</p></td>
				<td width="17%" colspan="2"><p align="center">日期</p></td>
				<td width="33%"><p align="center">&nbsp;</p></td>
			</tr>
			<tr>
				<td width="16%"><p align="center">归档人签收</p></td>
				<td width="32%" colspan="2"><p align="center">&nbsp;</p></td>
				<td width="17%" colspan="2"><p align="center">日期</p></td>
				<td width="33%"><p align="center">&nbsp;</p></td>
			</tr>
			<tr>
				<td width="100%" colspan="6" valign="top"><p>
						备注：
						<textarea name="other"
							style="width:95%; height:100px;background:#e9e3e3;margin: 10px">${other }</textarea>
					</p></td>
			</tr>
		</table>
	</form>
</body>
</html>
