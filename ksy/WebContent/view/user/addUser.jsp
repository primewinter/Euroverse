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


<!-- fontawesome CDN -->
<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

 -->
 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.swiper-container{
    height: 300px;
    background-color:#E6E6E6;
    padding: 50px;
    padding-top: 30px;
    padding-right: 30px;
    margin-right:30px;
}


.s1 {
    width: 510px;
    height: 300px;
     padding-right: 30px;
      margin-right:30px;
    
} 


.s2 {
    width: 510px;
    height: 300px;
     padding-right: 30px;
      margin-right:30px;
} 




.swiper-wrapper{
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
      showOn: "button",
      buttonImage: "https://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
      buttonImageOnly: true,
      buttonText: "Select date",
      dateFormat : "yy-mm-dd",
      showAnim : "bounce"
      /* ,
      buttonImage : "/img/calendar.gif" */
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
var birth = $("input[name='birth']");
var sex = $("input[name='sex']");
$("input[name='phone']").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
var phone = $("input[name='phone']");
var image = $("input[name='image']");



var h6 = document.getElementsByTagName('h6');




	$(document).on('keyup', '#userId', function() {
		if(userId.val().length <4 || userId.val().length > 12 ){
			h6[0].innerHTML ="아이디는 4~12자 입니다.";
		}else{
			h6[0].innerHTML ="";
		}
		h6[2].innerHTML ="";
	});
	
	$(document).on('keyup','#pwd',function(){
		if(pwd.val().length <6  || pwd.val().length >20 ){
			h6[1].innerHTML = "비밀번호는 6~20자 입니다.";
		}else{
			h6[1].innerHTML = "";
		}
		if(pwd.val() != pwdConfirm.val()){
			h6[2].innerHTML = "비밀번호가 일치하지 않습니다.";
		}else{
			h6[2].innerHTML = "";
		}
		h6[2].innerHTML ="";
	});
	
	$(document).on('keyup','#pwdConfirm',function(){
		if(pwd.val() != pwdConfirm.val()){
			h6[2].innerHTML = "비밀번호가 일치하지 않습니다.";
		}else{
			h6[2].innerHTML = "<i class='fas fa-check'></i>";
		}
	});
	
	$(document).on('keyup','#userName' , function(){
		
		
		
	});
	
	
	
	$("button:contains('Submit')").on("click",function(){
		
		
		if(userId.val().length <4 || userId.val().length > 12 ){
				//alert("아이디를 확인해주세요.")
				h6[2].innerHTML ="아이디를 확인해주세요.";
			return;
		}else if(pwd.val().length <6  || pwd.val().length >20 ){
				//alert("비밀번호를 확인해주세요.");
				h6[2].innerHTML ="비밀번호를 확인해주세요.";
			return;
		}else if(pwd.val()){
			
			
		}
		
		
		
		
		
		
		else{
			
		
		/* $.ajax({
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
					$("form").attr("method","get").attr("action","/user/login").submit();
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
		})//ajax */
		
		}//else
		
		
	});
	


})

	
	
	
	
	
	
$(function(){
	$(".btn-primary").on("click",function(){
		alert("하이");
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
		
		var h6Tag = document.getElementsByTagName("h6");
		
		 
		 
		 
		 
		 
		 
		 
		 
		 alert("      userId="+userId.val()
				+"   pwd="+pwd.val()
				+"   pwdConfirm="+pwdConfirm.val()
				+"   userName="+userName.val() 
				+"   nickname="+nickname.val()
				+"   email="+email.val()
				+"   birth="+birth.val()
				+"   sex="+sex.val()
				+"   phone="+phone.val()
				+"   image="+image.val());
/* 				+"   dreamCity="+dreamCity.val()
				+"   tripStyle="+tripStyle.val());
 */		
		 
		 
		 
		 
		for(var i=1;i<=$("input:checkbox[class=dreamCity]").length;i++){
			 if($("input:checkbox[id=dreamCity"+i+"]").is(":checked") == true) {
				 
				  var value = $("input:checkbox[id=dreamCity"+i+"]").val();
				  alert(value);
				  $("#checkDreamCity").append("<input type='hidden' name='dreamCity' value='"+value+"'>");
				
			} 
		 
		}/* for End */	 
		
		for(var i=1;i<=$("input:checkbox[class=tripStyle]").length;i++){
			
			if($("input:checkbox[id=tripStyle"+i+"]").is(":checked")==true){
				
				var value = $("input:checkbox[id=tripStyle"+i+"]").val();
				alert(value);
				 $("#checkTripStyle").append("<input type='hidden' name='tripStyle' value='"+value+"'>");
			}
			
		}/* for End(tripStyle) */
		
		alert( $("#checkDreamCity").html());
		alert( $("#checkTripStyle").html());
		
		$("form").attr("action","addUser").attr("method","post").attr("enctype","multipart/form-data").submit();
		
	});/* btn-primary End */
});/* function End */







