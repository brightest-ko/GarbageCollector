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
  
	<!--jquery -->	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
	<title>당신의 쓰레기는 안녕하수깡?</title>
	<link rel="struct icon" href="<%=ctxPath %>/assets/img/brsg.ico">
	<style>
  </style>
</head>
<body>
<%@include file="/header.jsp"%>
<main>




	<div class="container" style="padding: 50px 0;">
		<div class="list_header">
			<div class="col-xs-9" style="">
			<h2>지난 <font style="font-weight: bold;">신청</font>은 여기에!</h2>
			</div>
			<div class="col-xs-3" style="margin: 30px 0 0 0;">
				<div class="form-group">
					<!-- <label for="sel1">필터조건</label> <select class="form-control" id="sel1">-->
				<select class="form-control" >
					<option>낮은 비용순</option>
					<option>2</option>
				</select>
				</div>
			</div>
		</div>
		<div class="list_body">
			<div class="matching_filter">
				<div></div>
			</div>

			<div class="matching_lsit">

				<table class="table table-bordered text-center table-hover">
					<thead>
						<tr class="bg-success" style="font-weight: bold;">
			<td>고객신청번호</td>
			<td>핸드폰번호</td>
			<td>인근주소</td>
			<td>둘째주소</td>
			<td>상세주소</td>
			<td>가방갯수</td>
			<td>분리수거종류</td>
			<td>원하는수거시간대</td>
			<td>가격</td>
			<td>카드번호</td>
			<td>작성일자</td>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="vo" items="${rl}">
							<!--if 마감시간 1시간 임박-->
							<tr class="deadline_red" onclick="location.href='apply_detail.do?serialNo=${vo.serialNo}'">
				<td>${vo.serialNo}</td>
				<td>${vo.customer_phone}</td>
				<td>${vo.customer_addr_first}</td>
				<td>${vo.customer_addr_second}</td>
				<td>${vo.customer_addr_third}</td>
				<td>${vo.bag_num}</td>
				<td>${vo.trash_type}</td>
				<td>${vo.wanted_time}</td>
				
				<td>${vo.price}</td>
				<td>${vo.card_num}</td>
				<td>${vo.customer_apply_day}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="list_footer">
			<!-- paging -->
		</div>
	</div>

  
<style>
.btn-outline-success{
	color: #5cb85c;
    border-color: #4cae4c
}
.visuallyhidden{
	display: none;
}

</style>
</main>
<%@include file="/footer.jsp"%>
<%@include file="/script.jsp"%>

</body>
</html>