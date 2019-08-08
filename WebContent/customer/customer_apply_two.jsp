<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>

 <div class="modal fade" id="customer_apply_two_modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">결제</h4>
        </div>
        <div class="modal-body" style="padding:60px">
          <p class="text-center"> 고객님!</p>
          <label for="total_money"> 총 이용금액 : </label>
          	<span id="price"></span>
          
         <form method="POST"  action="customer_update.do">
         	
     	  <input type="text" class="form-control" id="total_money" name="total_money"
     	  value="123">
			
          <label for="card_num" >카드번호</label>
     	  <input type="text" class="form-control" id="card_num" name="card_num">
     	  <a data-dismiss="modal" id="one_finish" href="#customer_apply_result" style="background-color:#ADCB00">신청</a>
			<a role="submit" class="btn pull-left" style="background-color:#ADCB00" >이전</a>

           </form>
        </div>
      
      </div>
      
    
  </div>
</div>
