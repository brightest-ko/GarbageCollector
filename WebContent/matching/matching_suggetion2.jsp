<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String ctxPath = request.getContextPath();

	String auth = null;
	String id = null;
	try{
		auth = (String)session.getAttribute("auth");
		id =  (String)session.getAttribute("id");
		if(auth==null||!auth.equals("helper")||id==null||id.equals("")){
			response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
		}
	}catch(Exception e){
		response.sendRedirect("helper/login.jsp"); //login.jsp로 변경
	}
%>
<%--jstl 을 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--${fn:length(rl)} 를 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" href="<%=ctxPath%>/assets/css/index.css">

<!--jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>당신의 쓰레기는 안녕하수깡?</title>
<link rel="struct icon" href="<%=ctxPath%>/assets/img/brsg.ico">
<style>
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<main>

	<style>
.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	color: #1abc9c !important
}
</style>
	<div class="container" style="padding: 40px 0;">
		<div class="list_header">
			<div class="col-xs-12" style="padding: 15px;">
				<h2>
					제안받은 <font style="font-weight: bold;">대행을</font> 진행해주세요!
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-tabs">
					<li class="nav-item active"><a class="active nav-link"
						data-toggle="pill" data-target="#acceptance_tabone"><i
							class="glyphicon glyphicon-ok-sign"></i> 매칭 성공 </a></li>
					<li class="nav-item"><a class="nav-link" href=""
						data-toggle="pill" data-target="#acceptance_tabtwo"><i
							class="glyphicon glyphicon-question-sign"></i> 매칭 대기 </a></li>
					<li class="nav-item" style=""><a href="" class="nav-link"
						data-toggle="pill" data-target="#acceptance_tabthree"><i
							class="glyphicon glyphicon-remove-sign"></i> 매칭 실패 </a></li>
				</ul>
				<div class="tab-content mt-2" style="padding: 20px 0;">
					<div class="tab-pane tab-pane fade active in"
						id="acceptance_tabone" role="tabpanel">
						<div class="table-responsive">
							<table class="table table-bordered text-center table-hover">
								<thead>
									<tr class="bg-success" style="font-weight: bold;">
										<th class="text-center col-xs-1">No</th>
										<th class="text-center col-xs-3">고객 주소 (나머지 주소 포함)</th>
										<th class="text-center col-xs-2">전화번호</th>
										<th class="text-center col-xs-2">종류</th>
										<th class="text-center col-xs-1">가격</th>
										<th class="text-center col-xs-2">약속 시간</th>
										<th class="text-center col-xs-1"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo1" items="${rl_success}">
										<tr>
											<td>${vo.serialNo }</td>
											<td>${vo.customer_addr_first }${vo.customer_addr_second }
												${vo.customer_addr_third }</td>
											<td>${vo.customer_phone }</td>
											<td>${vo.trash_type }</td>
											<td>${vo.price }</td>
											<td>${vo.wanted_time }</td>
											<c:if test="${vo1.certify_status }==0">
												<td><a class="btn btn-success"
													href="<%=ctxPath %>/certify/certify_submit.jsp?SerailNo=${vo1.serialNo }">인증하기</a></td>
											</c:if>
											<c:if
												test="${vo1.certify_status }==1 and ${vo1.review_status }==0">
												<td><a class="btn btn-default" href="#"
													style="border-color: #4cae4c; color: #4cae4c;">인증수정</a></td>
											</c:if>
											<c:if
												test="${vo1.certify_status }==1 and ${vo1.review_status }==1">
												<td><a class="btn btn-default" href="#">인증확인</a></td>
											</c:if>
										</tr>
										
										<a class="btn btn-success"
													href="<%=ctxPath %>/certify/certify_submit.jsp?SerailNo=${vo1.serialNo }">인증하기</a>
													<a class="btn btn-default" href="#"
													style="border-color: #4cae4c; color: #4cae4c;">인증수정</a>
													<a class="btn btn-default" href="#">인증확인</a>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>


					<div class="tab-pane fade" id="acceptance_tabtwo" role="tabpanel">
						<div class="table-responsive">
							<table class="table table-bordered text-center table-hover">
								<thead>
									<tr class="bg-success" style="font-weight: bold;">
										<th class="text-center col-xs-1">No</th>
										<th class="text-center col-xs-4">고객 주소</th>
										<th class="text-center col-xs-2">수행 예정 시간</th>
										<th class="text-center col-xs-1">종류</th>
										<th class="text-center col-xs-1">갯수</th>
										<th class="text-center col-xs-1">금액</th>
										<th class="text-center col-xs-3">마감 시간</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${rl_yet}">
										<tr>
											<td>${vo.serialNo }</td>
											<td>${vo.customer_addr_first } ${vo.customer_addr_second }</td>
											<td><fmt:formatDate value="${vo.wanted_time }" pattern="MM월 dd일 HH시 mm분"/></td>
											<td>
												<c:if test="${vo.trash_type ==0}">오늘의 재활용</c:if>
												<c:if test="${vo.trash_type ==1}">혼합</c:if>
											</td>
											<td>${vo.bag_num }</td>
											<td>${vo.price }</td>
											<td><div id="countdown2_${vo.serialNo}"  wanted_time_data="${vo.wanted_time }"></div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>


					<div class="tab-pane fade" id="acceptance_tabthree" role="tabpanel">
						<div class="table-responsive">
							<table class="table table-bordered text-center table-hover">
								<thead>
									<tr class="bg-success" style="font-weight: bold;">
										<th class="text-center col-xs-1">No</th>
										<th class="text-center col-xs-4">고객 주소 (나머지 주소 포함)</th>
										<th class="text-center col-xs-2">종류</th>
										<th class="text-center col-xs-1">가격</th>
										<th class="text-center col-xs-3">약속 시간</th>
										<th class="text-center col-xs-1"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo3" items="${rl_fail}">
										<tr>
											<td>${vo.serialNo }</td>
											<td>${vo.customer_addr_first }${vo.customer_addr_second }
												${vo.customer_addr_third }</td>
											<td>${vo.trash_type }</td>
											<td>${vo.price }</td>
											<td>${vo.wanted_time }</td>
											<td>
											<c:if test="${vo1.certify_status }==0">
												<a class="btn btn-success" href="<%=ctxPath %>/certify/certify_submit.jsp?SerailNo=${vo1.serialNo }">인증하기</a>
											</c:if>
											<c:if test="${vo1.certify_status }==1 and ${vo1.review_status }==0">
												<a class="btn btn-default" 
												href="#" style="border-color: #4cae4c; color: #4cae4c;">인증수정</a>
											</c:if>
											<c:if test="${vo1.certify_status }==1 and ${vo1.review_status }==1">
												<a class="btn btn-default" href="#">인증확인</a>
											</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	</main>
	<%@include file="/footer.jsp"%>
	<%@include file="/script.jsp"%>
