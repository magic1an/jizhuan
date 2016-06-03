<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">

</head>
<body>

				<table style="width:800px;" align="center">
					
					<tr>
						<td>
							<ul class="unstyled inline" >
								
										<li style="width: 394px; margin-left: 0px;padding: 0px;">
											<div align="center" style="margin-top: 20px;">
												<div><a href="Manage_list.action?sectionId=${manage.id }"><img style="width: 160px;height: 200px" alt="" src="${pageContext.request.contextPath}/${manage.user.face }"></a></div>
												<font style="font-size: 12px;">姓名：${manage.user.name }</font>
												<font style="font-size: 12px;">职位：${manage.name }</font>						
											</div>
										</li>
								
							</ul>
						</td>
					</tr>
				</table>

	
</body>
</html>