<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style type="text/css">
	  
		.s {
			background-color:#ADCB00;
			border: none;
			color: white;
			padding:30px;
			font-size: 16px;
			cursor: pointer;
			margin:10px;
		}

	
/* Darker background on mouse-over */
		.s:hover {
		  background-color: RoyalGreen;
		}
 </style>
<!DOCTYPE html>

<div class="modal fade" id="customer_choose" role="dialog">
	<div class="modal-dialog" >

		<!-- Modal content-->
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body" >
				
				<div style="float:left;text-align:center">
					
					<button id="apply_do" class="btn btn-square s" ><i class="fa">신청하기</i></button>
					<button id="apply_result" class="btn btn-square s"><i class="fa fa-home">신청결과 조회</i></button>
					
				</div>


					<div class="modal-footer">
						
					<!-- <button type="button" class="btn btn-default with-text" id="customer_apply_Modal_btn"><i class="glyphicon glyphicon-search"></i></button>
    				 -->
					</div>
				</form>
			</div>
		</div>
	</div>
</div>