<script type="text/javascript">
setInterval(function(){
	  $(".blinkEle").toggleClass( 'btn-success' );
	  $(".blinkEle").toggleClass( 'btn-outline-success' );
	}, 1000);
	

<c:forEach var="vo" items="${rl_yet}">
	CountDownTimer('countdown2_${vo.serialNo}');
</c:forEach>

CountDownTimer('countdown');

function CountDownTimer(id)
{

var end = new Date($('#'+id).attr('wanted_time_data'));

var _second = 1000;
var _minute = _second * 60;
var _hour = _minute * 60;
var _day = _hour * 24;
var timer;

function showRemaining() {
var now = new Date();
var distance = end - now;
if (distance < 0) {

clearInterval(timer);
document.getElementById(id).innerHTML = 'EXPIRED!';

return;
}
var days = Math.floor(distance / _day);
var hours = Math.floor((distance % _day) / _hour);
var minutes = Math.floor((distance % _hour) / _minute);
var seconds = Math.floor((distance % _minute) / _second);

if(days<1 && hours<=1){
	$('#'+id).parent().parent().css( 'color', 'red' );
}
if(days<1 && hours<1 && minutes<1 && seconds<1){
	$('#'+id).parent().parent().addClass('visuallyhidden');
}
	
document.getElementById(id).innerHTML = days + '일 ';
document.getElementById(id).innerHTML += hours + '시간 ';
document.getElementById(id).innerHTML += minutes + '분 ';
document.getElementById(id).innerHTML += seconds + '초';
}

timer = setInterval(showRemaining, 1000);
}

</script>
</body>
</html>