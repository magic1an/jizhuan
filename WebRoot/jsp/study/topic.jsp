<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<script type="text/javascript">
function deleteTopic(topicId){
	if(confirm("您确定要删除这条数据吗？")){
		$.post("Topic_delete.action",{topicId:topicId},function(result){
			if(result.success){
				/* var result=eval('('+result+')'); */
				alert("数据已成功删除！");
				location.reload(true);
			}else{
				alert("数据删除失败！");
			}
		},"json");
	}else{
		return;
	}
}
function modifyTopic(topicId,topicTop,topicGood){
	$("#topicId").val(topicId);
	$("#topicTop").val(topicTop);
	$("#topicGood").val(topicGood);
}
function saveTopic(){
	var topicId=$("#topicId").val();
	var topicTop=$("#topicTop").val();
	var topicGood=$("#topicGood").val();
	$.post("Topic_modify.action",{topicId:topicId,topicTop:topicTop,topicGood:topicGood},function(result){
		if (result.success) {
			alert("数据已成功修改！");
			location.reload(true);
		} else {
			alert("数据修改失败！");
		}
	},"json");
}
</script>
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
							<a  href="${pageContext.request.contextPath}/study.jsp">讨论区</a> <span class="divider">/</span>
						</li>
						<li class="active" >
							<p>${section.name }</p>
						</li>
					</ul>
					<blockquote>
						<p>
							<a class="" href="Topic_preSave.action?sectionId=${section.id }" onclick="return checkForm()">发帖</a>
						</p> <small>发帖人<cite>-${section.master.name }</cite></small>
					</blockquote>
					<div class="pagination pagination-right">${pageCode }
					</div>
					<table class="table table-bordered table-condensed">
						<thead>
							<tr>
								<th>
									状态
								</th>
								<th>
									主题
								</th>
								<th>
									参与人数
								</th>
								<th>
									发表者
								</th>
								<th>
									最后回复
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${zdTopicList }" var="topic">
							<tr class="error">
								<td>
									
									<c:choose>
									<c:when test="${topic.good==0 }">
										<span style="color: blue;">【普通】</span>
									</c:when>
									<c:otherwise>
										<span style="color: red;">【精华】</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${topic.top==1 }">【置顶】</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
								</td>
								<td>
									
									<a href="Topic_details.action?topicId=${topic.id }">${topic.title }</a>
								</td>
								<td>
									
									${topicReplyCount.get(topic) }
								</td>
								<td>
									
									${topic.user.name }
								</td>
								<td>
										
									<strong>${topicLastReply.get(topic).user.name }</strong><br>
									${topicLastReply.get(topic).publishTime }
								</td>
								<td>
								<c:choose>
									<c:when test="${currentUser.id==topic.user.id&&currentUser.id!=section.master.id }">
										<a id="modal-273840" href="#modal-container-273840" role="button" class="btn" data-toggle="modal">修改</a>
									</c:when>
									<c:when test="${currentUser.id==section.master.id }">
										<a id="modal-273840" href="#modal-container-273840" role="button" class="btn" data-toggle="modal" onclick="return modifyTopic(${topic.id },${topic.top },${topic.good })" >修改</a>
										<button class="btn btn-danger" onclick="javascript:deleteTopic(${topic.id })">删除</button>
									</c:when>
									 <c:when test="${currentUser.type==2 }">
										<%--<button class="btn btn-info" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return modifyTopic(${topic.id },${topic.top },${topic.good })">修改</button> --%>
										<a id="modal-273840" href="#modal-container-273840" role="button" class="btn" data-toggle="modal" onclick="return modifyTopic(${topic.id },${topic.top },${topic.good })" style="color: red;" >修改</a>									
									 	<button class="btn btn-danger" onclick="javascript:deleteTopic(${topic.id })">删除</button>
									</c:when> 
									<c:otherwise>
										您无权对本贴进行操作
									</c:otherwise>
								</c:choose>
									
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<table class="table table-bordered table-condensed">
						<c:forEach items="${ptTopicList }" var="topic">
						<tr class="success">
							<td style="text-align: center;vertical-align:middle;width: 150px;">
								<c:choose>
									<c:when test="${topic.good==0 }">
										<span style="color: blue;">【普通】</span>
									</c:when>
									<c:otherwise>
										<span style="color: red;">【精华】</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${topic.top==1 }">【置顶】</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</td>
							<td style="text-align: center;vertical-align:middle;">
								<a href="Topic_details.action?topicId=${topic.id}">${topic.title }</a>
							</td>
							<td style="text-align: center;vertical-align:middle;width: 100px;">
								${topicReplyCount.get(topic) }
							</td>
							<td style="text-align: center;vertical-align:middle;width: 100px;">
								${topic.user.name }
							</td>
							<td style="text-align: center;vertical-align:middle;width: 200px;">
								<strong>${topicLastReply.get(topic).user.name }</strong><br>
								${topicLastReply.get(topic).publishTime }
							</td>
							<td style="text-align: center;vertical-align:middle;width: 150px;">
								<c:choose>
									<c:when test="${currentUser.id==topic.user.id&&currentUser.id!=section.master.id }">
										<a id="modal-273840" href="#modal-container-273840" role="button" class="btn" data-toggle="modal">修改</a>
									</c:when>
									<c:when test="${currentUser.id==section.master.id }">
										<a id="modal-273840" href="#modal-container-273840" role="button" class="btn" data-toggle="modal" onclick="return modifyTopic(${topic.id },${topic.top },${topic.good })" >修改</a>
										<button class="btn btn-danger" onclick="javascript:deleteTopic(${topic.id })">删除</button>
									</c:when>
									 <c:when test="${currentUser.type==2 }">
										<%--<button class="btn btn-info" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return modifyTopic(${topic.id },${topic.top },${topic.good })">修改</button> --%>
										<a id="modal-273840" href="#modal-container-273840" role="button" class="btn" data-toggle="modal" onclick="return modifyTopic(${topic.id },${topic.top },${topic.good })" style="color: red;" >修改</a>									
									 	<button class="btn btn-danger" onclick="javascript:deleteTopic(${topic.id })">删除</button>
									</c:when> 
									<c:otherwise>
										您无权对本贴进行操作
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
					
					</table>
			

					<div id="modal-container-273840" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h3 id="myModalLabel">
								修改主题
							</h3>
						</div>
						<div class="modal-body">
							<form id="fm" action="#" method="post" enctype="multipart/form-data">
								<table>
									<tr>
										<td>
											<label class="control-label" for="top">置顶：</label>
										</td>
										<td>
											<select id="topicTop">
												<option value="0">非置顶</option>
												<option value="1">置顶</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label" for="good">精华：</label>
										</td>
										<td>
											<select id="topicGood">
												<option value="0">非精华</option>
												<option value="1">精华</option>
											</select>
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
				<jsp:include page="../../common/coon.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>