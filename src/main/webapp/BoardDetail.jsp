<%@page import="com.smhrd.model.BoardVO"%>
<%@page import="com.smhrd.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 세부 내용</title>
<!-- CSS 스타일링 -->
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

#board {
	max-width: 800px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	font-size: 19px;
}

td, th {
	padding: 20px;
	border: 1px solid #ddd;
	text-align: center;
}

a {
	text-decoration: none;
	color: #333;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin: 5px;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
}

button:hover {
	opacity: 0.8;
}
</style>
</head>
<body>
	<div id="board">
		<!-- 게시글 세부 내용 조회 -->
		<%
		int est_idx = Integer.parseInt(request.getParameter("num"));
		BoardVO e = new BoardDAO().detailBoard(est_idx);
		%>
		<table id="list">
			<tr>
				<td>제목</td>
				<td><%=e.getEst_title()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=e.getMem_id()%></td>
			</tr>
			<tr>
				<td>견적서 금액</td>
				<td><%=e.getEst_amount()%></td>
			</tr>
			<tr>
				<td>진행 상황</td>
				<td><%=e.getEst_status()%></td>
			</tr>
			<tr>
				<td>다운로드</td>
				<td><a href="./file/<%=e.getEst_file()%>" download><%=e.getEst_file()%></a></td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="content"><%=e.getEst_content()%></div> <img alt=""
					src="./file/<%=e.getEst_file()%>">
				</td>
			</tr>
			<tr>
				<td colspan="2"><a href="BoardMain.jsp"><button>뒤로가기</button></a>
					<a href="Chat.jsp"><button>채팅하기</button></a></td>
			</tr>
		</table>
	</div>
	<!-- JavaScript 파일 -->
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
