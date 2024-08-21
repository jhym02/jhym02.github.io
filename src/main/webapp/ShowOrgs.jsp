<%@page import="com.smhrd.model.OrgsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.OrgsDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>전라남도 귀농지원기관</title>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/ShowOrgs.css">

<script type="text/javascript">
   function showInfo(location, event) {
      var info = {
         '고흥' : {
            title : '고흥군농업기술센터',
            address : '고흥군 풍양면 풍남로143',
            phone : '061-830-6821'
         },
         '영광' : {
            title : '영광군농업기술센터',
            address : '영광군 군서면 백수로1481 2층',
            phone : '061-350-5574'
         },
         '영암' : {
            title : '농업기술센터',
            address : '영암군 덕진면 금호길 11',
            phone : '061-470-6609, 6610~2'
         },
         '화순' : {
            title : '농업기술센터',
            address : '화순군 능주면 학포로 2275',
            phone : '061-379-5441~2'
         },
         '해남' : {
            title : '농업기술센터',
            address : '해남군 해남읍 땅끝대로 77-22',
            phone : '061-531-3828'
         },
         '함평' : {
            title : '농업기술센터',
            address : '함평군 학교면 학교화산길 90',
            phone : '061-320-2499'
         },
         '진도' : {
            title : '농업기술센터',
            address : '진도군 군내면 가흥로 697',
            phone : '061-540-6131'
         },
         '장흥' : {
            title : '농산과',
            address : '장흥군 장흥읍 장흥로 21',
            phone : '061-860-5950~1'
         },
         '장성' : {
            title : '농업기술센터',
            address : '장성군 장성읍 단풍로 220',
            phone : '061-390-8467~9'
         },
         '완도' : {
            title : '농업기술센터',
            address : '완도군 완도읍 노두목길 64',
            phone : '061-550-5971'
         },
         '여수' : {
            title : '농업기술센터',
            address : '여수시 주동 1길 32',
            phone : '061-659-4452~4'
         },
         '신안' : {
            title : '농업기술센터',
            address : '신안군 압해읍 1042',
            phone : '061-240-4113'
         },
         '순천' : {
            title : '농업기술센터',
            address : '순천시 승주읍 승주로 628',
            phone : '061-749-8693'
         },
         '보성' : {
            title : '귀농귀촌지원센터',
            address : '보성군 보성읍 새싹길 23',
            phone : '061-852-2282'
         },
         '무안' : {
            title : '농업기술센터',
            address : '무안군 무안읍 무안로 339',
            phone : '061-450-4054~5'
         },
         '담양' : {
            title : '농업기술센터',
            address : '담양군 담양읍 면앙정로 730',
            phone : '061-380-3441~2'
         },
         '나주' : {
            title : '귀농귀촌지원센터',
            address : '나주시 왕곡면 덕산길 17 농업기술센터 2층',
            phone : '061-339-7814'
         },
         '구례' : {
            title : '농업기술센터',
            address : '구례군 구례읍 동산1길 32',
            phone : '061-780-2084~6'
         },
         '광양' : {
            title : '농업기술센터',
            address : '광양시 광양읍 인덕로 1100',
            phone : '061-797-3323'
         },
         '곡성' : {
            title : '농업기술센터',
            address : '곡성군 곡성읍 학정3길 9',
            phone : '061-360-7253'
         },
         '강진' : {
            title : '농업기술센터',
            address : '강진군 군동면 진흥로 85',
            phone : '061-430-3645~7'
         }

      };

      var additionalInfo = {
         '고흥' : {
            titles : [ '행복학교', '귀농어 귀촌지원센터' ],
            addresses : [ '고흥군 남양면 와야길 17', '고흥군 고흥읍 고흥군청로 1' ],
            phones : [ '061-830-5091~3', '061-830-5428' ]
         },
         '영광' : {
            titles : [ '이모빌리티산업과' ],
            addresses : [ '영광군 영광읍 중앙로 203' ],
            phones : [ '061-350-5819' ]
         },
         '해남' : {
            titles : [ '귀농귀촌희망센터' ],
            addresses : [ '해남군 계곡면 둔주포 안길 18' ],
            phones : [ '061-535-8968' ]
         },
         '함평' : {
            titles : [ '일자리경제과' ],
            addresses : [ '함평군 함평읍 중앙길 200' ],
            phones : [ '061-320-1741~3' ]
         },
         '장흥' : {
            titles : [ '농업기술센터' ],
            addresses : [ '장흥군 장흥읍 원도1길 11' ],
            phones : [ '061-860-6523' ]
         },
         '장성' : {
            titles : [ '귀농귀촌지원센터' ],
            addresses : [ '장성군 장성읍 단풍로 220' ],
            phones : [ '061-390-8469' ]
         },
         '완도' : {
            titles : [ '농업축산과' ],
            addresses : [ '완도군 완도읍 청해진남로 51' ],
            phones : [ '061-550-5711,061-550-5714' ]
         },
         '보성' : {
            titles : [ '농축산과', '농업기술센터' ],
            addresses : [ '보성군 보성읍 송재로 165', '보성군 보성읍 녹차로 1357' ],
            phones : [ '061-850-5383', '061-850-5718' ]
         },
         '무안' : {
            titles : [ '전라남도 인구청년정책관실' ],
            addresses : [ '무안군 삼향읍 오룡길 1' ],
            phones : [ '061-286-2840~4' ]
         },
         '담양' : {
            titles : [ '귀농귀촌지원센터' ],
            addresses : [ '담양군 담양읍 면앙정로 730' ],
            phones : [ '061-380-3437' ]
         },
         '나주' : {
            titles : [ '농업기술센터' ],
            addresses : [ '나주시 왕곡면 덕산길 17' ],
            phones : [ '061-339-7812' ]
         },
         '구례' : {
            titles : [ '체류형농업창업지원센터' ],
            addresses : [ '구례군 용방면 용방로 320' ],
            phones : [ '061-780-2084~5' ]
         },
         '곡성' : {
            titles : [ '농정과', '귀농귀촌지원센터' ],
            addresses : [ '곡성군 곡성읍 군청로 50', '곡성군 곡성읍 군청로 28' ],
            phones : [ '061-360-7177', '061-362-2371' ]
         },
         '강진' : {
            titles : [ '귀농사관학교' ],
            addresses : [ '강진군 칠량면 구로길 36' ],
            phones : [ '061-434-2431' ]
         },

      };

      var popup = document.getElementById('popup');

      // 팝업 내용
      var tableHTML = '<table>';
      tableHTML += '<tr><th>기관명</th><th>주소</th><th>연락처</th></tr>';
      tableHTML += '<tr>';
      tableHTML += '<td>' + info[location].title + '</td>';
      tableHTML += '<td>' + info[location].address + '</td>';
      tableHTML += '<td>' + info[location].phone + '</td>';
      tableHTML += '</tr>';

      // 추가 정보가 있는 경우 추가
      if (additionalInfo[location]) {
         additionalInfo[location].titles.forEach(function(title, index) {
            tableHTML += '<tr>';
            tableHTML += '<td>' + title + '</td>';
            tableHTML += '<td>' + additionalInfo[location].addresses[index]
                  + '</td>';
            tableHTML += '<td>' + additionalInfo[location].phones[index]
                  + '</td>';
            tableHTML += '</tr>';
         });
      }
      tableHTML += '</table>';

      popup.innerHTML = tableHTML;
      popup.style.left = event.pageX + 'px';
      popup.style.top = event.pageY + 'px';
      popup.style.display = 'block';
      event.stopPropagation();
   }

   // 클릭 외부 시 팝업 숨기기
   document.addEventListener('click', function(event) {
      var popup = document.getElementById('popup');
      if (!popup.contains(event.target)) {
         popup.style.display = 'none';
      }
   });
