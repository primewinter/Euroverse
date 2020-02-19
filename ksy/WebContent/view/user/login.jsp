<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<style>
h6{
	margin-left: 13px;
	margin-top: -10px;
}

#loginModal .modal-dialog > h2{
	
color : #F0F8FF;
position:absolute;
top:58px;
right:215px;
}


#loginModal .modal-content{

width: 500px; 
height: 300px;
position: absolute; 
top: 100px; 
right: 10px;
}

#loginModal #modalForm .form-group > input{
	padding:15px 20px;
	border-radius:25px;
	background:rgba(217, 242, 253);
	border: 2px;
}

.useruser{
	font-size: 12px;
	
}
</style>


<script>

$( function() {
	// 네이버 아이디로 로그인 이미지 클릭 시 
	$("#naverLogin").on("click", function(){
		// 새로 팝업창에서 네이버 로그인을 진행하기 위해 아무 의미없는 jsp로 연결
		/* $(self.location).attr("href","/naver/openWindow.jsp"); */
		$.ajax(
				{
					
					url : "/user/json/naverLoginUrlMake" , 
					method : "get" ,
					dataType : "json" ,
					headers : { 
						"Accept" : "application/json" , 
						"Content-Type" : "application/json"
					} , 
					success : function( JSONData ) { 
						self.location = JSONData.url; 	
					}
				}
		)
		
		/* window.open("/naver/openWindow.jsp",
				"popWin",
				"left=700, top=90, width=537, height=750, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no"); */
	})
	
	$("#googleLogin").on("click",function(){
		/* function openopen() {
			window.open("https://accounts.google.com/o/oauth2/v2/auth?scope=https://www.googleapis.com/auth/analytics.readonly&access_type=offline&include_granted_scopes=true&state=state_parameter_passthrough_value&redirect_uri=http://localhost:8080/user/googleLoginLogic&response_type=code&client_id=474522905430-f6nkrljp2qocnq1mop0ve2oc5ng91q38.apps.googleusercontent.com",
					"popWin",
					"left=700, top=90 , width=537 , height=750 , marginwidth=0,marginheight=0, fullscreen=no , scrollbars=yes, scrolling=yes, menubar=no, resizable=no");
		} */
		$(self.location).attr("href","https://accounts.google.com/o/oauth2/v2/auth?scope=https://www.googleapis.com/auth/analytics.readonly&access_type=offline&include_granted_scopes=true&state=state_parameter_passthrough_value&redirect_uri=http://localhost:8080/user/googleLoginLogic&response_type=code&client_id=474522905430-f6nkrljp2qocnq1mop0ve2oc5ng91q38.apps.googleusercontent.com");
	})
	
	$("#kakaoLogin").on("click", function(){
				// 새로 팝업창에서 카카오 로그인을 진행하기 위해 아무 의미없는 jsp로 연결
				/* window.open("/kakao/openWindow.jsp",
						"popWin",
						"left=700, top=90, width=537, height=750, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no"); */
						$.ajax(
								{
									
									url : "/user/json/kakaoLoginUrlMake" ,  // 단순 URL을 만들기 위한 UserController 
									method : "get" , // 넘겨 줄 Data가 없으므로 get
									dataType : "json" , // 받아 올 data의 Type을 json으로 설정 
									headers : { // dataType이 json이므로 받을 때(Accept)와 보낼 때(Content-Type)을 모두 application/json으로 설정  
										"Accept" : "application/json" , 
										"Content-Type" : "application/json"
									} , 
									success : function( JSONData ) { // success 시, 
																	 // HTTP 200 OK일 시 
																	 // UserController에서 return한 값을 JSONData로 받음 
										
										self.location = JSONData.url; 	// json/kakaoLoginUrlMake에서 return을 Map<String, String>으로 했으며
																		// map.put("url", kakaoLoginUrl); 으로 map에 넣었으므로 
																		// JSONData.url로 naverLoginUrl 접근이 가능하다 
																		// self.location으로 return한 URL로 이동 
																		// 이동 시 카카오 아이디로 로그인하라는 창으로 이동하며 로그인 뒤에 
																		// 로그인 Redirect URL으로 자동 redirect, 이동한다.
																		// redirect 시 URL은 {redirect_uri}?code={authorize_code}
																		// 현재는 http://192.168.0.76:8080/user/kakaoLoginLogic?code={authorize_code}
																		// query string으로 반환된 code는 접근 토큰 요청할 때 사용되므로 @RequestParam으로 받아와야한다.

									}
								}
						)
			})
})

