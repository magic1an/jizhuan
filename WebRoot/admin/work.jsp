<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
function zoneDelete(zoneId){
	if(confirm("确定要删除这条数据吗?")){
		$.post("Work_delete.action",{workId:workId},
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
			<button class="btn btn-primary" type="button" data-backdrop="static" data-toggle="modal" data-target="#dlg" onclick="return openAddDlg()">添加大板块</button>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>作品列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>序号</th>
									<th>标题</th>
									<th>作者</th>
									<th>发布时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${workList }" var="work">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;">${work.id }</td>
										<td style="text-align: center;">${work.title }</td>
										<td style="text-align: center;">${work.user.name }</td>
										<td style="text-align: center;">${work.time }</td>
										<td style="text-align: center;">
											<button class="btn btn-danger" type="button" onclick="javascript:workDelete(${work.id})">删除</button>
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
	</div>
</body>
</html>