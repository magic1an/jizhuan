<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩录入</title>
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
							<a href="Grade_termlist.action?term=1">第一学期</a>
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
							<a href="Course_list.action?term=1">第一学期</a>
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
			<div class="container-fluid" style="width: 800px;margin-left: auto;margin-right: auto;">		
	
			<form action="Grade_savelist.action">
						<table class="table table-bordered table-striped with-check">
							
							<thead>
							<tr>
								<th colspan="7" style="text-align: center;" >第${term}学期成绩录入表 </th>
							</tr>
								<tr >
									<th>科目</th>
									<th>期末成绩</th>
									<th>平时成绩</th>	
									<th>绩点</th>
									<th>补考成绩</th>	
									<th>重修成绩</th>
									<th>备注(公选课名字)</th>				
								</tr>
							</thead>
					 	<tbody>
								<c:forEach items="${courseList }" var="course" varStatus="status"> 
									<tr>	
										<td style="text-align: left;vertical-align: middle;">${course.name }</td>			
										<td style="text-align: left;vertical-align: middle;"><input class="text input-block-level" type="text" id="grade"	name="gradeList[${status.index}].grade"   /></td>
										<td style="text-align: left;vertical-align: middle;"><input class="text input-block-level" type="text" id="grade_ps" 	name="gradeList[${status.index}].grade_ps"  /></td>
										<td style="text-align: left;vertical-align: middle;"><input class="text input-block-level" type="text" id="grade_p"		name="gradeList[${status.index}].grade_p" /></td>		
										<td style="text-align: left;vertical-align: middle;">	<input class="text input-block-level" type="text" id="grade_bk"		name="gradeList[${status.index}].grade_bk " /></td>
										<td style="text-align: left;vertical-align: middle;"><input class="text input-block-level" type="text" id="grade_cx"		name="gradeList[${status.index}].grade_cx" /></td>	
										<td style="text-align: left;vertical-align: middle;"><input class="text input-block-level" type="text" id="remark"		name="gradeList[${status.index}].remark" /></td>			
										<input class="text input-block-level" type="hidden" id="course.id"	name="gradeList[${status.index}].course.id"  value="${course.id }" />
										<input class="text input-block-level" type="hidden" id="user.id"	value="${currentUser.id }"	name="gradeList[${status.index}].user.id" />																					
									</tr>														
								</c:forEach>
							</tbody> 
					</table>		
					<input class="btn btn-info"    type="submit" value="保存"  style="float:right;">
					</form>		
			</div>	
		</div>
		<jsp:include page="../../common/coon.jsp" />
	</div>
</div>		
</div>			
</body>
</html>