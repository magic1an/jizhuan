<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩查询</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<link rel="shortcut icon" href="<c:url value='/image/favicon.ico' /> " />
</head>
<body>
<div style="margin:0 0 50px 0 ;">
	<jsp:include page="../../common/top.jsp"></jsp:include>
</div>
<div style="width:95%;margin:50px 3% 0px 2%;">
<div class="container-fluid">
	<div class="row-fluid">
		<div class="col-xs-6 span9">
			<div style="margin: 0px 30%">
			<ul class="nav nav-tabs">	
				<li class="dropdown pull-right">
					 <a  data-toggle="dropdown" class="dropdown-toggle">查询成绩<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li>
							<a href="Grade_list.action?term=1">第一学期</a>
						</li>
						<li>
							<a href="Grade_termlist.action?term=2">第二学期</a>
						</li>
						<li>
							<a href="Grade_termlist.action?term=3">第三学期</a>
						</li>
						<li>
							<a href="Grade_termlist.action?term=4">第四学期</a>
						</li>
						<li>
							<a href="Grade_termlist.action?term=4">第五学期</a>
						</li>
						<li>
							<a href="Grade_termlist.action?term=4">第六学期</a>
						</li>
					</ul>
				</li>
				<li class="dropdown pull-left">
					 <a href="#" data-toggle="dropdown" class="dropdown-toggle">录入成绩<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li>
							<a href="Course_list.action?term=1" onclick="">第一学期</a>
						</li>
						<li>
							<a href="Course_list.action?term=2">第二学期</a>
						</li>
						<li>
							<a href="Course_list.action?term=3">第三学期</a>
						</li>
						<li>
							<a href="Course_list.action?term=4">第四学期</a>
						</li>
						<li>
							<a href="Course_list.action?term=5">第五学期</a>
						</li>
						<li>
							<a href="Course_list.action?term=6">第六学期</a>
						</li>
					</ul>
				</li>
			</ul>
			</div>
			<table class="table table-bordered" width="80%">			
		   			<caption >${currentUser.name }的成绩表</caption>
		   				<thead>
		   					<tr>
								<th style="width: 80px;border: 0px;" >学期</th>
								<th >科目</th>
								<th>期末成绩</th>
								<th>平时成绩</th>	
								<th>绩点</th>
								<th >学分</th>
								<th>补考成绩</th>	
								<th>重修成绩</th>	
								<th >科目类型</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
		  		 <tbody>
			      <c:forEach items="${gradeList }" var="grade">
						<tr class="info">
							<td style="text-align: left;vertical-align: middle;">${grade.course.term }</td>	
							<td style="text-align: left;;vertical-align: middle;">${grade.course.name }</td>
							<td style="text-align: left;vertical-align: middle;">${grade.grade }</td>
							<td style="text-align: left;vertical-align: middle;">${grade.grade_ps}</td>
							<td style="text-align: left;vertical-align: middle;">${grade.grade_p }</td>
							<td style="text-align: left;vertical-align: middle;">${grade.course.credit }</td>		
							<td style="text-align: left;vertical-align: middle;">${grade.grade_bk }</td>
							<td style="text-align: left;vertical-align: middle;">${grade.grade_cx}</td>
							<td style="text-align: left;vertical-align: middle;">${grade.course.type }</td>
							<td style="text-align: left;vertical-align: middle;">${grade.remark }</td>			
							<td><a id="modal-273840" href="#modal-container-273840" onclick="return xiugai()" role="button" class="btn" data-toggle="modal">修改</a></td>
						</tr>
					</c:forEach>
		   		</tbody>
			</table>
			<div class="pagination pagination-right">
				${pageCode }
			</div>
		<div id="modal-container-273840" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h3 id="myModalLabel">
								修改成绩
							</h3>
						</div>
						<div class="modal-body">
							<form id="fm" action="#" method="post" enctype="multipart/form-data">
								<table>								
									<tr>
										<td>
											<label class="control-label" for="top">期末成绩：</label>
										</td>
										<td>
											<input type="text" name="grade.course.term" value="${grade.course.term }" />
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label" for="top">平时成绩：</label>
										</td>
										<td>
											<input type="text" name="grade.course.term" value="${grade.course.term }" />
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label" for="top">绩点：</label>
										</td>
										<td>
											<input type="text" name="grade.course.term" value="${grade.course.term }" />
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label" for="top">学分：</label>
										</td>
										<td>
											<input type="text" name="grade.course.term" value="${grade.course.term }" />
										</td>
									</tr>
										<tr>
										<td>
											<label class="control-label" for="top">重修成绩：</label>
										</td>
										<td>
											<input type="text" name="grade.course.term" value="${grade.course.term }" />
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label" for="top">备注：</label>
										</td>
										<td>
											<input type="text" name="grade.course.term" value="${grade.course.term }" />
										</td>
									</tr>
									
									</table>
								<input id="topicId" type="hidden">
							</form>
						</div>
						<div class="modal-footer">
							 <button class="btn" data-dismiss="modal" aria-hidden="true" onclick="return resetValue()">关闭</button> 
							 <button class="btn btn-primary" onclick="javascript:saveTopic()">保存设置</button>
						</div>
					</div>
		</div>
		<jsp:include page="../../common/coon.jsp" />
	</div>
</div>		
</div>			
</body>
</html>