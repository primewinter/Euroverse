<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${ empty user }">
		<jsp:forward page="/"/>
	</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<title>Insert title here</title>
<style type="text/css">

   div.carousel-inner {
        width:540px;
        height: 320px;

    }

    .carousel-inner {
    }

    .carousel-inner>.carousel-item {
        width: 100%;
        height: 450px;

    }

.card{
	width: 60px;
	height:60px;
	margin: 6px;
}


.form-group{
	 content: ''; 
	 dispaly: table;
	 clear: both; 
}


.modal {
          text-align: center;
        }
        
@media screen and (min-width: 768px) {
          .modal:before {
            display: inline-block;
            vertical-align: middle;
            content: " ";
            height: 100%;
          }
        }
        .modal-dialog {
          display: inline-block;
          text-align: left;
          vertical-align: middle;
         
        }
        .modal-body{
        
        }



/*  .custom-file-input ~ .custom-file-label::after {
    content: " 프로필사진 등록 ";
}
 */
 
 
 .col{
font-size: 12px;

}
</style>


<script type="text/javascript">

$(function(){
	var h6 = document.getElementsByClassName("h6Class");
	var nickname = $("#nickname");
	var phone = $("input[name='phone']");
	var phone1 = $("#phone1");
	var phone2 = $("#phone2");
	var phone3 = $("#phone3");
	
	$("input[name='email']").val($("#emailId").val()+"@"+$("#choiceEmail").val());
	var email =  $("input[name='email']");
	var emailId = $("#emailId");
	
	
	
	
	$(document).on('keyup','#nickname',function(){
		for(var i=0;i<nickname.val().length;i++){
			if(nickname.val()[i] == " "){
				nickname.val(nickname.val().replace(" ", ""));
			}
		}
		 if(nickname.val().length <2 || nickname.val().length > 10){
			h6[1].innerHTML = "닉네임은 2~10자 입니다.";
			return;
		}
		 
		 if(nickname.val() == "${user.nickname}"){
			 h6[1].innerHTML = ""; 
			 return;
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
					h6[1].innerHTML ="";
				}else{
					h6[1].innerHTML ="중복된 닉네임입니다.";
				}
			}//success
		})//ajax
		
		}
	})
	
	
	
	$(document).on('keyup','#phone1',function(){
		if(phone1.val().length > 3){
			h6[2].innerHTML="핸드폰 번호를 확인해주세요.";
		}else{
			h6[2].innerHTML="";
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
			h6[2].innerHTML="핸드폰 번호를 확인해주세요.";
		}else{
			h6[2].innerHTML="";
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
			h6[2].innerHTML="핸드폰 번호를 확인해주세요.";
		}else{
			h6[2].innerHTML="";
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
		
		/* if(${user} == null){
			$(self.location).attr("href","/");
		}
		 */
		$("#checkPwd").modal({keyboard: false,backdrop: 'static'});
		$("#checkPwd").modal("show");
		
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
		
		
	})
	
	
	
	
	$(function(){
		$(".btn-primary:contains('수정')").on("click",function(){
			var nickname = $("input[name='nickname']");
			var pushAgree = $("input:radio[name='pushAgree']"); 
			
			var phone1 = $("#phone1");
			var phone2 = $("#phone2");
			var phone3 = $("#phone3");
			var phone = $("input[name='phone']");
				phone.val(phone1.val()+"-"+phone2.val()+"-"+phone3.val());
			
			var emailId = $("#emailId");
			var choiceEmail = $("#choiceEmail");
			var email = $("input[name='email']")
				email.val(emailId.val()+"@"+choiceEmail.val());
			
			var h6 = document.getElementsByClassName("h6Class");
			
			
			if($("input:radio[name='pushAgree']").is(":checked") == false){
				alert("수신여부를 선택해주세요");
				return;
			}
			
			if($.trim(email.val())=="@"+null){
				alert("이메일을 확인해주세요.");
				return;
			}else if ($.trim(email.val()) != "" && (email.val().indexOf('@') < 1 || email.val().indexOf('.') == -1)) {
				
				alert("이메일 형식이 아닙니다.");
				return;
			}else if($.trim(email.val()) != email.val()){
				
				alert("이메일에 띄어쓰기는 사용할 수 없습니다.");
				return;
			} 
			
			if($.trim(phone.val()).length <10){
				
				alert("휴대폰 번호를 확인해주세요.");
				return;
			} 
			
			for(var i=0 ; i<h6.length ; i++){
				if(h6[i].innerHTML != ""){
					
					alert(h6[i].innerHTML);
					return;
				}
			}
			
			 
			for(var i=0;i<=$("input:checkbox[class=dreamCountry]").length;i++){
				 if($("input:checkbox[id=dreamCountry"+i+"]").is(":checked") == true) {
					  var value = $("input:checkbox[id=dreamCountry"+i+"]").val();
					  var countryImg = $("#countryImg"+i).val();
					  
					  $("#checkDreamCountry").append("<input type='hidden' name='dreamCountry' value='"+value+"'>");
					  $("#checkDreamCountry").append("<input type='hidden' name='countryImg' value='"+countryImg+"'>'")
				} 
			}/* for End */	 
			
			for(var i=0;i<=$("input:checkbox[class=tripStyle]").length;i++){
				if($("input:checkbox[id=tripStyle"+i+"]").is(":checked")==true){
					var value = $("input:checkbox[id=tripStyle"+i+"]").val();
					var styleImg = $("#styleImg"+i).val();
					 $("#checkTripStyle").append("<input type='hidden' name='tripStyle' value='"+value+"'>");
					 $("#checkTripStyle").append("<input type='hidden' name='styleImg' value='"+styleImg+"'>");
				}
			}/* for End(tripStyle) */
			
			
			
			$("#updateForm").attr("action","/user/updateUser").attr("method","post").attr("enctype","multipart/form-data").submit();
		})
		
		
		
		$(".btn-secondary:contains('취소')").on("click",function(){
			$(self.location).attr("href","/user/getUser");
		})
		$(".btn-primary:contains('취소')").on("click",function(){
			$(self.location).attr("href","/user/getUser");
		})
		
		$(".btn-primary:contains('비밀번호체크')").on("click",function(){
		
			var pwd = $("input[id='pwdId']");
			var main = $("#main");
			var errorMsg = $("#pwdMessage");
			if('${user.pwd}' == pwd.val()){
				$("#checkPwd").modal("hide");
				main.prop("style","display : block");
				
				
			}else{
				errorMsg.text("비밀번호가 틀렸습니다.");
			}
		})
		
		$("#pwdId").keydown(function (key) {
			
			
			enterConfirm(key);
			
		})
	 
		
		
		$(".custom-file-input").on("change",function(){
			  var fileSize = this.files[0].size;
			    var maxSize = 360 * 360;
			    if(fileSize > maxSize) {
			        alert("파일용량을 초과하였습니다.");
			        $(".custom-file label").html("");
			       // $("#imgTag").prop("src","");
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
			 var image = $('#imgTag').attr('src',e.target.result).attr('width','300px').attr('height','300px');
			 console.log(e.target.result);
				 $("#imgTag").html("<img src="+e.target.result+" style='border-color: #E6E6E6; border: 10px;'>");
		}
		 render.readAsDataURL(input.files[0]);
	}
}
	

function unReg(){
		
		alert("탈퇴")
		$(self.location).attr("href","/user/unRegUser");
	
}



function enterConfirm(key){
	var pwd = $("input[id='pwdId']");
	var main = $("#main");
	var errorMsg = $("#pwdMessage");

	if(key.keyCode == 13){
		if('${user.pwd}' == pwd.val()){
			$("#checkPwd").modal("hide");
			main.prop("style","display : block");
		}else{
			errorMsg.text("비밀번호가 틀렸습니다.");
		}
	}



}

	
</script>

</head>
<body>
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>
<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>
<div id="main" style="display: none">
<p style="font-size:30px; margin-left:500px; margin-top: 50px; margin-bottom: -20px" >
내정보수정<br><hr style="width: 600px;margin-bottom: -5px;">
<small style="margin-left:500px;margin-right: 400px; ">정보를 입력해주세요.</small>
	<small>
	
 <i class="fas fa-user-times" onclick="unReg()">회원탈퇴</i>
	</small>

</p>

<div class="row">
	<div style="width: 380px;">	</div>
	
	<div>
	
     	<form id="updateForm">
     
		      <div style="text-align: center;">
		     		<div id="userImgDiv" style="text-align: center;">
		     			<img alt="" id="imgTag" src="/resources/images/userImages/${user.userImg}" style="width: 200px;height: 200px;border-radius: 100px;" >
						
		     		</div>
					<div class="custom-file" style="width: 150px;">
					  <input type="file" class="custom-file-input" id="image" name="image" accept="image/*" >
					  <label class="custom-file-label" for="customFile"data-browse="프로필이미지 변경" ></label>  
		   			</div>
		   			<h6 class="h6Class"></h6>
		      </div>
      
		      <div style="width: 350px;" >
		      			닉네임
		     		<div  style="text-align: center;">
		     			<div class="form-row">
						    <div class="form-group col">
		     					<input type="text" class="form-control" value="${user.nickname}" name="nickname" id="nickname">
		     				</div>
		     			</div>
		     				<h6 class="h6Class" id="nicknameh6"></h6>
		     		
		     		</div>
		      </div>
      
      		<div>
		     			핸드폰번호
		     			  <div class="row" style="text-align: center;">
		     			<div class="col-3">
		     			 <div class="form-row">
						    <div class="form-group col">
						      <input type="text" class="form-control" value="${user.phone1}" id="phone1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3" > 
						    </div>
						    <div class="form-group col">
						    <input type="text" class="form-control" value="${user.phone2}" id="phone2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"> 
						    </div>
						    <div class="form-group col">
						      <input type="text" class="form-control" value="${user.phone3}" id="phone3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
						    </div>
						  <h6 class="h6Class"></h6>
						  </div>
				        <input type="hidden" name="phone"> 
		     		</div>
		    	  </div>
		      
     		</div>
      
       <div class="row">
      		<div class="col-5" style="text-align: right;">
     			이메일
     		</div>
     		<div class="col-3" style="text-align: center;">
     			<div class="form-row">
				    <div class="form-group col">
     					<input type="text" class="form-control"  placeholder="email" id="emailId"  value="${user.emailId}">
     					
     				</div>
     				
     				 <div class="form-group col">
     				 
     				 <c:if test="${user.choiceEmail=='gmail.com'}">
	     				<select class="custom-select" id="choiceEmail">
						    <option value="gmail.com" selected="selected">gmail.com</option>
						    <option value="naver.com" >naver.com</option>
						    <option value="daum.net">daum.net</option>
						    <!-- 셀렉트 된 값이 없으면 기본 값 집어넣기-->
					 	</select>
					 </c:if>
					 
					 <c:if test="${user.choiceEmail=='naver.com'}">
	     				<select class="custom-select" id="choiceEmail">
						    <option value="gmail.com" >gmail.com</option>
						    <option value="naver.com" selected="selected">naver.com</option>
						    <option value="daum.net">daum.net</option>
						    <!-- 셀렉트 된 값이 없으면 기본 값 집어넣기-->
					 	</select>
					 </c:if>
					 
					 <c:if test="${user.choiceEmail=='daum.net'}">
	     				<select class="custom-select" id="choiceEmail">
						    <option value="gmail.com" >gmail.com</option>
						    <option value="naver.com" >naver.com</option>
						    <option value="daum.net" selected="selected">daum.net</option>
						    <!-- 셀렉트 된 값이 없으면 기본 값 집어넣기-->
					 	</select>
					 </c:if>	
					 
					 <!--걍 유저일때 보이게....  -->
					 <c:if test="${user.choiceEmail=='user.com'}">
	     				<select class="custom-select" id="choiceEmail">
						    <option value="gmail.com">gmail.com</option>
						    <option value="naver.com" >naver.com</option>
						    <option value="daum.net">daum.net</option>
						    <!-- 셀렉트 된 값이 없으면 기본 값 집어넣기-->
					 	</select>
					 </c:if>	
					 	
					 	<!-- 더미데이터때문에 집어넣어둔거 나중에 삭제하자 -->
					 <c:if test="${user.choiceEmail=='google.com'}">
	     				<select class="custom-select" id="choiceEmail">
						    <option value="gmail.com" selected="selected">gmail.com</option>
						    <option value="naver.com" >naver.com</option>
						    <option value="daum.net">daum.net</option>
						    <!-- 셀렉트 된 값이 없으면 기본 값 집어넣기-->
					 	</select>
					 </c:if>	
					 	
						    <input type="hidden" name="email">
				 	</div>
     				<h6 class="h6Class"></h6>
     			</div>
     		
     		</div>
      </div>
      
      
       <div class="row">
      		<div class="col-5" style="text-align: right;">
     			알림수신여부
     		</div>
     		<div class="col-3" style="text-align: center;">
     		
     		
     		
     		<c:if test="${user.pushAgree == 'T'}" > 
     			<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="pushAgree" id="pushAgreeTrue" value="T" checked="checked">
					  <label class="form-check-label" for="inlineRadio1">동의합니다.</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="pushAgree" id="pushAgreeFalse" value="F">
					  <label class="form-check-label" for="inlineRadio2">거절합니다.</label>
					  <!-- 유저가 가지고 있는값 체크 되있도록 여부체크하기  -->
				</div>
			</c:if>
				
			<c:if test="${user.pushAgree == 'F'}" >	
				<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="pushAgree" id="pushAgreeTrue" value="T" >
					  <label class="form-check-label" for="inlineRadio1">동의합니다.</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="pushAgree" id="pushAgreeFalse" value="F"checked="checked">
					  <label class="form-check-label" for="inlineRadio2">거절합니다.</label>
					  <!-- 유저가 가지고 있는값 체크 되있도록 여부체크하기  -->
				</div>
			</c:if>	
				
		
      </div>
     </div> 
      
       
      
     
<div class="form-group">
	 <div class="col-6 mx-auto ">	
	<b>가고싶은 나라</b><small>(최대5개)</small>
      <div id="country-carousel" class="carousel slide" data-ride="carousel">
            <!-- 슬라이드 쇼 -->
            <div class="carousel-inner">
                <!--첫번째 슬라이드-->
                <div class="carousel-item active">
                    <!--<img class="d-block w-100" src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="First slide">-->
                    <!-- <div class="carousel-caption d-none d-md-block" style=""> -->
                    <div class="row">

						<c:forEach var="dreamCountry" items="${countryList}" varStatus="status" begin="0" end="9">
								<div class="col" style="margin-top: 30px; text-align: center;">
						    		 <img alt="" src="/resources/images/tripInfoimges/${dreamCountry.surveyImg}" width="80px" height="80px" style="overflow: hidden;">
				 							<input type="hidden" value="${status.index}">
								   	 		<input  type="checkbox" id="dreamCountry${status.index}" value="${dreamCountry.surveyChoice}" class="dreamCountry">
								   	 		<input type="hidden" id="countryImg${status.index}" value="${dreamCountry.surveyImg}">
								   	 	 	<label  for="dreamCountry${status.index}">${dreamCountry.surveyChoice}</label>
								</div>
							</c:forEach> 
							 
                    </div>
                </div>
                <!--두번째 슬라이드-->
                <div class="carousel-item" >
                     <div class="row">
						
						<c:forEach var="dreamCountry" items="${countryList}" varStatus="status" begin="10" end="19">
								<div class="col" style="margin-top: 30px; text-align: center;">
						    		 <img alt="" src="/resources/images/tripInfoimges/${dreamCountry.surveyImg}" width="80px" height="80px" style="overflow: hidden;">
				 							<input type="hidden" value="${status.index}">
								   	 		<input  type="checkbox" id="dreamCountry${status.index}" value="${dreamCountry.surveyChoice}" class="dreamCountry">
								   	 		<input type="hidden" id="countryImg${status.index}" value="${dreamCountry.surveyImg}">
								   	 	 	<label  for="dreamCountry${status.index}">${dreamCountry.surveyChoice}</label>
								</div>
							</c:forEach>                     


                    </div>
                </div>
                
                <div class="carousel-item" >
                     <div class="row">
						
						<c:forEach var="dreamCountry" items="${countryList}" varStatus="status" begin="20" end="29">
								<div class="col" style="margin-top: 30px; text-align: center;">
						    		 <img alt="" src="/resources/images/tripInfoimges/${dreamCountry.surveyImg}" width="80px" height="80px" style="overflow: hidden;">
				 							<input type="hidden" value="${status.index}">
								   	 		<input  type="checkbox" id="dreamCountry${status.index}" value="${dreamCountry.surveyChoice}" class="dreamCountry">
								   	 		<input type="hidden" id="countryImg${status.index}" value="${dreamCountry.surveyImg}">
								   	 	 	<label  for="dreamCountry${status.index}">${dreamCountry.surveyChoice}</label>
								</div>
							</c:forEach>                     


                    </div>
                </div>
                
                
                <div class="carousel-item" >
                     <div class="row">
						
						<c:forEach var="dreamCountry" items="${countryList}" varStatus="status" begin="30" end="39">
								<div class="col" style="margin-top: 30px; text-align: center;">
						    		 <img alt="" src="/resources/images/tripInfoimges/${dreamCountry.surveyImg}" width="80px" height="80px" style="overflow: hidden;">
				 							<input type="hidden" value="${status.index}">
								   	 		<input  type="checkbox" id="dreamCountry${status.index}" value="${dreamCountry.surveyChoice}" class="dreamCountry">
								   	 		<input type="hidden" id="countryImg${status.index}" value="${dreamCountry.surveyImg}">
								   	 	 	<label  for="dreamCountry${status.index}">${dreamCountry.surveyChoice}</label>
								</div>
							</c:forEach>                     


                    </div>
                </div>
                
                
                <div class="carousel-item">
                     <div class="row">
						
						<c:forEach var="dreamCountry" items="${countryList}" varStatus="status" begin="40" >
								<div class="col" style="margin-top: 30px; text-align: center;">
						    		 <img alt="" src="/resources/images/tripInfoimges/${dreamCountry.surveyImg}" width="80px" height="80px" style="overflow: hidden;">
				 							<input type="hidden" value="${status.index}">
								   	 		<input  type="checkbox" id="dreamCountry${status.index}" value="${dreamCountry.surveyChoice}" class="dreamCountry">
								   	 		<input type="hidden" id="countryImg${status.index}" value="${dreamCountry.surveyImg}">
								   	 	 	<label  for="dreamCountry${status.index}">${dreamCountry.surveyChoice}</label>
								</div>
							</c:forEach>                     


                    </div>
                </div>
                
                
                <!--세번째 슬라이드-->
<!--                 <div class="carousel-item" style="background-color: cornflowerblue;">
                    다다다다다다다ㅏ
                </div> -->
                <!-- / 슬라이드 쇼 끝 -->

                <!-- 왼쪽 오른쪽 화살표 버튼 시작 -->
                <a class="carousel-control-prev" href="#country-carousel" data-slide="prev" style="height: 50px; vertical-align: middle; margin-top: 130px;color: black;font-size: 30px;">
                   <i class="far fa-caret-square-left"></i>
                    <!-- <span>Previous</span> --> </a>

                <a class="carousel-control-next" href="#country-carousel" data-slide="next" style="height: 50px; vertical-align: middle; margin-top: 130px;color: black;font-size: 30px;">
                  <i class="far fa-caret-square-right"></i>
                    <!-- <span>Next</span> --> </a>
                <!-- 왼쪽 오른쪽 화살표 버튼 끝 -->

            </div>
        </div>
	</div>
</div>	


	
	

<div class="form-group">
	 <div class="col-6 mx-auto ">	
	<b>나의 여행스타일</b><small>(최대3개)</small>
      <div id="main-carousel" class="carousel slide" data-ride="carousel">
            <!-- 슬라이드 쇼 -->
            <div class="carousel-inner">
                <!--첫번째 슬라이드-->
                <div class="carousel-item active" >
                    <!--<img class="d-block w-100" src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="First slide">-->
                    <!-- <div class="carousel-caption d-none d-md-block" style=""> -->
                    <div class="row">

						<c:forEach var="style" items="${tripStyleList}" varStatus="status" begin="0" end="9">
								<div class="col" style="margin-top: 30px; text-align: center;">
						    		<img alt="" src="/resources/images/tripInfoimges/${style.surveyImg}" style="overflow: hidden" width="80px;"height="80px;">
				 							<input type="hidden" value="${status.index}">
								   	 		<input  type="checkbox" id="tripStyle${status.index}" value="${style.surveyChoice}" class="tripStyle">
								   	 		<input type="hidden" id="styleImg${status.index}" value="${style.surveyImg}">
								   	 	 	<label  for="tripStyle${status.index}">${style.surveyChoice}</label>

								</div>
							</c:forEach> 
                    </div>
                </div>
                <!--두번째 슬라이드-->
                <div class="carousel-item" >
                     <div class="row">
						<c:forEach var="style" items="${tripStyleList}" varStatus="status" begin="10" >
								<div class="col" style="margin-top: 60px; text-align: center;">
						    		<img alt="" src="/resources/images/tripInfoimges/${style.surveyImg}" style="overflow: hidden" width="80px;"height="80px;">
				 						<p class="card-text"> 
				 							<input type="hidden" value="${status.index}">
								   	 		<input  type="checkbox" id="tripStyle${status.index}" value="${style.surveyChoice}" class="tripStyle">
								   	 		<input type="hidden" id="styleImg${status.index}" value="${style.surveyImg}">
								   	 	 	<label  for="tripStyle${status.index}">${style.surveyChoice}</label>
				  						</p>
								</div> 
							</c:forEach>                       
                    </div>
                </div>
                <a class="carousel-control-prev" href="#main-carousel" data-slide="prev"  style="height: 50px; vertical-align: middle; margin-top: 130px;color: black;font-size: 30px;">
                   <i class="far fa-caret-square-left"></i>
                    <!-- <span>Previous</span> --> </a>

                <a class="carousel-control-next" href="#main-carousel" data-slide="next" style="height: 50px; vertical-align: middle; margin-top: 130px;color: black;font-size: 30px;">
                   <i class="far fa-caret-square-right"></i>
                    <!-- <span>Next</span> --> </a>
                <!-- 왼쪽 오른쪽 화살표 버튼 끝 -->
            </div>
        </div>
	</div>
</div>
	<div id="checkDreamCountry"></div>
	<div  id="checkTripStyle"></div>	

	
     
     	 <div class="form-group">	 
	     		<div class="col-6 mx-auto" style="text-align: center;">
     			<button type="button" class="btn btn-primary" >수정</button>
				<button type="button" class="btn btn-secondary">취소</button>
     			</div>
      </div>
     
     
</div><!-- id main Div End -->    
     
     
     
      
	 
 
 
	
     	</form>
     	</div>
   </div>
<jsp:include page="/toolbar/footer.jsp"></jsp:include>
   
   
   
   
       
       
<div class="modal fade " id="checkPwd">
	  <!-- <div class="modal-dialog modal-lg"> -->
	  <div class="modal-dialog ">
	  	<!-- <h2 style="color : #FFFFFF">Sign In</h2> -->
	  
		<div class="modal-content" style="border-radius: 5px; padding:  10px 20px;">
			 <!-- 	<div class="modal-header">
				</div>modal header End 
 			-->
				 
				
			
		<div class="modal-body" >
			<form>
					<div class="form-group  text-center">
						<label for="pwd" style="margin-bottom: 15px;">Password</label>
						 <input type="password"	class="form-control" placeholder="Enter password" id="pwdId" name="pwd" style="width: 180px;">
						 <input type="text" style="display: none;" >
						 <div id="pwdMessage" style="color: red;"></div>
					</div>
						
						
					<div class="form-group text-center" style="padding-top: 5px;">
					<button type="button" class="btn btn-primary" style="margin-right: 5px;">비밀번호체크</button>
					<button type="button" class="btn btn-primary">취소 </button>
					</div>
			</form>


			<!-- 	<div class="modal-footer">
				</div>modal footer End  -->

				</div><!--modal body End  -->

			</div><!--modal content End  --> 
	  </div><!--modal dialog End  -->

</div><!--myModal End  -->
     

 <script>
	
  </script>
</body>
</html>