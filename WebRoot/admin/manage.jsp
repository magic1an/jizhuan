<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
 function modifyManage(id,userId,name,text,pic,positionId){
	
	 $("#myModalLabel").html("修改班干");
	 $("#id").val(id);
	 $("#userId").val(userId);
	 $("#name").val(name);
	 $("#text").val(text);
	 $("#pic").attr("src","${pageContext.request.contextPath}/"+pic);
	 $("#positionId").val(positionId);
	
 }
 function saveManage(){

		/*  if ($("#zoneName").val()==null||$("#zoneName").val()=='') {
			 $("#error").html("请输入大板块名称！");
			 return false;
		} */
		 $.post("Manage_save.action", $("#fm").serialize());
		 alert("保存成功！");
		 resetValue();
		 location.reload(true);

 }
function manageDelete(manageId){
	if(confirm("用户所发的帖子也将被删除，确定要删除这条数据吗?")){
		$.post("Manage_delete.action",{manageId:manageId},
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
function deleteManages(){
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
		$.post("Manage_deleteManges.action",{ids:ids},function(result){
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
<!-- 			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">添加班干</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">批量删除</a>			
		 --></div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">					
					<h5>班干列表列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>编号</th>
									<th>姓名</th>
									<th>职位</th>					
									<th>标语</th>
									<th>照片</th>									
									<th>第几届</th>									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${manageList }" var="manage">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${manage.id }</td>
										<td style="text-align: center;vertical-align: middle;">${manage.user.name }</td>
										<td style="text-align: center;vertical-align: middle;">${manage.name }</td>
										<td style="text-align: center;vertical-align: middle;">${manage.text }</td>
										<td style="text-align: center;vertical-align: middle;">
											<c:choose>
													<c:when test="${(manage.user.face==null||user.face=='')&&user.sex=='男'}">
														<img alt="" src="${pageContext.request.contextPath}/images/user/user0.gif" style="width: 100px;height: 100px;">
													</c:when>
													<c:when test="${(manage.user.face==null||user.face=='')&&user.sex=='女'}">
														<img alt="" src="${pageContext.request.contextPath}/images/user/female.gif" style="width: 100px;height: 100px;">
													</c:when>
													<c:otherwise>
														<img alt="" src="${pageContext.request.contextPath}/${manage.pic}" style="width: 100px;height: 100px;">
													</c:otherwise>
											</c:choose>
										</td>
										<td style="text-align: center;vertical-align: middle;">${manage.position.name }</td>									
										<td style="text-align: center;vertical-align: middle;">
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" 
								 			onclick="return modifyManage(${manage.id},'${manage.user.id }','${manage.name }','${manage.text }','${manage.pic }','${manage.position.id }')">修改</button>&nbsp;&nbsp;
									<%-- 		<button class="btn btn-danger" type="button" onclick="javascript:userDelete(${user.id})">删除</button>
									 --%>	</td>
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
		<div id="dlg" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">修改</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="manageUserName">班干ID：</label>
							</td>
							<td>
								<input id="userId" type="text" name="manage.user.id" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="number">职位：</label>
							</td>
							<td>
								<input id="name" type="text" name="manage.name" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="number">班干格言：</label>
							</td>
							<td>
								<input id="text" type="text" name="manage.text" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>			
							<td>
								<label class="control-label" for="face">头像：</label>
							</td>
							<td>							
								<img id="pic" class="pull-left" style="width: 140px; height: 180px;" />
								
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="email">第几届：</label>
							</td>
							<td>
								<input id="positionId" type="text" name="manage.position.id" placeholder="导入数据失败！">
							</td>
						</tr>
										
					</table>
					<input id="id" type="hidden" name="manage.id">				
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn btn-primary" onclick="javascript:saveManage()">保存</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
			</div>
		</div>
	</div>
</body>
</html>