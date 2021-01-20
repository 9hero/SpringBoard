<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>my Page</h1>
<div>
아이디 ${uib.userId}
비밀번호 ${uib.userPwd }
이름 ${uib.userName }
생일 ${uib.userBirth }
${uib.userEmail }
${uib.userAdress }
${uib.userPhone }
${uib.userProfileName}
</div>

<div><a href="">내가 쓴 글</a><a href="">수정하기</a><a href="">회원탈퇴</a></div>
</body>
</html>