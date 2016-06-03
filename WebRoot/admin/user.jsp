<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户列表</title>
<script type="text/javascript">
function modifyUser(id,name,number,password,type,age,sex,address,mobile,qq,face,email){
	 var v=document.getElementById('dlg');
	  v.style.display='block';
	 $("#myModalLabel").html("修改用户");
	 $("#id").val(id);
	 $("#name").val(name);
	 $("#number").val(number);
	 $("#password").val(password);
	 $("#type").val(type);
	 $("#age").val(age);
	 $("#sex").val(sex);
	 $("#address").val(address);
	 $("#mobile").val(mobile);
	 $("#qq").val(qq); 
	 $("#face").attr("src","${pageContext.request.contextPath}/"+face);
	 $("#email").val(email);
}
function userDelete(userId){
	if(confirm("用户所发的帖子也将被删除，确定要删除这条数据吗?")){
		$.post("User_delete.action",{userId:userId},
				function(result){
					var result=eval('('+result+')');
					if(result.info){
						alert(result.info);
						window.location.reload(true);
					}
				}
			);
	}
}
function saveUser(){
	
	 $.post("User_save.action", $("#fm").serialize());
	 alert("保存成功！");
	 resetValue();
	 location.reload(true);
	
}
function deleteUsers(){
	var selectedSpan=$(".checked").parent().parent().next("td");
	if(selectedSpan.length==0){
		alert("请选择要删除的数据！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedSpan.length;i++){
		strIds.push(selectedSpan[i].innerHTML);
	}
	var ids=strIds.join(",");
	if(confirm("用户所发的帖子也将被删除，您确定要删除这"+selectedSpan.length+"条数据吗？")){
		$.post("User_deleteUsers.action",{ids:ids},function(result){
			var result=eval('('+result+')');
			if(result.info){
				alert(result.info);
				location.reload(true);
			}
		});
	}else{
		return;
	}
}
function resetValue(){
	 $("#id").val("");
	 $("#userName").val("");
}

</script>

</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
		<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">批量删除</a>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						
						<h5>用户列表</h5>
					</div>
					<div class="widget-content nopadding">
					<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>昵称</th>					
									<th>登录密码</th>
									<th>性别</th>
									<th>头像</th>
									<th>注册时间</th>
									<th>学号</th>
									<th>联系电话</th>
									<th>用户类型</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList }" var="user">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${user.id }</td>
										<td style="text-align: center;vertical-align: middle;">${user.name }</td>
										<td style="text-align: center;vertical-align: middle;">${user.password }</td>
										<td style="text-align: center;vertical-align: middle;">${user.sex }</td>
										<td style="text-align: center;vertical-align: middle;">
											<c:choose>
													<c:when test="${(user.face==null||user.face=='')&&user.sex=='男'}">
														<img alt="" src="${pageContext.request.contextPath}/images/user/user0.gif" style="width: 100px;height: 100px;">
													</c:when>
													<c:when test="${(user.face==null||user.face=='')&&user.sex=='女'}">
														<img alt="" src="${pageContext.request.contextPath}/images/user/female.gif" style="width: 100px;height: 100px;">
													</c:when>
													<c:otherwise>
														<img alt="" src="${pageContext.request.contextPath}/${user.face}" style="width: 100px;height: 100px;">
													</c:otherwise>
											</c:choose>
										</td>
										<td style="text-align: center;vertical-align: middle;">${user.regTime }</td>
										<td style="text-align: center;vertical-align: middle;">${user.number }</td>
										<td style="text-align: center;vertical-align: middle;">${user.mobile }</td>
										<td style="text-align: center;vertical-align: middle;width: 150px;">
											<c:choose>
					                  	  		<c:when test="${user.sectionList.size()==0&&user.type!=2 }">
					                  	  			<font style="color: black;">普通用户</font>	
					                  	  		</c:when>
					                  	  		<c:when test="${user.sectionList.size()!=0&&user.type!=2 }">
					                  	  			<font style="color: blue;">版主</font>
					                  	  			【<c:forEach items="${user.sectionList }" var="section">
					                  	  				${section.name }；
					                  	  			</c:forEach>】
					                  	  		</c:when>
					                  	  		<c:otherwise>
					                  	  			<font style="color: red;">管理员</font>
					                  	  		</c:otherwise>
					                  	  	</c:choose>
										</td>
										<td style="text-align: center;vertical-align: middle;">
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" 
								 			onclick="return modifyUser(${user.id} ,'${user.name }','${user.number }','${user.password }','${user.type }','${user.age }','${user.sex }','${user.address }','${user.mobile }','${user.qq }','${user.face }','${user.email }')">修改</button>&nbsp;&nbsp;
											<button class="btn btn-danger" type="button" onclick="javascript:userDelete(${user.id})">删除</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pagination alternate">
					<ul class="clearfix">${pageCode }
					</ul>
				</div>


			</div>
		</div>
		<div id="dlg" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">增加大板块</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="userName">用户昵称：</label>
							</td>
							<td>
								<input id="name" type="text" name="user.name" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="number">学号：</label>
							</td>
							<td>
								<input id="number" type="text" name="user.number" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="password">登录密码：</label>
							</td>
							<td>
								<input id="password" type="text" name="user.password" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
						<tr>
							<td>
								<label class="control-label" for="type">权限(1普通2管理员):</label>
							</td>
							<td>
						
								<input id="type" type="text" name="user.type" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="age">年龄：</label>
							</td>
							<td>
								<input id="age" type="text" name="user.age" placeholder="导入数据失败！">
							</td>
						</tr>

							<td>
								<label class="control-label" for="sex">性别：</label>
							</td>
							<td>
								<input id="sex" type="text" name="user.sex" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
							<td>
								<label class="control-label" for="address">联系地址：</label>
							</td>
							<td>
								<input id="address" type="text" name="user.address" placeholder="导入数据失败！">
							</td>
						</tr>
						
							<td>
								<label class="control-label" for="mobile">联系电话：</label>
							</td>
							<td>
								<input id="mobile" type="text" name="user.mobile" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="qq">qq：</label>
							</td>
							<td>
								<input id="qq" type="text" name="user.qq" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
						
							<td>
								<label class="control-label" for="face">头像：</label>
							</td>
							<td>
								
										<img id="face" class="pull-left" style="width: 140px; height: 180px;" />
								
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="changeface">更改头像：</label>
							</td>
							<td>
								<input type="file" id="changeface" name="User.face">
							</td>
						</tr>
					

						<tr>
							<td>
								<label class="control-label" for="email">email：</label>
							</td>
							<td>
								<input id="email" type="text" name="user.email" placeholder="导入数据失败！">
							</td>
						</tr>
						
						<tr>
					
					</table>
					<input id="id" type="hidden" name="user.id">
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveUser()">保存</button>
			</div>
		</div>
	</div>
</body>
</html>