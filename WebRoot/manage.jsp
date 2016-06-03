<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>历届班干部</title>
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
	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="col-xs-6 span9">
					<div class="tabbable" id="tabs-424906">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#panel-143085" data-toggle="tab">第一届班干</a>
							</li>
							<li>
								<a href="#panel-879329" data-toggle="tab">第二届班干</a>
							</li>
							<li>
								<a href="#panel-879330" data-toggle="tab">第三届班干</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-143085">
								<p>
									<table border="0" width="90%" cellspacing="0" cellpadding="0" style="margin-top: 8;">
											<tr>
												<td>
													<ul class="unstyled inline" >
														<c:forEach items="${manageList }" var="manage">
															<c:if test="${manage.position.id==1}">
																<li style="width: 394px; margin-left: 0px;padding: 0px;">
																	<div align="center" style="margin-top: 20px;">
																		<div><a href="#"><img style="width: 160px;height: 200px" alt="" src="${pageContext.request.contextPath}/${manage.user.face }"></a></div>
																		<font style="font-size: 12px;">姓名：${manage.user.name }</font>
																		<font style="font-size: 12px;">职位：${manage.name }</font>						
																	</div>
																</li>
															</c:if>
														</c:forEach>
													</ul>
												</td>
											</tr>
									</table>
								</p>
							</div>
							<div class="tab-pane" id="panel-879329">
								<p>
									<table border="0" width="90%" cellspacing="0" cellpadding="0" style="margin-top: 8;">
											<tr>
												<td>
													<ul class="unstyled inline" >
														<c:forEach items="${manageList }" var="manage">
															<c:if test="${manage.position.id==2}">
																<li style="width: 394px; margin-left: 0px;padding: 0px;">
																	<div align="center" style="margin-top: 20px;">
																		<div><a href="#"><img style="width: 160px;height: 200px" alt="" src="${pageContext.request.contextPath}/${manage.user.face }"></a></div>
																		<font style="font-size: 12px;">姓名：${manage.user.name }</font>
																		<font style="font-size: 12px;">职位：${manage.name }</font>						
																	</div>
																</li>
															</c:if>
														</c:forEach>
													</ul>
												</td>
											</tr>
									</table>
								</p>
							</div>
							<div class="tab-pane" id="panel-879330">
								<p>						
									<table border="0" width="90%" cellspacing="0" cellpadding="0" style="margin-top: 8;">
											<tr>
												<td>
													<ul class="unstyled inline" >
														<c:forEach items="${manageList }" var="manage">
															<c:if test="${manage.position.id==3}">
																<li style="width: 394px; margin-left: 0px;padding: 0px;">
																	<div align="center" style="margin-top: 20px;">
																		<div><a href="#"><img style="width: 160px;height: 200px" alt="" src="${pageContext.request.contextPath}/${manage.user.face }"></a></div>
																		<font style="font-size: 12px;">姓名：${manage.user.name }</font>
																		<font style="font-size: 12px;">职位：${manage.name }</font>						
																	</div>
																</li>
															</c:if>
														</c:forEach>
													</ul>
												</td>
											</tr>
									</table>
								</p>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="common/coon.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
</body>
</html>