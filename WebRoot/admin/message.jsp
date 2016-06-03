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

function messageDelete(messageId){
	if(confirm("确定要删除这条数据吗?")){
		$.post("Message_delete.action",{messageId:messageId},
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
function deleteMessages(){
	var selectedSpan=$(".checked").parent().parent().next("td");
	if(selectedSpan.length==0){
		alert("请选择要删除的数据！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedSpan.length;i++){
		strIds.push(selectedSpan[i].innerHTML);
	}
	var messageId=strIds.join(",");
	if(confirm("您确定要删除这"+selectedSpan.length+"条数据吗？")){
		$.post("Message_deleteMessage.action",{messageId:messageId},function(result){
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
			<!-- <a href="#" role="button" class="btn btn-danger" onclick="javascrip:deleteUsers()">批量删除</a>
		 -->
		</div>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<!-- <span class="icon"> <input type="checkbox"
							id="title-checkbox" name="title-checkbox" />
						</span> -->
						<h5>留言列表</h5>
					</div>
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th><i class=""></i></th>
									<th>序号</th>
									<th>留言用户</th>					
									<th>内容</th>									
									<th>留言时间</th>									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${messageList }" var="message">
									<tr>
										<td><input type="checkbox" /></td>
										<td style="text-align: center;vertical-align: middle;">${message.id }</td>
										<td style="text-align: center;vertical-align: middle;">${message.user.name }</td>
										<td style="text-align: center;vertical-align: middle;">${message.content}</td>
										<td style="text-align: center;vertical-align: middle;">${message.m_time }</td>							
										<td style="text-align: center;vertical-align: middle;">
											
											<button class="btn btn-danger" type="button" onclick="javascript:messageDelete(${message.id})">删除</button>
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