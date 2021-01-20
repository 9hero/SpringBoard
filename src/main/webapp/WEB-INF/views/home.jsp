<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
          <form class="register-form" name="regfrom" action="doJoin" method="post" enctype="multipart/form-data">
            <p>환영 해요!</p>
            
            <div><input type="text"  placeholder="아이디(필수)" name="userId" id="userId" onkeyup="changedID()"/>
            <button id="overLapBtn" type="button" onclick="idOverLapCheck()">중복확인</button><br></div>
            <span id="idOK"></span><br>
            <input type="password" placeholder="비번(필수)" onkeyup="pwConfirm()" name="userPwd" id="userPwd"/>
            <span id="pwdFormOK"></span><br>
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
          <form class="login-form" action="doLogin" method="get">
            <p>어서와요! 기다리고 있었다고요!</p>
            <input type="text" placeholder="아이디" name="userId">
            <input type="password" placeholder="비밀번호" name="userPwd">
            <button>login</button>
            <p class="message">회원이 아니십니까? <a href="#">그렇다면 가입하세요!</a></p>
          </form>
        </div>
      </div>
      <c:if test="${joinDone eq 'wellDone'}">
      	<script>alert('회원가입 감사합니다.');</script>
      </c:if>
      <c:if test="${outDone eq 'goodBye'}">
      	<script>alert('탈퇴되었습니다.');</script>
      </c:if>
      
</body>
<script>
$('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});
//필드 선언이유: 함수안에서 선언할시 마지막 제출함수에서 undefined 그래서 라이프 사이클을 필드로 했음
//			  함수가 onkeyup이라서 계속 false로 나옴 해결방법은 고민안해봄
var idCheckOK = false; //아이디 중복확인 여부 확인
var passformOK = false; //비밀번호 양식 확인
var passConfirmOK = false; //비밀번호 일치 체크

function changedID(){
	idCheckOK = false;//아이디 바뀔시 중복 체크해야 가능하게 submit에서 if로 분기
	idOK.innerHTML = "";// 바뀔시 아이디 가능 여부 없앰
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
				idCheckOK = true;
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
	var pwdFormOK = document.getElementById("pwdFormOK"); //비밀번호 양식 안내 문구
	var confirmPws = document.getElementById("password_confirm").value; // 비밀번호확인
	passformOK = false; //비밀번호 양식 확인: 비밀번호 바꾸고 하는 가입을 방지(false) 
	passConfirmOK = false; //비밀번호 일치 체크: 비밀번호 바꾸고 하는 가입을 방지(false) 

	var num = userPw.search(/[0-9]/g);
	var eng = userPw.search(/[a-z]/ig);
	var spe = userPw.search(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi);
	
	if(userPw.search(/\s/)!=-1){
		pwdFormOK.style.color = "#ff0000";
		pwdFormOK.innerHTML = "비밀번호는 공백 없이 입력해주세요!";
	} else if (userPw.length < 8 || userPw.length > 20){
		pwdFormOK.style.color = "#ff0000";
		pwdFormOK.innerHTML = "8자리 ~ 20자리 이내로 입력해주세요!";
	} else if( num < 0 || eng < 0 || spe < 0 ){
		pwdFormOK.style.color = "#ff0000";
		pwdFormOK.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요!";
	} else {
		pwdFormOK.style.color = "#0000ff";
		pwdFormOK.innerHTML = "적절한 비밀번호 입니다!";
		passformOK = true; 
	}
	
	
	   if( userPw != confirmPws ) {
		   pwdOK.style.color = "#ff0000";
		   pwdOK.innerHTML = "비밀번호가 일치 하지 않습니다";
	   } else if ( userPw == confirmPws ){
		   pwdOK.style.color = "#0000ff";
		   pwdOK.innerHTML = "비밀번호가 일치합니다";
		   passConfirmOK = true; 		   
	   }

}

function doJoinBtn(){
	console.log('상태!'+idCheckOK);
	console.log('상태!'+passformOK );
	console.log('상태!'+passConfirmOK);
	if(idCheckOK && passformOK && passConfirmOK){
		console.log('유효성 검사들 성공');
		regfrom.submit();
	}else if(idCheckOK == false){
		alert('아이디 중복검사를 해주세요!');
	}else if(passformOK == false || passConfirmOK == false){
		alert('비밀번호를 확인해주세요 !');
	} 
	// 의문 비번,아이디 둘다 체크가 안되어 있으면 어떤것을 alert를 할까 해답: else의 위에서 부터
	// 회원가입시 아이디가 유효한지 먼저 체크해야되기 때문에 아이디를 첫번째 else로 했음
	
	
}



</script>

</html>