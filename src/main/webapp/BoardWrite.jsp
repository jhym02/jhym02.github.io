<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>견적서 게시판</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
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
	color: black;
	margin-top: 20px;
	text-decoration: none;
}

.home {
	width: 45px;
	height: auto;
	margin-right: 5px;
	margin-bottom: 10px;
	vertical-align: middle;
}

#board {
	max-width: 800px; /* 너비 조정 */
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
h2 {
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

td, th {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: center;
	font-size: 19px;
}

input[type="text"], input[type="file"], textarea {
	border: none;
	outline: none;
	width: calc(100% - 22px); /* 너비 조정 */
	padding: 10px;
	border-radius: 4px;
	font-size: 19px;
}

input[type="submit"], input[type="reset"] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin: 5px;
	font-size: 18px;
	
}

input[type="reset"] {
	background-color: #f44336;
}

input[type="submit"]:hover, input[type="reset"]:hover {
	opacity: 0.8;
}

.button-container {
	text-align: center;
}

textarea {
	width: calc(100% - 22px); /* 너비 조정 */
	height: 300px; /* 높이 조정 */
	padding: 10px;
	border-radius: 4px;
	resize: none;
}
</style>
</head>
<body>
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
	<h2>게시글 작성</h2>
		<form action="BoardService.do" method="post"
			enctype="multipart/form-data">
			<table id="list">
				<input type="hidden" name="est_no">
				<input type="hidden" name="created_at">
				<input type="hidden" name="est_idx">
				<tr>
					<td>제목</td>
					<td><input type="text" name="est_title"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="mem_id"></td>
				</tr>
				<tr>
					<td>견적서 금액</td>
					<td><input type="text" name="est_amount"></td>
				</tr>
				<tr>
					<td>진행상황</td>
					<td style="text-align: left;">
						<label><input type="radio" name="est_status" value="대기" type="radio"> 대기</label> 
						<label><input type="radio" name="est_status" value="진행중" type="radio">진행중</label> 
						<label><input type="radio" name="est_status" value="완료" type="radio">완료</label></td>
				</tr>
				<tr>
					<td >열람 권한</td>
					<td style="text-align: left;">
					<label><input type="radio" name="est_auth" value="고수" type="radio"> 고수</label> 
					<label><input type="radio" name="est_auth" value="전체" type="radio"> 전체</label>
					</td>
				</tr>

				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="est_file" style="float: right;"></td>
				</tr>
				<tr>
					<td colspan="2">내용</td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="10" name="est_content"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="button-container"><input type="reset"
						value="초기화"> <input type="submit" value="저장하기"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
