<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>留言吧</title>
<script type="text/javascript" src="bootstrap/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="bootstrap/js/jquery-ui.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<link rel="shortcut icon" href="image/favicon.ico"/>
</head>
<body>
<div style="margin:0 0 50px 0 ;">
	<jsp:include page="common/top.jsp"></jsp:include>
</div>

<div style="width:90%;margin:50px 3% 0px 7%;">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-xs-6 span9">
				<div class="alert alert-info" >
					 <button type="button" class="close" data-dismiss="alert">×</button>
					<h4>
						提示!
					</h4> <strong>警告!</strong> 请注意你的个人隐私安全.
				</div>
				<form action="Message_save.action" method="post">
					<table>					
						<tr>
							<td style="vertical-align: top;">
											【留下你的脚印】:
							</td>
							<td>
								<textarea name="message.content" id="Content" cols="50" style="height:150px;width:500px;" ></textarea>
							</td>
							
						</tr>
						<tr>
							<td>
							</td>
							<td align="right">
								<input type="submit" value="留言" onclick="return checkForm()">
							</td>
						</tr>
						<input  type="hidden" name="message.user.id" value="${currentUser.id }">
					</table>
				</form>
				<div class="pagination pagination-right">
				${pageCode }
				</div>
				<table class="table">
				<c:forEach items="${messageList }" var="message">
					 <tr >
					
					    	<td rowspan="3" width="120px;"><img height="80px" width="102px" src="<c:url value="${message.user.face}"/>" /></td>
					   
					    <td style="font-size: 12px;">${message.user.name }
					    </td>
					  </tr>
					  <tr class="success">
					    <td height="100px;">${message.content}</td>
					  </tr>
					  <tr class="warning">
					    <td style="font-size: 12px;">${message.m_time}</td>
					 </tr>
				</c:forEach>
				</table>
							
			</div>	
		<jsp:include page="common/coon.jsp"></jsp:include>		
	</div>
</div>
</div>
</body>
</html>