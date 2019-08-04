<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE >
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">인증하기</button>

  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h2 class="modal-title">분리수거 완료했어요!</h2>
        </div>
        <div class="modal-body">
          <div class="container">
</div>
<p><form method="POST" action="certify_add2.do" enctype="multipart/form-data">
<div class="container">
<div class="row">
  <div class="col-sm-4">
  	<div class="form-group has-success has-feedback">
    <div class="input-group">
      <span class="input-group-addon">고객 신청번호</span>
      <input id="certify_serialNo" type="text" class="form-control" name="certify_serialNo" placeholder="신청번호를 입력하세요">
    </div>
    </div>
  	</div>
  	<div class="col-sm-4">
  	</div>
  	<div class="col-sm-4">
  	</div>
 </div>
  <div class="row">
  		<div class="col-sm-4">
  			<div class="form-group has-success has-feedback">
    		<div class="input-group">
      		<span class="input-group-addon">위치</span>
      		<input id="housePlace" type="text" class="form-control" name="housePlace" placeholder="위치를 찍어주세요">
    		</div>
    		</div>
  		</div>
  		<div class="col-sm-4">

  		</div>
  		<div class="col-sm-4">
  
  		</div>
	</div>
</p>
		<input type="text" name="title" size="10"/>
		<input type="file" name="photo" camera="camera"/>

  <div class="row">
  <div class="col-sm-0"></div>
  <div class="col-sm-4">
  	<h3>특이사항</h3>    
    <div class="form-group">
      <label for="comment"></label>
      <textarea class="form-control" rows="5" id="details" name="details" ></textarea>
    </div>
  	</div>
  <div class="col-sm-7"></div>
</div>
  <h2></h2>
  <!-- Trigger the modal with a button -->
  <button type="submit" class="btn btn-success" data-toggle="modal" data-target="#myModal">인증하기</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body">
          <p>인증하시겠습니까?.</p>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">확인</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
</form>
</body>
</html>