</script> 
</head>
<body>
	<div class="header">
        <div class="logo">
            농사의 고수
            <img alt="로고이미지" src="img/logo.png" class="logo-image">
        </div>
        <div class="top-right">
            <a href="Real_Main.jsp"><img src="img/home.png" alt="홈버튼이미지" class="home">메인</a>
        </div>
    </div>   
	<h1>전라남도 귀농지원기관</h1>
    <!-- 지도 팝업 -->
    <div>
        <img src="img/clickmap.png" usemap="#image-map" class="map">
        <map name="image-map">
            <area alt="고흥" title="고흥" href="javascript:void(0);" onclick="showInfo('고흥', event)" coords="716,556,46" shape="circle">
            <area alt="영광" title="영광" href="javascript:void(0);" onclick="showInfo('영광', event)" coords="308,143,38" shape="circle">
            <area alt="영암" title="영암" href="javascript:void(0);" onclick="showInfo('영암', event)" coords="380,420,37" shape="circle">
            <area alt="화순" title="화순" href="javascript:void(0);" onclick="showInfo('화순', event)" coords="571,313,48" shape="circle">
            <area alt="해남" title="해남" href="javascript:void(0);" onclick="showInfo('해남', event)" coords="350,576,47" shape="circle">
            <area alt="함평" title="함평" href="javascript:void(0);" onclick="showInfo('함평', event)" coords="343,238,34" shape="circle">
            <area alt="진도" title="진도" href="javascript:void(0);" onclick="showInfo('진도', event)" coords="195,628,31" shape="circle">
            <area alt="장흥" title="장흥" href="javascript:void(0);" onclick="showInfo('장흥', event)" coords="530,459,32" shape="circle">
            <area alt="장성" title="장성" href="javascript:void(0);" onclick="showInfo('장성', event)" coords="453,118,36" shape="circle">
            <area alt="완도" title="완도" href="javascript:void(0);" onclick="showInfo('완도', event)" coords="463,705,63" shape="circle">
            <area alt="여수" title="여수" href="javascript:void(0);" onclick="showInfo('여수', event)" coords="889,437,38" shape="circle">
            <area alt="신안" title="신안" href="javascript:void(0);" onclick="showInfo('신안', event)" coords="106,271,45" shape="circle">
            <area alt="순천" title="순천" href="javascript:void(0);" onclick="showInfo('순천', event)" coords="763,314,55" shape="circle">
            <area alt="보성" title="보성" href="javascript:void(0);" onclick="showInfo('보성', event)" coords="643,419,45" shape="circle">
            <area alt="무안" title="무안" href="javascript:void(0);" onclick="showInfo('무안', event)" coords="300,344,33" shape="circle">
            <area alt="담양" title="담양" href="javascript:void(0);" onclick="showInfo('담양', event)" coords="559,134,45" shape="circle">
            <area alt="나주" title="나주" href="javascript:void(0);" onclick="showInfo('나주', event)" coords="448,314,44" shape="circle">
            <area alt="구례" title="구례" href="javascript:void(0);" onclick="showInfo('구례', event)" coords="820,168,45" shape="circle">
            <area alt="광양" title="광양" href="javascript:void(0);" onclick="showInfo('광양', event)" coords="895,295,42" shape="circle">
            <area alt="곡성" title="곡성" href="javascript:void(0);" onclick="showInfo('곡성', event)" coords="700,174,42" shape="circle">
            <area alt="강진" title="강진" href="javascript:void(0);" onclick="showInfo('강진', event)" coords="454,490,32" shape="circle">
        </map>
    </div>
    <div id="popup" class="popup">
        <div class="title"></div>
        <div class="address"></div>
        <div class="phone"></div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
