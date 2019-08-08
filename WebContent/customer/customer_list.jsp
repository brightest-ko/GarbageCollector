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
			<div class="col-xs-9" style="padding: 10px;">
			<h2><font style="font-weight: bold;">신청 결과 조회</font></h2>
			<h5>수락하지 않은 <font style="font-weight: bold;">신청</font> 대행을 PICK하세요!</h5>
			<h5>지난 신청엔 <font style="font-weight: bold;">후기</font>를 작성해주세요!</h5>
			
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
			<td>No</td>
			<td>핸드폰번호</td>
			<td>주소</td>
			<td>가방갯수</td>
			<td>분리수거종류</td>
			<td>원하는수거시간대</td>
			<td>가격</td>
			<td>카드번호</td>
			<td>작성일자</td>
			<td>대행ID</td>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="vo" items="${rl}">
							<tr>
				<td onclick="location.href='customer/customer_detail.jsp?serialNo=${vo.serialNo}'">${vo.serialNo}</td>
				<td>${vo.customer_phone}</td>
				<td>${vo.customer_addr_first} ${vo.customer_addr_second} ${vo.customer_addr_third}</td>
				<td>${vo.bag_num}</td>
				<td>${vo.trash_type}</td>
				<td>${vo.wanted_time}</td>
				
				<td>${vo.price}</td>
				<td>${vo.card_num}</td>
				<td>${vo.customer_apply_day}</td>
				<c:if test="${not empty vo.helperID and vo.certify_status == 1 and vo.review_status == 0}">
					<td><button class="btn btn-success" data-toggle="modal" data-target="#review_Modal_upload${vo.serialNo }">후기쓰기</button></td>
				</c:if>
				<c:if test="${not empty vo.helperID and vo.review_status == 1}">
					<td><button class="btn btn-success" data-toggle="modal" data-target="#review_Modal_view${vo.serialNo }">후기수정</button></td>

				</c:if>
				<c:if test="${empty vo.helperID}">
					<td><button class="btn btn-default" onclick="location.href='apply_detail.do?serialNo=${vo.serialNo}'">대행고르기</button></td>
				</c:if>
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
	
<c:forEach var="vo2" items="${rl}">
	<c:if test="${not empty vo2.helperID and vo2.review_status == 1}">
		<%@include file="/review/review_modal_insert.jsp"%>
	</c:if>
</c:forEach>
<c:forEach var="vo_review" items="${rl_review}">
	<c:if test="${not empty vo_review.helperID and vo_review.review_status == 1}">
		<%--@include file="/review/review_modal_view.jsp"--%>
	</c:if>
</c:forEach>
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

	<style>
	
	.form-control{
	margin-left : 30px; 
	text-align : center;
	}
	.modal-header{
        	background-color:#ADCB00;
            color:#1C4220;
        }  
	
	*{
	    margin: 0;
	    padding: 0;
	}
	.rate {
	    float: left;
	    height: 46px;
	    padding: 0 10px;
	}
	.rate:not(:checked) > input {
	    position:absolute;
	    top:-9999px;
	}
	.rate:not(:checked) > label {
	    float:right;
	    width:1em;
	    overflow:hidden;
	    white-space:nowrap;
	    cursor:pointer;
	    font-size:30px;
	    color:#ccc;
	}
	.rate:not(:checked) > label:before {
	    content: '★ ';
	}
	.rate > input:checked ~ label {
	    color: #ffc700;    
	}
	.rate:not(:checked) > label:hover,
	.rate:not(:checked) > label:hover ~ label {
	    color: #deb217;  
	}
	.rate > input:checked + label:hover,
	.rate > input:checked + label:hover ~ label,
	.rate > input:checked ~ label:hover,
	.rate > input:checked ~ label:hover ~ label,
	.rate > label:hover ~ input:checked ~ label {
	    color: #c59b08;
	}
	/* Modified from: https://github.com/mukulkant/Star-rating-using-pure-css */
	
	th, td { /*안댐*/
		text-overflow:ellipsis; !important
		overflow:hidden; !important
		white-space:nowrap; !important
	}
	.row{
        	padding:10px
        
        }
        
	.gul{
        	padding:8px;
          
        }
        
	#selector {
		width: 100px; !important
	}
	#search {
		width: 200px; !important
	}
	</style>
	
</body>
</html>