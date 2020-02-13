<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- jquery Ui 링크 (datePicker)  -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!--datePicker CDN  -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- boot strap File upload CDN  -->
<script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.js"></script>

<!-- swiper CDN -->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<!--========================= -->

<!-- fontawesome CDN -->
<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>

.addH6{
	color: red;
}


.swiper-container{
    height: 300px;
    background-color:#E6E6E6;
    padding: 50px;
    padding-top: 30px;
    padding-right: 30px;
    margin-right:30px;
}


.s1 {
    width: 500px;
    height: 300px;
     padding-right: 30px;
      margin-right:30px;
    
} 


.s2 {
    width: 500px;
    height: 300px;
     padding-right: 30px;
      margin-right:30px;
} 




 .swiper-slide {
 
	margin:10px;
	
} 
.swiper-slide img {
}

.card{
	width: 80px;
	height:90px;
	margin: 10px;
}

 .custom-file-input ~ .custom-file-label::after {
    content: "프로필사진 등록";
}

 

#preview img{
	border: 100px;
	border-color: #E6E6E6;
}

</style>


<script>
$( function() {
    $( "#datepicker" ).datepicker({
      showOptions: { direction: "up" },
	  defaultDate : '1996-05-31',
      changeYear : true ,
      changeMonth : true ,
      showOn: "button",
      buttonImage: "/resources/images/userImages/CalendarICON.png",
      buttonImageOnly: true,
      buttonText: "Select date",
      dateFormat : "yy-mm-dd",
      showAnim : "bounce"
    });
  } );


$(document).ready(function () {
	  bsCustomFileInput.init()
	  
	})
	


