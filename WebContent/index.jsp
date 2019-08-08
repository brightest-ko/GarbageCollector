<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
   
    %>
<% String ctxPath = request.getContextPath();
	
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
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/assets/css/datepicker3.css" />
	<!--jquery -->	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/assets/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="<%=ctxPath %>/assets/js/bootstrap-datepicker.kr.js"></script>
	<title>당신의 쓰레기는 안녕하수깡?</title>
	<link rel="struct icon" href="<%=ctxPath %>/assets/img/brsg.ico">
	
</head>
<body>
<%@include file="/header.jsp"%>
<main>


<!-- Index Search Container -->
<div class="index-search container-fluid bg-green">
<div class="container">
	<div class="row wrapper no-gutters" >
		<div data-name="search" class="col-md-6 hidden-xs"> <!-- NOTE: data-name="search"사용안하면 지우기 & css사용중  -->
			<img src="<%=ctxPath %>/assets/img/index.png" style="width: 100%;
    margin: -30px 0 30px 0;">
		</div>
		<div data-name="search" class="col-md-6 col-xs-12" style="padding: 100px 0;"> <!-- NOTE: data-name="search"사용안하면 지우기 & css사용중  -->
			<h2>
				<div class="padding-bottom-8">귀찮은 분리수거</div>
				<div class="padding-bottom-8"><font style="font-weight: bold;">대행 서비스</font>를</div>
				<div class="padding-bottom-8">신청해보세요</div>
			</h2>
			<div class="service-apply">
				<form onsubmit="return false;" >
					<div role="group" class="input-group border-thick">
						<input type="text" placeholder="핸드폰 번호를 숫자만 입력해주세요." autocomplete="off" id="customer_phone_in" class="form-control with-button" 
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >
						<div class="input-group-btn">
      					<button type="button" class="btn btn-default with-text" id="customer_choose_btn"><i class="glyphicon glyphicon-search"></i></button>

    				</div>
					<!---->
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>

 <script>
	function ajaxGet(url,fpOk,fpFail)
	{
		var xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					//undefined를 피하기 위한 방법
					if(fpOk){
						fpOk(xhr.responseText);
					}	
				}else{
					if(fpFail){
					fpFail(xhr.status);
					}
				}
			}
		};
		xhr.open("GET",url,true);
		xhr.send(null);
	}

window.onload=function(){
	var apply_do=document.getElementById("apply_do");
	var apply_result=document.getElementById("apply_result");
	var one_finish=document.getElementById("one_finish");
	var bag_num="1";
	var phone="";
		$(document).ready(function() {
			$("#customer_choose_btn").click(function(){
	       		 $("#customer_choose").modal("show");
	    	});
			$("#one_finish").click(function(){
				phone=$('#one_phone').val();
				var first=$('#customer_addr_first').val();
				var second=$('#customer_addr_second').val();
				var third=$('#customer_addr_third').val();
				var bag=document.getElementById("bag_num");
				var num=bag.selectedIndex;
				bag_num=bag.options[num].value;
				var trash_type = $('input:radio[name="trash_type"]:checked').val();
				var date="2019-09-09";
				/*$('#dateRangePicker').datepicker({
					 format: "yyyy-mm-dd",
					 language: "kr"
					 });
				var imsi=$('#dateRangePicker').datepicker( "getDate" );*/
			
				var url="<%=ctxPath%>/customer/customer_test.jsp?temp=temp&one_phone="+phone+"&first="+first+"&second="+second+
					"&third="+third+"&bag_num="+bag_num+"&trash_type="+trash_type+"&date="+date;
				ajaxGet(url,function(rt){
					var ob=window.eval("("+rt.trim()+")");
					alert(ob.code);
					if(ob.code=='OK'){
						document.getElementById("price_ap").innerHTML=bag_num*1500+"원";
							$('#customer_apply_one_modal').modal('hide');
							$("#customer_apply_two_modal").modal("show");	
				}
	       		
	    	});
			
		});
			$("#two_finish").click(function(){
	
				
				var card_num=$('#card_num').val();
				$("#customer_apply_two_modal").modal("hide");
		       	$("#customer_apply_result").modal("show");
		       
		       	var url="<%=ctxPath%>/customer/customer_test1.jsp?temp=temp&two_phone="+phone+"&price="+(bag_num*1500)+"&card_num="+card_num;
				ajaxGet(url,function(rt){
					var ob=window.eval("("+rt.trim()+")");
					alert(ob.code);
					if(ob.code=='OK1'){
							$('#customer_apply_two_modal').modal('hide');
							$("#customer_apply_result").modal("show");	
		    		}}
					);
				}
			);
			$("#apply_do").click(function(){
				document.getElementById("one_phone").value=$("#customer_phone_in").val();
				$("#customer_choose").modal("hide");
				$("#customer_apply_one_modal").modal("show");
				
	       		
	    	});
			$("#apply_result").click(function(){
				
				$("#customer_choose").modal("hide");
	       		
	    	});
		//var go_list=document.getElementById("go_list");
	});
	};
</script>


<!-- Second Container -->
<hr>
<div class="container bg-white">
	<%@include file="/map/map_info.jsp"%>
	<br>
	<br>
</div>

</main>
<%@include file="/footer.jsp"%>
<%@include file="/script.jsp"%>
<%@include file="/customer/customer_choose.jsp"%>
<%@include file="/customer/customer_apply_one.jsp"%>
<%@include file="/customer/customer_apply_two.jsp"%>
<%@include file="/customer/customer_apply_result.jsp"%>
</body>
</html>