<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改信息</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">


<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="bootstrap/css/docs.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.messages_cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>

<link rel="shortcut icon" href="../../image/favicon.ico"/>
<script type="text/javascript">
	$(function () {
		$("#face").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
		
});
	
</script>

</head>
<body><div style="margin:0 0 50px 0 ;">
	<jsp:include page="../../common/top.jsp"></jsp:include>
</div>
<div style="width:90%;margin:50px 3% 0px 7%;">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-xs-6 span9">
				<p align="center">修改信息后，重新登录生效</p>
				<div class="tabbable tabs-left" id="tabs-429293">
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#panel-162594" data-toggle="tab">基本资料</a>
						</li>
						<li>
							<a href="#panel-478741" data-toggle="tab">修改密码</a>
						</li>
						<li>
							<a href="#panel-478742" data-toggle="tab">更换头像</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-162594">
							<form style="width: 500px;"  method="post" action="User_modify.action">
							<table class="table">
								
								<thead>
									<tr>
										<th>
											个人信息
										</th>																			</tr>
								</thead>
								<tbody>
								<tr>
									<td >昵称：</td>
									<td ><input type="text" id="name" name="user.name" value="${currentUser.name }"/></td>
								</tr>
								<tr>
									<td>学号：</td>
									<td><input type="text" id="number" name="user.number" value="${currentUser.number }"/></td>
								</tr>
								<tr>
									<td>年龄：</td>
									<td><span class="pull-left"></span><input type="text" id="age" name="user.age" value="${currentUser.age }"/></td>
									<td>	</td>
								</tr>
								<tr>
									<td></td>
								
								</tr>
								<tr>
									<td>性别：</td>
									<td><select id="sex" name="user.sex">
												<option value="${currentUser.sex }" selected="selected">${currentUser.sex }</option>
												<option value="女" >女</option>
												<option value="男" >男</option>
										</select> 
									</td>
								</tr>								
								<tr>
									<td>mobile</td>
									<td><input type="text" id="mobile" name="user.mobile" value="${currentUser.mobile }"/></td>
								</tr>
								<tr>
									<td>address</td>
									<td><input type="text" id="address" name="user.address" value="${currentUser.address }"/></td>
								</tr>
								<tr>
									<td>QQ</td>
									<td><input type="text" id="qq" name="user.qq" value="${currentUser.qq }"/></td>
								</tr>
								<tr>
									<td>email</td>
									<td><input type="text" id="email" name="user.email" value="${currentUser.email }"/></td>
								</tr>
								<tr>
									<td></td>
									<td>
										<button class="btn btn-info" type="submit">保存修改</button>
									
									</td>			
								</tr>
							</tbody>
								<input type="hidden" id="password" name="user.password" value="${currentUser.password }"/>
								<input type="hidden" name="user.type" value="${currentUser.type }">
								<input type="hidden" name="user.id" value="${currentUser.id }">
								<input type="hidden" name="user.regTime" value="${currentUser.regTime }">
								<input type="hidden" name="user.face" value="${currentUser.face }">								
						</table>
						</form>
						
						</div>
						<div class="tab-pane" id="panel-478741">
						<form id="regForm" style="width: 700px;" enctype="multipart/form-data" class="form-horizontal form-inline" method="post" action="User_modify.action">
							<table class="table">
								<thead>
									<tr>
										<th>
											修改密码
										</th>																			</tr>
								</thead>
								<tbody>
						
								<tr>
									<td>
										密码：
									
									</td>
									<td>
										</span><input type="password" name="user.password" id="password">									
									</td>
								</tr>
								<tr>
									<td>
										确认密码
									
									</td>
									<td>
										<input type="password" name="rePassWord" id="rePassWord">
									
									</td>
								</tr>
							
								<tr>
									<td></td>
									<td>
										<button class="btn btn-info" type="submit">保存修改</button>
									
									</td>
								</tr>
								
								</tbody>
								<input type="hidden" id="name" name="user.name" value="${currentUser.name }"/>
								<input type="hidden" id="number" name="user.number" value="${currentUser.number }"/>
								<input type="hidden" id="age" name="user.age" value="${currentUser.age }"/>
								<input type="hidden" id="sex" name="user.sex" value="${currentUser.sex }"/>
								<input type="hidden" id="address" name="user.address" value="${currentUser.address }"/>
								<input type="hidden" id="mobile" name="user.mobile" value="${currentUser.mobile }"/>
								<input type="hidden" id="qq" name="user.qq" value="${currentUser.qq }"/>
								<input type="hidden" id="email" name="user.email" value="${currentUser.email }"/>
								<input type="hidden" name="user.type" value="${currentUser.type }">
								<input type="hidden" name="user.id" value="${currentUser.id }">
								<input type="hidden" name="user.regTime" value="${currentUser.regTime }">
								<input type="hidden" name="user.face" value="${currentUser.face }">
								</table>
							</form>
						</div>
						<div class="tab-pane" id="panel-478742">
						<form id="regForm" style="width: 700px;" enctype="multipart/form-data" class="form-horizontal form-inline" method="post" action="User_modify.action">
							<table class="table">
								<tr>
									<td>
										<img id="ImgPr" class="pull-left" style="width: 120px; height: 180px;" src="${pageContext.request.contextPath}/${currentUser.face }" />
									</td>
								</tr>
								<tr>
									<td>
										<input type="file" name="face" id="face">
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<button class="btn btn-info" type="submit">保存修改</button>
									
									</td>
								</tr>
								<input type="hidden" id="name" name="user.name" value="${currentUser.name }"/>
								<input type="hidden" id="password" name="user.password" value="${currentUser.password }"/>
								<input type="hidden" id="number" name="user.number" value="${currentUser.number }"/>
								<input type="hidden" id="age" name="user.age" value="${currentUser.age }"/>
								<input type="hidden" id="sex" name="user.sex" value="${currentUser.sex }"/>
								<input type="hidden" id="address" name="user.address" value="${currentUser.address }"/>
								<input type="hidden" id="mobile" name="user.mobile" value="${currentUser.mobile }"/>
								<input type="hidden" id="qq" name="user.qq" value="${currentUser.qq }"/>
								<input type="hidden" id="email" name="user.email" value="${currentUser.email }"/>
								<input type="hidden" name="user.type" value="${currentUser.type }">
								<input type="hidden" name="user.id" value="${currentUser.id }">
								<input type="hidden" name="user.regTime" value="${currentUser.regTime }">
								<input type="hidden" name="user.face" value="${currentUser.face }">
									
							</table>
							
						</form>
						</div>
					</div>
				</div>
			</div>	
			<jsp:include page="../../common/coon.jsp"></jsp:include>
		</div>
	</div>
</div>
</body>
</html>