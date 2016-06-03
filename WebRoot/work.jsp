<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Work</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<link rel="shortcut icon" href="image/favicon.ico"/>
</head>
<body>
<div>
	<jsp:include page="common/top.jsp"></jsp:include>
</div>
<div style="width:90%;margin:0px 3% 0px 7%;">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<div class="col-xs-6 span9">
						<div class="carousel slide" id="carousel-656742">
							<ol class="carousel-indicators">
								<li class="active" data-slide-to="0" data-target="#carousel-656742">
								</li>
								<li data-slide-to="1" data-target="#carousel-656742">
								</li>
								<li data-slide-to="2" data-target="#carousel-656742">
								</li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img alt="" src="image/1.jpg" />
									<div class="carousel-caption">
										<h4>
											棒球
										</h4>
										<p>
											棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。
										</p>
									</div>
								</div>
								<div class="item">
									<img alt="" src="image/2.jpg" />
									<div class="carousel-caption">
										<h4>
											冲浪
										</h4>
										<p>
											冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。
										</p>
									</div>
								</div>
								<div class="item">
									<img alt="" src="image/2.jpg" />
									<div class="carousel-caption">
										<h4>
											自行车
										</h4>
										<p>
											以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
										</p>
									</div>
								</div>
							</div> <a data-slide="prev" href="#carousel-656742" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-656742" class="right carousel-control">›</a>
						</div>
						<div class="accordion" id="accordion-673646">
							<div class="accordion-group">
								<div class="accordion-heading">
									 
									<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-673646" href="#accordion-element-85435">文章类</a>
									<a href="Work_add.action" onclick="return checkForm()">添加文章</a>
								</div>
								<div id="accordion-element-85435" class="accordion-body collapse in">
									<div class="accordion-inner" style="width: 300px;">
										
										<%-- <c:forEach items="${workList }" var="work">
										<table  width="100%">
												<tr class="success">
												<td align="center" >
													<a href="Work_findById.action?workId=${work.id }"> ${work.title }</a>
												</td>
												<td align="right">
													${work.user.name}
												</td>
											</tr>
											
										</table>
										
										</c:forEach>	 --%>								
									</div>
								</div>
							</div>
						
						</div>
						<c:forEach items="${workList }" var="work">
						<table class="table">				
							<tr>
								<td rowspan="2">
									<img height="48px" width="72px" src="<c:url value='${work.user.face }' />" />
								</td>
								<td>
									<a href="Work_findById.action?workId=${work.id }"> ${work.title }</a>
								</td>
							</tr>
							<tr>
								<td>
									作者：${work.user.name }
								</td>
							</tr>
						</table>
						</c:forEach>
					</div>
					<jsp:include page="common/coon.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>