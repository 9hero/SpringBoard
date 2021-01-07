<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" type="text/css" href="resources/css/mem.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <div class="login-page">
        <div class="form">
          <form class="register-form" action="doJoin" method="post" enctype="multipart/form-data">
            <p>환영 해요!</p>
            <div style="width: 270px;"><input style="width: 200px;" type="text" placeholder="아이디(필수)" name="userId"/><button style="width: 70px; height: 47px; padding: 5px;">중복확인</button><br></div>
            <input type="password" placeholder="비번(필수)" name="userPwd"/>
            <input type="text" placeholder="이름(필수)" name="userName"/>
            <input type="date" placeholder="생일(선택사항)" name="userBirth"/>
            <input type="text" placeholder="email address(필수)" name="userEmail"/>
            <input type="text" placeholder="주소(선택사항)" name="userAdress"/>
            <input type="tel" placeholder="핸드폰(선택사항)" name="userPhone"/>
            <p>프로필 사진</p>
            <input type="file" name="userProfile">
            <button type="button" onclick="">create</button>
            <p class="message">Already registered? <a href="#">Sign In</a></p>
          </form>
          <form class="login-form" action="doLogin">
            <p>어서와요! 기다리고 있었다고요!</p>
            <input type="text" placeholder="아이디" name="userId">
            <input type="password" placeholder="비밀번호" name="userPwd">
            <button>login</button>
            <p class="message">Not registered? <a href="#">Create an account</a></p>
          </form>
        </div>
      </div>
</body>
<script>
$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});
</script>

</html>