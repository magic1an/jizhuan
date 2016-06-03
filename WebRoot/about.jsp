<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
						13计专
					</h1>
					<p>
						班群：13计专 160687105
					</p>
					<p>
						<a class="btn btn-primary btn-large" href="about.jsp">了解我们 »</a>
					</p>
				</div>
				
			</div>				
			<jsp:include page="common/coon.jsp"></jsp:include>
		</div>
	</div>
</div>
</body>
</html>