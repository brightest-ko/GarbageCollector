<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String ctxPath = request.getContextPath();
	String customer_phone = request.getParameter("customer_phone");
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


<!-- subin -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>

<title>당신의 쓰레기는 안녕하수깡?</title>
<link rel="struct icon" href="<%=ctxPath%>/assets/img/brsg.ico">
<style>
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<main>


	<style type="text/css">
.modal-header {
	background-color: #ADCB00;
	color: #1C4220;
}

.col-md-4 {
	text-align: center;
}

.gul {
	padding: 8px;
}

.row {
	padding: 10px
}

input.img-button {
	background: url("C:/Users/jsb56/Downloads/baseline-help-24px.svg" )
		no-repeat;
	width: 30px;
}
</style>

	<div class="container">
		<h2>신청결과조회</h2>
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">동네입력했다 치고</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">서비스 신청</h4>
					</div>
					<div class="modal-body">
						<form method="POST" action="customer_apply_two.me">


							<div class="row">
								<div class="col-xs-4 gul">전화번호</div>
								<div class="col-xs-8 ">
									<input type="text" class="form-control" name="customer_phone"
										value="01043394609">
								</div>
							</div>

							<div class="row">
								<div class="col-xs-4 gul">주소</div>
								<div class="col-xs-8 row">
									<div class="col-xs-4">
										<input type="text" class="form-control"
											name="customer_addr_front" value="제주도"
											style="color: #445A3E; text-align: center">
									</div>
									<div class="col-xs-4">
										<input type="text" class="form-control"
											name="customer_addr_detail" value="이도2동"
											style="color: #445A3E; text-align: center">
									</div>
									<div class="col-xs-4">
										<input type="text" class="form-control"
											name="customer_addr_detail" value="165"
											style="color: #445A3E; text-align: center">
									</div>
								</div>
							</div>

								<div class="row">
									<div class="col-xs-4 gul">봉투 갯수</div>
									<div class="col-xs-4">
										<div class="form-group">
											<select class="form-control" id="sel1">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
											</select>
										</div>
									</div>
									<div class="col-xs-4">
										<a role="button"><img class="btn-img"
											src="<%=ctxPath %>/assets/img/baseline-help-24px.svg"></a>
									</div>
								</div>


								<div class="row">
									<div class="col-xs-4 gul">분리수거</div>
									<div class="col-xs-4">
										<label class="form-check-label" for="radio1"> <input
											type="radio" class="form-check-input" id="radio1"
											name="trash_type" value="1" checked>당일수거물품
										</label>
									</div>

									<div class="col-xs-4">
										<label class="form-check-label" for="radio2"> <input
											type="radio" class="form-check-input" id="radio2"
											name="trash_type" value="2">혼합
										</label>
									</div>
								</div>


								<div class="row">
									<div class="col-xs-4 gul">수거시간</div>
									<div class="col-xs-8">
										<div class="input-group date" data-provide="datepicker">
											<input type="text" class="form-control"
												value="2019/08/10 -09:05" style="color: #BBC592">
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-th"></span>
											</div>
										</div>
									</div>

								</div>



								<div class="modal-footer">
									<a role="submit" class="btn btn-lg"
										style="background-color: #ADCB00; color: black;">다음</a>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	</main>
	<%@include file="/footer.jsp"%>
	<%@include file="/script.jsp"%>

</body>
</html>