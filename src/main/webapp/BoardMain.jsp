<%@page import="com.smhrd.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 30px;
	background-color: #fff;
	border-bottom: 1px solid #eaeaea;
}

.logo {
	display: flex;
	align-items: center;
	font-size: 45px;
	font-weight: bold;
	background: linear-gradient(to right top, green, yellow);
	color: transparent;
	-webkit-background-clip: text;
	margin-left: 50px;
}

.logo-image {
	width: 55px;
	height: 55px;
}

.top-right {
	display: flex;
	justify-content: flex-end;
	gap: 30px;
	margin-right: 30px;
	text-decoration: none;
	color: #000;
	margin-right: 80px;
	
}

.top-right a {
	font-size: 22px;
	font-weight: bold;
	font-size: 30px;
	margin-top: 20px;
}

.home {
	width: 45px;
	height: auto;
	margin-right: 5px;
	margin-bottom: 10px;
	vertical-align: middle;
}

#board {
	max-width: 1000px;
	margin: 20px auto;
	padding: 20px;
}

table {
	
	border-collapse: collapse;
	margin-top: 20px;
	font-size: 19px;
	
}

td, th {
	padding: 15px;
	border: 1px solid #ddd;
	text-align: center;
	white-space: nowrap; /* 줄바꿈 방지 */
}

a {
	text-decoration: none;
	color: #333;
}

.button-container {
	text-align: center;
	margin-top: 20px;
	
}

.delete-button {
	background-color: #bbbbba;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin: 5px;
	text-decoration: none;
	display: inline-block;
	font-size: 17px;
	
}
#writer{
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin: 20px;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
}
#writer:hover, .delete-button:hover {
	opacity: 0.8;
}

/* Responsive adjustments */
@media ( max-width : 600px) {
	#board {
		padding: 10px;
	}
	table {
		font-size: 14px;
	}
	td, th {
		padding: 8px;
	}
}
</style>
</head>
<body>
	<!-- Q17. 게시글 목록 조회 기능 -->
	<%
	List<BoardVO> estimate_requests = new BoardDAO().allBoard();
	System.out.print(estimate_requests.size());
	pageContext.setAttribute("estimate_requests", estimate_requests);
	%>

	<div class="header">
		<div class="logo">
			농사의 고수 <img alt="로고이미지" src="img/logo.png" class="logo-image">
		</div>
		<div class="top-right">
			<a href="Real_Main.jsp"><img src="img/home.png" alt="홈버튼이미지"
				class="home">메인</a>
		</div>
	</div>

	<div id="board">
		<!-- JSP code to fetch and display board data -->
		<table id="list">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>견적서 금액</th>
					<th>열람권한</th>
					<th>진행상황</th>
					<th>작성일자</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${estimate_requests}" varStatus="s">
					<tr>
						<td>${s.count}</td>
						<td><a href="BoardDetail.jsp?num=${e.est_idx}">${e.est_title}</a></td>
						<td>${e.mem_id}</td>
						<td>${e.est_amount}</td>
						<td>${e.est_auth}</td>
						<td>${e.est_status}</td>
						<td>${e.created_at}</td>
						<td>
							<form action="BoardDeleteCon.do" method="post"
								onsubmit="return confirm('정말 삭제하시겠습니까?');">
								<input type="hidden" name="id" value="${e.est_idx}">
								<button type="submit" class="delete-button">삭제</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="button-container">
			<a href="BoardWrite.jsp" id="writer">작성하기</a>
		</div>
	</div>

	<!-- Scripts (assuming these are necessary for your layout) -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
	<jsp:include page="footer.jsp" />
</body>
</html>
