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
		.certify_temp{
		background-color: #ADCB00 ;
		padding: 8px;
	}
	.certify_detalis{
		border : solid #ADCB00 3px;
	}
  </style>
</head>
<body>
<%@include file="/header.jsp"%>
<main>
	<div class="container ">
	<form method="POST" action="/certify_button.jsp" enctype="multipart/form-data">
		<div style="text-align:left">
		
			<div class="container row">
					<div class="jumbotron certify_temp">
						<p></p>
						<div class="row">
   						<div class="col-sm-4" ><h2 style="color: WHITE" >인증 상세정보</h1></div>
    					<div class="col-sm-4" ></div>
    					<div class="col-sm-4" ><img src="/GarbageCollector/assets/img/certify_info.png" width="200" height="200" alt="My Image" readonly></div>
  						</div>
					</div>
			</div>				
			<div class="form-group has-success has-feedback">
				<div class="input-group">
					<span class="input-group-addon">고객 신청번호</span> <input
						id="certify_serialNo" type="text" class="form-control"
						name="certify_serialNo" value="${vo.serialNo}" readonly>
				</div>
			</div>
		</div>
			<div class="form-group has-success has-feedback">
				<div class="input-group">
					<span class="input-group-addon">위치</span> <input id="housePlace"
						type="text" class="form-control" name="housePlace"
						value="${vo.housePlace} " readonly>
				</div>
			</div>
			<div class="form-group has-success has-feedback">
				<div class="input-group">
					<span class="input-group-addon">사진</span> <input type="file"
						name="photo" camera="camera" class="form-control" />
				</div>
			</div>

			<h3 style="color: WHITE">특이사항</h3>
			<div class="form-group certify_detalis">
				<textarea class="form-control" rows="5" id="details" name="details"></textarea>
			</div>

		<!-- Trigger the modal with a button -->
		<div class="container">
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#myModal">인증완료</button>
		</div>
		<div class="col-md-4"></div>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">
						<p>인증하시겠습니까?.</p>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">확인</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	</form>
</main>
<%@include file="/footer.jsp"%>
<%@include file="/script.jsp"%>

</body>
</html>