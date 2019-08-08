<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<iframe width=800 name="por" width="0" height="0" frameborder="0" scrolling="no"></iframe>
<!DOCTYPE html>
<%
	//String phone=(String)request.getAttribute("phone");
	//customer_apply_rsult->customer.do(lisT)request.setAttribute();
%>
<div class="container"> 
<form method="POST" action="<%=ctxPath%>/index.do">
  	<div class="modal fade" id="customer_apply_result" role="dialog">
      <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" id="go_list">&times;</button>
   
        </div>
        <div class="modal-body" style="padding:40px">
          <span class="pull-center" style="font-size:20pt;">신청이 완료되었습니다!</span><br/><br/>
          <span>신청번호 164번</span><br/>
         	
          
        </div>
     	<input type="submit" value="확인">
      </div>
    </div>
 </div>
 </form>
  </div>


