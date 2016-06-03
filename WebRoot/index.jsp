<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>13计专</title>
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
				<div class="hero-unit">
					<h1>
						Hello,欢迎你!
					</h1>
					<p>
						13计专是一个非常有特殊的一个班级，都是来自少数名族地区的，这里有你不了解的文化，这里有你不知道的秘密
					</p>
					<p>
						<a class="btn btn-primary btn-large" href="about.jsp">了解我们 »</a>
					</p>
				</div>
				<ul class="thumbnails">
					<li class="span4">
						<div class="thumbnail">
							<img alt="300x200" height="200px" width="320px" src="image/work.jpg" />
							<div class="caption">
								<h4>
									最新作品
								</h4>
								<c:forEach items="${workList }" var="work" begin="1" end="6">
								<p>
									${work.title}
								</p>
								</c:forEach>
								<p>
									<a class="btn btn-primary" href="work.jsp">Readrmost>></a>
								</p>
							</div>
						</div>
					</li>
					<li class="span4">
						<div class="thumbnail">
							<img alt="300x200" height="200px" width="320px" src="image/work.jpg" />
							<div class="caption">
								<h4>
									最新通知
								</h4>
								<c:forEach items="${infromList }" var="infrom">
								
									<p>
									 ${infrom.title }
									</p>
								</c:forEach>
									 <a class="btn" href="inform.jsp">Readrmost>></a>
								</p>
							</div>
						</div>
					</li>
					<li class="span4">
						<div class="thumbnail">
							<img alt="300x200" height="200px" width="320px" src="image/work.jpg"/>
							<div class="caption">
								<h4>
									最新留言
								</h4>
								<c:forEach items="${messageList }" var="message" begin="1" end="6">
									<p>
										${message.content}
									</p>
								</c:forEach>
								<p>
									<a class="btn btn-primary" href="Message_list.action">Readrmost>></a>
								</p>
							</div>						
					</li>
				</ul>
			</div>				
			<jsp:include page="common/coon.jsp"></jsp:include>
		</div>
	</div>
</div>
</body>
</html>