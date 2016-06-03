<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<!-- 富文本 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.emoticons.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/emoticon.css" />
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" media="screen">
<!--   -->
<script type="text/javascript" src="bootstrap/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="bootstrap/js/jquery-ui.js"></script><link href="bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<script type="text/javascript">
$(function(){
	//放新浪微博表情
    $("#message_face").jqfaceedit({txtAreaObj:$("#Content"),containerObj:$('#container'),top:25,left:-27});
	 //显示表情
	$(".show_e").emotionsToHtml();
});
function saveReply(){
	if('${currentUser.name}'==''){
		alert("请先登陆，再回帖！");
		/* var url="Report_preSave.action?role=0&reportType=1";
		window.open("login.jsp?url="+url); */
		return false;
	}
	if ($("#Content").val().length<10) {
		alert("最少输入10个字符！");
		return false;
	}
	if ($("#Content").val().length>1000) {
		alert("最多输入1000个字符！");
		return false;
	}
	$.post("Reply_save.action",$("#replyForm").serialize(),function(result){
		if(result.success){
			alert("回复成功！");
			location.reload(true);
		}else{
			alert("回复失败！");
		}
	},"json");
}
function deleteReply(replyId){
	if (confirm("您确定要删除这条回复吗？")) {
		$.post("Reply_delete.action",{replyId:replyId},function(result){
			if(result.success){
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
</script>
</head>
<body>
<div style="margin:0 0 50px 0 ;">
	<jsp:include page="../../common/top.jsp"></jsp:include>
</div>
<div style="width:90%;margin:50px 3% 0px 7%;">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-xs-6 span9">
				<ul class="breadcrumb">
							<li>
								<a href="${pageContext.request.contextPath}/study.jsp">讨论区主页</a> <span class="divider">/</span>
							</li>
							<li>
								<a href="Topic_list.action?sectionId=${sectionId }">${section.name }</a> <span class="divider">/</span>
							</li>
							<li class="active">
								${topic.title }
							</li>
				</ul>			
				<div class="container-fluid" style="padding-left: 0px;padding-right: 0px;">
					<div class="row-fluid">
						<div class="span2">
							<table style="width: 100%;" cellpadding="5px;">
								<tr>
									<td>
										★楼主&nbsp;<a href="#" style="font-size: 9pt;color: black;"><strong>${topic.user.name }</strong></a>
									</td>
								</tr>
								<tr>
									<td>
										<c:choose>
												<c:when test="${(topic.user.face==null||topic.user.face=='')&&topic.user.sex=='男'}">
													<img alt="" src="${pageContext.request.contextPath}/images/user/user0.gif" style="width: 100px;height: 100px;">
												</c:when>
												<c:when test="${(topic.user.face==null||topic.user.face=='')&&topic.user.sex=='女'}">
													<img alt="" src="${pageContext.request.contextPath}/images/user/female.gif" style="width: 100px;height: 100px;">
												</c:when>
												<c:otherwise>
													<img alt="" src="${pageContext.request.contextPath}/${topic.user.face}" style="width: 100px;height: 100px;">
												</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td>
										性别：${topic.user.sex }
									</td>
								</tr>
								
								<tr>
									<td>
										<c:choose>
												<c:when test="${topic.user.sectionList.size()==0&&topic.user.type!=2 }">
													<font style="color: black;">普通用户</font>
												</c:when>
												<c:when test="${topic.user.sectionList.size()!=0&&topic.user.type!=2 }">
													<font style="color: blue;">版主</font>
													【<c:forEach items="${topic.user.sectionList }" var="section">
								                  	  				${section.name }；
								                  	 </c:forEach>】
								                </c:when>
												<c:otherwise>
													<font style="color: red;">管理员</font>
												</c:otherwise>
											</c:choose>
										</td>
								</tr>
							</table>
						</div>
						<div class="span10">
							<table style="width: 100%;">
								<tr style="height: 50px;">
									<td>
										【主题】:<strong>${topic.title }</strong>
									</td>
								</tr>
								<tr>
									<td style="text-align: right;">
										发表时间:『${topic.publishTime }』
									</td>
								</tr>
								<tr>
									<td>
										【内容】:
										<div style="width:85%;padding:6px; background-color: #F0F0F0" class="show_e">
											${topic.content }
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<c:forEach items="${replyList }" var="reply" varStatus="status">
					<div class="row-fluid" style="margin-top: 20px;">
						<div class="span2">
							<table style="width: 100%;" cellpadding="5px;">
								<tr>
									<td>
										▲${(page-1)*10+status.index+1 }楼
									</td>
								</tr>
								<tr>
									<td>
										<c:choose>
												<c:when test="${(reply.user.face==null||reply.user.face=='')&&reply.user.sex=='男'}">
													<img alt="" src="${pageContext.request.contextPath}/images/user/user0.gif" style="width: 100px;height: 100px;">
												</c:when>
												<c:when test="${(reply.user.face==null||reply.user.face=='')&&reply.user.sex=='女'}">
													<img alt="" src="${pageContext.request.contextPath}/images/user/female.gif" style="width: 100px;height: 100px;">
												</c:when>
												<c:otherwise>
													<img alt="" src="${pageContext.request.contextPath}/${reply.user.face}" style="width: 100px;height: 100px;">
												</c:otherwise>
										</c:choose>
											</td>
								</tr>
								<tr>
									<td>
										性别：${reply.user.sex }
									</td>
								</tr>
								<tr>
									<td>
										姓名：<a href="#" style="font-size: 9pt;color: black;"><strong>${reply.user.name }</strong></a>
									</td>
								</tr>
								<tr>
									<td>
										<c:choose>
												<c:when test="${reply.user.sectionList.size()==0&&reply.user.type!=2 }">
													<font style="color: black;">普通用户</font>
												</c:when>
												<c:when test="${reply.user.sectionList.size()!=0&&reply.user.type!=2 }">
													<font style="color: blue;">版主</font>
													【<c:forEach items="${reply.user.sectionList }" var="section">
								                  	  				${section.name }；
								                  	 </c:forEach>】
								                </c:when>
												<c:otherwise>
													<font style="color: red;">管理员</font>
												</c:otherwise>
											</c:choose>
										</td>
								</tr>
							</table>
						</div>
						<div class="span10">
							<table style="width: 100%;">
								<tr>
									<td style="text-align: right;">
										<c:choose>
											<c:when test="${currentUser.id==section.master.id }">
												<button class="btn btn-danger" onclick="javascript:deleteReply(${reply.id })">删除</button>
											</c:when>
											<c:when test="${currentUser.type==2 }">
												<button class="btn btn-danger" onclick="javascript:deleteReply(${reply.id })">删除</button>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
										回复时间:『${reply.publishTime }』
									</td>
								</tr>
								<tr>
									<td>
										<div style="width:90%;padding:6px; background-color: #F0F0F0" class="show_e">
											${reply.content }
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					</c:forEach>
				</div>
				<div class="pagination alternate" align="center">
					<c:choose>
						<c:when test="${pageCode =='未查询到数据'}">
							本帖还没有人回复
						</c:when>
						<c:otherwise>
							<ul class="clearfix">${pageCode }
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<table>
						<tr>
							
							<td style="width: 100%;">
								<form id="replyForm" class="form-horizontal" style="margin-top: 10px;">
								<table style="width: 100%;" cellpadding="10px;">
							
									<tr>
										<td>
											【表情】:
										</td>
										<td>
											<div id="container">
											<a href="JavaScript:void(0)" id="message_face">请选择...</a>
											</div>
										</td>
									</tr>
									<tr>
										<td style="vertical-align: top;">
											【内容】:
										</td>
										<td>
											<textarea name="reply.content" id="Content" cols="50" style="height:150px;width:500px;" ></textarea>
										</td>
									</tr>
									<tr>
										<td>
											<input id="userId" name="reply.user.id" value="${currentUser.id }" type="hidden"/>
											<input id="topicId" name="reply.topic.id" value="${topic.id }" type="hidden"/>
										</td>
										<td>
											<Button class="btn btn-primary " data-dismiss="modal" aria-hidden="true" type="button" onclick="javascript:saveReply()">提交</Button>
											<font id="error"></font>
										</td>
									</tr>
								</table>
								</form>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<jsp:include page="../../common/coon.jsp"></jsp:include>
		</div>
	</div>
</div>
<script type="text/javascript">
       
</script>

</body>
</html>