<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>

<%

	
%>
<!-- Modal -->
<div class="modal fade" id="customer_apply_one_modal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">서비스 신청</h4>
			</div>
			<div class="modal-body">
				<form method="POST" action="customer_apply_two.do">


					<div class="row">
						<div class="col-xs-4 gul">전화번호</div>
						<div class="col-xs-8 ">
							<input type="text" class="form-control" name="two_phone" id="customer_phone"
								value="01043394609">
						</div>
					</div>

					<div class="row">
						<div class="col-xs-4 gul">주소</div>
						<div class="col-xs-8 row">
							<div class="col-xs-4">
								<input type="text" class="form-control"
									name="customer_addr_front" value="제주도"
									style="color: #445A3E; text-align: center">
							</div>
							<div class="col-xs-4">
								<input type="text" class="form-control"
									name="customer_addr_detail" value="이도2동"
									style="color: #445A3E; text-align: center">
							</div>
							<div class="col-xs-4">
								<input type="text" class="form-control"
									name="customer_addr_detail" value="165"
									style="color: #445A3E; text-align: center">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-4 gul">봉투 갯수</div>
						<div class="col-xs-4">
							<div class="form-group">
								<select class="form-control" id="sel1">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
								</select>
							</div>
						</div>
						<div class="col-xs-4">
							<a role="button"><img class="btn-img"
								src="<%=ctxPath%>/assets/img/baseline-help-24px.svg"></a>
						</div>
					</div>


					<div class="row">
						<div class="col-xs-4 gul">분리수거</div>
						<div class="col-xs-4">
							<label class="form-check-label" for="radio1"> <input
								type="radio" class="form-check-input" id="radio1"
								name="trash_type" value="1" checked>당일수거물품
							</label>
						</div>

						<div class="col-xs-4">
							<label class="form-check-label" for="radio2"> <input
								type="radio" class="form-check-input" id="radio2"
								name="trash_type" value="2">혼합
							</label>
						</div>
					</div>


					<div class="row">


					<div class="col-xs-4 gul">수거시간</div>
					<div class="col-xs-8">
					<input size="16" type="text" value="2012-06-15 14:45" readonly class="form_datetime">
					</div>
					</div>



					<div class="modal-footer">
						<a role="submit" class="btn btn-lg" id="one_finish" 
							style="background-color: #ADCB00; color: black;">다음</a>
						<!-- <button type="button" class="btn btn-default with-text" id="customer_apply_Modal_btn"><i class="glyphicon glyphicon-search"></i></button>
    				 -->
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<style type="text/css">
.modal-header {
	background-color: #ADCB00;
	color: #1C4220;
}

.col-md-4 {
	text-align: center;
}

.gul {
	padding: 8px;
}

.row {
	padding: 10px
}

input.img-button {
	background: url("C:/Users/jsb56/Downloads/baseline-help-24px.svg" )
		no-repeat;
	width: 30px;
}
</style>

<!-- DatePicker관련 js, css 다시 추가해야할 듯 잘 안됨 -->
