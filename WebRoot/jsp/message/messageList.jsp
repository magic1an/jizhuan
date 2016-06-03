<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
</head>
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="col-xs-6 span9">
			<table class="table">
				<thead>
					<tr>
						<th>
							留言板
						</th>
						<th>
							<textarea style="width:400px;height: 80px;max-width: 600px;max-height: 100px;"></textarea>
						</th>
					
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<img alt="" src=" <c:url value='${user.face}'/> " >
						</td>
						<td>
							TB - Monthlyfdsfdsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaafd
						</td>
					
				</tbody>
			</table>
		</div>
				<div class="col-xs-6 span3">
					<form class="form-horizontal">
						<div class="control-group">						
								<input id="inputEmail" type="text"  placeholder="userName" style="height:22px;"/>					
						</div>
						<div class="control-group">						
								<input id="inputPassword" type="password"  placeholder="password" style="height:22px;"/>					
						</div>
						<div class="control-group">						
								<button type="submit" class="btn">登陆</button>					
						</div>
					</form>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								面板标题
							</h3>
						</div>
						<div class="panel-body">
							Panel content
						</div>
						<div class="panel-footer">
							Panel footer
						</div>
					</div>
				</div>
	</div>
</div>
</body>
</html>