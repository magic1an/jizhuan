<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>讨论区</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<link rel="shortcut icon" href="image/favicon.ico"/>
<style type="text/css">
th{
	height: 40px;
	width: 150px;
	border-color:#ccc;
	color: #f0ff;
}
</style>
</head>


<body>
<div style="margin:0 0 50px 0 ;">
	<jsp:include page="common/top.jsp"></jsp:include>
</div>
<div style="width:90%;margin:50px 3% 0px 7%;">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-xs-6 span9">
					<table style="width: 100%">
		<c:forEach items="${zoneList }" var="zone">
		<tr>
			<td>
				<table style="width:95%" class="table">
								<th align="left" >
									${zone.name }
								</th>
								<tr class="success">
									<td >
										<c:forEach items="${zone.sectionList }" var="section">
											<div style="width: 40%;float: left;padding: 5%;">						
															<div><a href="Topic_list.action?sectionId=${section.id }"><img height="180px"  width="240px"  src="<c:url value="${section.logo}"/>" /></a></div>
															<div style="margin: 0 auto;"> <a href="Topic_list.action?sectionId=${section.id }"><font style="font-size: 18px;font-weight: bold;">${section.name }</font></a></div>
															<font style="font-size: 12px;">专题总数：${sectionTopicCount.get(section) }</font>
															<font style="font-size: 12px;">精华专题：${sectionGoodTopicCount.get(section) }</font>
															<font style="font-size: 12px;">未回复：${sectionNoReplyTopicCount.get(section) }</font>
															<font style="font-size: 12px;">版主：${section.master.name }</font>
											</div>
										</c:forEach>
									</td>
								</tr>
							
							</table>
						
						</td>
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