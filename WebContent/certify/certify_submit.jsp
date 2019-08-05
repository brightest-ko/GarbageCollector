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
	<div class="container">
	
		<form method="POST" action="certify_add2.do"
			enctype="multipart/form-data">
			<button type="button" class="btn btn-success" data-toggle="modal"
				data-target="#myModal">인증하기</button>

			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h2 class="modal-title">분리수거 완료했어요!</h2>
						</div>
						<div class="modal-body">
							<div class="">
								<div class="form-group has-success has-feedback">
									<div class="input-group">
										<span class="input-group-addon">고객 신청번호</span> <input
											id="certify_serialNo" type="text" class="form-control"
											name="certify_serialNo" placeholder="신청번호를 입력하세요">
									</div>
								</div>
							</div>
							<div class="">
								<div class="form-group has-success has-feedback">
									<div class="input-group">
										<span class="input-group-addon">위치</span> <input
											id="housePlace" type="text" class="form-control"
											name="housePlace" placeholder="위치를 찍어주세요">
									</div>
								</div>
							</div>
							<div class="">
								<div class="form-group has-success has-feedback">

									<div class="input-group">
									<span class="input-group-addon">사진</span>
									<input type="file" name="photo" camera="camera" class="form-control"/>
								</div></div>
							</div>

							<div class="">
								<h3>특이사항</h3>
								<div class="form-group">
									<label for="comment"></label>
									<textarea class="form-control" rows="5" id="details"
										name="details"></textarea>
								</div>
							</div>

							<!-- Trigger the modal with a button -->
							<button type="submit" class="btn btn-success" data-toggle="modal"
								data-target="#myModal">인증하기</button>

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
					</div>
				</div>

			</div>
</form>
	</div>
</main>
<%@include file="/footer.jsp"%>
<%@include file="/script.jsp"%>

</body>
</html>