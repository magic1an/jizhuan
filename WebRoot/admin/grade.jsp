<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
$(function () {
	$("#logo").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
});
function openAddDlg(){
	$("#myModalLabel").html("增加小板块");
}
function saveSection(){
	 if ($("#sectionName").val()==null||$("#sectionName").val()=='') {
		 $("#error").html("请输入小板块名称！");
		 return false;
	 }
	 if ($("#zone").val()==null||$("#zone").val()=='') {
		 $("#error").html("请选择所属大板块！");
		 return false;
	 }
	 if ($("#masterName").val()==null||$("#masterName").val()=='') {
		 $("#error").html("请输入版主昵称！");
		 return false;
	 }
	 /* $.post("Section_save.action", $("#fm").serialize()); */
	 $("#fm").submit();
	 alert("保存成功！");
	 resetValue();
	 location.reload(true);
 }
 function modifySection(id,name,zone,masterName,logo){
	 $("#myModalLabel").html("修改小板块");
	 $("#id").val(id);
	 $("#sectionName").val(name);
	 $("#ImgPr").attr("src","${pageContext.request.contextPath}/"+logo);
	 $("#zone").val(zone);
	 $("#masterName").val(masterName);
 }
function sectionDelete(sectionId){
	if(confirm("确定要删除这条数据吗?")){
		$.post("Section_delete.action",{sectionId:sectionId},
				function(result){
					var result=eval('('+result+')');
					if(result.error){
						alert(result.error);
					}else{
						alert("删除成功！");
						window.location.reload(true);
					}
				}
			);
	}
}
function deleteSections(){
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
	if(confirm("您确定要删除这"+selectedSpan.length+"条数据吗？")){
		$.post("Section_delete1.action",{ids:ids},function(result){
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
function resetValue(){
	 $("#id").val("");
	 $("#sectionName").val("");
}
function searchUserByName(userName){
	$.post("Section_getUserByName.action",{name:userName},function(result){
		var result=eval('('+result+')');
		$("#info").html(result.info);
		$("#masterId").val(result.masterId);
	});
}
</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;"> 
		 <form action="Grade_listAdmin.action" method="post" class="form-search" style="display: inline;">
	  		&nbsp;学生姓名：
	  		<select name="grade.user.id"><option value="" selected="selected">请选择...</option>
				<c:forEach var="user" items="${userList }">
					<option value="${user.id }" ${user.id==user.id?'selected':'' }>${user.name }</option>
				</c:forEach>
				</select>
		
	
		 	&nbsp;学期：
			  <select name="grade.course.term"><option value="">请选择...</option>
				<option value="1" >大一第一学期</option>
				<option value="2" >大一第二学期</option>
				<option value="3" >大二第一学期</option>
				<option value="4" >大二第二学期</option>
				<option value="5" >大三第一学期</option>
				<option value="6" >大三第二学期</option>				
			  </select>
		&nbsp;科目名称：
			<select name="grade.course.name"><option value="">请选择...</option>
				<c:forEach var="course" items="${courseList }">
					<option value="${course.name }" ${course.id==course.id?'selected':'' }>${course.name }</option>
				</c:forEach>
				</select>
			 
			  </br>分数大于：
			  <input name="grade.grade" type="text"> 
			  <button type="submit" class="btn btn-primary" title="Search">查询&nbsp;<i class="icon  icon-search"></i></button>
			</form> 
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>成绩列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th>序号</th>		
									<th>姓名</th>
									<th>科目</th>
									<th>成绩</th>
									<th>学分</th>
									<th>学期</th>
									<!-- <th>操作</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${gradeList }" var="grade">
									<tr>
										<td style="text-align: center;vertical-align: middle;">${grade.id }</td>
										
										<td style="text-align: center;vertical-align: middle;">${grade.user.name }</td>
										<td style="text-align: center;vertical-align: middle;">${grade.course.name }</td>	
										<td style="text-align: center;vertical-align: middle;">${grade.grade }</td>										
										<td style="text-align: center;vertical-align: middle;">${grade.course.credit }</td>
										<td style="text-align: center;vertical-align: middle;">${grade.course.term }</td>
										<%-- <td style="text-align: center;vertical-align: middle;">
											<button class="btn btn-info" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return modifySection(${section.id},'${section.name }',${section.zone.id },'${section.master.name }','${section.logo }')">修改
											</button>										
										</td> --%>
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
	
	</div>
</body>
</html>