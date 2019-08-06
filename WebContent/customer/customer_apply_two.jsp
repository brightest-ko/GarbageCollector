<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="customer.customer_applyVO"
    %>
<!DOCTYPE html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style type="text/css" >
		.modal-header{
        	background-color:#ADCB00;
            color:#1C4220;
        }      
		.form-control{
        	padding:10px;
            margin:10px
        
        }
      
 </style>
</head>
<body><%
	String phone=(String)request.getAttribute("phone");
	
%>

<div class="container">
  
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">결제</h4>
        </div>
        <div class="modal-body" style="padding:60px">
          <p class="text-center"><%=phone%> 고객님!</p>
          <label for="total_money">총 이용금액</label>
         <form method="POST"  action="customer_update.me">
         	
     	  <input type="text" class="form-control" id="total_money" name="total_money">
			
          <label for="card_num" >카드번호</label>
     	  <input type="text" class="form-control" id="card_num" name="card_num">
			<a role="submit" class="btn pull-left" style="background-color:#ADCB00" >이전</a>
         	<a role="submit" class="btn pull-right" style="background-color:#ADCB00" >신청</a>
           </form>
        </div>
      
      </div>
      
    </div>
  </div>


</body>
</html>
