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
 function modifyInfrom(id,title,content,time){
	 var v=document.getElementById('dlg');
	  v.style.display='block';
	 $("#myModalLabel").html("修改通知");
	 $("#id").val(id);
	 $("#title").val(title);
	 $("#content").val(content);

 }
 function saveInfrom(){
	 
	 
	 $.post("Infrom_save.action", $("#fm").serialize());
	 alert("保存成功！");
	 resetValue();
	 location.reload(true);
	 
 } 
function infromDelete(infromId){
	if(confirm("用户所发的帖子也将被删除，确定要删除这条数据吗?")){
		$.post("Infrom_delete.action",{infromId:infromId},
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
function deleteInfroms(){
	var selectedSpan=$(".checked").parent().parent().next("td");
	if(selectedSpan.length==0){
		alert("请选择要删除的数据！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedSpan.length;i++){
		strIds.push(selectedSpan[i].innerHTML);
	}
	var infromIds=strIds.join(",");
	if(confirm("用户所发的帖子也将被删除，您确定要删除这"+selectedSpan.length+"条数据吗？")){
		$.post("User_deleteInfrom.action",{infromIds:infromIds},function(result){
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

}

</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" >发布通知</button>&nbsp;&nbsp;&nbsp;&nbsp; -->
			<a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">批量删除</a>
		
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>通知列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>序号</th>
									<th>标题</th>					
									<th>内容</th>									
									<th>发布时间</th>									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${infromList }" var="infrom">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${infrom.id }</td>
										<td style="text-align: center;vertical-align: middle;">${infrom.title }</td>
										<td style="text-align: center;vertical-align: middle;">${infrom.content}</td>
										<td style="text-align: center;vertical-align: middle;">${infrom.time }</td>							
										<td style="text-align: center;vertical-align: middle;">
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" 
								 			onclick="return modifyInfrom(${ infrom.id},'${infrom.title }','${infrom.content }','${infrom.time }')">修改</button>&nbsp;&nbsp;
											<button class="btn btn-danger" type="button" onclick="javascript:infromDelete(${infrom.id})">删除</button>
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
		<div id="dlg" class="modal hide fade"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" onclick="return resetValue()">×</button>
				<h3 id="myModalLabel">增加小板块</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="infromId">序号：</label>
							</td>
							<td>
								<input id="id" type="text" name="infrom.id" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="number">标题：</label>
							</td>
							<td>
								<input id="title" type="text" name="infrom.title" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="password">内容：</label>
							</td>
							<td>
								<input id="content" type="text" name="infrom.content" placeholder="导入数据失败！">
							</td>
						</tr>
						<tr>
						

					</table>
					<input id="id" type="hidden" name="infrom.id">
				
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" date-dismiss="modal" aria-hidden="true" onclick="return sacvInfrom()">保存说</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
			</div>
		</div>
	</div>
</body>
</html>