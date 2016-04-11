<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>视频列表</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="../../image/icon.png"/>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/list.css" />
<style type="text/css">
body {
	text-align: center;
	 padding-top: 75px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"> <img alt="Brand" src="../image/logo.png" style="width: 95px">
			</a>
		</div>
	<ul class="nav navbar-nav" id="mytab">
		<li class="active"><a href="#">搞笑 <span class="sr-only">(current)</span></a></li>
		<li><a href="#">生活</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-haspopup="true"
			aria-expanded="false">学习 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">移动端</a></li>
				<li><a href="#">后台</a></li>
				<li><a href="#">前端</a></li>
			</ul></li>
	</ul>
	<button type="button" class="btn btn-default navbar-btn navbar-right">Sign in</button>
	<form class="navbar-form navbar-right" role="search">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="Search">
		</div>
		<button type="submit" class="btn btn-default ">查找</button>
	</form>
	<p class="navbar-text navbar-right">欢迎来到 <a href="#" class="navbar-link">在线创意视频</a></p>
	</nav>
	<center>
		<ul class="appList">
		<c:if test="${empty videos }">没有视频</c:if>
		<c:forEach items="${videos}" var="video">
			<li>
				<a href="${pageContext.request.contextPath}/video/toBoFang?id=${video.id }" target="_blank">
					<figure>
						<img style="width: 300px; height: 200px; cursor: pointer;margin-left: -9px;"
							alt="${video.videoName}" title="${video.videoName}" src="http://img.alinetgo.com${video.photoPath}" /> <figcaption>
						<h3>${video.videoName}</h3>
					</figcaption> 
					</figure>
				</a>
			</li>
		
		</c:forEach>
		</ul>
	</center>

</body>
 <script src="../script/jquery-2.0.2.min.js"></script>
<script src="../script/bootstrap.min.js"></script>
<script type="text/javascript">
	$("#mytab a").click(function(e){
		$(this).tab("show");
	})
</script>
<%@include file="../common/foot.html"%>
</html>
