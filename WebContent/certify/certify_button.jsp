<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	String ctxPath =request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

</head>
<body>
<div class="container ">

<form method="POST" action="certify_submit.jsp">
	<button type="submit" class="btn btn-success" >인증하기</button>
</form>
<form method="POST" action="<%=ctxPath %>/certify_find2.do">
				<div class="input-group">
					<span class="input-group-addon">고객신청번호</span> <input
						id="certify_serialNo" type="text" class="form-control"
						name="certify_serialNo"  value="99" placeholder="99" readonly>
				</div>	
	<button type="submit" class="btn btn-success" >수정하기</button>
</form>
<form method="POST" action="/certify_info2.do">
	<button type="submit" class="btn btn-success" >인증정보</button>
</form>
</div>
</body>
</html>