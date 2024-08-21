<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보수정</title>
<link rel="stylesheet" href="css/join.css">
</head>
<body>
    <div class="container">
        <h1>회원정보수정</h1>
        <form action="UpdateCon.do" method="post">
            <h3>접속한 ID : ${user_info.mem_id}</h3>
            <input name="id" type="hidden" value="${user_info.mem_id}">
           
            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="pw"> 
            
            <label for="name">이름</label> 
            <input type="text" id="name" name="name">
            
            <label for="phone">전화번호</label> 
            <input type="text" id="phone" name="phone">
            
            <label for="address">주소</label> 
            <input type="text" id="address" name="address">
            
            <label for="nick">닉네임</label> 
            <input type="text" id="nick" name="nick">
            
            <label for="type">회원유형</label> 
            <select id="type" name="type" required>
                <option value="general">일반</option>
                <option value="expert">고수</option>
            </select>
            
            <input type="submit" value="수정하기">
        </form>
        
        <div class="right-align">
            <form action="DeleteCon.do" method="post" onsubmit="return confirm('정말 탈퇴하시겠습니까?');">
                <input name="mem_id" type="hidden" value="${user_info.mem_id}">
                <button type="submit"  class="delete-button">회원탈퇴</button>
            </form>
        </div>
    </div>
</body>
</html>
