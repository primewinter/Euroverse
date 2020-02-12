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

<!-- jquery Ui ��ũ (datePicker)  -->
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

h6{
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
    content: "�����ʻ��� ���";
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
	

	
var userId = $("input[name='userId'");
var pwd = $("input[name='pwd']");
var pwdConfirm = $("#pwdConfirm");
var userName = $("input[name='userName']");
var nickname = $("input[name='nickname']");
$("input[name='email']").val($("#emailId").val()+"@"+$("#choiceEmail").val());
var email =  $("input[name='email']");
var emailId = $("#emailId");

var birth = $("input[name='birth']");
var sex = $("input[name='sex']");
$("input[name='phone']").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
var phone = $("input[name='phone']");
var phone1 = $("#phone1");
var phone2 = $("#phone2");
var phone3 = $("#phone3");

var image = $("input[name='image']");

var h6 = document.getElementsByTagName('h6');

	$(document).on('keyup', '#userId', function(event) {
		
		for(var i=0;i<userId.val().length;i++){
			if(userId.val()[i] == " "){
				userId.val(userId.val().replace(" ", ""));
			}
			userId.val(userId.val().replace(/[^\\!-z]/gi,""));
			userId.val(userId.val().replace(/[~!@\]\[\#$%;,.\/^&*\()\-=+_'\\\"]/gi,""));
		}
		if(userId.val().length <4 || userId.val().length > 12 ){
			h6[0].innerHTML ="���̵�� 4~12�� �Դϴ�.";
		}else{
			if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,12}$/.test(userId.val()) == false){
				h6[0].innerHTML = "���̵�� �ּ� �ϳ��� �ҹ���,�빮�� �� ���ڰ� ���ԵǾ�� �մϴ�."
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
					h6[0].innerHTML ="�ߺ��� ���̵��Դϴ�.";
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
			h6[1].innerHTML = "��й�ȣ�� 6~20�� �Դϴ�.";
		}		
		else{
			if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/.test(pwd.val()) == false){
				h6[1].innerHTML = "��й�ȣ�� �ּ� �ϳ��� �ҹ���,�빮�� �� ���ڰ� ���ԵǾ�� �մϴ�."
			}else{
				h6[1].innerHTML = "";
			}
		}
		if(pwd.val() != pwdConfirm.val()){
			h6[2].innerHTML = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
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
			h6[2].innerHTML = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
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
			h6[3].innerHTML = "�ܱ�����ΰ���? �̸��� ���� ����..."
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
			h6[4].innerHTML = "�г����� 2~10�� �Դϴ�.";
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
					h6[4].innerHTML ="�ߺ��� �г����Դϴ�.";
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
			h6[8].innerHTML="�ڵ��� ��ȣ�� Ȯ�����ּ���.";
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
			h6[8].innerHTML="�ڵ��� ��ȣ�� Ȯ�����ּ���.";
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
			h6[8].innerHTML="�ڵ��� ��ȣ�� Ȯ�����ּ���.";
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
		
		
		var userId = $("input[name='userId']");
		var pwd = $("input[name='pwd']");
		var pwdConfirm = $("#pwdConfirm");
		var userName = $("input[name='userName']");
		var nickname = $("input[name='nickname']");
		$("input[name='email']").val($("#emailId").val()+"@"+$("#choiceEmail").val());
		var email =  $("input[name='email']");
		var birth = $("input[name='birth']");
		var sex = $("input[name='sex']");
		$("input[name='phone']").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
		var phone = $("input[name='phone']");
		var image = $("input[name='image']");
		var dreamCity = $("input[name='dreamCity']");
		var tripStyle = $("input[name='tripStyle']");
		
		var submitAlert = $(".alert-danger");
		var alertMessage = $(".alert-danger strong");
		
		var h6 = document.getElementsByTagName('h6');
	
		 
		for(var i=1;i<=$("input:checkbox[class=dreamCity]").length;i++){
			 if($("input:checkbox[id=dreamCity"+i+"]").is(":checked") == true) {
				  var value = $("input:checkbox[id=dreamCity"+i+"]").val();
				  $("#checkDreamCity").append("<input type='hidden' name='dreamCity' value='"+value+"'>");
			} 
		}/* for End */	 
		
		for(var i=1;i<=$("input:checkbox[class=tripStyle]").length;i++){
			if($("input:checkbox[id=tripStyle"+i+"]").is(":checked")==true){
				var value = $("input:checkbox[id=tripStyle"+i+"]").val();
				 $("#checkTripStyle").append("<input type='hidden' name='tripStyle' value='"+value+"'>");
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
			alertMessage.html("���̵� Ȯ�����ּ���.");
			return;
			
			
			
		}else if($.trim(userId.val()) != userId.val()){
			submitAlert.prop("style","display : block");
			alertMessage.html("���̵� ����� ����� �� �����ϴ�.");
			return;
		}else{
			
			/* for(var i=0;i<userId.val().length;i++){
				if(userId.val()[i] == " "){
					submitAlert.prop("style","display : block");
					alertMessage.html("���̵� ����� ����� �� ���ٰ� ���ݾ�!!!!!!!!!!!!!!!!!!!!!!!!.");
					return;
				}
			}
			 */
			
		}
		
		if($.trim(pwd.val())==""){
			submitAlert.prop("style","display : block");
			alertMessage.html("��й�ȣ�� Ȯ�����ּ���.");
			return;
		}else if($.trim(pwd.val()) != pwd.val()){
			submitAlert.prop("style","display : block");
			alertMessage.html("��й�ȣ�� ����� ����� �� �����ϴ�.");
			return;
		}
		
		if($.trim(pwdConfirm.val()) ==""){
			submitAlert.prop("style","display : block");
			alertMessage.html("��й�ȣ�� Ȯ�����ּ���.");
			return;
		}
		
		if($.trim(userName.val())==""){
			submitAlert.prop("style","display : block");
			alertMessage.html("�̸��� Ȯ�����ּ���.");
			return;
		}else if($.trim(userName.val()) != userName.val()){
			submitAlert.prop("style","display : block");
			alertMessage.html("�̸��� ����� ����� �� �����ϴ�.");
			return;
		}
		
		if($.trim(nickname.val()) ==""){
			submitAlert.prop("style","display : block");
			alertMessage.html("�г����� Ȯ�����ּ���.");
			return;
		}else if($.trim(nickname.val()) != nickname.val()){
			submitAlert.prop("style","display : block");
			alertMessage.html("�г��ӿ� ����� ����� �� �����ϴ�.");
			return;
		}
		
		if($.trim(birth.val())==""){
			submitAlert.prop("style","display : block");
			alertMessage.html("������ Ȯ�����ּ���.");
			return;
		}
		
		if($.trim(email.val())=="@"+null){
			submitAlert.prop("style","display : block");
			alertMessage.html("�̸����� Ȯ�����ּ���.");
			return;
		}else if ($.trim(email.val()) != "" && (email.val().indexOf('@') < 1 || email.val().indexOf('.') == -1)) {
			submitAlert.prop("style","display : block");
			alertMessage.html("�̸��� ������ �ƴմϴ�.");
			return;
		}else if($.trim(email.val()) != email.val()){
			submitAlert.prop("style","display : block");
			alertMessage.html("�̸��Ͽ� ����� ����� �� �����ϴ�.");
			return;
		} 
		
		if($.trim(phone.val()).length <10){
			submitAlert.prop("style","display : block");
			alertMessage.html("�޴��� ��ȣ�� Ȯ�����ּ���.");
			return;
		} 
		
		
		if($("input:radio[name='sex']").is(":checked") == false){
			submitAlert.prop("style","display : block");
			alertMessage.html("������ �������ּ���.");
			return;
		}
		
		
		
	/* 	
		 alert("      userId="+userId.val()
				+"   pwd="+pwd.val()
				+"   pwdConfirm="+pwdConfirm.val()
				+"   userName="+userName.val() 
				+"   nickname="+nickname.val()
				+"   email="+email.val()
				+"   birth="+birth.val()
				+"   sex="+sex.val()
				+"   phone="+phone.val()
				+"   image="+image.val()
 				+"   dreamCity="+dreamCity.val()
				+"   tripStyle="+tripStyle.val()); */
		 $("#myModal").modal({keyboard: false,backdrop: 'static'});
		 $("#myModal").modal("show");
		//$("form").attr("action","addUser").attr("method","post").attr("enctype","multipart/form-data").submit();
		//h6�±� length���ϰ� ���������� �� "" ������ Ȯ���ϰ� ���Ժ����� �ϳ��� �ν�Ʈ�� �ƴ϶�� ���ٸ��̱�
		
		
	});/* btn-primary End */
});/* function End */







$(function(){

	$("input[name='pushAgree']").on("click",function(){
		$("form").attr("action","addUser").attr("method","post").attr("enctype","multipart/form-data").submit();
	})
	
	$(".alert-danger button").on("click",function(){
		$(".alert-danger").prop("style","display:none");			
	})
	
	$(".btn-secondary:contains('���')").on("click",function(){
		$(location).attr("href","/view/user/page.jsp");		
	})
	
	
	$("input[class='dreamCity']").on("click",function(){
		if($("input:checkbox[class=dreamCity]:checked").length > 5){
			alert("5�������� ���� �����մϴ�.");
			$("input:checkbox[id=dreamCity"+$(this).prev().val()+"]").prop("checked",false);
		}
	})
	
	$("input[class='tripStyle']").on("click",function(){
		if($("input:checkbox[class=tripStyle]:checked").length > 3){
			alert("3�������� ���� �����մϴ�.");
			$("input:checkbox[id=tripStyle"+$(this).prev().val()+"]").prop("checked",false);
		}
	})
	
 
	$(".custom-file-input").on("change",function(){
		  var fileSize = this.files[0].size;
		    var maxSize = 360 * 360;
		    if(fileSize > maxSize) {
		        alert("���Ͽ뷮�� �ʰ��Ͽ����ϴ�.");
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
			 var image = $('#preview').attr('src',e.target.result).attr('width','300px').attr('height','300px');
			 console.log(e.target.result);
				 $("#preview").html("<img src="+e.target.result+" style='border-color: #E6E6E6; border: 10px;'>");
		}
		 render.readAsDataURL(input.files[0]);
	}
}









</script>

</head>
<body>
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<div class="col-4 mx-auto">
		<h1 class="display-1">ȸ������</h1>

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
			<h6></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<b>Password</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-lock"></i></span>
				<input type="password" class="form-control" placeholder="password" id="pwd" name="pwd">
			</div>
			<h6></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<b>PasswordConfirm</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-lock"></i></span>
				<input type="password" class="form-control" placeholder="password Confirm" id="pwdConfirm">
			</div>
			<h6></h6>
		</div>
	</div>
	

	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<b>Name</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-user"></i></span>
				<input type="text" class="form-control" placeholder="Only Korean" name="userName" id="userName" onkeypress="if(!(event.keyCode < 47 && event.keyCode > 58)) event.returnValue=false;">
			</div>
			<h6></h6>
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
			<h6></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
		<b>Birth</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-baby"></i></span>
				<span class="input-group-append"><input type="text" class="form-control" placeholder="birth" name="birth" readonly="readonly" id="datepicker"></span>
			</div>
			<h6></h6>
				
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
			    <!--�̸��� �� �����ϱ� email���������� ����� +@+choiceEmail.val() ���ϱ�  -->
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
				    <!--�̸��� �� �����ϱ� email���������� ����� +@+choiceEmail.val() ���ϱ�  -->
				 	</select>
				
				</c:if>
			 	
			 	
			 	
			 	<input type="hidden" name="email" id="email">
			</div>
			<h6></h6>
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
			<h6></h6>
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
		      <input type="hidden" name="phone"> 
		    </div>
		    <h6></h6>
		</div>
 	 </div>
 	 
 	  <div class="form-group">
	 	<div class="col-6 mx-auto">
	 		<b>Profile Image</b>
			<c:if test="${loginType!='sns'}">
			<div class="custom-file">
			  <input type="file" class="custom-file-input" id="image" name="image" accept="image/*" >
			  <label class="custom-file-label" for="customFile" ><i class="fas fa-camera-retro">size 360x360</i> </label>  
			  <!-- ������ �̹��� �̸����� �����! ���������� �ɾ�α�!~~~ -->
			</div>
			<h6></h6>
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
	 		<b>������� ����</b>(�ִ� 5��)
				<div class="swiper-container s1">
    				<div class="swiper-wrapper">
     	 				 <c:forEach var="dreamCity" items="${cityList}" varStatus="status">
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
					   	 			<input  type="checkbox" id="dreamCity${status.count}" value="${dreamCity}" class="dreamCity">
					   	 	 		<label  for="dreamCity${status.count}">${dreamCity}</label>
		  						</p>
							</div> 
					
						</c:forEach> 
						<div id="checkDreamCity"></div>
						<h6></h6>
					</div><!-- wrapper -->
				</div><!-- s1 -->
   			 </div><!-- ������� ���� col-6 mx-auto  -->
  				 <div class="swiper-pagination"></div>
   				 <div class="swiper-scrollbar"></div>
		</div><!-- ������� ���� form-group End  -->
	</div><!-- �����̳� end �ֳ��ϸ� �������� �ΰ��� ���� �����̳ʿ� ������ �̸� �ٸ����ص� �ڲ� �浹�Ͼ...  -->

	 	<div class="form-group">
	 		<div class="col-6 mx-auto">
	 			<b>���ེŸ��</b>(�ִ� 3��)
					<div class="swiper-container s2">
    					<div class="swiper-wrapper">
     	 					 <c:forEach var="style" items="${tripStyle}" varStatus="status">
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
								   	 		<input  type="checkbox" id="tripStyle${status.count}" value="${style}" class="tripStyle">
								   	 	 	<label  for="tripStyle${status.count}">${style}</label>
				  						</p>
								</div> 
							</c:forEach> 
							<div id="checkTripStyle"></div>
							<h6></h6>
						</div><!-- wrapper -->
					</div><!-- s2 -->
   				 </div><!--���ེŸ�� col-6 mx-auto End -->
			</div><!-- ���ེŸ�� form-group End -->
	
	<div class="form-group">
	 		<div class="col-6 mx-auto ">
				<!-- <button type="button" class="btn btn-primary">ȸ������</button> -->
				<button type="button" class="btn btn-primary"  data-backdrop="static" data-keyboard="false">ȸ������</button>
				<button type="button" class="btn btn-secondary">���</button>
	
			</div>
			<div class="alert alert-danger alert-dismissable" style="display: none;" >
			    <button type="button" class="close" >��</button>
			    <strong></strong>&nbsp; ���� �� �ٽ� �õ����ּ���.
			</div>
	</div>
	
	
	
	
	
	
	
	<input type="hidden" name="dreamCity">
	<input type="hidden" name="tripStyle">
	
	
<!-- Modal -->
	<div class="modal fade" id="myModal" >
	  <div class="modal-dialog" role="document">
			<h2 style="color: white;"><b>�˸����ſ���üũ</b></h2>
	    <div class="modal-content">
	      <div class="modal-body">
	      	<p>
	      	<b>Euroverse</b>�� ���������� ���� �˸� ���񽺸� �����ϰ��ֽ��ϴ�.
	      	�˸� ���񽺸� �̿��Ͻðڽ��ϱ�?
			</p>      	
	
			<input type="radio" name="pushAgree" id="pushAgreeTrue" value="T">
			<label for="pushAgreeTrue">�����ϰڽ��ϴ�.</label>
			
			<input type="radio" name="pushAgree" id="pushAgreeFalse" value="F">
			<label for="pushAgreeFalse">�����ϰڽ��ϴ�.</label>		
			
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