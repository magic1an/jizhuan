<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

</script>
</head>
<body>
<div class="col-xs-6 span3">
			<c:choose>
				<c:when test="${currentUser==null}">
				<form action="User_login.action" method="post" class="form-horizontal">
					<div class="control-group">						
						<input id="inputEmail" name="user.name" type="text"  placeholder="userName" style="height:22px;"/>					
					</div>
					<div class="control-group">						
						<input id="inputPassword" name="user.password" type="password"  placeholder="password" style="height:22px;"/>					
					</div>
					<div class="control-group">	
						<button type="submit" class="btn">登陆</button>
						<label class="control-label" style="color: red;" for="inputPassword">${error }</label>										
					</div>
				</form>
				</c:when>
				<c:otherwise>
					<img class="img-rounded"  alt="140x140" width="180px;" height="320px;" src="<c:url value="${currentUser.face}"/>" /> 
					<ul class="nav nav-list">
					<li class="nav-header">
						信息列表
					</li>
					<li class="active">
						<a href="#">欢迎</a>
					</li>
					<li>
						<a href="#">${currentUser.name}
							『<c:choose>
					             <c:when test="${currentUser.sectionList.size()==0&&currentUser.type!=1}">
					             	<font style="color: black;">普通用户</font>	
					             </c:when>
					             <c:when test="${currentUser.sectionList.size()!=0&&currentUser.type!=1 }">
					                <font style="color: blue;">版主</font>
					             </c:when>
					             <c:otherwise>
					                 <font style="color: red;">管理员</font>
					             </c:otherwise>
					             </c:choose>』</a>
					</li>
					<c:if test="${currentUser.type==2 }" >
						<li>
							<a href="admin/User_admin.action" >后台管理</a>
						</li>
					</c:if>
					
					<li>
						<a href="#" onclick="return logout()">注销</a>
					</li>
					<li class="nav-header">
						个人选项
					</li>
					<li>
						<a href="User_userCenter.action">主页</a>
					</li>
					<li>
						<a href="User_userCenter.action">修改密码</a>
					</li>
					<li class="divider">
					</li>
					<li>
						<a href="User_userCenter.action">修改个人资料</a>
					</li>
				</ul>
					</c:otherwise>
				</c:choose>
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							面板标题
						</h3>
					</div>
					<div class="panel-body">
						Panel content
					</div>
					<div class="panel-footer">
						Panel footer
					</div>
				</div>
			</div>
</body>
</html>