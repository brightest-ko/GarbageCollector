<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"

%>
<%
    String ctxPath = request.getContextPath();
%>
<%--jstl 을 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--${fn:length(rl)} 를 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link rel="stylesheet" href="<%=ctxPath %>/assets/css/index.css">

    <title>당신의 쓰레기는 안녕하수깡?</title>
    <link rel="struct icon" href="<%=ctxPath %>/assets/img/brsg.ico">
    <style>
        .box_login {
            height: 300px;
            padding: 80px 80px 80px 80px;
            border: 2px solid green;
        }

        space {
            padding: 50px;
            margin: 20px;
        }

        center_c {
            float: none;
            margin: 0 auto;
            display: flex;
            align-items: center;
        }
        button{
            margin: 10px 0px 0px 350px;
            padding: 5px 15px 5px 15px;
        }

    </style>
</head>
<body>
<%@include file="/header.jsp" %>
<main>

    <div class="container-fluid space" style = "padding: 100px 100px 50px 100px">
        <div class="row container center_c space">
            <!-- 고객 로그인 창 -->
            <div class="col-lg-6 box_login">
                <form method="post" action="customer_login">
                    <div class="form-group">
                        <label for="customerPN"> Customer Phone </label>
                        <input type="text" class="form-control" placeholder="휴대폰 번호를 입력하세요." id="customerPN" >
                        <button type="submit" class="btn btn-success" >로그인</button>
                    </div>

                </form>
            </div>

            <!-- 대행 로그인 창-->
            <div class="col-lg-6 box_login">
                <form method="post" action="helper_login" style="padding=100px">
                    <div class="form-group">
                        <label for="helperId"> 아이디 </label>
                        <input type="text" class="form-control" placeholder="Email(ID)을 입력하세요."  id="helperId" >
                    </div>
                    <div class="form-group">
                        <label for="pw">비밀번호</label>
                        <input type="password" class="form-control" placeholder="비밀번호를 입력하세요." id="pw">
                        <button type="submit" class="btn btn-success">로그인</button>
                        <br/> 아이디가 없으신가요? <a href="<%=ctxPath%>/helper/signUp.jsp" style="color:green" class="btn">회원가입 하기</a>
                    </div>

                </form>
            </div>
        </div>
    </div>

</main>
<%@include file="/footer.jsp" %>
<%@include file="/script.jsp" %>

</body>
</html>