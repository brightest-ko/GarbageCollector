<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
   
    %>
<%
	String ctxPath =request.getContextPath();
%>
<%--jstl 을 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<%--${fn:length(rl)} 를 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=ctxPath %>/assets/css/index.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<title>당신의 쓰레기는 안녕하수깡?</title>
	<link rel="struct icon" href="<%=ctxPath %>/assets/img/brsg.ico">
	<style>
  </style>
</head>
<body>
<%@include file="/header.jsp"%>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
				<li data-target="#myCarousel" data-slide-to="5"></li>
				<li data-target="#myCarousel" data-slide-to="6"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="/GarbageCollector/assets/img/monday.png" alt="monday" style="width: 60%;">
				</div>

				<div class="item">
					<img src="/GarbageCollector/assets/img/tuesday.png" alt="tuesday" style="width: 60%;">
				</div>

				<div class="item">
					<img src="/GarbageCollector/assets/img/wenseday.png" alt="wenseday" style="width: 60%;">
				</div>
				<div class="item">
					<img src="/GarbageCollector/assets/img/thursday.png" alt="thursday" style="width: 60%;">
				</div>
				<div class="item">
					<img src="/GarbageCollector/assets/img/friday.png" alt="friday" style="width: 60%;">
				</div>
				<div class="item">
					<img src="/GarbageCollector/assets/img/saturday.png" alt="saturday" style="width: 60%;">
				</div>
				<div class="item">
					<img src="/GarbageCollector/assets/img/sunday.png" alt="sunday" style="width: 60%;">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div class="py-3 text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h1>분리수거 대행 서비스 이용방법</h1>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-3 col-6 p-4">
					<img src="/GarbageCollector/assets/img/usage_dump.png" width="100"
						height="100" alt="My Image">
					<h4>
						<b>One</b>
					</h4>
					<p>집에 쌓인 쓰레기를 모아둔다.</p>
				</div>
				<div class="col-lg-3 col-6 p-4">
					<img src="/GarbageCollector/assets/img/usage_custom.png"
						width="100" height="100" alt="My Image">
					<h4>
						<b>Two</b>
					</h4>
					<p>개인정보와 주소를 입력하여 신청한다.</p>
				</div>
				<div class="col-lg-3 col-6 p-4">
					<img src="/GarbageCollector/assets/img/usage_helper.png"
						width="100" height="100" alt="My Image">
					<h4>
						<b>Three</b>
					</h4>
					<p>신청을 목록중 마음에 드는 대행을 선택한다.</p>
				</div>
				<div class="col-lg-3 col-6 p-4">
					<img src="/GarbageCollector/assets/img/usage_clean.png" width="100"
						height="100" alt="My Image">
					<h4>
						<b>Four</b>
					</h4>
					<p>대행이 정해진 시간에 쓰레기를 수거해 클린하우스 또는 재활용 도움센터에 가서 분리수거를 한다.</p>
				</div>
			</div>
		</div>
	</div>
</main>
<%@include file="/footer.jsp"%>
<%@include file="/script.jsp"%>

</body>
</html>
</html>