$(function(){
	
	
	
	$("input[class='dreamCity']").on("click",function(){
/* 		alert($("input:checkbox[name=dreamCity]").length);
		alert($("input:checkbox[name=dreamCity]:checked").length); */
		if($("input:checkbox[class=dreamCity]:checked").length > 5){
			alert("5개까지만 선택 가능합니다.");
			$("input:checkbox[id=dreamCity"+$(this).prev().val()+"]").prop("checked",false);
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
			//console.log(e);
			//console.log(e.target);
			//console.log(e.target.readyState);
			//console.log(e.target.result);
			//preview(e);
			
			
			 var image = $('#preview').attr('src',e.target.result);
			 console.log(image);
			 /* 	 if(image.width() > width || image.height() > height){               
	                alert('지정된 크기와 맞지 않습니다.('+width + 'x'+ height +')');
			 		alert(image.width() +'x'+  image.height());
 					$(".custom-file label").html("");
 					return; */
			//}else{
				 
				 $("#preview").html("<img src="+e.target.result+" style='border-color: #E6E6E6; border: 10px;'>");
			//}
	}
		 render.readAsDataURL(input.files[0]);  
		
}
}
function preview(src){
	 console.log(src);
	 console.log(src.target);
	 console.log(src.target.result);
	/* $("#preview").html("<img src="+src+">"); */
	/* $("#preview").html("<img src='"+src.targer.result+"'>"); */
}






</script>

</head>
<body>
<div class="col-4 mx-auto">
		<h1 class="display-1">회원가입</h1>

</div>

<div class="container">

<form>


	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-user"></i></span>
				<input type="text" class="form-control" placeholder="userId" id="userId" name="userId" >
			</div>
			<h6></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-lock"></i></span>
				<input type="password" class="form-control" placeholder="password" id="pwd" name="pwd">
			</div>
			<h6></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-lock"></i></span>
				<input type="password" class="form-control" placeholder="password Confirm" id="pwdConfirm">
			</div>
			<h6></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-user"></i></span>
				<input type="text" class="form-control" placeholder="Name" name="userName">
			</div>
			<h6></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-user"></i></span>
				<input type="text" class="form-control" placeholder="Nickname" name="nickname">
			</div>
			<h6></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-globe"></i></span>
				<input type="text" class="form-control" placeholder="email" id="emailId">
				<span class="input-group-append">&nbsp;<i class="fas fa-at"></i>&nbsp;</span>
				<select class="custom-select" id="choiceEmail">
				<option value="" disabled selected hidden>please choice....</option>
			    <option value="google.com">google.com</option>
			    <option value="naver.com">naver.com</option>
			    <option value="daum.net">daum.net</option>
			    <!--이메일 잘 정리하기 email잡은다음에 밸류에 +@+choiceEmail.val() 더하기  -->
			 	</select>
			 	<input type="hidden" name="email">
			</div>
			<h6></h6>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-baby"></i></span>
				<span class="input-group-append"><input type="text" class="form-control" placeholder="birth" name="birth" readonly="readonly" id="datepicker"></span>
			</div>
			<h6></h6>
				
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
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
	 		<div class="input-group-prepend">
	 		  <span class="input-group-text"><i class="fas fa-phone"></i></span>
		      <input type="text" class="form-control" id="phone1" > - 
		      <input type="text" class="form-control" id="phone2"> - 
		      <input type="text" class="form-control" id="phone3" >
		      <input type="hidden" name="phone"> 
		    </div>
		    <h6></h6>
		</div>
 	 </div>
 	 
 	  <div class="form-group">
	 	<div class="col-6 mx-auto">
			<div class="custom-file">
			  <input type="file" class="custom-file-input" id="image" name="image" accept="image/*">
			  <label class="custom-file-label" for="customFile" ><i class="fas fa-camera-retro">size 360x360</i> </label>  
			  <!-- 프로필 이미지 미리보기 만들기! 사이즈제한 걸어두기!~~~ -->
			</div>
			<h6></h6>
			<div id="preview">
				
			</div>
		</div>
	</div>

	 <div class="form-group">
	 	<div class="col-6 mx-auto">
	 		<h5><b>가고싶은 도시</b>(최대 5개)</h5>
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
   			 </div><!-- 가고싶은 도시 col-6 mx-auto  -->
  				 <div class="swiper-pagination"></div>
   				 <div class="swiper-scrollbar"></div>
		</div><!-- 가고싶은 도시 form-group End  -->
	</div><!-- 컨테이너 end 왜냐하면 스와이퍼 두개가 같은 컨테이너에 있으면 이름 다르게해도 자꾸 충돌일어남...  -->

	 	<div class="form-group">
	 		<div class="col-6 mx-auto">
	 			<h5><b>여행스타일</b>(최대 3개)</h5>
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
   				 </div><!--여행스타일 col-6 mx-auto End -->
			</div><!-- 여행스타일 form-group End -->
	
	<div class="form-group">
	 		<div class="col-6 mx-auto ">
				<button type="button" class="btn btn-primary">회원가입</button>
				<button type="button" class="btn btn-secondary">취소</button>
	</div>
	</div>
	
	
	
	
	<input type="hidden" name="dreamCity">
	<input type="hidden" name="tripStyle">
	
	
	
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