$(function(){
	$(".nav-link:contains('회원가입')").addClass("disabled");

	
var userId = $("#userId");
var pwd = $("#pwd");
var pwdConfirm = $("#pwdConfirm");
var userName = $("#userName");
var nickname = $("#nickname");
$("input[name='email']").val($("#emailId").val()+"@"+$("#choiceEmail").val());
var email =  $("#email");
var emailId = $("#emailId");

var birth = $("input[name='birth']");
var sex = $("input[name='sex']");
$("input[name='phone']").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
var phone = $("input[name='phone']");
var phone1 = $("#phone1");
var phone2 = $("#phone2");
var phone3 = $("#phone3");

var image = $("input[name='image']");

var h6 = document.getElementsByClassName('addH6');

	$(document).on('keyup', '#userId', function(event) {
		
		for(var i=0;i<userId.val().length;i++){
			if(userId.val()[i] == " "){
				userId.val(userId.val().replace(" ", ""));
			}
			userId.val(userId.val().replace(/[^\\!-z]/gi,""));
			userId.val(userId.val().replace(/[~!@\]\[\#$%;,.\/^&*\()\-=+_'\\\"]/gi,""));
		}
		if(userId.val().length <4 || userId.val().length > 12 ){
			h6[0].innerHTML ="아이디는 4~12자 입니다.";
		}else{
			if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,12}$/.test(userId.val()) == false){
				h6[0].innerHTML = "아이디는 최소 하나의 소문자,대문자 와 숫자가 포함되어야 합니다."
			}else{
				h6[0].innerHTML = "";
			}
		}
		
		if(userId.val().length >=4 && userId.val().length <= 12 ){
		$.ajax({
			url : "/user/json/checkDuplicate",
			method : "post",
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				userId : userId.val()
			}),
			success : function(JSONData){
				if(JSONData.result == 'ok'){
					//h6[0].innerHTML ="";
				}else{
					h6[0].innerHTML ="중복된 아이디입니다.";
				}
			}//success
		})//ajax
		
		}
		
		h6[2].innerHTML ="";
	});
	
	$(document).on('keyup','#pwd',function(){
		
		for(var i=0;i<pwd.val().length;i++){
			if(pwd.val()[i] == " "){
				pwd.val(pwd.val().replace(" ", ""));
				return;
			}
		}
		
		if(pwd.val().length <6  || pwd.val().length >20 ){
			h6[1].innerHTML = "비밀번호는 6~20자 입니다.";
		}		
		else{
			if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/.test(pwd.val()) == false){
				h6[1].innerHTML = "비밀번호는 최소 하나의 소문자,대문자 와 숫자가 포함되어야 합니다."
			}else{
				h6[1].innerHTML = "";
			}
		}
		if(pwd.val() != pwdConfirm.val()){
			h6[2].innerHTML = "비밀번호가 일치하지 않습니다.";
		}else{
			h6[2].innerHTML = "";
		}
		h6[2].innerHTML ="";
	});
	
	$(document).on('keyup','#pwdConfirm',function(){
		for(var i=0;i<pwdConfirm.val().length;i++){
			if(pwdConfirm.val()[i] == " "){
				pwdConfirm.val(pwdConfirm.val().replace(" ", ""));
				return;
			}
		}
		if(pwd.val() != pwdConfirm.val()){
			h6[2].innerHTML = "비밀번호가 일치하지 않습니다.";
		}else{
			h6[2].innerHTML = "";
		}
	});
	
	
	$(document).on('keyup','#userName' , function(){
		
		for(var i=0;i<userName.val().length;i++){
			if(userName.val()[i] == " "){
				userName.val(userName.val().replace(" ", ""));
			}
			userName.val(userName.val().replace(/[~!@\]\[\#$%;,.\/^&*\()\-=+_'\\\"]/gi,""));
		}
		if(userName.val().length > 5){
			h6[3].innerHTML = "외국사람인가요? 이름이 많이 길어서요..."
		}else{
			h6[3].innerHTML = "";
		}
	});
	
	$(document).on('keyup','#nickname',function(){
		for(var i=0;i<nickname.val().length;i++){
			if(nickname.val()[i] == " "){
				nickname.val(nickname.val().replace(" ", ""));
			}
		}
		if(nickname.val().length <2 || nickname.val().length > 10){
			h6[4].innerHTML = "닉네임은 2~10자 입니다.";
		}else{
			h6[4].innerHTML = "";
		}
		
		if(nickname.val().length >=2 || nickname.val().length <= 10){

		$.ajax({
			url : "/user/json/checkDuplicate",
			method : "post",
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				nickname : nickname.val()
			}),
			success : function(JSONData){
				if(JSONData.result == 'ok'){
					//h6[4].innerHTML ="";
				}else{
					h6[4].innerHTML ="중복된 닉네임입니다.";
				}
			}//success
		})//ajax
		
		}
	})
	
	$(document).on('keyup' , '#emailId' , function(){
		for(var i=0;i<emailId.val().length;i++){
			if(emailId.val()[i] == " "){
				emailId.val(emailId.val().replace(" ", ""));
			}
			emailId.val(emailId.val().replace(/[^\\!-z]/gi,""));
			emailId.val(emailId.val().replace(/[~!@\]\[\#$%;,.\/^&*\()\-=+_'\\\"]/gi,""));
		}
	})
	
	$(document).on('keyup','#phone1',function(){
		if(phone1.val().length > 3){
			h6[8].innerHTML="핸드폰 번호를 확인해주세요.";
		}else{
			h6[8].innerHTML="";
		}
		for(var i=0;i<phone1.val().length;i++){
			if(phone1.val()[i] == " "){
				phone1.val(phone1.val().replace(" ", ""));
				return;
			}
		}
		
	})
	
	$(document).on('keyup','#phone2',function(){
		if(phone2.val().length > 4){
			h6[8].innerHTML="핸드폰 번호를 확인해주세요.";
		}else{
			h6[8].innerHTML="";
		}
		for(var i=0;i<phone2.val().length;i++){
			if(phone2.val()[i] == " "){
				phone2.val(phone2.val().replace(" ", ""));
				return;
			}
		}
	})
	
	$(document).on('keyup','#phone3',function(){
		if(phone3.val().length > 4){
			h6[8].innerHTML="핸드폰 번호를 확인해주세요.";
		}else{
			h6[8].innerHTML="";
		}
		for(var i=0;i<phone3.val().length;i++){
			if(phone3.val()[i] == " "){
				phone3.val(phone3.val().replace(" ", ""));
				return;
			}
		}
	})
	
	
	
	
})
	
	
$(function(){
	$(".btn-primary").on("click",function(){
		var userId = $("#userId");
		var pwd = $("#pwd");
		var pwdConfirm = $("#pwdConfirm");
		var userName = $("#userName");
		var nickname = $("#nickname");
		$("input[name='email']").val($("#emailId").val()+"@"+$("#choiceEmail").val());
		var email =  $("#email");
		var birth = $("input[name='birth']");
		var sex = $("input[name='sex']");
		$("input[name='phone']").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
		var phone = $("#phone");
		var image = $("input[name='image']");
		var dreamCountry = $("input[name='dreamCountry']");
		var tripStyle = $("input[name='tripStyle']");
		
		var submitAlert = $(".alert-danger");
		var alertMessage = $(".alert-danger strong");
		
		var h6 = document.getElementsByClassName('addH6');
	
		 
		for(var i=1;i<=$("input:checkbox[class=dreamCountry]").length;i++){
			 if($("input:checkbox[id=dreamCountry"+i+"]").is(":checked") == true) {
				  var value = $("input:checkbox[id=dreamCountry"+i+"]").val();
				  var countryImg = $("#countryImg"+i).val();
				  
				  $("#checkDreamCountry").append("<input type='hidden' name='dreamCountry' value='"+value+"'>");
				  $("#checkDreamCountry").append("<input type='hidden' name='countryImg' value='"+countryImg+"'>'")
			} 
		}/* for End */	 
		
		for(var i=1;i<=$("input:checkbox[class=tripStyle]").length;i++){
			if($("input:checkbox[id=tripStyle"+i+"]").is(":checked")==true){
				var value = $("input:checkbox[id=tripStyle"+i+"]").val();
				var styleImg = $("styleImg"+i).val();
				
				 $("#checkTripStyle").append("<input type='hidden' name='tripStyle' value='"+value+"'>");
				 $("#checkTripStyle").append("<input type='hidden' name='styleImg' value='"+styleImg+"'>");
			}
		}/* for End(tripStyle) */
		
		
		for(var i=0 ; i<h6.length ; i++){
			if(h6[i].innerHTML != ""){
				submitAlert.prop("style","display : block");
				alertMessage.html(h6[i].innerHTML);
				return;
			}
		}
		
		
		if($.trim(userId.val())==""){
			submitAlert.prop("style","display : block");
			alertMessage.html("아이디를 확인해주세요.");
			return;
			
			
			
		}else if($.trim(userId.val()) != userId.val()){
			submitAlert.prop("style","display : block");
			alertMessage.html("아이디에 띄어쓰기는 사용할 수 없습니다.");
			return;
		}
		
		if($.trim(pwd.val())==""){
			submitAlert.prop("style","display : block");
			alertMessage.html("비밀번호를 확인해주세요.");
			return;
		}else if($.trim(pwd.val()) != pwd.val()){
			submitAlert.prop("style","display : block");
			alertMessage.html("비밀번호에 띄어쓰기는 사용할 수 없습니다.");
			return;
		}
		
		if($.trim(pwdConfirm.val()) ==""){
			submitAlert.prop("style","display : block");
			alertMessage.html("비밀번호를 확인해주세요.");
			return;
		}
		
		if($.trim(userName.val())==""){
			submitAlert.prop("style","display : block");
			alertMessage.html("이름을 확인해주세요.");
			return;
		}else if($.trim(userName.val()) != userName.val()){
			submitAlert.prop("style","display : block");
			alertMessage.html("이름에 띄어쓰기는 사용할 수 없습니다.");
			return;
		}
		
		if($.trim(nickname.val()) ==""){
			submitAlert.prop("style","display : block");
			alertMessage.html("닉네임을 확인해주세요.");
			return;
		}else if($.trim(nickname.val()) != nickname.val()){
			submitAlert.prop("style","display : block");
			alertMessage.html("닉네임에 띄어쓰기는 사용할 수 없습니다.");
			return;
		}
		
		if($.trim(birth.val())==""){
			submitAlert.prop("style","display : block");
			alertMessage.html("생일을 확인해주세요.");
			return;
		}
		
		if($.trim(email.val())=="@"+null){
			submitAlert.prop("style","display : block");
			alertMessage.html("이메일을 확인해주세요.");
			return;
		}else if ($.trim(email.val()) != "" && (email.val().indexOf('@') < 1 || email.val().indexOf('.') == -1)) {
			submitAlert.prop("style","display : block");
			alertMessage.html("이메일 형식이 아닙니다.");
			return;
		}else if($.trim(email.val()) != email.val()){
			submitAlert.prop("style","display : block");
			alertMessage.html("이메일에 띄어쓰기는 사용할 수 없습니다.");
			return;
		} 
		
		if($.trim(phone.val()).length <10){
			submitAlert.prop("style","display : block");
			alertMessage.html("휴대폰 번호를 확인해주세요.");
			return;
		} 
		
		
		if($("input:radio[name='sex']").is(":checked") == false){
			submitAlert.prop("style","display : block");
			alertMessage.html("성별을 선택해주세요.");
			return;
		}
		

		 $("#myModal").modal({keyboard: false,backdrop: 'static'});
		 $("#myModal").modal("show");
	
	});/* btn-primary End */
});/* function End */







$(function(){

	$("input[name='pushAgree']").on("click",function(){
		$("form").attr("action","addUser").attr("method","post").attr("enctype","multipart/form-data").submit();
	})
	
	$(".alert-danger button").on("click",function(){
		$(".alert-danger").prop("style","display:none");			
	})
	
	$(".btn-secondary:contains('취소')").on("click",function(){
		$(location).attr("href","/view/user/page.jsp");		
	})
	
	
	$("input[class='dreamCountry']").on("click",function(){
		if($("input:checkbox[class=dreamCountry]:checked").length > 5){
			alert("5개까지만 선택 가능합니다.");
			$("input:checkbox[id=dreamCountry"+$(this).prev().val()+"]").prop("checked",false);
		}
	})
	
	$("input[class='tripStyle']").on("click",function(){
		if($("input:checkbox[class=tripStyle]:checked").length > 3){
			alert("3개까지만 선택 가능합니다.");
			$("input:checkbox[id=tripStyle"+$(this).prev().val()+"]").prop("checked",false);
		}
	})
	
 
	$(".custom-file-input").on("change",function(){
		  var fileSize = this.files[0].size;
		    var maxSize = 360 * 360;
		    if(fileSize > maxSize) {
		        alert("파일용량을 초과하였습니다.");
		        $(".custom-file label").html("<i class='fas fa-camera-retro'>size 360x360</i>");
		        $("#preview").html("");
		        return;
		    }else{
				readImg(this);
		    }
	});
})

function readImg(input){
	
	var width = 360;
	var height = 360;
	
	if(input.files && input.files[0]){
		var render = new FileReader();
		render.onload = function(e){
			 var image = $('#preview').attr('src',e.target.result).attr('width','300px').attr('height','300px').css('overflow' , 'hidden');
			 console.log(e.target.result);
				 $("#preview").html("<img src="+e.target.result+" style='border-color: #E6E6E6; border: 10px; overflow : hidden'>");
		}
		 render.readAsDataURL(input.files[0]);
	}
}









</script>

</head>
<body>
<%-- <jsp:include page="/toolbar/toolBar.jsp"></jsp:include> --%>
<jsp:include page="/view/user/userToolBar.jsp"></jsp:include>
<div class="col-md-7 mx-auto" > 
				<h1 class="text-center">회원가입</h1>
</div> 

<div class="container">

<form>




	<div class="form-group">
		<div class="col-6 mx-auto">
			<b>Id</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-user"></i></span>
				<input type="text" class="form-control" placeholder="userId" id="userId" name="userId" style="ime-mode:inactive;">
			</div>
			<h6 class="addH6"></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<b>Password</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-lock"></i></span>
				<input type="password" class="form-control" placeholder="password" id="pwd" name="pwd">
			</div>
			<h6 class="addH6"></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<b>PasswordConfirm</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-lock"></i></span>
				<input type="password" class="form-control" placeholder="password Confirm" id="pwdConfirm">
			</div>
			<h6 class="addH6"></h6>
		</div>
	</div>
	

	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<b>Name</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-user"></i></span>
				<input type="text" class="form-control" placeholder="Only Korean" name="userName" id="userName" onkeypress="if(!(event.keyCode < 47 && event.keyCode > 58)) event.returnValue=false;">
			</div>
			<h6 class="addH6"></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
		<b>Nickname</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-user"></i></span>
				<c:if test="${loginType!='sns'}">
					<input type="text" class="form-control" placeholder="Nickname" name="nickname" id="nickname">
				</c:if>
				<c:if test="${loginType=='sns'}">
					<input type="text" class="form-control" value="${snsUser.nickname}" name="nickname" id="nickname">
				</c:if>
				
				
				
				
			</div>
			<h6 class="addH6"></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
		<b>Birth</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-baby"></i></span>
				<span class="input-group-append"><input type="text" class="form-control" placeholder="birth" name="birth" readonly="readonly" id="datepicker"></span>
			</div>
			<h6 class="addH6"></h6>
				
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
		<b>Email</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-globe"></i></span>
				<c:if test="${loginType != 'sns' }">
				<input type="text" class="form-control" placeholder="email" id="emailId">
				<span class="input-group-append">&nbsp;<i class="fas fa-at"></i>&nbsp;</span>
				<select class="custom-select" id="choiceEmail">
				<option value="" disabled selected hidden>please choice....</option>
			    <option value="gmail.com">gmail.com</option>
			    <option value="naver.com">naver.com</option>
			    <option value="daum.net">daum.net</option>
			    <!--이메일 잘 정리하기 email잡은다음에 밸류에 +@+choiceEmail.val() 더하기  -->
			 	</select>
				</c:if>
				<c:if test="${loginType == 'sns' }">
					<input type="text" class="form-control" value="${snsUser.emailId}" id="emailId">
					<span class="input-group-append">&nbsp;<i class="fas fa-at"></i>&nbsp;</span>
					<select class="custom-select" id="choiceEmail">
				   		<c:if test="${snsUser.choiceEmail=='gmail.com'}">
						    <option value="gmail.com">gmail.com</option>
						    <option value="naver.com">naver.com</option>
						    <option value="daum.net">daum.net</option>
				   		</c:if> 
						<c:if test="${snsUser.choiceEmail=='naver.com'}">
						    <option value="gmail.com">naver.com</option>
						    <option value="google.com">gmail.com</option>
						    <option value="daum.net">daum.net</option>
						</c:if>			    
						<c:if test="${snsUser.choiceEmail=='daum.net'}">
						    <option value="gmail.com">daum.net</option>
						    <option value="google.com">gmail.com</option>
						    <option value="naver.com">naver.com</option>
						</c:if>
				    <!--이메일 잘 정리하기 email잡은다음에 밸류에 +@+choiceEmail.val() 더하기  -->
				 	</select>
				
				</c:if>
			 	
			 	
			 	
			 	<input type="hidden" name="email" id="email">
			</div>
			<h6 class="addH6"></h6>
		</div>
	</div>
	
	
	
	<div class="form-group">
		<div class="col-6 mx-auto">
		<b>Sex</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-venus-mars"></i></span>
					&nbsp;
					&nbsp;
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="sex" id="male" value="M">
					  <label class="form-check-label" for="inlineRadio1">Male<i class="fas fa-male"></i></label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="sex" id="female" value="F">
					  <label class="form-check-label" for="inlineRadio2">Female<i class="fas fa-female"></i></label>
					</div>
			</div>
			<h6 class="addH6"></h6>
		</div>
	</div>
	


	 <div class="form-group">
	 	<div class="col-6 mx-auto">
	 		<b>Phone</b>
	 		<div class="input-group-prepend">
	 		  <span class="input-group-text"><i class="fas fa-phone"></i></span>
		      <input type="text" class="form-control" id="phone1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3"> - 
		      <input type="text" class="form-control" id="phone2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"> - 
		      <input type="text" class="form-control" id="phone3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
		      <input type="hidden" name="phone" id="phone"> 
		    </div>
		    <h6 class="addH6"></h6>
		</div>
 	 </div>
 	 
 	  <div class="form-group">
	 	<div class="col-6 mx-auto">
	 		<b>Profile Image</b>
			<c:if test="${loginType!='sns'}">
			<div class="custom-file">
			  <input type="file" class="custom-file-input" id="image" name="image" accept="image/*" >
			  <label class="custom-file-label" for="customFile" ><i class="fas fa-camera-retro">size 360x360</i> </label>  
			  <!-- 프로필 이미지 미리보기 만들기! 사이즈제한 걸어두기!~~~ -->
			</div>
			<h6 class="addH6"></h6>
			</c:if>
			<div id="preview">
				<c:if test="${loginType=='sns'}">
					<img alt="" src="${snsUser.userImg}">
					<input type="hidden" name="userImg" value="${snsUser.userImg}">
				</c:if>
				
			</div>
		</div>
	</div>

	 <div class="form-group">
	 	<div class="col-6 mx-auto">
	 		<b>가고싶은 나라</b>(최대 5개)
				<div class="swiper-container s1">
    				<div class="swiper-wrapper">
     	 				 <c:forEach var="dreamCountry" items="${countryList}" varStatus="status">
							<c:if test="${status.index%8 eq 0 && status.index ne 0}">
								</div><!-- row row-cols-1 row-cols-md-5 -->
								</div><!-- swiper-slide -->
							</c:if>
							<c:if test="${status.index%8 eq 0}">
			     				<div class="swiper-slide">
			     	 			<div class="row row-cols-1 row-cols-md-5">
							</c:if>
							<div class="card">
							    <img alt="" src="/resources/images/tripInfoimges/${dreamCountry.surveyImg}" width="80px" height="90px" style="overflow: hidden;">
					 			<p class="card-text" style="font-size: x-small;"> 
					 				<input type="hidden" value="${status.count}">
					   	 			<input  type="checkbox" id="dreamCountry${status.count}" value="${dreamCountry.surveyChoice}" class="dreamCountry">
					   	 	 		<input type="hidden" id="countryImg${status.count}" value="${dreamCountry.surveyImg}">
					   	 	 		<label  for="dreamCountry${status.count}">${dreamCountry.surveyChoice}</label>
		  						</p>
							</div> 
					
						</c:forEach> 
						<div id="checkDreamCountry"></div>
						<h6 class="addH6"></h6>
					</div><!-- wrapper -->
				</div><!-- s1 -->
   			 </div><!-- 가고싶은 도시 col-6 mx-auto  -->
  				 <div class="swiper-pagination"></div>
   				 <div class="swiper-scrollbar"></div>
		</div><!-- 가고싶은 도시 form-group End  -->
	</div><!-- 컨테이너 end 왜냐하면 스와이퍼 두개가 같은 컨테이너에 있으면 이름 다르게해도 자꾸 충돌일어남...  -->

	 	<div class="form-group">
	 		<div class="col-6 mx-auto">
	 			<b>여행스타일</b>(최대 3개)
					<div class="swiper-container s2">
    					<div class="swiper-wrapper">
     	 					 <c:forEach var="style" items="${tripStyleList}" varStatus="status">
								<c:if test="${status.index%8 eq 0 && status.index ne 0}">
									</div><!-- row row-cols-1 row-cols-md-5 -->
									</div><!-- swiper-slide -->
								</c:if>
								<c:if test="${status.index%8 eq 0}">
			     	 				<div class="swiper-slide">
			     	 				<div class="row row-cols-1 row-cols-md-5">
								</c:if>
								<div class="card">
						    		<img alt="" src="http://ipsumimage.appspot.com/50x60">
				 						<p class="card-text"> 
				 							<input type="hidden" value="${status.count}">
								   	 		<input  type="checkbox" id="tripStyle${status.count}" value="${style.surveyChoice}" class="tripStyle">
								   	 		<input type="hidden" id="styleImg${status.count}" value="${style.surveyImg}">
								   	 	 	<label  for="tripStyle${status.count}">${style.surveyChoice}</label>
				  						</p>
								</div> 
							</c:forEach> 
							<div id="checkTripStyle"></div>
							<h6 class="addH6"></h6>
						</div><!-- wrapper -->
					</div><!-- s2 -->
   				 </div><!--여행스타일 col-6 mx-auto End -->
			</div><!-- 여행스타일 form-group End -->
	
	<div class="form-group">
	 		<div class="col-6 mx-auto ">
				<!-- <button type="button" class="btn btn-primary">회원가입</button> -->
				<button type="button" class="btn btn-primary"  data-backdrop="static" data-keyboard="false">회원가입</button>
				<button type="button" class="btn btn-secondary">취소</button>
	
			</div>
			<div class="alert alert-danger alert-dismissable" style="display: none;" >
			    <button type="button" class="close" >×</button>
			    <strong></strong>&nbsp; 수정 후 다시 시도해주세요.
			</div>
	</div>
	
	
	
	
	
	
	
	<input type="hidden" name="dreamCountry">
	<input type="hidden" name="tripStyle">
	
	
<!-- Modal -->
	<div class="modal fade" id="myModal" >
	  <div class="modal-dialog" role="document">
			<h2 style="color: white;"><b>알림수신여부체크</b></h2>
	    <div class="modal-content">
	      <div class="modal-body">
	      	<p>
	      	<b>Euroverse</b>는 정보제공을 위한 알림 서비스를 제공하고있습니다.
	      	알림 서비스를 이용하시겠습니까?
			</p>      	
	
			<input type="radio" name="pushAgree" id="pushAgreeTrue" value="T">
			<label for="pushAgreeTrue">동의하겠습니다.</label>
			
			<input type="radio" name="pushAgree" id="pushAgreeFalse" value="F">
			<label for="pushAgreeFalse">거절하겠습니다.</label>		
			
	      </div>
	     <!--  <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div> -->
	    </div>
	  </div>
	</div>
	
	</form>
	

	
	


 <script>
	
	$(".swiper-container").each(function(index, element){
	    var $this = $(this);
	    var swiper = new Swiper(this, {
	        // your settings ...
	    });
	})
  </script>
</body>

</html>