<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!DOCTYPE html>
    <div class="modal fade" id="#review_Modal_modify${vo.serialNo}" role="dialog">
			<div class="modal-dialog">
		    
		      <!-- Modal content-->
		    	<div class="modal-content">
		        	<div class="modal-header">
		          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<h4 class="modal-title" align="center" style="font-weight: bold">수정하기</h4>
		        	</div>
		        	<form method="POST" action="/review_modify.do">
		        	<div class="modal-body">
		        		 <div class="row">
					     	<div class="col-md-4" style="text-align:center;">
					     		<label for="md_serialNo" style="padding-top:8px">신청번호</label>
					     	</div>
					      	<div class="col-md-8">
					      		<input class="form-control" id="md_serialNo" type="text" name="md_serialNo" value="${vo.serialNo}" readonly style="margin-left:0px;"/>
					      	</div>
					   	 </div>

		        		<div class="row">
		        			<div class="col-md-4" style="text-align:center;">
								<label for="md_review_title" style="padding-top:8px">제목</label>
							</div>
							<div class="col-md-8">
							    <input class="form-control" id="md_review_title" type="text" name="md_review_title" value="${vo.reviewTitle}" style="margin-left:0px;"/>
							</div>
		        		</div>
		        		<div class="row">
		        			<div class="col-md-4" style="text-align:center;">
								<label for="md_helperID" style="padding-top:8px">대행자</label>
							</div>
							<div class="col-md-8">
								<input class="form-control" id="md_helperID" type="text" name="md_helperID" value="${vo.helperID}" readonly style="margin-left:0px;"/>
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
									<input type="radio" id="star1" name="rating" value="1" onClick="javascript:ChkRating('1')"/>
								   	<label for="star1" title="text" style="margin-bottom: 0px;">1 star</label>
								   	<input type="radio" id="star2" name="rating" value="2" onClick="javascript:ChkRating('2')"/>
								   	<label for="star2" title="text" style="margin-bottom: 0px;">2 stars</label>
								   	<input type="radio" id="star3" name="rating" value="3" onClick="javascript:ChkRating('3')"/>
								    <label for="star3" title="text" style="margin-bottom: 0px;">3 stars</label>
								   	<input type="radio" id="star4" name="rating" value="4" onClick="javascript:ChkRating('4')"/>
								    <label for="star4" title="text" style="margin-bottom: 0px;">4 stars</label>   	
								    <input type="radio" id="star5" name="rating" value="5" onClick="javascript:ChkRating('5')" />
								    <label for="star5" title="text" style="margin-bottom: 0px;">5 stars</label>
								</div>
							</div>
						</div>
		       			<div class="row">
		        			<div class="col-md-4" style="text-align:center;">
								<label for="md_review_cleanhouse" style="padding-top:8px">클린하우스 위치</label>
							</div>
							<div class="col-md-8">
							    <input class="form-control" id="md_review_cleanhouse" type="text" name="md_review_cleanhouse" placeholder="주소 찾기" style="margin-left:0px;"/>
							</div>
		        		</div>
		        		<div class="row">
		        			<div class="col-md-12" style="text-align:center;">
		        				<textarea class="form-control ta" id="md_review_content" name="md_review_content" scrolling="no" onKeyUp="javascript:fnChkByte(this,'80')" style="margin-left: 0px;">"${vo.reviewContent}"</textarea>
								<span style="float:right">/ 80bytes</span><span id="byteInfo" style="float:right">0</span>
							</div>
		        		</div>
		        	</div>
		        	<div class="modal-footer">
		        		<input type="submit" class="btn btn-md" style="background-color:#ADCB00;color:black;" value="등록" onClick="javascript:alert('등록하기')"/>
		        	</div>
		        	</form>		
		      	</div>
		  	</div>
		</div>