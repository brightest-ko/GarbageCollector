<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%  
%>
<!-- ############# Note ################### 
	This is imported by review_list Page.
 -->
    <!DOCTYPE html>
    <div class="modal fade" id="chkpwd_Modal" role="dialog">
			<div class="modal-dialog">
		    
		      <!-- Modal content-->
		    	<div class="modal-content">
		        	<div class="modal-header">
		          		<button type="button" class="close" data-dismiss="modal">&times;</button>
		          		<h4 class="modal-title" align="center" style="font-weight: bold">글 비밀번호를 입력하세요</h4>
		        	</div>
		        	<!--<form method="POST" action="<%=ctxPath%>/review_list"> -->
			        	<div class="modal-body">
			        		 <div class="row">
						     	<div class="col-md-4" style="text-align:center;">
						     		<label for="pwd" style="padding-top:8px">글 비밀번호</label>
						     	</div>
						      	<div class="col-md-8">
						      		<input class="form-control" id="pwd" type="password" name="pwd" value="1234" style="margin-left:0px;"/>
						      	</div>
						   	 </div> 		
			        	</div>
			        	<div class="modal-footer">
			        		<button id="chkpwd" class="btn btn-md" name="chkpwd" style="background-color:#ADCB00;color:black;" value="확인" onClick="javascript:Chk_Auth()" >확인</button>
			        	</div>
		        	<!-- </form> -->
		      	</div>
		  	</div>
		</div>