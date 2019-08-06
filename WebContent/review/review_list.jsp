<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    %>
<%
	String ctxPath =request.getContextPath();
	System.out.println("+"+ctxPath);
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=ctxPath %>/assets/css/index.css">
  
	<title>당신의 쓰레기는 안녕하수깡?</title>
	<link rel="struct icon" href="<%=ctxPath %>/assets/img/brsg.ico">
	<style>
	
	.form-control{
	margin-left : 30px; 
	text-align : center;
	}
	span {
	    display: table-cell;
	    vertical-align: middle;
	    height: 40px;
	    border: 1px solid red;
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
	#selector {
		width: 100px; !important
	}
	#search {
		width: 200px; !important
	}
	
	</style>
	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="<%=ctxPath%>/assets/js/jquery.raty.js"></script>
</head>
<body>
<%@include file="/header.jsp"%>
<main>
<!-- YOUR Content -->
<div class="container" style="padding: 50px 0;">
	<div class="list_header">
		<div class="col-xs-7" style="">
			<h2>소중한 <font style="font-weight: bold;">리뷰</font>를 확인하세요.</h2>
		</div>
		<div class="form-inline col-xs-5"  style="margin: 20px 0 0 0;">
			<div class="form-group">
				<!-- <label for="sel1">필터조건</label> <select class="form-control" id="sel1">-->
				<select class="form-control" id="selector" name="selector">
                  <option value="제목" placeholder="제목">제목</option>
                  <option value="대행자ID">대행자ID</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="search" name="search" placeholder="통합검색" onkeydown="enterSearch()"/><!--검색 텍스트박스-->
                <button type="submit" class="btn"><i class="fa fa-search" href="http://naver.com/">></i></button> <!--검색 버튼-->
			</div>
		</div>
	</div>
		<div class="list_body">
			<div class="review_list">
				<table class="table table-bordered text-center table-hover">
					<thead>
						<tr class="bg-primary" style="font-weight: bold;">
							<th class="text-center col-xs-1">신청번호</th>
							<th class="text-center col-xs-2">대행자ID</th>
							<th class="text-center col-xs-5">제목</th>
							<th class="text-center col-xs-2">작성일</th>
							<th class="text-center col-xs-2">평점</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>4</td>
							<td>abcdefghijklmnopqrstuvwxyz</td>
							<td>DB가 죽었어요..컴퓨터 폐기해주실분?</a></td>
							<td>2019-08-05</td>
							<td>2</td>
						</tr>
						<tr>
							<td>3</td>
							<td>angelous</td>
							<td>쓰레기 3일밀렸어요 ㅠ.ㅠ</a></td>
							<td>2019-08-05</td>
							<td>3</td>
						</tr>
						<tr>
							<td>2</td>
							<td>ironman</td>
							<td>[급구]내일 플라스틱 버려주실분</a></td>
							<td>2019-08-05</td>
							<td>4</td>
						</tr>
						<tr>
							<td>1</td>
							<td>Cjam</td>
							<td>새벽에 쓰레기 대신 버려주실분??.</td>
							<td>2019-08-05</td>
							<td>1</td>
						</tr>
						<c:forEach var="vo" items="${rl}">
							<tr>
								<td>${vo.serialNo}</td>
								<td>${vo.helperID}</td>
								<td>${vo.reviewTitle}</td>
								<td>${vo.reviewDay}</td>
								<td>${vo.rating}</td>
								<!-- 
								<td><a href="review_modify.jsp?serialNo=${vo.serialNo}">수정</a></td>
								<td><a href="review_delete.do?serialNo=${vo.serialNo}">삭제</a></td>-->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<button class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">글쓰기</button>
	<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
		    
		      <!-- Modal content-->
		    	<div class="modal-content">
		        	<div class="modal-header">
		          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<h4 class="modal-title" align="center" style="font-weight: bold">고객 신청글</h4>
		        	</div>
		        	<div class="modal-body">
		        		<div>
		        			<div class="form-group row">
		        				<span class="col-xs-3" style="margin: 10 0 0 0">
									<label for="l" style="margin-left:30px; margin-top:8px;">신청번호</label>
								</span>
								<span class="col-xs-3">
								    <input class="form-control" id="ex1" type="text" name="serialNo" value="PK123456" readonly />
								</span>
		        			</div>
		        			<div class="form-group row">
		        				<span class="col-xs-3">
									<label for="l" style="margin-left:30px; margin-top:8px;">제목</label>
								</span>
								<span class="col-xs-7">
								    <input class="form-control" id="ex2" type="text" name="title" placeholder="글 제목을 입력하세요." />
								</span>
		        			</div>
		        		</div>
		        			<div class="form-group row">
		        				<span class="col-xs-3">
									<label for="l" style="margin-left:30px; margin-top:8px;">대행자</label>
								</span>
								<span class="col-xs-4">
								    <input class="form-control" id="ex3" type="text" name="helperID" placeholder="열혈최강짱짱대행" readonly />
								</span>
		        			</div>
							<div class="form-group row">
								<span class="col-xs-3">
									<label for="l" style="margin-left:30px; margin-top:8px;">평점</label>
								</span>
								<span class="col-xs-5">
								    <!-- Rating Stars Box -->
								  	<div class="rate" style="margin-left:15px;">
								    	<input type="radio" id="star5" name="rate" value="5" />
								    	<label for="star5" title="text">5 stars</label>
								    	<input type="radio" id="star4" name="rate" value="4" />
								    	<label for="star4" title="text">4 stars</label>
								    	<input type="radio" id="star3" name="rate" value="3" />
								    	<label for="star3" title="text">3 stars</label>
								    	<input type="radio" id="star2" name="rate" value="2" />
								    	<label for="star2" title="text">2 stars</label>
								    	<input type="radio" id="star1" name="rate" value="1" />
								    	<label for="star1" title="text">1 star</label>
									</div>
								</span>
							</div>
		       			<div>
		       				<div class="form-group row">
		        				<span class="col-xs-3">
									<label for="l" style="margin-left:30px; margin-top:8px;">클린하우스 위치</label>
								</span>
								<span class="col-xs-7">
								    <input class="form-control" id="ex5" type="text" name="cleanhouse" placeholder="주소검색" />
								</span>
		        			</div>
		        		</div>
		          		<p>주의사항 문구</p>
		        	</div>
		        	<div class="modal-footer">
		          		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
