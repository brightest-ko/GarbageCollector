<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%  // Sample Example . ctxPath는 import되서 지정될거임
	Integer serialNo = 123456;
	String helperID = "jsb@naver.com";
%>
<!-- ############# Note ################### 
	This is imported by maching Page. ( <%--@include file="/review/review_modal_view.jsp"--%> )
	<button class="btn btn-info btn-lg" data-toggle="modal" data-target="#review_Modal_upload">리뷰 작성하기</button> 
	matching Page에서 리뷰작성버튼 modal 
	변수명은 serialNo, helperID로 통일한다.	
 -->
    <div class="modal fade" id="review_Modal_upload${vo2.serialNo }" role="dialog">
			<div class="modal-dialog">
		    
		      <!-- Modal content-->
		    	<div class="modal-content">
		        	<div class="modal-header">
		          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<h4 class="modal-title" align="center" style="font-weight: bold">고객 리뷰글</h4>
		        	</div>
		        	<form method="POST" action="<%=ctxPath%>/review_insert.do">
			        	<div class="modal-body">
			        		 <div class="row">
						     	<div class="col-md-4" style="text-align:center;">
						     		<label for="serialNo" style="padding-top:8px">신청번호</label>
						     	</div>
						      	<div class="col-md-8">
						      		<input class="form-control" id="serialNo" type="text" name="serialNo" value="<%=serialNo%>" readonly style="margin-left:0px;"/>
						      	</div>
						   	 </div>
	
			        		<div class="row">
			        			<div class="col-md-4" style="text-align:center;">
									<label for="review_title" style="padding-top:8px">제목</label>
								</div>
								<div class="col-md-8">
								    <input class="form-control" id="review_title" type="text" name="review_title" placeholder="myTitle" style="margin-left:0px;"/>
								</div>
			        		</div>
			        		<div class="row">
			        			<div class="col-md-4" style="text-align:center;">
									<label for="helperID" style="padding-top:8px">대행자</label>
								</div>
								<div class="col-md-8">
									<input class="form-control" id="helperID" type="text" name="helperID" value="<%=helperID%>" readonly style="margin-left:0px;"/>
								</div>
			        		</div>
							<div class="row">
								<div class="col-md-4" style="text-align:center;">
									<label for="rating" style="padding-top:8px">평점</label>
								</div>
								<div class="col-md-8" style="height:34px;">
									<!-- Rating Stars Box -->
									<div class="rate" style="
	    width: 100%;
	    float: left;
	    height: 46px;
	    padding: 0 calc( 50% - 75px );">
										<input type="radio" id="star1" name="rating" value="5" onClick="javascript:ChkRating('1')"/>
									   	<label for="star1" title="text" style="margin-bottom: 0px;">1 star</label>
									   	<input type="radio" id="star2" name="rating" value="4" onClick="javascript:ChkRating('2')"/>
									   	<label for="star2" title="text" style="margin-bottom: 0px;">2 stars</label>
									   	<input type="radio" id="star3" name="rating" value="3" onClick="javascript:ChkRating('3')"/>
									    <label for="star3" title="text" style="margin-bottom: 0px;">3 stars</label>
									   	<input type="radio" id="star4" name="rating" value="2" onClick="javascript:ChkRating('4')"/>
									    <label for="star4" title="text" style="margin-bottom: 0px;">4 stars</label>   	
									    <input type="radio" id="star5" name="rating" value="1" onClick="javascript:ChkRating('5')" />
									    <label for="star5" title="text" style="margin-bottom: 0px;">5 stars</label>
									</div>
								</div>
							</div>
			       			<div class="row">
			        			<div class="col-md-4" style="text-align:center;">
									<label for="review_cleanhouse" style="padding-top:8px">클린하우스 위치</label>
								</div>
								<div class="col-md-8">
								    <input class="form-control" id="review_cleanhouse" type="text" name="review_cleanhouse" placeholder="주소검색" style="margin-left:0px;"/>
								</div>
			        		</div>
			        		<div class="row">
			        			<div class="col-md-12" style="text-align:center;">
			        				<textarea class="form-control ta" id="review_content" name="review_content" scrolling="no" onKeyUp="javascript:fnChkByte(this,'80')" style="margin-left: 0px;"></textarea>
									<span style="float:right">/ 80bytes</span><span id="byteInfo" style="float:right">0</span>
								</div>
			        		</div>
			        	</div>
			        	<div class="modal-footer">
			        		<input type="submit" class="btn btn-md" style="background-color:#ADCB00;color:black;" value="등록" onClick="javascript:form_submit()"/>
			        	</div>
		        	</form>		
		      	</div>
		  	</div>
		</div>