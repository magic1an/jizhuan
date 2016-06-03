<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

body { 
font-family:Verdana,Microsoft YaHei; 
font-size:16px;
margin: 0 auto;
background: #F6F6F6
} 
li {
	 list-style-type:none;
	 display:inline;
	
}

#nav { 
line-height: 50px; list-style-type: none; background:#666; 
} 
#nav a { 
display: block; width: 130px; text-align:center; 
} 
#nav a:link { 
color:#FFF; text-decoration:none; 
} 
#nav a:visited { 
color:#FFF;text-decoration:none; 
} 
#nav a:hover { 
color:#F96;text-decoration:none;font-weight:bold; 
} 
#nav li { 
float: left; width: 130px; background:#666; line-height: 50px;
} 
#nav li a:hover{ 
background:#000; 
} 
#nav li ul { 
line-height: 27px; list-style-type: none;text-align:left; 
left: -999em; width: 180px; position: absolute;} 
#nav li ul li{ 
float: left; width: 130px;
background:#999; 
} 
#nav li ul a{ wedisplay: block; width: 106px;text-align:left;padding-left:24px;
} 
#nav li ul a:link { 
color:#FFF; text-decoration:none; 
} 
#nav li ul a:visited { 
color:#FFF;text-decoration:none; 
} 
#nav li ul a:hover { 
color:#F96;text-decoration:none;font-weight:normal; 
background:#333; 
} 
#nav li:hover ul { 
left: auto; 
} 
#nav li.sfhover ul { 
left: auto; 
} 
#content { 
clear: left; 
} 
</style>
<script type=text/javascript> 
<!--//--><![CDATA[//><!-- 
function checkForm(){
	if('${currentUser.name}'==''){
		alert("你还没有登录，请先登陆！");	
		return false;
	}
}
function logout() {
	if (confirm("您确定要退出系统吗？")) {
		window.location.href="User_logout.action";
	}
}
function menuFix() { 
var sfEls = document.getElementById("nav").getElementsByTagName("li"); 
for (var i=0; i<sfEls.length; i++) { 
sfEls[i].onmouseover=function() { 
this.className+=(this.className.length>0? " ": "") + "sfhover"; 
} 
sfEls[i].onMouseDown=function() { 
this.className+=(this.className.length>0? " ": "") + "sfhover"; 
} 
sfEls[i].onMouseUp=function() { 
this.className+=(this.className.length>0? " ": "") + "sfhover"; 
} 
sfEls[i].onmouseout=function() { 
this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), 
""); 
} 
} 
} 
window.onload=menuFix; 
//--><!]]> 
</script>
</head>

<body>
<div id="top" style=" width:100%; height:200px;margin: 0 auto;">
    <div id="logo" style="width:1100px;; height:150px;margin: 0 auto;">
    	<div style="float:left; width:200px; margin:80px 100px 5px 0px;">
	        <a href="#"><img width="46px" height="54px;" src="<c:url value='/image/weixin.png'/>"/></a>
	        <a><img width="46px" height="54px;" src="<c:url value='/image/qq.png'/>" /></a>
	        <a href="#"><img width="46px" height="54px;" src="<c:url value='/image/Weibo.png'/>" /></a>
        </div>
        <div style="float:left ; width:400px; height:102px;margin-left: 50px;margin-top: 20px;">
        	<img src="<c:url value='/image/logo3.png'/>"  height="102"/>
        </div>
        <div id="blog" style="float:left ; width:200px; height:50px; margin-top:100px;margin-left:150px;" >
        	<input style="height:22px;width:200px;" type="text" placeholder="搜索....这里 可以">
        </div>
	</div>

<div id="menu" style=" background:#666; width:100%; height:50px; ">
	<ul id="nav" style=" margin-left:10%; width:800px;"> 
        <li><a href="<c:url value='/index.jsp'/>">首页</a> </li> 
        <li><a href="Grade_list.action" onclick="return checkForm()">成绩查询与录入</a> 
            <ul> 
            <li><a href="Grade_list.action?term=1" onclick="return checkForm()">查询</a></li> 
            <li><a href="Course_list.action?term=3" onclick="return checkForm()">录入</a></li>
            </ul>
        </li>
        <li><a href="<c:url value='/study.jsp'/>" >讨论区</a> 
            <ul> 
            <li><a href="<c:url value='/study.jsp'/>" >JavaWeb</a></li> 
            <li><a href="<c:url value='/study.jsp'/>" >Android</a></li> 
            <li><a href="<c:url value='/study.jsp'/>" >常用框架</a></li> 
            </ul> 
        </li>        
        <li><a href="<c:url value='/about.jsp'/>" >关于我们</a> 
            <ul> 
                <li><a href="<c:url value='/manage.jsp'/>" >历届班干</a></li> 
                <li><a href="<c:url value='/about.jsp'/>" >联系我们</a></li> 
            </ul> 
		</li> 
		<li><a href="Work_list.action" >作品欣赏</a></li>
        <li><a href="Message_list.action" >留言吧</a></li> 
	</ul> 
	</div>
</body>
</html>