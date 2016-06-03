<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>13计专后台</title>
<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />

<script type="text/javascript">
$(function(){
	var sectionPage="section.jsp";var topicPage="topic.jsp";var userPage="user.jsp";var zonePage="zone.jsp";
	var curPage='${mainPage}';
	if(sectionPage.indexOf(curPage)>=0&&curPage!=""){
		$("#sectionLi").addClass("active");
	} else if(topicPage.indexOf(curPage)>=0&&curPage!=""){
		$("#topicLi").addClass("active");
	} else if(userPage.indexOf(curPage)>=0&&curPage!=""){
		$("#userLi").addClass("active");
	} else if(zonePage.indexOf(curPage)>=0&&curPage!=""){
		$("#zoneLi").addClass("active");
	}
})
 function logout() {
	if (confirm("您确定要退出系统吗？")) {
		window.location.href="User_logout2.action";
	}
	
}
</script>
</head>
<%
if(session.getAttribute("currentUser")==null){
	response.sendRedirect("login.jsp");
	return;
}
%>
<body>
	<div id="header">
		
		 <h3 style="padding: 20px; margin-top: 10px; margin-bottom: 0px;">
			<a href="#"><font color="#cccccc">13计专管理后台	</font></a>
			
		</h3>
		
	</div>

	<div id="sidebar">
		<ul>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>学习讨论管理</span> <span class="label">3</span></a>
				<ul>
					<li id="zoneLi"><a href="Zone_list.action"><i class="icon icon-home"></i> <span>大模块管理</span></a></li>
					<li id="sectionLi"><a href="Section_list.action"><i class="icon icon-home"></i> <span>小模块管理</span></a></li>
					<li id="topicLi"><a href="Topic_listAdmin.action"><i class="icon icon-home"></i> <span>帖子管理</span></a></li>
				</ul>
			</li>
			<!-- <li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>投票管理</span> <span class="label">3</span></a>
				<ul>
					<li><a href="#"><i class="icon icon-home"></i>投票主题</a></li>
					<li><a href="#"><i class="icon icon-home"></i>投票选项</a></li>
					<li><a href="#"><i class="icon icon-home"></i>投票</a></li>
				</ul>
			</li> -->
			
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
				<span>用户管理</span> <span class="label">3</span></a>
				<ul>
					<li><a href="User_list.action"><i class="icon icon-home"></i> <span>用户列表</span></a></li>
					<li><a href="Manage_listAdmin.action"><i class="icon icon-home"></i>班干部列表</a></li>
					<li><a href="Grade_listAdmin.action"><i class="icon icon-home"></i>用户成绩 </a></li>			
				</ul>
			</li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>学生作品管理</span> <span class="label">3</span></a>
				<ul>
					<li><a href="Work_listAdmin.action"><i class="icon icon-home"></i>文章作品列表</a></li>
					<!-- <li><a href="Work_listAdmin.action"><i class="icon icon-home"></i>视频作品列表</a></li>		 -->
				</ul>
			</li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>留言管理</span> <span class="label">1</span></a>
				<ul>
					<li><a href="Message_listAdmin.action"><i class="icon icon-home"></i>留言列表</a></li>
					
				</ul>
			</li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>其他管理</span> <span class="label">3</span></a>
				<ul>
					<li><a href="Course_listAdmin.action"><i class="icon icon-home"></i>课程列表</a></li>
					<li><a href="Infrom_listAdmin.action"><i class="icon icon-home"></i>通知列表</a></li>
					<li><a href="#" onclick="return logout()"><i class="icon icon-home"></i>退出登录</a></li>						
				</ul>
			</li>	
		</ul>

	</div>

	<div id="style-switcher">
		<i class="icon-arrow-left icon-white"></i> <span>颜色:</span> 
		<a href="#grey" style="background-color: #555555; border-color: #aaaaaa;"></a> 
		<a href="#blue" style="background-color: #2D2F57;"></a> 
		<a href="#red" style="background-color: #673232;"></a>
	</div>

	<div id="content">
		<div id="content-header">
			<h1><a href="${pageContext.request.contextPath}/index.jsp">13计专首页</a></h1>
		
		</div>
		<div id="breadcrumb">
			<a href="${pageContext.request.contextPath}/admin/main.jsp" title="首页" class="tip-bottom">
			<i class="icon-home"></i> 首页</a> <a href="#" class="current">${crumb1 }</a>
			
		</div>
		<jsp:include page="${mainPage }"></jsp:include>
		<div class="row-fluid">
			<div id="footer" class="span12">
				2015 &copy;  作者：西红柿炒番茄&nbsp;&nbsp;&nbsp;&nbsp; 
			</div>
		</div>
	</div>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>

<script src="js/jquery.dataTables.min.js"></script>
<script src="js/unicorn.js"></script>
<script src="js/unicorn.tables.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
</body>
</html>