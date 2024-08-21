<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/join.css">
    <!-- Include SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- Include jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <h1>농사의 고수에 오신 것을 환영합니다</h1>
        <form action="JoinCon.do" method="post" id="idCheck">
            <label for="id">아이디</label> 
            <input type="text" id="id" name="id">
            <button type="button" id="btn">아이디 중복 확인</button>
            <span id="idCheck"> </span>
            
            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="pw"> 
            
            <label for="name">이름</label> 
            <input type="text" id="name" name="name">
            
            <label for="phone">전화번호</label> 
            <input type="text" id="phone" name="phone">
            
            <label for="address">주소</label> 
            <input type="text" name="address" class="text" id="sample6_address" placeholder="주소"><br>
            
            <label for="nick">닉네임</label> 
            <input type="text" id="nick" name="nick">
            
            <label for="birthdate">생년월일</label> 
            <input type="date" id="birthdate" name="birth">
            
            <label for="gender">성별</label> 
            <select id="gender" name="gender" required>
                <option value="male">남성</option>
                <option value="female">여성</option>
            </select>
            
            <label for="type">회원유형</label> 
            <select id="type" name="type" required>
                <option value="general">일반</option>
                <option value="expert">고수</option>
            </select>
            <input type="submit" value="가입하기">
        </form>
    </div>

    <!-- Include SweetAlert2 JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        $(document).ready(function() {
            $('#btn').on('click', function() {
                var mem_id = $('#id').val(); // 사용자가 입력한 아이디

                $.ajax({
                    url: "idCheckCon.do",
                    type: "POST",
                    data: { id: mem_id },
                    dataType: "text",
                    success: function(response) {
                        // SweetAlert2 알림창 표시
                        Swal.fire({
                            title: '아이디 중복확인',
                            text: response,
                            icon: response.includes('중복') ? 'error' : 'success',
                            confirmButtonText: '확인'
                        });
                    },
                    error: function() {
                        Swal.fire({
                            title: 'Error',
                            text: '서버 오류가 발생했습니다.',
                            icon: 'error',
                            confirmButtonText: '확인'
                        });
                    }
                });
            });
        });
        
        00
    </script>
</body>
</html>
