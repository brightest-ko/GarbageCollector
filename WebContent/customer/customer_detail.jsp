<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
   	import="customer.CustomerApplyVO,customer.CustomerApplyDAO,customer.CustomerApplyDAO_OracleImpl"
    %>
<%
	
	String ctxPath =request.getContextPath();
	String serialNo=request.getParameter("serialNo");
	CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();
	CustomerApplyVO vo=dao.findAll_cus(serialNo);
	String type=null;
	if(vo.getTrash_type()==0)
		type="당일수거";
	else
		type="혼합";
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


	<div class="container ">
	<form method="POST" action="<%=ctxPath%>/customer_apply_list.do">
		<div style="text-align:left">
		
			<div class="container row">
					<div class="jumbotron certify_temp">
						<p></p>
						<div class="row">
   						<div class="col-sm-4" ><h2 style="color: WHITE" >신청 상세정보</h1></div>
    					<div class="col-sm-4" ></div>
    					<div class="col-sm-4" ><img src="/GarbageCollector/assets/img/certify_info.png" width="200" height="200" alt="My Image" readonly></div>
  						</div>
					</div>
			</div>				
				<div class="py-5">
					<div class="container ">
						<div class="row">
							<div class="col-md-12">

								<div class="form-group row">
									<label class="col-2 col-form-label">핸드폰번호</label>
									<div class="col-10">
										<div><%=vo.getCustomer_phone()%></div>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-2 col-form-label">주소</label>
									<div class="col-10">
										<%=vo.getCustomer_addr_first()%>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-2 col-form-label">가방갯수</label>
									<div class="col-10">
										<%=vo.getBag_num()%>
									</div>
								</div>

								<div class="form-group row " id="photo">
									<label class="col-2 col-form-label ">분리수거종류</label> 
								
									<div class="col-10">
										<%=type%>	
									</div>
								</div>
								<div id="details">
									<label class="col-2 col-form-label">원하는 수거시간대</label> 
									<div class="col-10">
										<%=vo.getWanted_time()%>	
									</div>
									
								</div>
							</div>
						</div>
					</div>

				</div>

		<div class="container">
		<input type="submit" class="btn btn-success"  value="확인">
		</div>
		<div class="col-md-4"></div>
	</form>
</div>

</main>
<%@include file="/footer.jsp"%>
<%@include file="/script.jsp"%>

</body>
</html>