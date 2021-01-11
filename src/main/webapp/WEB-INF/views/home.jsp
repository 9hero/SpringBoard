<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" type="text/css" href="resources/css/mem.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>

.form div{
width: 270px;
}
.form div input{
margin-bottom:0px;
}
#userId{
width: 199px;
}
#overLapBtn {
	width: 67px; height: 47px; padding: 5px;
}
</style>
</head>
<body>
    <div class="login-page">
        <div class="form">
          <form class="register-form" action="doJoin" method="post" enctype="multipart/form-data">
            <p>환영 해요!</p>
            
            <div><input type="text"  placeholder="아이디(필수)" name="userId" id="userId" onkeyup="changedID()"/>
            <button id="overLapBtn" type="button" onclick="idOverLapCheck()">중복확인</button><br></div>
            <span id="idOK"></span><br>
            <input type="password" placeholder="비번(필수)" name="userPwd" id="userPwd"/>
            <input type="password" placeholder="비번확인" onkeyup="pwConfirm()" id="password_confirm"/>
            <span id="pwdOK"></span><br>
            <input type="text" placeholder="이름(필수)" name="userName"/>
            <input type="date" placeholder="생일(선택사항)" name="userBirth"/>
            <input type="text" placeholder="email address(필수)" name="userEmail"/>
            <input type="text" placeholder="주소(선택사항)" name="userAdress"/>
            <input type="tel" placeholder="핸드폰(선택사항)" name="userPhone"/>
            <p>프로필 사진</p>
            <input type="file" name="userProfile">
            <button type="button" onclick="doJoinBtn()">create</button>
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



function changedID(){
	
}

function idOverLapCheck(){
	console.log("idOverLapCheck()함수 실행");
	var userId = document.getElementById("userId").value;
	
	$.ajax({
		type : "GET" ,
		url : "idCheck" ,				
		data : { "userId" : userId } ,		/* ajaxCheck?userId=aaa */
		dataType : "text" ,
		
		success : function(result){
			
			console.log("result : " + result);
			
			if(result==""){
				idOK.style.color = "#0000ff";
				idOK.innerHTML = userId + "는 사용 가능한 아이디";
				alert('사용가능한 아이디');
			} else {
				idOK.style.color = "#ff0000";
				idOK.innerHTML = userId + "는 사용중인 아이디";
				alert('사용중인 아이디');
			}
		},	// 성공시
		error : function() {
			alert('ajaxCheck()함수 통신 실패!')
		}			// 실패시
	});
}
function pwConfirm(){
	
	var userPw = document.getElementById("userPwd").value;	//비밀번호
	var pwdOK = document.getElementById("pwdOK"); //비밀번호 안내 문구
	var confirmPws = document.getElementById("password_confirm").value; // 비밀번호확인
	var passformOK = false; // 양식 완료
	var passConfirmOk = false; // 비밀번호 둘다 같음 
	
	var num = userPw.search(/[0-9]/g);
	var eng = userPw.search(/[a-z]/ig);
	var spe = userPw.search(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi);
	
	if(userPw.search(/\s/)!=-1){
		pwdOK.style.color = "#ff0000";
		pwdOK.innerHTML = "비밀번호는 공백 없이 입력해주세요!";
	} else if (userPw.length < 8 || userPw.length > 20){
		pwdOK.style.color = "#ff0000";
		pwdOK.innerHTML = "8자리 ~ 20자리 이내로 입력해주세요!";
	} else if( num < 0 || eng < 0 || spe < 0 ){
		pwdOK.style.color = "#ff0000";
		pwdOK.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요!";
	} else {
		pwdOK.style.color = "#0000ff";
		pwdOK.innerHTML = "적절한 비밀번호 입니다!";
		passformOK = true;
	}
	
	
	   if( userPw != confirmPws ) {
		   pwdOK.style.color = "#ff0000";
		   pwdOK.innerHTML = "비밀번호가 일치 하지 않습니다";
	   } else if ( userPw = confirmPws ){
		   pwdOK.style.color = "#0000ff";
		   pwdOK.innerHTML = "비밀번호가 일치합니다";
		   passConfirmOK = true;		   
	   }

}
</script>

</html>