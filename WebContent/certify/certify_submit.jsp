<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String ctxPath = request.getContextPath();
	String certify_no = request.getParameter("SerailNo");
	String auth = null;
	String helperID = null;
	try{
		auth = (String)session.getAttribute("auth");
		helperID =  (String)session.getAttribute("id");
		if(auth==null||!auth.equals("helper")||helperID==null||helperID.equals("")){
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
.certify_temp {
	background-color: #ADCB00;
	padding: 8px;
}

.certify_detalis {
	border: solid #101820 3px;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<main>
	<div class="container ">
		<div style="text-align: left">
			<form method="POST" action="<%=ctxPath%>/certify/certify_add2.do"
				enctype="multipart/form-data">
				<div class="container row">
					<div class="jumbotron certify_temp">
						<p></p>
						<div class="row">
							<div class="col-sm-4">
								<h2 style="color: WHITE">분리수거 완료했어요!</h2>
							</div>
							<div class="col-sm-4"></div>
							<div class="col-sm-4">
								<img src="/GarbageCollector/assets/img/certify_submit.png"
									width="200" height="200" alt="My Image">
							</div>
						</div>
					</div>
				</div>

				<div class="py-5">
					<div class="container ">
						<div class="row">
							<div class="col-md-12">

								<div class="form-group row">
									<label class="col-sm-1 col-form-label">대행ID</label>
									<div class="col-sm-11">
										<input type="text" class="form-control" id="certify_helperID"
											name="certify_helperID" value=<%=helperID%> readonly>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-1  col-form-label">신청번호</label>
									<div class="col-sm-11">
										<input type="text" class="form-control " id="certify_serialNo"
											name="certify_serialNo" value=<%=certify_no%> readonly>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-1 col-form-label">위치</label>
									<div class="col-sm-11">
										<input type="text" class="form-control " id="housePlace"
											name="housePlace" placeholder="위치를 찍어주세요">
									</div>
								</div>
								<div class="form-group row ">
									<label class="col-sm-1 col-form-label ">사진</label> <div class="col-sm-11"><input
										type="file" name="photo" camera="camera" class="form-control " />
										</div>
								</div>
								<h3>특이사항</h3>
								<div class="form-group">
									<textarea class="form-control" rows="5" id="details"
										name="details"></textarea>

								</div>
							</div>
						</div>
						<div class="container">
							<button type="button" class="btn btn-success" data-toggle="modal"
								data-target="#myModal">인증완료</button>
						</div>
					</div>

				</div>
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
	<div class="pt-5 text-center ">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h3 contenteditable="true">인증하는 방법</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 p-4">
					<h4>
						<b>One</b>
					</h4>
					<p>내 위치 버튼을 클릭하여 현재위치의 클린하우스 또는 재활용 도움센터를 찍어주세요</p>
				</div>
				<div class="col-lg-4 col-md-4 p-4">
					<h4>
						<b>Two</b>
					</h4>
					<p style="">
						클린하우스와 빈 봉투가 보이게&nbsp;<br>사진을 찍어주세요
					</p>
				</div>
				<div class="col-lg-4 col-md-4 p-4">
					<h4>
						<b>Three</b>
					</h4>
					<p>사진을 첨부한 후 특이사항을 작성하시고 인증완료 버튼을 눌러주세요</p>
				</div>
			</div>
		</div>
	</div>
</body>
</main>
<%@include file="/footer.jsp"%>
<%@include file="/script.jsp"%>

</body>
</html>