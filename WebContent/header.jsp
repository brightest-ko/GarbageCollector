<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<header>
<!-- Navbar -->
<nav class="navbar navbar-default bg-white">
  <div class="container width-100">
  
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"><img src="<%=ctxPath %>/assets/img/logo.png" style="width: 180px; margin: -20px -15px;"></a>
    </div>

    <div class="collapse navbar-collapse dropdown"" id="myNavbar">
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">서비스소개</a>
              <ul class="dropdown-menu">
                <li><a href="#">이용방법</a></li>
                <li><a href="#">클린하우스란?</a></li>
                <li><a href="#">클린하우스 위치</a></li>
                <!-- <li class="divider"></li> -->
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">나영(신청자)</a>
              <ul class="dropdown-menu">
                <li><a href="#">대행 서비스 신청</a></li>
                <li><a href="#">신청 결과 조회</a></li>
                <li><a href="#">과거 매칭 기록</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">느영(대행자)</a>
              <ul class="dropdown-menu">
                <li><a href="#">서비스 요청 리스트</a></li>
                <li><a href="#">대행자 제안 리스트</a></li>
              </ul>
            </li>
	        <li><a href="#">후기</a></li>
            <li><a href="#">로그인</a></li>
          </ul>
    </div>
  </div>
</nav>
</header>