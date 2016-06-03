<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">

 function saveCourse(){
	 /* if ($("#zoneName").val()==null||$("#zoneName").val()=='') {
		 $("#error").html("请输入大板块名称！");
		 return false;
	} */
	 $.post("Course_save.action", $("#fm").serialize());
	 alert("保存成功！");
	 resetValue();
	 location.reload(true);
 }

function courseDelete(courseId){
	if(confirm("确定要删除这条数据吗?")){
		$.post("Course_delete.action",{courseId:courseId},
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
 function resetValue(){
	 $("#id").val("");

}

</script>
</head>
<body>
	<div class="container-fluid">
		<div id="tooBar" style="padding: 10px 0px 0px 10px;">
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" >添加课程</button>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>课程列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>序号</th>
									<th>课程名称</th>
									<th>学分</th>
									<th>学期</th>
									<th>课程类型</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${courseList }" var="course">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;">${course.id }</td>
										<td style="text-align: center;">${course.name }</td>
										<td style="text-align: center;">${course.credit }</td>
										<td style="text-align: center;">${course.term }</td>
										<td style="text-align: center;">${course.type }</td>
										<td style="text-align: center;">
											<button class="btn btn-danger" type="button" onclick="javascript:zoneDelete(${zone.id})">删除</button>
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
				<h3 id="myModalLabel">添加课程</h3>
			</div>
			<div class="modal-body">
				<form id="fm" action="">
					<table>
						<tr>
							<td>
								<label class="control-label" for="zoneName">请输入课程名称：</label>
							</td>
							<td>
								 <input id="name" type="text" name="course.name" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="description">请输入学分：</label>
							</td>
							<td>
								<input id="credit" type="text" name="course.credit" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="description">请输入学期(1-6)：</label>
							</td>
							<td>
								<input id="term" type="text" name="course.term" placeholder="请输入…">
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label" for="description">请输入课程类型：</label>
							</td>
							<td>
								<input id="type" type="text" name="course.type" placeholder="请输入…">
							</td>
						</tr>
					</table>
					<input id="id" type="hidden" name="course.id">
				</form>
			</div>
			<div class="modal-footer">
				<font id="error" style="color: red;"></font>
				<button class="btn" data-dismiss="modal" aria-hidden="true"
					onclick="return resetValue()">关闭</button>
				<button class="btn btn-primary" onclick="javascript:saveCourse()">保存</button>
			</div>
		</div>
	</div>
</body>
</html>