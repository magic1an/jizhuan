<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">

</head>
<body>
<div style="margin:0 0 50px 0 ;">
	<jsp:include page="../../common/top.jsp"></jsp:include>
</div>
<div style="width:90%;margin:50px 3% 0px 7%;">
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="col-xs-6 span9">
					<ul class="breadcrumb">
						<li>
							<a href="Work_list.action">作品区</a> <span class="divider">/</span>
						</li>
					
						<li class="active">
							<%-- 	${ } --%>
						</li>
					</ul>
				
					<div style="margin:0 10%;width: 80%; ">	
					<h2>
						${work.title }
					</h2>
					
						${work.content }
					</div>
				
				</div>
				<jsp:include page="../../common/coon.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
</div>
