<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="login-container">
		<div id="logo">
			<img src="img/logo2.png" alt="로고이미지">
		</div> 
			<form action="LoginCon.do" class="login-form">
			<label for="id">아이디</label> 
			<input type="text" id="id" name="id">
			<label for="password">비밀번호</label> 
			<input type="password" id="pw" name="pw"> 
			<input type="submit" id="login-button" value="로그인">

			<div class="login-options">
				<label>로그인 유지 <input type="checkbox" name="remember-me"></label>
				<a href="#" class="forgot-password">아아디/비밀번호 찾기</a>
			</div>
		</form>
		<div class="register">
			<p>
				아직 농고 회원이 아니세요? <a href="Real_Join.jsp">회원가입 하기</a>
			</p>
		</div>
	</div>
</body>
</html>
