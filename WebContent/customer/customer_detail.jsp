<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="customer.CustomerApplyVO,customer.CustomerApplyDAO,customer.CustomerApplyDAO_OracleImpl"%>
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

	<div class="container" style="padding: 50px 0;">
		<div class="list_header">
			<div class="col-xs-12" style="padding: 10px;">
				<h2>
					<font style="font-weight: bold;">신청 내역 조회</font>
				</h2>
			</div>
		</div>
		<div class="list_body">
			<div class="matching_filter">
				<div></div>
			</div>

			<div class="matching_lsit">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="col-xs-3">No.</th>
							<td class="col-xs-9">${vo.serialNo}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>핸드폰번호</th>
							<td>${vo.customer_phone}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${vo.customer_addr_first} ${vo.customer_addr_second}
								${vo.customer_addr_third}</td>
						</tr>
						<tr>
							<th>봉투 개수</th>
							<td>${vo.bag_num}개</td>
						</tr>
						<tr>
							<th>종류</th>
							<td>${vo.trash_type}</td>
						</tr>
						<tr>
							<th>원하는 수거 시간(마감시간)</th>
							<td>${vo.wanted_time}</td>
						</tr>
						<tr>
							<th>가격</th>
							<td>${vo.price}</td>
						</tr>
						<tr>
							<th>등록일자</th>
							<td>${vo.customer_apply_day}</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
		
		<div class="list_header">
			<div class="col-xs-12" style="padding: 10px;">
				<h3>
					이 신청에 제안온 <font style="font-weight: bold;">헬퍼</font>
				</h3>
				<h5>
					당신의 <font style="font-weight: bold;">대행을 PICK</font> 하세요!
				</h5>
			</div>
		</div>
		<div class="list_footer">
			<table class="table table-bordered text-center table-hover">
					<thead>
						<tr class="bg-success" style="font-weight: bold;">
			<td>대행ID</td>
			<td>핸드폰번호</td>
			<td>성별</td>
			<td>하고 싶은 말</td>
			<td></td>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="vo2" items="${rl}">
							<tr>
				<td onclick="location.href='helper/helper_detail.jsp?helperId=${vo2.helperId}'">${vo2.helperId}</td>
				<td>${vo2.helper_Phone}</td>
				<td>${vo2.sex}</td>
				<td>${vo2.want_to_say}</td>
				<td>
					<button type="button" class="btn btn-default btn-success" data-toggle="modal" data-target="#acceptance_ok">PICK</button>
				</td>
							</tr>
										
  <div class="modal fade" id="acceptance_ok" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h2 class="modal-title" style="float: left; color: #ffffff;"><b>수락</b>하기</h2> <button type="button" class="close" data-dismiss="modal"> <span>×</span> </button>
        </div>
        <div class="modal-body">
          <p class="text-center" style="font-size: 20px;">느영(대행맨)에게<br>분리수거를 맡기겠습니까?</p>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="location.href='<%=ctxPath%>/matching_suggetion_add.do?serialNo=${vo.serialNo}'">&nbsp; &nbsp; 예&nbsp; &nbsp;&nbsp;</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button> </div>
      </div>
    </div>
  </div>
						</c:forEach>
					</tbody>
				</table>
		</div>
	</div>


	</main>
	<%@include file="/footer.jsp"%>
	<%@include file="/script.jsp"%>

</body>
</html>