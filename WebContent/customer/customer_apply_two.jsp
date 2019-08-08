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
          	<div id="price_ap">d</div>		
          <label for="card_num" >카드번호</label>
     	  <input type="text" class="form-control" id="card_num" name="card_num">
     	  
        </div>
					<div class="modal-footer">
						<a role="button" data-dismiss="modal" href="#customer_apply_two" class="btn btn-default pull-left" >이전</a>
						<a role="button" data-dismiss="modal" id="two_finish" href="#customer_apply_result" class="btn btn-success">신청</a>
					</div>
      </div>
      
    
  </div>
</div>
