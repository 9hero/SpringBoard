<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 수정</h1>
<form action="memModi" method="post" name="modiform">
<input type="hidden" name= "userId" value="${uib.userId }">
<input type="text" placeholder="이름(필수)" id="userName" name="userName" value="${uib.userName }">
<input type="text" placeholder="email address(필수)"  id="userEmail" name="userEmail" value="${uib.userEmail }"/>
<input type="tel" placeholder="핸드폰(선택사항)" name="userPhone" value="${uib.userPhone }"/>
<input type="password" placeholder="비번확인" id="password_confirm"/>
<button type="button" onclick="modi()">수정</button>
</form>
</body>
<script>
	function modi(){
		var userPwd = ${uib.userPwd};
		var userInputPwd = document.getElementById("password_confirm").value;
        var userEmail = document.getElementById("userEmail").value;
        var userName = document.getElementById("userName").value;
        console.log(userPwd == userInputPwd && userEmail !="" && userName !="");
        
		if(userPwd == userInputPwd && userEmail !="" && userName !=""){
		modiform.submit();
		}else if(userPwd == userInputPwd){
			alert('필수 부분(이름,이메일) 입력 바람');
		}else{
			alert('비밀번호 틀림');
		}
	}
</script>
</html>