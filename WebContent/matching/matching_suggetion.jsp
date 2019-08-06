<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%--jstl 을 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--${fn:length(rl)} 를 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<title>당신의 쓰레기는 안녕하수깡?</title>
<link rel="struct icon" href="<%=ctxPath%>/assets/img/brsg.ico">
<style>
</style>
</head>
<body onLoad="CalcRemaining(document.clock)">
	<%@include file="/header.jsp"%>
	<main>



	<div class="container" style="padding: 50px 0;">
		<div class="list_header">
			<div class="col-xs-9" style="">
			<h2>대행을 <font style="font-weight: bold;">제안</font>하세요!</h2>
			</div>
			<div class="col-xs-3" style="margin: 30px 0 0 0;">
				<div class="form-group">
					<!-- <label for="sel1">필터조건</label> <select class="form-control" id="sel1">-->
				<select class="form-control" >
					<option>낮은 비용순</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
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
							<th class="text-center col-xs-3">지역</th>
							<th class="text-center col-xs-3">수행 예정 시간</th>
							<th class="text-center col-xs-1">종류</th>
							<th class="text-center col-xs-1">금액</th>
							<th class="text-center col-xs-3">마감 시간</th>
							<th class="text-center col-xs-1"></th>
						</tr>
					</thead>
					
					<tbody>
					
							<tr class="danger" style="color: red;">
								<td>제주시 이도1동</td>
								<td>2019/08/20/17:22:10</td>
								<td>플라스틱</td>
								<td>2000원</td>
								<td style="color: red;"><FORM NAME=clock>
<INPUT TYPE=TEXT NAME=txtDays style="width:25px; border:1px #c0c0c0 solid"> 일
<INPUT TYPE=TEXT NAME=txtHours style="width:20px; border:1px #c0c0c0 solid"> 시간
<INPUT TYPE=TEXT NAME=txtMins style="width:20px; border:1px #c0c0c0 solid"> 분 
<!-- <INPUT TYPE=TEXT NAME=txtSecs style="width:20px; border:1px #c0c0c0 solid"> seconds -->
</FORM>후</td>
								<td>
									<button type="button" class="btn btn-success">제안하기</button>
								</td>
							</tr>
						<l:forEach var="vo" items="${rl}">
							<!--if 마감시간 1시간 임박-->
							<tr>
								<td>${vo.addr_front}시 ${vo.addr_front}</td>
								<td>2019/08/20/17:22:10</td>
								<td>플라스틱</td>
								<td>2000원</td>
								<td style="color: red;"></td>
								<td>
									<button type="button" class="btn btn-success">제안하기</button>
								</td>
							</tr>
						</l:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="list_footer">
			<!-- paging -->
		</div>
	</div>


	</main>
	<%@include file="/footer.jsp"%>
	<%@include file="/script.jsp"%>
<SCRIPT LANGUAGE="JavaScript">
 
var millenium = new Date('2019/05/16/17:22:10');
function CalcRemaining(theForm)
{
var now = new Date();
 
var difference = parseInt(((millenium.getTime() - now.getTime()) / 1000) + 0.999)
var secs = difference % 60
 
difference = parseInt(difference / 60)
var minutes = difference % 60
 
difference = parseInt(difference / 60)
var hours = difference % 24
 
difference = parseInt(difference / 24)
var days = difference
 
theForm.txtDays.value = days;
theForm.txtHours.value = hours;
theForm.txtMins.value = minutes;
//theForm.txtSecs.value = secs;
 
setTimeout("CalcRemaining(document.clock)", 250);
}
</SCRIPT>

</body>
</html>