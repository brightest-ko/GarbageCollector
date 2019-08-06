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

<style>
.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover{
	color: #1abc9c !important
}
</style>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h2 class="">대행 제안 내역 조회</h2>
        </div>
      </div>
    </div>
  	<div class="container">
      <div class="row">
        <div class="col-md-12" style="">
          <ul class="nav nav-tabs">
            <li class="nav-item active"> <a class="active nav-link" data-toggle="pill" data-target="#acceptance_tabone"><i class="glyphicon glyphicon-ok-sign"></i> 매칭 성공 </a> </li>
            <li class="nav-item"> <a class="nav-link" href="" data-toggle="pill" data-target="#acceptance_tabtwo"><i class="glyphicon glyphicon-question-sign"></i> 매칭 대기 </a> </li>
            <li class="nav-item" style=""> <a href="" class="nav-link" data-toggle="pill" data-target="#acceptance_tabthree"><i class="glyphicon glyphicon-remove-sign"></i> 매칭 실패 </a> </li>
          </ul>
          <div class="tab-content mt-2"  style="padding: 20px 0;">
            <div class="tab-pane tab-pane fade active in" id="acceptance_tabone" role="tabpanel">
              <div class="table-responsive">
                <table class="table table-bordered text-center table-hover">
                  <thead>
                    <tr class="bg-success"  style="font-weight: bold;">
                      <th class="text-center col-xs-1">No</th>
                      <th class="text-center col-xs-3">고객 주소 (나머지 주소 포함)</th>
                      <th class="text-center col-xs-1">가격</th>
                      <th class="text-center col-xs-3">요청 시간</th>
                      <th class="text-center col-xs-3">마감 시간</th>
                      <th class="text-center col-xs-1"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th>1</th>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td><a class="btn btn-success" href="#">인증수정</a></td>
                    </tr>
                    <tr>
                      <th>2</th>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td><a class="btn btn-default"  href="#" style="border-color: #4cae4c; color: #4cae4c;">인증확인</a></td>
                    </tr>
                    <tr>
                      <th>2</th>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td><a class="btn btn-default"  href="#" >인증수정</a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            
            
            <div class="tab-pane fade" id="acceptance_tabtwo" role="tabpanel">
              <div class="table-responsive">
                <table class="table table-bordered ">
                  <thead class="table-success">
                    <tr>
                      <th>고객 신청 번호</th>
                      <th>고객 주소 (나머지 주소 포함)</th>
                      <th>가격</th>
                      <th>요청 시간</th>
                      <th>마감 시간</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th>1</th>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td><a class="btn btn-primary" href="#">인증하기</a></td>
                    </tr>
                    <tr>
                      <th>2</th>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td><a class="btn btn-outline-primary" href="#">인증수정</a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            
            
            <div class="tab-pane fade" id="acceptance_tabthree" role="tabpanel">
              <div class="table-responsive">
                <table class="table table-bordered ">
                  <thead class="table-success">
                    <tr>
                      <th>고객 신청 번호</th>
                      <th>고객 주소 (나머지 주소 포함)</th>
                      <th>가격</th>
                      <th>요청 시간</th>
                      <th>마감 시간</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th>1</th>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td><a class="btn btn-primary" href="#">인증하기</a></td>
                    </tr>
                    <tr>
                      <th>2</th>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td><a class="btn btn-outline-primary" href="#">인증수정</a></td>
                    </tr>
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

</body>
</html>