<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>농사의 고수</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<%
      //로그인 여부 확인해서 로그아웃 회원정보수정 탭 띄우기
      MemberDTO user_info = (MemberDTO)session.getAttribute("user_info");
      System.out.print(user_info);
%>
   <div class="header">
      <div class="logo">농사의 고수
      <img alt="로고이미지" src="img/logo.png" class="logo-image">
   </div>
   
   <div class="search-box">
         <input type="text" placeholder="어떤 서비스가 필요하세요?">
         <button id="search-btn">검색</button>
      </div>
   
   <nav id="auth">
      <% if(user_info != null){%>
               <!--개인정보수정 기능-->
               <a href="./UpdateMember.jsp">개인정보수정</a>
               <!-- 업데이트멤버.jsp으로 이동하고 정보수정버튼 누르면 db에있는 정보 가 수정됨 -->
               <!-- 로그아웃 기능  -->
               <a href="logoutCon.do">로그아웃</a>
      
      <%}else{ %>
         <a href="Real_Login.jsp">로그인</a> 
         <a href="Real_Join.jsp">회원가입</a>
      <%} %>
   </nav>
   </div>
   <div class="main">
      <div class="banner">
    <img src="img/메인배너.png" alt="농사의 고수 배너 이미지" class="banner-image">
	</div>
      <h1>어떤 어려움이 있으세요?</h1>
      <div class="services">
         <a href="BoardMain.jsp">
         	<div class="service">
         	<img src="img/새싹.jpg" alt="작물재배">
               <p>작물재배</p>
            </a></div>
         <div class="service">
         	<a href="BoardMain.jsp">
            <img src="img/사과2.png" alt="작물수확">
            <p>작물수확</p>
         </a></div>
         <div class="service">
         	<a href="BoardMain.jsp">
            <img src="img/벌레.png" alt="병충해">
            <p>병충해</p>
         </a></div>
         <div class="service">
         	<a href="BoardMain.jsp">
            <img src="img/머니.png" alt="판매전략">
            <p>유통/판매</p>
         </div></a>
         <div class="service">
         	<a href="BoardMain.jsp">
            <img src="img/농기계.png" alt="농기계">
            <p>농기계</p>
         </div></a>
         <div class="service">
            <a href="BoardMain.jsp">
            <img src="img/bb.png" alt="비닐하우스시공">
            <p>비닐하우스시공</p>
         </div></a>
      </div>

      <div class="popular-services">
         <h2>농고 인기 서비스</h2>
         <div class="service-list">
         <a href="Alarm.jsp">
            <div class="service-item">
               <img src="img/캘린더2.png" alt="농작물재배알림 캘린더">
               <p>농작물<br> 재배 캘린더</p>

            </div></a>
            <a href="ShowCrops.jsp">
            <div class="service-item">
               <img src="img/바구니.png" alt="전라남도 재배작물 정보">
               <p>전라남도<br> 재배작물 정보</p>

            </div></a>
            <a href="ShowOrgs.jsp">
            <div class="service-item">
               <img src="img/기관.png" alt="지원기관">
               <p>전라남도<br> 귀농지원기관</p>

            </div></a>

         </div>
      </div>
   </div>
    <jsp:include page="footer.jsp" />
</body>
</html>