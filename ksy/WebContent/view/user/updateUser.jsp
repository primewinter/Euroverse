<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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



/*  .custom-file-input ~ .custom-file-label::after {
    content: " 프로필사진 등록 ";
}
 */
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
			var h6 = $("#pwdMessage");
			if('${user.pwd}' == pwd.val()){
				$("#checkPwd").modal("hide");
				main.prop("style","display : block");
				
				
			}else{
				h6.text("비밀번호가 틀렸습니다.");
			}
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
	
	
</script>

</head>
<body>
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4" style="display: none" id="main">
	
      <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">내정보수정</h1>
      </div> 
     	<form id="updateForm">
     
      <div class="row">
      		<div class="col-5">
     		</div>
     		<div id="userImgDiv" class="col-2" style="text-align: center;">
				<div class="form-row">
     			<img alt="" id="imgTag" src="/resources/images/userImages/${user.userImg}" style="width: 200px;height: 200px; border: 3px solid black; border-radius: 100px;-moz-border-radius: 100px;-khtml-border-radius: 100px;-webkit-border-radius: 100px;" >
				
					<div class="custom-file">
					  <input type="file" class="custom-file-input" id="image" name="image" accept="image/*" >
					  <label class="custom-file-label" for="customFile"data-browse="프로필이미지 변경" ></label>  
	     			</div>
	     			<h6 class="h6Class"></h6>
     			</div>
     		</div>
     		<div class="col">
     		</div>
     		<div class="col">
     		</div>
      </div>
      
      <div class="row">
      	<div class="col" >
      		</br><p></p>
      	</div>
      </div>
      
      <div class="row">
      		<div class="col-5" style="text-align: right;">
      			닉네임
     		</div>
     		<div class="col-2" style="text-align: center;">
     			<div class="form-row">
				    <div class="form-group col">
     					<input type="text" class="form-control" value="${user.nickname}" name="nickname" id="nickname">
     				</div>
     			</div>
     				<h6 class="h6Class" id="nicknameh6"></h6>
     		
     		</div>
     		<div class="col">
     		</div>
     		<div class="col">
     		</div>
      </div>
      
      <%--  <div class="row">
      	
     		<div class="col-5" style="text-align: right;">
     			비밀번호
     		</div>
     		<div class="col-2" style="text-align: center;">
     			<div class="form-row">
				    <div class="form-group col">
     					<input type="password" class="form-control" value="${user.nickname}" name="pwd" id="pwd">
     				</div>
     			</div>
     		</div>
     		<div class="col-2">
     		삼
     		</div>
     		<div class="col-2">
     		사
     		</div>
     	
      </div> --%>
      
      
       <div class="row">
      		<div class="col-5" style="text-align: right;">
     			핸드폰번호
     		</div>
     		<div class="col-3" style="text-align: center;">
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
     		<div class="col">
     		</div>
     		<div class="col">
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
     		<div class="col">
     		</div>
     		<div class="col">
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
     		<div class="col">
     			
	 	
     		
     		</div>
     		<div class="col">
     		</div>
      </div>
      
      
       
      
      
       <div class="row">
      		<div class="col">
      			<p></p>
     		</div>
     		<div class="col">
     		</div>
     		<div class="col">
     		</div>
     		<div class="col">
     		</div>
      </div>
      
       <div class="row">
      		<div class="col">
     		</div>
     		<div class="col">
     		</div>
     		<div class="col">
     		</div>
     		<div class="col">
     		</div>
      </div>
      

      

 		
 				 <div class="form-group">
	 	<div class="col-6 mx-auto">
				<div class="swiper-container s1">
	 		<b>가고싶은 나라</b>(최대 5개)
    				<div class="swiper-wrapper">
     	 				 <c:forEach var="dreamCountry" items="${countryList}" varStatus="status">
							<c:if test="${status.index%8 eq 0 && status.index ne 0}">
								</div><!-- row row-cols-1 row-cols-md-5 -->
								</div><!-- swiper-slide -->
							</c:if>
							<c:if test="${status.index%8 eq 0}">
			     				<div class="swiper-slide">
			     	 			<div class="row row-cols-1 row-cols-md-4">
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
					<div class="swiper-container s2">
	 				<b>여행스타일</b>(최대 3개)
    					<div class="swiper-wrapper">
     	 					 <c:forEach var="style" items="${tripStyleList}" varStatus="status">
								<c:if test="${status.index%8 eq 0 && status.index ne 0}">
									</div><!-- row row-cols-1 row-cols-md-5 -->
									</div><!-- swiper-slide -->
								</c:if>
								<c:if test="${status.index%8 eq 0}">
			     	 				<div class="swiper-slide">
			     	 				<div class="row row-cols-1 row-cols-md-4">
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
					<div class="swiper-pagination"></div>
   				 <div class="swiper-scrollbar"></div>
   				 </div><!--여행스타일 col-6 mx-auto End -->
			</div><!-- 여행스타일 form-group End -->
	
	 
	 	      <div class="row">
      		<div class="col-5">
     		</div>
     		<div class="col-3" style="text-align: center;">
     			<button type="button" class="btn btn-primary" >수정</button>
				<button type="button" class="btn btn-secondary">취소</button>
     		</div>
     		<div class="col">
     		</div>
     		<div class="col">
     		</div>
      </div>
      
	 
      
     </main>
     </div><!-- row -->
 
 
 
	
     	</form>
       </div><!-- container -->  
       
       
   </div>
   </div>    
       
       
       
       
<div class="modal fade " id="checkPwd">
	  <!-- <div class="modal-dialog modal-lg"> -->
	  <div class="modal-dialog ">
	  	<!-- <h2 style="color : #FFFFFF">Sign In</h2> -->
	  
		<div class="modal-content">
			 <!-- 	<div class="modal-header">
				</div>modal header End 
 			-->
				 
				
			
		<div class="modal-body">
			<form>
					<div class="form-group  text-center">
						<label for="pwd">Password</label>
						 <input type="password"	class="form-control" placeholder="Enter password" id="pwdId" name="pwd">
						<h6 id="pwdMessage" style="color: #F00"></h6>
					</div>
						
						
					<div class="form-group text-center">
					<button type="button" class="btn btn-primary" >비밀번호체크</button>
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
	
	$(".swiper-container").each(function(index, element){
	    var $this = $(this);
	    var swiper = new Swiper(this, {
	        // your settings ...
	    });
	})
  </script>
</body>
</html>