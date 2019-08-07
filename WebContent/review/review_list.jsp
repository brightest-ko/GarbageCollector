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
	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="<%=ctxPath%>/assets/js/jquery.raty.js"></script>
	<script>
		function ChkRating(n)
		{
			var rating = 'star'.concat(n);
			rating = document.getElementById(rating).value
			alert(rating);
		}
		function fnChkByte(obj, maxByte)
		{
		    var str = obj.value;
		    var str_len = str.length;
		    
		    var rbyte = 0;
		    var rlen = 0;
		    var one_char = "";
		    var str2 = "";
	
		    for(var i=0; i<str_len; i++)
		    {
		        one_char = str.charAt(i);
		        if(escape(one_char).length > 4)
		        {
		            rbyte += 2;                                         //한글2Byte
		        }
		        else
		        {
		            rbyte++;                                            //영문 등 나머지 1Byte
		        }
		        if(rbyte <= maxByte)
		        {
		            rlen = i+1;                                          //return할 문자열 갯수
		        }
		     }
		     if(rbyte > maxByte)
		     {
			  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
			  alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
			  str2 = str.substr(0,rlen);                                  //문자열 자르기
			  obj.value = str2;
			  fnChkByte(obj, maxByte);
		     }
		     else
		     {
		        document.getElementById('byteInfo').innerText = rbyte;
		     }
		}
		function form_submit() {
	        alert(document.getElementById("serialNo").submit());
	    } 
		//rating 선택하지 않았을때 null point오류뜸. 에러잡아야함
	</script>
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
						<tr class="bg-success" style="font-weight: bold;">
							<th class="text-center col-xs-1">신청번호</th>
							<th class="text-center col-xs-2">대행자ID</th>
							<th class="text-center col-xs-5">제목</th>
							<th class="text-center col-xs-2">작성일</th>
							<th class="text-center col-xs-2">평점</th>
						</tr>
					</thead>
					<tbody>
						
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
		<button class="btn btn-info btn-lg" data-toggle="modal" data-target="#reviewModal">글쓰기</button>

	<!-- Modal -->
		
		
		
	<%@include file="/review/review_insert.jsp"%>	
</div>
</main>
	<!-- include 써주기(모달뺴서) -->
<%@include file="/footer.jsp"%>
<%@include file="/script.jsp"%>

</body>
</html>
