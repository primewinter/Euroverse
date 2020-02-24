<%@page import="com.ksy.service.domain.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 	<c:if test="${ ! empty user }">
		<jsp:forward page="/main.jsp"/>
	</c:if> --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
h6{
	color: red;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script type="text/javascript">
	window.onload = function() {
		var phoneDiv = document.getElementById("phoneDiv");
		var emailDiv = document.getElementById("emailDiv");
		var userName1 = document.getElementById("userName1");
		var userName2 =document.getElementById("userName2");
		var phone = document.getElementById("phone");
		var emailId = document.getElementById("emailId");
		var choiceEmail = document.getElementById("choiceEmail");
		var h6 = document.getElementsByTagName("h6");
		/* �̸� �����а� ����ϴϱ� �� �����Ƽ� �� �������� */
		var name1 = $("input[id='userName1']");
		var name2 = $("input[id='userName2']");
		var p1 = $("#phone1");
		var p2 = $("#phone2");
		var p3 = $("#phone3");
		var ei = $("#emailId");
		var ce = $("#choiceEmail");
		
		
		
		document.getElementById('phoneCheck').onclick = function() {
			phoneDiv.style.display="";     
			emailDiv.style.display="none";
			userName1.setAttribute('name','userName');
			userName2.setAttribute('name','');
			userName2.setAttribute('value','');
			name2.prop("value","");
			ei.prop("value","");
			ce.prop("value","");
			h6[2].innerHTML="";
			h6[3].innerHTML="";
		}
		
		document.getElementById('emailCheck').onclick = function() {
			phoneDiv.style.display="none";
			emailDiv.style.display="";
			userName1.setAttribute('name','');
			userName1.setAttribute('value','');
			userName2.setAttribute('name','userName');
			name1.prop("value","");
			p1.prop("value","");
			p2.prop("value","");
			p3.prop("value","");
			h6[0].innerHTML="";
			h6[1].innerHTML="";
		}
	};
	
	function next(){
		var name1 = document.getElementById("userName1");
		var name2 = document.getElementById("userName2");
		var emailId = document.getElementById("emailId");
		var choiceEmail = document.getElementById("choiceEmail");
		var email = emailId.value + '@' + choiceEmail.value;
		
		document.getElementById("email").value = email;
		
		var phone1 = document.getElementById("phone1");
		var phone2 = document.getElementById("phone2");
		var phone3 = document.getElementById("phone3");
		var phoneRadio = document.getElementById('phoneCheck');
		var emailRadio = document.getElementById('emailCheck');
		var phone = document.getElementById("phone");
		
		var h6 = document.getElementsByTagName("h6");
		
		phone.value = phone1.value + "-" + phone2.value + "-" + phone3.value ;
 
		if(phoneRadio.checked==true){
			if(name1.value =="" || name1.value == null){
				//alert("�̸��� �ݵ�� �Է��ϼž� �մϴ�.");
				h6[0].innerHTML="�̸��� �ݵ�� �Է��ϼž��մϴ�.";
				return;
			}else{
				h6[0].innerHTML="";
			}
			
			
			
			if(phone1.value == "" || phone2.value == "" || phone3.value == "" ){
				//alert("�ڵ��� ��ȣ�� �Է��ϼž��մϴ�.")
				h6[1].innerHTML="�ڵ��� ��ȣ�� �Է��ϼž��մϴ�.";
				return;
			}else{
				h6[1].innerHTML="";
			}
			
			
			
			if(phone.value.length < 10){
				//alert("�ڵ��� ��ȣ�� �Է��ϼž� �մϴ�.")
				h6[1].innerHTML="�ڵ��� ��ȣ�� Ȯ�����ּ���.";
				return;
			}else{
				h6[1].innerHTML="";
			}
			
			
		}else if(emailRadio.checked == true){
			if(name2.value == null|| name2.value == ""){
				//alert("�̸��� �ݵ�� �Է��ϼž��մϴ�.");
				h6[2].innerHTML="�̸��� �ݵ�� �Է��ϼž��մϴ�.";
				return;
			}else{
				h6[2].innerHTML="";
			}
		
			if (email == null || email.length < 1) {
				//alert("�̸����� �ݵ�� �Է��ϼž� �մϴ�.");
				h6[3].innerHTML="�̸����� �ݵ�� �Է��ϼž� �մϴ�.";
				return;
			}else{
				h6[3].innerHTML="";
			}
			 if (email != ""
					&& (email.indexOf('@') < 1 || email
							.indexOf('.') == -1)) {
				//alert("�̸��� ������ �ƴմϴ�.");
				h6[3].innerHTML="�̸��� ������ �ƴմϴ�.";
				return;
			}else{
				h6[3].innerHTML="";
			}
			
		}
		
		$(function(){
			var realName = document.getElementsByName("userName");
		$.ajax({
			url : "/user/json/getUserId",
			method : "post",
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				phone : phone.value,
				email : email,
				userName : realName[0].value
			}),
			success : function(JSONData, Status) {
				 if(JSONData[0] == "error"){
					
					var submitAlert = $(".alert-danger");
					var alertMessage = $(".alert-danger strong");
					
					submitAlert.prop("style","display : block");
					alertMessage.html("��ġ�ϴ� �����Ͱ� �����ϴ�!");
					
					
					return;
				}else{
					
				
					 var name1 = document.getElementById("userName1");
					console.log(name1.name);
					var name2 = document.getElementById("userName2");
					console.log(name2.name);
					var email =document.getElementById("email");
					console.log(email.name);
					if(email.value=='@'){
						email.value ="";
					}
					
					var phone = document.getElementById("phone");
					if(phone.value == '--'){
						phone.value = "";
					} 
					//document.getElementById("searchIdForm").submit();
					$("#searchIdForm").attr("action","/user/searchId").attr("method","post").submit();
				}
			}
		})
	});
	}
	
	
	$(function(){
		$(".nav-link:contains('���̵�ã��')").addClass("disabled");
		
		
		$(".alert-danger button").on("click",function(){
			$(".alert-danger").prop("style","display:none");			
		});
		
		
				
		
	});
	
	
	
