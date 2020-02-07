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
		alert("����");
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
	/* 	var dreamCity = $("input[name='dreamCity']");
		var tripStyle = $("input[name='tripStyle']");
		 */
		alert("      userId="+userId.val()
				+"   pwd="+pwd.val()
				+"   pwdConfirm="+pwdConfirm.val()
				+"   userName="+userName.val() 
				+"   nickname="+nickname.val()
				+"   email="+email.val()
				+"   birth="+birth.val()
				+"   sex="+sex.val()
				+"   phone="+phone.val()
				+"   userImg="+userImg.val());
/* 				+"   dreamCity="+dreamCity.val()
				+"   tripStyle="+tripStyle.val());
 */		
		 
		 
		 
		 
		for(var i=1;i<=$("input:checkbox[name=dreamCity]").length;i++){
			
			 if($("input:checkbox[id=dreamCity"+i+"]").is(":checked") == true) {
				  //�۾�
				  alert("����!üũ�� ���ô�!"+i+"�� ����!");
				
			} 
		 
		}/* for End */	 
		
		for(var i=1;i<=$("input:checkbox[name=tripStyle]").length;i++){
			
			if($("input:checkbox[id=tripStyle"+i+"]").is(":checked")==true){
				
				alert("����!üũ�� ���ེŸ����!!"+i+"�� ����!");
			}
			
		}/* for End(tripStyle) */
		
	});/* btn-primary End */
});/* function End */







$(function(){
	
	$("input[name='dreamCity']").on("click",function(){
		alert($(this).prev().val());
/* 		alert($("input:checkbox[name=dreamCity]").length);
		alert($("input:checkbox[name=dreamCity]:checked").length); */
		if($("input:checkbox[name=dreamCity]:checked").length > 5){
			alert("5�������� ���� �����մϴ�.");
			$("input:checkbox[id=dreamCity"+$(this).prev().val()+"]").prop("checked",false);
		}
	})
	
	$("input[name='tripStyle']").on("click",function(){
		alert($(this).prev().val());
		if($("input:checkbox[name=tripStyle]:checked").length > 3){
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
			//console.log(e);
			//console.log(e.target);
			//console.log(e.target.readyState);
			//console.log(e.target.result);
			//preview(e);
			
			
			 var image = $('#preview').attr('src',e.target.result);
			 console.log(image);
			 /* 	 if(image.width() > width || image.height() > height){               
	                alert('������ ũ��� ���� �ʽ��ϴ�.('+width + 'x'+ height +')');
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
		<h1 class="display-1">ȸ������</h1>

</div>

<div class="container">

<form>


	<div class="form-group">
		<div class="col-6 mx-auto">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-user"></i></span>
				<input type="text" class="form-control" placeholder="userId" name="userId" >
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
			    <!--�̸��� �� �����ϱ� email���������� ����� +@+choiceEmail.val() ���ϱ�  -->
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
			  <input type="file" class="custom-file-input" id="userImg" name="userImg" accept="image/*">
			  <label class="custom-file-label" for="customFile" ><i class="fas fa-camera-retro">size 360x360</i> </label>  
			  <!-- ������ �̹��� �̸����� �����! ���������� �ɾ�α�!~~~ -->
			</div>
			<div id="preview">
				
			</div>
		</div>
	</div>

	 <div class="form-group">
	 	<div class="col-6 mx-auto">
	 		<h5><b>������� ����</b>(�ִ� 5��)</h5>
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
					   	 			<input  type="checkbox" id="dreamCity${status.count}" value="${dreamCity}" name="dreamCity">
					   	 	 		<label  for="dreamCity${status.count}">${dreamCity}</label>
		  						</p>
							</div> 
					
						</c:forEach> 
					</div><!-- wrapper -->
				</div><!-- s1 -->
   			 </div><!-- ������� ���� col-6 mx-auto  -->
  				 <div class="swiper-pagination"></div>
   				 <div class="swiper-scrollbar"></div>
		</div><!-- ������� ���� form-group End  -->
	</div><!-- �����̳� end �ֳ��ϸ� �������� �ΰ��� ���� �����̳ʿ� ������ �̸� �ٸ����ص� �ڲ� �浹�Ͼ...  -->

	 	<div class="form-group">
	 		<div class="col-6 mx-auto">
	 			<h5><b>���ེŸ��</b>(�ִ� 3��)</h5>
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
								   	 		<input  type="checkbox" id="tripStyle${status.count}" value="${style}" name="tripStyle">
								   	 	 	<label  for="tripStyle${status.count}">${style}</label>
				  						</p>
								</div> 
							</c:forEach> 
						</div><!-- wrapper -->
					</div><!-- s2 -->
   				 </div><!--���ེŸ�� col-6 mx-auto End -->
			</div><!-- ���ེŸ�� form-group End -->
	
	<div class="form-group">
	 		<div class="col-6 mx-auto ">
				<button type="button" class="btn btn-primary">ȸ������</button>
				<button type="button" class="btn btn-secondary">���</button>
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