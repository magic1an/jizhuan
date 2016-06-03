<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type=text/javascript> 
<!--//--><![CDATA[//><!-- 
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
	        <a href="#"><img width="46px" height="54px;" src="<c:url value='/image/weixin.png'/>" /></a>
	        <a><img width="46px" height="54px;" src="<c:url value='/image/qq.png' />" /></a>
	        <a href="#"><img width="46px" height="54px;" src="<c:url  value='/image/Weibo.png' />" /></a>
        </div>
        <div style="float:left ; width:400px; height:102px;margin-left: 50px;margin-top: 20px;">
        	<img src="<c:url value='/image/logo3.png' />"  height="102"/>
        </div>
        <div id="blog" style="float:left ; width:200px; height:50px; margin-top:100px;margin-left:150px;" >
        	<input style="height:28px;width:200px;" type="text" placeholder="搜索....这里 可以">
        </div>
	</div>

<div id="menu" style=" background:#666; width:100%; height:50px; ">
	<ul id="nav" style=" margin-left:10%; width:800px;"> 
        <li><a href="<c:url value='/index.jsp'/>">首页</a> </li> 
        <li><a href="Grade_list.action" >成绩查询与录入</a> 
            <ul> 
            <li><a href="Grade_list.action?trem=1">查询</a></li> 
            <li><a href="Grade_list.action?trem=2">录入</a></li>
            </ul>
        </li>
        <li><a href="study_Lis.action" >讨论区</a> 
            <ul> 
            <li><a href="study_Lis.action?trem=1">JavaWeb</a></li> 
            <li><a href="study_Lis.action?trem=1">Android</a></li> 
            <li><a href="study_Lis.action?trem=1">常用框架</a></li> 
            </ul> 
        </li>        
        <li><a href="about_.jsp">关于我们</a> 
            <ul> 
                <li><a href="jsp/leader/leader.jsp">历届班干</a></li> 
                <li><a href="jsp/about.jsp">联系我们</a></li> 
            </ul> 
		</li> 
		<li><a href="work_List.action">作品欣赏</a></li>
        <li><a href="message_List.action">留言吧</a></li> 
	</ul> 
	</div>
 </div>
</body>
</html>