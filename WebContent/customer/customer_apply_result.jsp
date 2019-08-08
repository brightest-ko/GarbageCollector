<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<iframe width=800 name="por" width="0" height="0" frameborder="0" scrolling="no"></iframe>
<!DOCTYPE html>
<%
	//String phone=(String)request.getAttribute("phone");
	//customer_apply_rsult->customer.do(lisT)request.setAttribute();
%>
<div class="container"> 
<form method="POST" action="customer_apply_list.do">
  	<div class="modal fade" id="customer_apply_result" role="dialog">
      <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" id="go_list">&times;</button>
   
        </div>
        <div class="modal-body" style="padding:40px">
          <span class="pull-center" style="font-size:20pt;">신청이 완료되었습니다!</span><br/><br/>
          
         	
          
        </div>
        <!-- <a role="submit" class="btn btn-success pull-right" >확인</a>-->
        <div class="modal-footer">
     	<a role="button" id="apply_result1" href="<%=ctxPath %>/customer_apply_list.do" class="btn btn-success pull-right"><i class="fa fa-home">확인</i></a>
     	</div>
      </div>
    </div>
 </div>
 </form>
  </div>


