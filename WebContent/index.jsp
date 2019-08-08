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
	<link rel="stylesheet" href="<%=ctxPath %>/assets/css/bootstrap-datetimepicker.min.css">
	<script type="text/javascript" src="<%=ctxPath %>/assets/js/bootstrap-datetimepicker.min.js"></script>
	<script>
	
	function myFunction() {
		var winScroll = document.body.scrollTop
				|| document.documentElement.scrollTop;
		var height = document.documentElement.scrollHeight
				- document.documentElement.clientHeight;
		var scrolled = (winScroll / height) * 100;
		document.getElementById("myBar").style.width = scrolled + "%";
	}

	var good_b = [ "한림읍", "애월읍", "구좌읍", "조천읍", "한경면", "추자면", "우도면", "일도동",
			"이도동", "삼도동", "용담동", "건입동", "화북동", "삼양동", "봉개동", "아라동", "오라동",
			"연동", "노형동", "외도동", "이호동", "도두동" ];
	var good_c = [ "대정읍", "남원읍", "성산읍", "안덕면", "표선면", "송산동", "정방동", "중앙동",
			"천지동", "효돈동", "영천동", "동흥동", "서홍동", "대륜동", "대천동", "중문동", "예래동" ];

	function categoryChange1(e) {

		var target1 = document.getElementById("good1");
		
		if (e.value == "제주시")
		{	var d = good_b;
			
		}
		else if (e.value == "서귀포시")
		{	var d = good_c;
			
		}

		target1.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target1.appendChild(opt);
		}
	}
	
	  

	</script>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>



<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/smoothness/jquery-ui.css" type="text/css" media="all" />
    <style>
    .ui-timepicker-div .ui-widget-header { margin-bottom: 8px; }
    .ui-timepicker-div dl { text-align: left; }
    .ui-timepicker-div dl dt { height: 25px; margin-bottom: -25px; }
    .ui-timepicker-div dl dd { margin: 0 10px 10px 65px; }
    .ui-timepicker-div td { font-size: 90%; }
    .ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }
    .ui-timepicker-rtl{ direction: rtl; }
    .ui-timepicker-rtl dl { text-align: right; }
    .ui-timepicker-rtl dl dd { margin: 0 65px 10px 10px; }
    </style>
    
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
				var first_1=document.getElementById("city1");
				var first_2=first_1.selectedIndex;
				var first=first_1.options[first_2].value;
				
				var second_1=document.getElementById("good1");
				var second_2=second_1.selectedIndex;
				var second=second_1.options[second_2].value;
				
				var third=$('#customer_addr_third').val();
				
				var bag=document.getElementById("bag_num");
				var num=bag.selectedIndex;
				
				bag_num=bag.options[num].value;
				var trash_type = $('input:radio[name="trash_type"]:checked').val();
				var imsi_num=0;
				if(trash_type==0)
					imsi_num=1000;
				else
					imsi_num=2000;
				var date="2019-09-09";
				/*var a=$('#dateRangePicker').datepicker({
					 format: "yyyy-mm-dd",
					 language: "kr"
					 });
				alert(a);
				var imsi=$('#dateRangePicker').datepicker( "getDate" );*/
			
				var url="<%=ctxPath%>/customer/customer_test.jsp?temp=temp&one_phone="+phone+"&first="+first+"&second="+second+
					"&third="+third+"&bag_num="+bag_num+"&trash_type="+trash_type+"&date="+date;
				ajaxGet(url,function(rt){
					var ob=window.eval("("+rt.trim()+")");
					
					if(ob.code=='OK'){
						
						document.getElementById("price_ap").innerHTML=bag_num*imsi_num+"원";
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
			$("#datetimepicker1").click(function() {
			    $('#datetimepicker1').datetimepicker({
				      language: 'pt-BR'
				    });
			});
		//var go_list=document.getElementById("go_list");
	});
		
	};
</script>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
				<li data-target="#myCarousel" data-slide-to="5"></li>
				<li data-target="#myCarousel" data-slide-to="6"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="/GarbageCollector/assets/img/monday.png" alt="monday" style="width: 40%;">
				</div>

				<div class="item">
					<img src="/GarbageCollector/assets/img/tuesday.png" alt="tuesday" style="width: 40%;">
				</div>

				<div class="item">
					<img src="/GarbageCollector/assets/img/wenseday.png" alt="wenseday" style="width: 40%;">
				</div>
				<div class="item">
					<img src="/GarbageCollector/assets/img/thursday.png" alt="thursday" style="width: 40%;">
				</div>
				<div class="item">
					<img src="/GarbageCollector/assets/img/friday.png" alt="friday" style="width: 40%;">
				</div>
				<div class="item">
					<img src="/GarbageCollector/assets/img/saturday.png" alt="saturday" style="width: 40%;">
				</div>
				<div class="item">
					<img src="/GarbageCollector/assets/img/sunday.png" alt="sunday" style="width: 40%;">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
<div class="py-3 text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h1>분리수거 대행 서비스 이용방법</h1>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-3 col-6 p-4">
					<img src="/GarbageCollector/assets/img/usage_dump.png" width="100"
						height="100" alt="My Image">
					<h4>
						<b>One</b>
					</h4>
					<p>집에 쌓인 쓰레기를 모아둔다.</p>
				</div>
				<div class="col-lg-3 col-6 p-4">
					<img src="/GarbageCollector/assets/img/usage_custom.png"
						width="100" height="100" alt="My Image">
					<h4>
						<b>Two</b>
					</h4>
					<p>개인정보와 주소를 입력하여 신청한다.</p>
				</div>
				<div class="col-lg-3 col-6 p-4">
					<img src="/GarbageCollector/assets/img/usage_helper.png"
						width="100" height="100" alt="My Image">
					<h4>
						<b>Three</b>
					</h4>
					<p>신청을 목록중 마음에 드는 대행을 선택한다.</p>
				</div>
				<div class="col-lg-3 col-6 p-4">
					<img src="/GarbageCollector/assets/img/usage_clean.png" width="100"
						height="100" alt="My Image">
					<h4>
						<b>Four</b>
					</h4>
					<p>대행이 정해진 시간에 쓰레기를 수거해 클린하우스 또는 재활용 도움센터에 가서 분리수거를 한다.</p>
				</div>
			</div>
		</div>
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