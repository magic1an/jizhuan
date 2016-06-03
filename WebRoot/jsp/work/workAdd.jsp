<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 富文本  -->
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/emoticon.css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.emoticons.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>

<!-- 界面必须 -->
<script type="text/javascript" src="bootstrap/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="bootstrap/js/jquery-ui.js"></script><link href="bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">

</head>
<div style="margin:0 0 50px 0 ;">
	<jsp:include page="../../common/top.jsp"></jsp:include>
</div>
<div style="width:90%;margin:50px 3% 0px 7%;">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-xs-6 span9">
				<div class="alert alert-info" >
					 <button type="button" class="close" data-dismiss="alert">×</button>
					<h4>
						提示!
					</h4> <strong>警告!</strong> 请注意你的个人隐私安全.
				</div>
				<form class="form-horizontal" style="margin-top: 10px;" action="Work_save.action" method="post" onsubmit="return checkForm()">
						<div class="control-group">
							<label class="control-label" for="title">【标题】</label>
							<div class="controls">
								<input type="text" id="title" name="work.title" value="${topic.title }" style="width: 385px;">
							</div>
						</div>
						<%-- <div class="control-group">
							<label class="control-label" for="section">【板块】</label>
							<div class="controls">
								<select id="section" name="topic.section.id" style="width: 400px;"><option value="0">请选择板块...</option>
									<c:forEach var="section" items="${sectionList }">
										<option value="${section.id }" ${curSection.id==section.id?'selected':'' }>${section.name }</option>
									</c:forEach>
								</select>
							</div>
						</div> --%>
		
						<div class="control-group">
							<label class="control-label" for="Content">【内容】</label>
							<div class="controls">
								<textarea name="work.content" id="Content" class="ckeditor" cols="50" style="height:200px;width: 800px;" ></textarea>
							</div>
						</div>
						<input id="user" name="work.user.id" value="${currentUser.id }" type="hidden"/>
						<div class="control-group">
							<div class="controls">
								<Button class="btn btn-primary " data-dismiss="modal" aria-hidden="true" type="submit">提交</Button>
								<font id="error"></font>
							</div>
						</div>
					</form>		
				</div>				
			<jsp:include page="../../common/coon.jsp"></jsp:include>
		</div>
	</div>
</div>
</body>
</html>