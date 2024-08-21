<%@page import="com.smhrd.model.CropsDTO"%>
<%@page import="com.smhrd.model.CropsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>전라남도 작물재배정보</title>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/ShowCrops.css">
</head>
<body>
    <c:set var="cropsList" value="${CropsDAO.selectCrops()}"> </c:set>
    <div class="header">
        <div class="logo">
            농사의 고수
            <img alt="로고이미지" src="img/logo.png" class="logo-image">
        </div>
        <div class="top-right">
            <a href="Real_Main.jsp"><img src="img/home.png" alt="홈버튼이미지" class="home">메인</a>
        </div>
    </div>
    <h1>전라남도 작물재배 정보</h1>
    <div class="container">
        <div class="card">
            <img src="img/배추.jpg">
            <div class="info">
                <h2>배추</h2>
                <a href="CropsInfo1.jsp"><button>상세정보</button></a>
            </div>
        </div>
        <div class="card">
            <img src="img/고추.jpg">
            <div class="info">
                <h2>고추</h2>
                <a href="CropsInfo2.jsp"><button>상세정보</button></a>
            </div>
        </div>
        <div class="card">
            <img src="img/마늘.jpg">
            <div class="info">
                <h2>마늘</h2>               
                <button>상세정보</button>
            </div>
        </div>
        <div class="card">
            <img src="img/양파.jpg">
            <div class="info">
                <h2>양파</h2>              
                <button>상세정보</button>
            </div>
        </div>
        <div class="card">
            <img src="img/무우.jpg">
            <div class="info">
                <h2>무</h2>
                <button>상세정보</button>
            </div>
        </div>
        <div class="card">
            <img src="img/수박.jpg">
            <div class="info">
                <h2>수박</h2>
                <a href="CropsInfo3.jsp"><button>상세정보</button></a>
            </div>
        </div>
        <div class="card">
            <img src="img/딸기.jpg">
            <div class="info">
                <h2>딸기</h2>
               	<a href="CropsInfo4.jsp"><button>상세정보</button></a>
            </div>
        </div>
        <div class="card">
            <img src="img/파프리카.jpg">
            <div class="info">
                <h2>파프리카</h2>
                <button>상세정보</button>
            </div>
        </div>
        <div class="card">
            <img src="img/시금치.jpg">
            <div class="info">
                <h2>시금치</h2>
                <button>상세정보</button>
            </div>
        </div>
        <div class="card">
            <img src="img/토마토.jpg">
            <div class="info">
                <h2>토마토</h2>
                <button>상세정보</button>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
