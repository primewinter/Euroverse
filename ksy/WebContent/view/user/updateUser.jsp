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
<title>Insert title here</title>
<style type="text/css">

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
    content: " �����ʻ��� ��� ";
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
			h6[1].innerHTML = "�г����� 2~10�� �Դϴ�.";
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
					h6[1].innerHTML ="�ߺ��� �г����Դϴ�.";
				}
			}//success
		})//ajax
		
		}
	})
	
	
	
	$(document).on('keyup','#phone1',function(){
		if(phone1.val().length > 3){
			h6[2].innerHTML="�ڵ��� ��ȣ�� Ȯ�����ּ���.";
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
			h6[2].innerHTML="�ڵ��� ��ȣ�� Ȯ�����ּ���.";
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
			h6[2].innerHTML="�ڵ��� ��ȣ�� Ȯ�����ּ���.";
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
		$(".btn-primary:contains('����')").on("click",function(){
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
				alert("���ſ��θ� �������ּ���");
				return;
			}
			
			if($.trim(email.val())=="@"+null){
				alert("�̸����� Ȯ�����ּ���.");
				return;
			}else if ($.trim(email.val()) != "" && (email.val().indexOf('@') < 1 || email.val().indexOf('.') == -1)) {
				
				alert("�̸��� ������ �ƴմϴ�.");
				return;
			}else if($.trim(email.val()) != email.val()){
				
				alert("�̸��Ͽ� ����� ����� �� �����ϴ�.");
				return;
			} 
			
			if($.trim(phone.val()).length <10){
				
				alert("�޴��� ��ȣ�� Ȯ�����ּ���.");
				return;
			} 
			
			for(var i=0 ; i<h6.length ; i++){
				if(h6[i].innerHTML != ""){
					
					alert(h6[i].innerHTML);
					return;
				}
			}
			
			$("#updateForm").attr("action","/user/updateUser").attr("method","post").attr("enctype","multipart/form-data").submit();
		})
		
		
		
		$(".btn-primary:contains('���')").on("click",function(){
			$(self.location).attr("href","/user/getUser");
		})
		
		
		$(".btn-primary:contains('��й�ȣüũ')").on("click",function(){
		
			var pwd = $("input[id='pwdId']");
			var main = $("#main");
			var h6 = $("#pwdMessage");
			if('${user.pwd}' == pwd.val()){
				$("#checkPwd").modal("hide");
				main.prop("style","display : block");
				
				
			}else{
				h6.text("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
			}
		})
		
		
		
		
		$(".custom-file-input").on("change",function(){
			  var fileSize = this.files[0].size;
			    var maxSize = 360 * 360;
			    if(fileSize > maxSize) {
			        alert("���Ͽ뷮�� �ʰ��Ͽ����ϴ�.");
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
        <h1 class="h2">����������</h1>
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
					  <label class="custom-file-label" for="customFile"data-browse="�������̹��� ����" ></label>  
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
      			�г���
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
     			��й�ȣ
     		</div>
     		<div class="col-2" style="text-align: center;">
     			<div class="form-row">
				    <div class="form-group col">
     					<input type="password" class="form-control" value="${user.nickname}" name="pwd" id="pwd">
     				</div>
     			</div>
     		</div>
     		<div class="col-2">
     		��
     		</div>
     		<div class="col-2">
     		��
     		</div>
     	
      </div> --%>
      
      
       <div class="row">
      		<div class="col-5" style="text-align: right;">
     			�ڵ�����ȣ
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
     			�̸���
     		</div>
     		<div class="col-3" style="text-align: center;">
     			<div class="form-row">
				    <div class="form-group col">
     					<input type="text" class="form-control"  placeholder="email" id="emailId"  value="${user.emailId}">
     					
     				</div>
     				
     				 <div class="form-group col">
     				 
     				 <c:if test="${user.choiceEmail=='google.com'}">
	     				<select class="custom-select" id="choiceEmail">
						    <option value="gmail.com" selected="selected">gmail.com</option>
						    <option value="naver.com" >naver.com</option>
						    <option value="daum.net">daum.net</option>
						    <!-- ����Ʈ �� ���� ������ �⺻ �� ����ֱ�-->
					 	</select>
					 </c:if>
					 
					 <c:if test="${user.choiceEmail=='naver.com'}">
	     				<select class="custom-select" id="choiceEmail">
						    <option value="gmail.com" >gmail.com</option>
						    <option value="naver.com" selected="selected">naver.com</option>
						    <option value="daum.net">daum.net</option>
						    <!-- ����Ʈ �� ���� ������ �⺻ �� ����ֱ�-->
					 	</select>
					 </c:if>
					 
					 <c:if test="${user.choiceEmail=='daum.net'}">
	     				<select class="custom-select" id="choiceEmail">
						    <option value="gmail.com" >gmail.com</option>
						    <option value="naver.com" >naver.com</option>
						    <option value="daum.net" selected="selected">daum.net</option>
						    <!-- ����Ʈ �� ���� ������ �⺻ �� ����ֱ�-->
					 	</select>
					 </c:if>	
					 
					 <!--�� �����϶� ���̰�....  -->
					 <c:if test="${user.choiceEmail=='user.com'}">
	     				<select class="custom-select" id="choiceEmail">
						    <option value="gmail.com">gmail.com</option>
						    <option value="naver.com" >naver.com</option>
						    <option value="daum.net">daum.net</option>
						    <!-- ����Ʈ �� ���� ������ �⺻ �� ����ֱ�-->
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
     			�˸����ſ���
     		</div>
     		<div class="col-3" style="text-align: center;">
     		
     		
     		
     		<c:if test="${user.pushAgree == 'T'}" > 
     			<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="pushAgree" id="pushAgreeTrue" value="T" checked="checked">
					  <label class="form-check-label" for="inlineRadio1">�����մϴ�.</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="pushAgree" id="pushAgreeFalse" value="F">
					  <label class="form-check-label" for="inlineRadio2">�����մϴ�.</label>
					  <!-- ������ ������ �ִ°� üũ ���ֵ��� ����üũ�ϱ�  -->
				</div>
			</c:if>
				
			<c:if test="${user.pushAgree == 'F'}" >	
				<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="pushAgree" id="pushAgreeTrue" value="T" >
					  <label class="form-check-label" for="inlineRadio1">�����մϴ�.</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="pushAgree" id="pushAgreeFalse" value="F"checked="checked">
					  <label class="form-check-label" for="inlineRadio2">�����մϴ�.</label>
					  <!-- ������ ������ �ִ°� üũ ���ֵ��� ����üũ�ϱ�  -->
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
      
      <div class="row">
      		<div class="col-5">
     		</div>
     		<div class="col-3" style="text-align: center;">
     			<button type="button" class="btn btn-primary" >����</button>
				<button type="button" class="btn btn-secondary">���</button>
     		</div>
     		<div class="col">
     		</div>
     		<div class="col">
     		</div>
      </div>
      
      
     	</form>
     </main>
     </div><!-- row -->
     </div><!-- container -->
 
     
     
     
     
     
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
					<button type="button" class="btn btn-primary" >��й�ȣüũ</button>
					<button type="button" class="btn btn-primary">��� </button>
					</div>
			</form>


			<!-- 	<div class="modal-footer">
				</div>modal footer End  -->

				</div><!--modal body End  -->

			</div><!--modal content End  --> 
	  </div><!--modal dialog End  -->

</div><!--myModal End  -->
     

</body>
</html>