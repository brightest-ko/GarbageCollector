<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="l"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Review</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<link href="stylesheet" type="text/css" href="/css/style.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="jquery.fontstar.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.raty.js"></script>
</head>	

<style>
.form-control{
	margin-left : 30px; 
	text-align : center;
}

span {
	display: table-cell;
	padding-left: 10px;
	text-align: left;
	vertical-align: middle;
}

label[for="l"] {
        position: absolute;
        top: 6px;
      }

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
	
	<!-- 평점 -->

		<div id="star" ></div>

		<div style="padding-top:20px;">
			<label for="starRating">Value : </label><input type="text" id="starRating" value="3"/>
		</div>

		<div style="padding-top:20px;">
			<label for="displayStarRating">Value : </label><span id="displayStarRating" style="padding-left:20px;">3</span>
		</div>
	<!-- 평점 -->
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
									<label for="l" style="margin-left:30px; margin-top:2px;">신청번호</label>
								</span>
								<span class="col-xs-3">
								    <input class="form-control" id="ex1" type="text" name="serialNo" value="PK123456" readonly />
								</span>
								<span class="col-xs-3"></span>
		        			</div>
		        			<div class="form-group row">
		        				<span class="col-xs-3">
									<label for="l" style="margin-left:30px; margin-top:2px;">제목</label>
								</span>
								<span class="col-xs-7">
								    <input class="form-control" id="ex2" type="text" name="title" placeholder="글 제목을 입력하세요." />
								</span>
		        			</div>
		        		</div>
		        			<div class="form-group row">
		        				<span class="col-xs-3">
									<label for="l" style="margin-left:30px; margin-top:2px;">대행자</label>
								</span>
								<span class="col-xs-4">
								    <input class="form-control" id="ex3" type="text" name="helperID" placeholder="열혈최강짱짱대행" readonly />
								</span>
		        			</div>
		        			<select name="" class="star">
		        				<option value="1">1</option>
		        				<option value="2">2</option>
		        				<option value="3">3</option>
		        				<option value="4">4</option>
		        				<option value="5">5</option>
		        			</select>
		        			<script>
		        				$('.star').fontstar();
		  						$('.star').fontstar({
		  						},function(value,self){
		  							console.log("hello"+value);
		  						})
		        			</script>
				   			<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" id="ex4" data-toggle="dropdown">평점
								<span class="caret"></span></button>
								<ul class="dropdown-menu">
									<li><a href="#">★★★★★☆</a></li>
									<li><a href="#">★★★★☆</a></li>
									<li><a href="#">★★★☆☆</a></li>
									<li><a href="#">★★☆☆☆</a></li>
									<li><a href="#">★☆☆☆☆</a></li>
								</ul>
							</div>
		       			<div>
		       				<div class="form-group row">
		        				<span class="col-xs-3">
									<label for="l" style="margin-left:30px; margin-top:2px;">클린하우스 위치</label>
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
	<script type="text/javascript">
		$(function() {
			$('div#star').raty({
				score: 3
				,path : "/resources/2979/img"
				,width : 200
				,click: function(score, evt) {
					$("#starRating").val(score);
					$("#displayStarRating").html(score);
				}
			});
		});
	</script>
</body>
</html>
