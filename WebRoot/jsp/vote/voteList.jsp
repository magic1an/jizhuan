<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>

</head>
<body>
<div style="margin:0 0 50px 0 ;">
	<jsp:include page="../../common/top.jsp"></jsp:include>
</div>
<div style="width:90%;margin:50px 3% 0px 7%;">
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="col-xs-6 span9">
								<h3>
				h3. 这是一套可视化布局系统.
			</h3>
			<div class="carousel slide" id="carousel-656742">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-656742">
					</li>
					<li data-slide-to="1" data-target="#carousel-656742">
					</li>
					<li data-slide-to="2" data-target="#carousel-656742">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="img/1.jpg" />
						<div class="carousel-caption">
							<h4>
								棒球
							</h4>
							<p>
								棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/2.jpg" />
						<div class="carousel-caption">
							<h4>
								冲浪
							</h4>
							<p>
								冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/3.jpg" />
						<div class="carousel-caption">
							<h4>
								自行车
							</h4>
							<p>
								以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
							</p>
						</div>
					</div>
				</div> <a data-slide="prev" href="#carousel-656742" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-656742" class="right carousel-control">›</a>
			</div>
			<div class="accordion" id="accordion-673646">
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-673646" href="#accordion-element-85435">言情</a>
					</div>
					<div id="accordion-element-85435" class="accordion-body collapse in">
						<div class="accordion-inner">
							<ul>
								<li>1/li>
								<li>2/li>
								<li>3/li>
								<li>4/li>

							</ul>
						</div>
					</div>
				</div>
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-673646" href="#accordion-element-559641">文学</a>
					</div>
					<div id="accordion-element-559641" class="accordion-body collapse">
						<div class="accordion-inner">
							<ul>
								<li>1/li>
								<li>2/li>
								<li>3/li>
								<li>4/li>

							</ul>
						</div>
					</div>
				</div>
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-673646" href="#accordion-element-559641">爱情</a>
					</div>
					<div id="accordion-element-559642" class="accordion-body collapse">
						<div class="accordion-inner">
							<ul>
								<li>1/li>
								<li>2/li>
								<li>3/li>
								<li>4/li>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6 span3">
						<form class="form-horizontal">
							<div class="control-group">						
									<input id="inputEmail" type="text"  placeholder="userName" style="height:30px;"/>					
							</div>
							<div class="control-group">						
									<input id="inputPassword" type="password"  placeholder="password" style="height:30px;"/>					
							</div>
							<div class="control-group">						
									<button type="submit" class="btn">登陆</button>					
							</div>
					</form>	
				<c:if test="${user==null}">
				<img class="img-rounded" alt="140x140" src="img/a.jpg" />
					<dl>
						<dt>
							欢迎
						</dt>
						<dd>
							qby管理员
						</dd>
						<dt>
							个人选项
						</dt>
						<dd>
							主页
						</dd>
						<dd>
							修改密码
						</dd>
						<dd>
							修改个人资料
						</dd>
					</dl>
				
					</c:if>
				<div class="list-group">
						 <a class="list-group-item active" href="#">主页</a>
						<div class="list-group-item">
							列表标题
						</div>
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								列表项标题
							</h4>
							<p class="list-group-item-text">
								...
							</p>
						</div>
						<div class="list-group-item">
							<span class="badge">14</span>帮助
						</div> <a class="list-group-item active"><span class="badge">14</span>帮助</a>
					</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							面板标题
						</h3>
					</div>
					<div class="panel-body">
						Panel content
					</div>
					<div class="panel-footer">
						Panel footer
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

</body>
</html>