</script>

</head>
<body>

<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>

<p style="font-size:30px; margin-left:500px; margin-top: 50px; margin-bottom: -20px" >
���̵�ã��<br><hr style="width: 600px;margin-bottom: -5px;">
<small style="margin-left:500px; ">���Ͻô� ����� �������ּ���.</small>
</p>

<div class="container" style="margin-top: 70px;">


		<!-- <div class="row justify-content-center"> -->
		<div class="row">
		</div>
<form id="searchIdForm">

<div class="form-group">
	<div class="col-md-7 mx-auto" > 
<!-- <input type="radio" name="searchId" id="phoneCheck">�ڵ�����ȣ�� ���̵�ã��</br> -->
	<div class="custom-control custom-radio ">
	
	  <input type="radio" id="phoneCheck" name="searchId" class="custom-control-input">
	  <label class="custom-control-label" for="phoneCheck"><h3>�ڵ�����ȣ�� ���̵�ã��</h3></label>
	</div>
	</div>
	<div id="phoneDiv" style="display:none">
		
		<div class="form-group">
			<div class="col-7 mx-auto">
				<b>Name</b>
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
					<input type="text" class="form-control" placeholder="Name" id="userName1">
				</div>
				<h6></h6>
			</div>
		</div>
	
		<div class="form-group">
		 	<div class="col-7 mx-auto">
		 		<b>Phone</b>
		 		<div class="input-group-prepend">
		 		  <span class="input-group-text"><i class="fas fa-phone"></i></span>
			      <input type="text" class="form-control" id="phone1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3"> - 
			      <input type="text" class="form-control" id="phone2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"> - 
			      <input type="text" class="form-control" id="phone3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
			      <input type="hidden" name="phone" id="phone"> 
			      <input type="button" value="���̵�ã��" onclick="javascript:next()" class="btn btn-outline-primary">
			    </div>
			    <h6></h6>
			</div>
	 	 </div>
	
	
<!-- 	�̸� <input type="text" id="userName1" ></br>
	�ڵ�����ȣ<input type="text" id="phone1"  >
		 -<input type="text" id="phone2">
	   	 -<input type="text" id="phone3" >&nbsp;&nbsp;
	   	 <input type="button" value="���̵�ã��" onclick="javascript:next()">
			<input type="hidden" id="phone" name="phone"> -->
	</div>
</div>

<div class="form-group">
<!-- <input type="radio" name="searchId" id="emailCheck">�̸��Ϸ� ���̵�ã��</br> -->
	<div class="col-md-7 mx-auto" > 
	<div class="custom-control custom-radio">
	  <input type="radio" id="emailCheck" name="searchId" class="custom-control-input">
	  <label class="custom-control-label" for="emailCheck"><h3>�̸��Ϸ� ���̵�ã��</h3></label>
	</div>
	</div>
	<div id="emailDiv" style="display:none">
	
		<div class="form-group">
			<div class="col-7 mx-auto">
				<b>Name</b>
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
					<input type="text" class="form-control" placeholder="Name"  id="userName2" >
				</div>
				<h6></h6>
			</div>
		</div>
		
		<div class="form-group">
		<div class="col-7 mx-auto">
		<b>Email</b>
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-globe"></i></span>
				<input type="text" class="form-control" placeholder="email" id="emailId">
				<span class="input-group-append">&nbsp;<i class="fas fa-at"></i>&nbsp;</span>
				<select class="custom-select" id="choiceEmail">
				<option value="" disabled selected hidden>please choice....</option>
			    <option value="gmail.com">gmail.com</option>
			    <option value="naver.com">naver.com</option>
			    <option value="daum.net">daum.net</option>
			    <!--�̸��� �� �����ϱ� email���������� ����� +@+choiceEmail.val() ���ϱ�  -->
			 	</select>
			 	<input type="hidden" name="email" id="email">
			 	<input type="button" onclick="javascript:next()" value="���̵�ã��"  class="btn btn-outline-primary">
			</div>
			<h6></h6>
		</div>
		</div>
	
	<!-- �̸� <input type="text" id="userName2" ></br>
	�̸��� <input type="text"  id="emailFirst"> 
		@ <select id="emailSecond">
			<option value="">����</option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
		</select>
	<input type="hidden" name="email" id="email">	
	
	<input type="button" onclick="javascript:next()" value="���̵�ã��"> -->
			</div>
			</div>
			</div>
			<div class="alert alert-danger alert-dismissable" style="display: none;" >
			    <button type="button" class="close" >��</button>
			    <strong></strong>&nbsp; ���� �� �ٽ� �õ����ּ���.
</form>
</div>	




</body>
<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</html>