<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="l"%>
<% String ctxPath = request.getContextPath(); System.out.println("+"+ctxPath);%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Review</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link href="stylesheet" type="text/css" href="/css/style.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="<%=ctxPath%>/assets/js/jquery.raty.js"></script>
</head>	

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
</style>
<body>
	<table class="table table-striped" border="1" cellspacing="0" cellpading="30">
		<tr>
			<td align="center">신청번호</td>
			<td align="center">대행자</td>
			<td align="center">제목</td>
			<td align="center">작성일</td>
			<td align="center">평점</td>
		</tr>
		<l:forEach var="vo" items="${rl}">
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
		</l:forEach>
	</table>
        
	<!-- add시 -->
	<div class="container">
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
		        				<span class="col-xs-3">
									<label for="l" style="margin-left:30px; margin-top:8px;">신청번호</label>
								</span>
								<span class="col-xs-3">
								    <input class="form-control" id="ex1" type="text" name="serialNo" value="PK123456" readonly />
								</span>
								<span class="col-xs-3"></span>
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
								  	<div class="rate">
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
		        				<span "style=width:40%">
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
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	 <!-- 평점표시 -->

</body>
</html>