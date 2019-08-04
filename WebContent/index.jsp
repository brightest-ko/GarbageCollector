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
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link rel="stylesheet" href="<%=ctxPath %>/assets/css/index.css">
  
	<title>당신의 쓰레기는 안녕하수깡?</title>
	<link rel="struct icon" href="<%=ctxPath %>/assets/img/brsg.ico">
	<style>
  </style>
</head>
<body>
<%@include file="/header.jsp"%>
<main>


<!-- Index Search Container -->
<div class="index-search container-fluid bg-green">
<div class="container">
	<div class="row wrapper no-gutters" >
		<div data-name="search" class="col-md-6 hidden-xs"> <!-- NOTE: data-name="search"사용안하면 지우기 & css사용중  -->
			<img src="<%=ctxPath %>/assets/img/index.png" style="width: 100%;
    margin: -30px 0 30px 0;">
		</div>
		<div data-name="search" class="col-md-6 col-xs-12" style="padding: 100px 0;"> <!-- NOTE: data-name="search"사용안하면 지우기 & css사용중  -->
			<h2>
				<div class="padding-bottom-8">귀찮은 분리수거</div>
				<div class="padding-bottom-8"><font style="font-weight: bold;">대행 서비스</font>를</div>
				<div class="padding-bottom-8">신청해보세요</div>
			</h2>
			<div class="service-apply">
				<form>
					<div role="group" class="input-group">
						<input type="text" placeholder="핸드폰 번호를 입력해주세요." autocomplete="off" value="" class="form-control with-button" >
						<div class="input-group-btn">
      					<button class="btn btn-default with-text" type="submit">
        					<i class="glyphicon glyphicon-search"></i>
      					</button>
    				</div>
					<!---->
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>


<!-- Second Container -->
<hr>
<div class="container bg-white">
	<%@include file="/map/map_info.jsp"%>
	<br>
	<br>
</div>


</main>
<%@include file="/footer.jsp"%>
<%@include file="/script.jsp"%>

</body>
</html>