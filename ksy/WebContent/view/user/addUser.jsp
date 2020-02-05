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
		var userImg = $("input[name='userImg']");
		var dreamCity = $("input[name='dreamCity']");
		var tripStyle = $("input[name='tripStyle']");
		
		alert("      userId="+userId.val()
				+"   pwd="+pwd.val()
				+"   pwdConfirm="+pwdConfirm.val()
				+"   userName="+userName.val() 
				+"   nickname="+nickname.val()
				+"   email="+email.val()
				+"   birth="+birth.val()
				+"   sex="+sex.val()
				+"   phone="+phone.val()
				+"   userImg="+userImg.val()
				+"   dreamCity="+dreamCity.val()
				+"   tripStyle="+tripStyle.val());
		
		alert("${cityList}");
		
		
	});/* btn-primary End */
});/* function End */







$(function(){
	
	
	$("input[name='dreamCity']").on("click",function(){
		console.log(this)
		alert(this.value);	
	
	
	
	})
	
	
})

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
				<input type="text" class="form-control" placeholder="userId" name="userId">
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-lock"></i></span>
				<input type="password" class="form-control" placeholder="password" name="pwd">
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-lock"></i></span>
				<input type="password" class="form-control" placeholder="password Confirm" id="pwdConfirm">
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-user"></i></span>
				<input type="text" class="form-control" placeholder="Name" name="userName">
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-user"></i></span>
				<input type="text" class="form-control" placeholder="Nickname" name="nickname">
			</div>
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
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-baby"></i></span>
				<span class="input-group-append"><input type="text" class="form-control" placeholder="birth" name="birth" readonly="readonly" id="datepicker"></span>
			</div>
				
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-venus-mars"></i></span>
					&nbsp;
					&nbsp;
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="sex" id="male" value="male">
					  <label class="form-check-label" for="inlineRadio1">Male<i class="fas fa-male"></i></label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="sex" id="female" value="female">
					  <label class="form-check-label" for="inlineRadio2">Female<i class="fas fa-female"></i></label>
					</div>
			</div>
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
		</div>
 	 </div>
 	 
 	  <div class="form-group">
	 	<div class="col-6 mx-auto">
			<div class="custom-file">
			  <input type="file" class="custom-file-input" id="customFile" name="userImg">
			  <label class="custom-file-label" for="customFile">Choose file</label>
			  <!-- 프로필 이미지 미리보기 만들기! 사이즈제한 걸어두기!~~~ -->
			</div>
		</div>
	</div>

	 <div class="form-group">
	 	<div class="col-6 mx-auto">
	 		<h5><b>가고싶은 도시</b>(최대 5개)</h5>
				<div class="swiper-container s1">
    				<div class="swiper-wrapper">
     	 				 <c:forEach var="city" items="${cityList}" varStatus="status">
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
					   	 			<input  type="checkbox" id="city${status.count}" value="${city}" name="dreamCity">
					   	 	 		<label  for="city${status.count}">${city}</label>
		  						</p>
							</div> 
					
						</c:forEach> 
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
								   	 		<input  type="checkbox" id="tripStyle${status.count}" value="${style}" name="tripStyle">
								   	 	 	<label  for="tripStyle${status.count}">${style}</label>
				  						</p>
								</div> 
							</c:forEach> 
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
	
	
	
	
	</form>




   
   
   






 <script>
/*  $(document).ready(function () {
	  //initialize swiper when document ready
	  var mySwiper = new Swiper ('.swiper1', {
	    navigation:{
	    nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev' // 이번 버튼 클래스명
	    } 
	  })
	});
 

 $(document).ready(function () {
	  //initialize swiper when document ready
	  var mySwiper = new Swiper ('.swiper2', {
	    navigation:{
	    nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev' // 이번 버튼 클래스명
	    } 
	  })
	}); */
	
	$(".swiper-container").each(function(index, element){
	    var $this = $(this);
	    var swiper = new Swiper(this, {
	        // your settings ...
	    });
	})
  </script>
</body>

</html>