$(document).ready(function(){
    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("#loginUserId").val(userInputId); 
     
    if($("#loginUserId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("#loginUserId").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#loginUserId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("#loginUserId").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}


$(function(){
	

	
var userId = $('#loginUserId');
var pwd = $('#loginPwd');
var h6 = document.getElementsByClassName('loginH6');


	$("#loginUserId").keydown(function (key) {

		if(userId.val()==""){
			 return;
		 } 
		
		if(pwd.val()==""){
			return;
		}
		
        if(key.keyCode == 13){
    		loginAjax(userId,pwd);
        }
    });
	 
	$("#loginPwd").keydown(function (key) {
		if(userId.val()==""){
			 return;
		 } 
		
		if(pwd.val()==""){
			return;
		}
		if(key.keyCode == 13){
	    	loginAjax(userId,pwd);
	    }
		
        
    });
	
	$("button:contains('로그인')").on("click",function(){
		if(userId.val()==""){
			 return;
		 } 
		
		if(pwd.val()==""){
			return;
		}
		 loginAjax(userId,pwd);
	});
	


})


function loginAjax(userId , pwd ){
	var h6 = document.getElementsByClassName('loginH6');
	$.ajax({
		url : "/user/json/login",
		method : "post",
		dataType : "json",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			userId : userId.val(),
			pwd : pwd.val()
		}),
		success : function(JSONData){
			console.log(JSONData);
			if(JSONData.result == 'ok'){
				//$("form").attr("method","get").attr("action","/user/login").submit();
				$("#loginModal").modal("hide");
				location.reload();
			}else if(JSONData.result =='errorId'){
				//alert("존재하지 않는 아이디입니다.");
				h6[2].innerHTML = "존재하지 않는 아이디입니다.";
			}else if(JSONData.result =='errorPwd'){
				//alert("비밀번호가 틀렸습니다.");
				h6[2].innerHTML = "비밀번호가 틀렸습니다.";
			}else{
				alert("띠용");
			}
		}//success
	})//ajax
	
	
}

</script>

<title>Insert title here</title>
</head>
<body>

<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false">
로그인모달
</button>
 -->

<div class="modal fade " id="loginModal">
	  <!-- <div class="modal-dialog modal-lg"> -->
	  <div class="modal-dialog ">
	  	<h2 >Sign In</h2>
	  
		<div class="modal-content" >
			 <!-- 	<div class="modal-header">
				</div>modal header End 
 			-->
				 
				
			
		<div class="modal-body">
			<form id="modalForm">
					<div class="form-group" style="margin-bottom: -10px;">
						<div >&nbsp;&nbsp;&nbsp;<b>ID</b></div>
						<input type="text"	class="form-control" id="loginUserId" name="userId">
						<h6 class="loginH6" style="color: #F00"></h6>
					</div>
					
					<label class="form-check-label" style="margin-top: 0px;">
					 <input class="form-check-input" type="checkbox" id="idSaveCheck" style="margin-left: 10px;"> 
						 <span style="margin-left: 25px;"><small>아이디기억</small></span>
					</label>
					
					<div class="form-group" style="margin-top: 25px">
						<div >&nbsp;&nbsp;&nbsp;<b>Password</b></div>
						 <input type="password"	class="form-control" id="loginPwd" name="pwd">
						<h6 class="loginH6" style="color: #F00"></h6>
					</div>
						<h6 class="loginH6" style="color: #F00"></h6>
						
						
							<!-- <div class="form-group form-check" >
								<a href="/user/addUser" class="badge badge-pill badge-primary pull-right">회원가입</a>
								<a href="/user/searchId" class="badge badge-pill badge-primary pull-right">아이디찾기</a>
								<a href="/user/findPwd" class="badge badge-pill badge-primary pull-right">비밀번호찾기</a>
								<img id="kakaoLogin" src="/resources/images/userImages/kakaoImage.png" width="30" height="30" /> 
								<img id="naverLogin" src="/resources/images/userImages/naverImage.PNG" width="30" height="30" /> 
								<img id="googleLogin" src="/resources/images/userImages/googleImage.png" width="30" height="30">
							</div> -->
							<a href="/user/addUser">	<span class="useruser" style="margin-left: 20px; position:absolute; top:215px;right:420px;">회원가입</span> </a>
							<a href="/user/searchId">	<span class="useruser" style="position:absolute; top:215px;right:355px;">아이디찾기</span> </a>
							<a href="/user/findPwd">	<span class="useruser" style="position:absolute; top:215px;right:280px;">비밀번호찾기</span></a>
							
							<div style="text-align: right; position:absolute; top:215px;right:25px;font-size: 12px;">SNS간편회원가입</div>
							<div style="text-align: right;position:absolute;top:235px;right:20px;">
							<img id="kakaoLogin" src="/resources/images/userImages/kakaoImage.png" width="30" height="30" /> 
							<img id="naverLogin" src="/resources/images/userImages/naverImage.PNG" width="30" height="30" /> 
							<img id="googleLogin" src="/resources/images/userImages/googleImage.png" width="30" height="30">					
							</div>
							
							
				<!-- 		<div name="naverLogin">
							네이버 아이디로 로그인 이미지
						</div>
						<div name="googleLogin">
						</div>
						<div name="kakaoLogin">
							카카오 아이디로 로그인 이미지
						</div>	
						 -->
					<h6 class="loginH6"></h6>
					
					<button type="button" class="btn btn-outline-primary" style="margin-left: 20px; position:absolute; top:240px;right:395px;">로그인</button>
	      			<!-- <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button> -->
			
			</form>


			<!-- 	<div class="modal-footer">
				</div>modal footer End  -->

				</div><!--modal body End  -->

			</div><!--modal content End  --> 
	  </div><!--modal dialog End  -->

</div><!--myModal End  -->
 <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
</body>
</html>