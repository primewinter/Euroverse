<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script>
$(function(){
	$(".nav-link:contains('비밀번호찾기')").addClass("disabled");
});

window.onload = function(){
var pwd = document.getElementById("pwd");
var pwdConfirm = document.getElementById("pwdConfirm");
var h6 = document.getElementsByTagName("h6");
var updatePwd = document.getElementById("updatePwd");
//h6[0].style.display = "none";
//h6[1].style.display = "none";

h6[0].innerHTML = "";
h6[1].innerHTML = " ";

	pwd.onkeyup = function(event) {
		if(pwd.value.length<6 || pwd.value.length>20){
			//h6[0].style.display = "";
			//h6[0].show();
			h6[0].innerHTML = "비밀번호는 6자~20자 입니다."
			return;
			//updatePwd.setAttribute("type","hidden");
		}else if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/.test(pwd.value) == false){
			h6[0].innerHTML = "비밀번호는 최소 하나의 소문자,대문자 와 숫자가 포함되어야 합니다."
			return;
		
		}else{
			//h6[0].style.display = "none";
			h6[0].innerHTML = " ";
		}
	
	}
	
	pwdConfirm.onkeyup = function(event){
		if(pwd.value != pwdConfirm.value){
			//h6[1].style.display = "";
			h6[1].innerHTML = "비밀번호가 일치하지 않습니다."
		 	//updatePwd.setAttribute("type","hidden");
		}else{
		    h6[1].innerHTML = " ";
		    if(pwdConfirm.value.length<6 || pwdConfirm.value.length>20){
			//h6[1].style.display = "none";
		    	//updatePwd.setAttribute("type","hidden");
		    }else{
		    //updatePwd.setAttribute("type","button");
		    }
		}
		
	}	

	
	
	document.getElementById('updatePwd').onclick = function() {
		
		if(pwd.value != pwdConfirm.value){
			alert("비밀번호가 일치하지 않습니다.");
		}else if( pwd.value.length < 6 || pwd.value.length > 20){
			alert("비밀번호는 6자~20자 입니다.");
		}else if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/.test(pwd.value) == false){
			alert("비밀번호는 최소 하나의 소문자,대문자 와 숫자가 포함되어야 합니다.");
		}else{
			
		var form = document.getElementsByTagName("form");
		form[0].setAttribute("action","/user/updatePwd");
		form[0].setAttribute("method","post");
		form[0].submit();
		}
	}
	
}

</script>



</head>
<body>
 <jsp:include page="/view/user/userToolBar.jsp"></jsp:include>
<form>

<h1><b>※updatePwd page※</b></h1>

<input type="hidden" name="userId" id="userId" value="${userId}">
변경할 비밀번호<input type="text" name="password" id="pwd"></br>
<h6></h6>

변경할 비밀번호 확인<input type="text" id="pwdConfirm"></br>
<h6></h6>

<input type="button" id="updatePwd" value="비밀번호 변경">

 


</form>
</body>
</html>