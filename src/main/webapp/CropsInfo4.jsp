<%@page import="com.smhrd.model.CropsDTO"%>
<%@page import="com.smhrd.model.CropsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page isELIgnored="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/CropsInfo.css">
</head>
<body>
	<c:set var="cropsList" value="${CropsDAO.selectCrops()}"> </c:set>
    <div class="rounded-rectangle">
        <span class="text">과일 - 딸기</span>
    </div>
    <div class="horizontal-layout">
        <img src="img/딸기.jpg">
        <div class="info">
            <c:forEach items="${cropsList}" var="crops">
                <c:if test="${crops.crop_name == '딸기'}">
                    <div>
                        부류명 : ${crops.crop_classification} <br>
                        작목명 : ${crops.crop_name} <br>
                        총면적(헥타르) : ${crops.total_area} <br>
                        표본면적(헥타르) : ${crops.sample_area} <br>
                        단수(10아르당킬로그램) : ${crops.ars_kg} <br>
                        생산량(톤) : ${crops.ton} <br>
                        총면적증감율(퍼센트) : ${crops.area_inc_dec_rate} <br>
                        생산량증감율(퍼센트) : ${crops.production_inc_dec_rate} <br>
                        농가수 : ${crops.farmhouses} <br>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
    <img src="img/작업일정4.png" >
    <img src="img/딸기종류1.png" >
    <img src="img/딸기종류2.png" >
  	<a href="ShowCrops.jsp"><button>목록</button></a>
  	<jsp:include page="footer.jsp" />
</body>
</html>
