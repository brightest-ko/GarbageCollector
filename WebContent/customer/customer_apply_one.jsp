<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<!DOCTYPE html>
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


					<div class="row">
						<div class="col-xs-4 gul">전화번호</div>
						<div class="col-xs-8 ">
							<input type="text" autocomplete="off" id="one_phone" class="form-control with-button" 
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >
						</div>
					</div>

					<div class="row">
						<div class="col-xs-4 gul">주소</div>
						<div class="col-xs-8 row">
							<div class="col-xs-4">
								<select class="form-control"  onchange="categoryChange1(this)"
									name="city1" id="city1" value="" required>
									<option>시</option>
									<option value="제주시">제주시</option>
									<option value="서귀포시">서귀포시</option>
								</select> 
							</div>
							<div class="col-xs-4">
								<select class="form-control"  id="good1" name="dong1" required>
									<option>읍, 면, 동</option>
								</select>
							</div>
							<div class="col-xs-4">
								<input type="text" class="form-control" id="customer_addr_third"
									name="customer_addr_third" value="165"
									style="color: #445A3E; text-align: center">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-4 gul">봉투 갯수</div>
						<div class="col-xs-4">
							<div class="form-group">
								<select class="form-control" id="bag_num" name="bag_num">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</div>
						</div>
						<div class="col-xs-4">
							<a role="button" id="help_icon">
								<img src="<%=ctxPath%>/assets/img/baseline-help-24px.svg" onmouseover="this.src='<%=ctxPath%>/assets/img/trash_size.png'" 
								onmouseout="this.src='<%=ctxPath%>/assets/img/baseline-help-24px.svg'">
						</div>
					</div>


					<div class="row">
						<div class="col-xs-4 gul">분리수거</div>
						<div class="col-xs-4">
							<label class="form-check-label" for="radio1"> <input
								type="radio" class="form-check-input" id="radio1"
								name="trash_type" value="0" checked>당일수거물품(1000원)
							</label>
						</div>

						<div class="col-xs-4">
							<label cl ass="form-check-label" for="radio2"> <input
								type="radio" class="form-check-input" id="radio2"
								name="trash_type" value="1">혼합(2000원)
							</label>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4 gul">수거시간</div>
						<div class="col-xs-4 gul">
							<div class="form-control-wrapper">
								<input type="text" id="date-fr" class="form-control floating-label" value="18/03/2015 08:00" placeholder="Date de début">
							</div>
					</div>

					</div>

					
				


					<div class="modal-footer">
					
						<a class="btn btn-success" role="button" data-dismiss="modal" id="one_finish" href="#customer_apply_two_modal">다음</a>
					</div>
			</div>
		</div>
	</div>
</div>

<style type="text/css">
.modal-header {
	border-radius: 6px 6px 0 0;
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
	background: url("<%=ctxPath%>/assets/img/baseline-help-24px.svg")
		no-repeat;
	width: 70px;
}
</style>
<script>
(function(i, s, o, g, r, a, m) {
	i['GoogleAnalyticsObject'] = r;
	i[r] = i[r] || function() {
		(i[r].q = i[r].q || []).push(arguments)
	}, i[r].l = 1 * new Date();
	a = s.createElement(o),
		m = s.getElementsByTagName(o)[0];
	a.async = 1;
	a.src = g;
	m.parentNode.insertBefore(a, m)
})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

ga('create', 'UA-60343429-1', 'auto');
ga('send', 'pageview');

</script>
<link rel="stylesheet" href="<%=ctxPath%>/assets/css/bootstrap-material-datetimepicker.css" />
<script type="text/javascript" src="<%=ctxPath%>/assets/js/bootstrap-material-datetimepicker.js">
</script>
<!-- DatePicker관련 js, css 다시 추가해야할 듯 잘 안됨 -->
