<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="customer.CustomerApplyVO"
	%>
<%
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
<style type="text/css">
		.modal-header{
        	background-color:#ADCB00;
            color:#1C4220;
        }      
		.form-control{
        	padding:10px;
            margin:10px
        
        }
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<%
	String two_phone=(String)request.getAttribute("two_phone");
	int bag_num=Integer.parseInt((String)request.getAttribute("bag_num"));
	int price=Integer.parseInt((String)request.getAttribute("price"));
	%>
	<main>
<div class="container">
 <div class="modal fade" id="customer_apply_two_modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">결제</h4>
        </div>
        <div class="modal-body" style="padding:60px">
          <p class="text-center"><%=two_phone%> 고객님!</p>
          <label for="total_money">봉투갯수 : <%=bag_num%> 총 이용금액</label>
          
         <form method="POST"  action="customer_update.do">
         	
     	  <input type="text" class="form-control" id="total_money" name="total_money"
     	  value="<%=price%>">
			
          <label for="card_num" >카드번호</label>
     	  <input type="text" class="form-control" id="card_num" name="card_num">
			<a role="submit" class="btn pull-left" style="background-color:#ADCB00" >이전</a>
         	<a role="submit" class="btn pull-right" style="background-color:#ADCB00" >신청</a>
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