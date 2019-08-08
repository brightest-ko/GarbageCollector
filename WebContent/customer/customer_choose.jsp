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
			
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			
			<div class="modal-body" >
				<div class="row" >
					<div class="col-xs-2">&nbsp;</div>
					<div class="col-xs-2" style="margin-right:40px">
						<center>
							<button id="apply_do" class="btn btn-square s" ><i class="fa">신청하기</i></button>
						</center>
					</div>
					<div class="col-xs-2" style="margin-left:50px">
						<center>
							<button id="apply_result" class="btn btn-square s"><i class="fa fa-home">신청결과 조회</i></button>
						</center>
					</div>
					<div class="col-xs-2">&nbsp;</div>
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