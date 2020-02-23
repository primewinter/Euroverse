
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:if test="${ ! empty user }">
		<jsp:forward page="/main.jsp"/>
	</c:if>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	window.onload = function() {
		var phoneDiv = document.getElementById("phoneDiv");
		var emailDiv = document.getElementById("emailDiv");
		var userId1 = document.getElementById("userId1");
		var userId2 = document.getElementById("userId2");
		
		var userName1 = document.getElementById("userName1");
		var userName2 = document.getElementById("userName2");
		var phone1 = document.getElementById("phone1");
		var phone2 = document.getElementById("phone2");
		var phone3 = document.getElementById("phone3");
		var phone = document.getElementById("phone");
		
		var emailId = document.getElementById("emailId");
		var choiceEmail = document.getElementById("choiceEmail");
		
		
		var email = emailId.value + '@' + choiceEmail.value;
		
		
		
		document.getElementById('phoneCheck').onclick = function() {
			phoneDiv.style.display = "";
			emailDiv.style.display = "none";
			userName1.setAttribute('name', 'userName');
			userName2.setAttribute('name', '');
			userName2.setAttribute('value', '');
			userId2.setAttribute('value','');
			emailId.setAttribute('value' , '');
			choiceEmail.setAttribute('value' , '');
			eamil = '';
			
		}

		document.getElementById('emailCheck').onclick = function() {
			phoneDiv.style.display = "none";
			emailDiv.style.display = "";
			userName1.setAttribute('name', '');
			userName1.setAttribute('value', '');
			userName2.setAttribute('name', 'userName');
			userId1.setAttribute('value','');
			phone1.setAttribute('value','');
			phone2.setAttribute('value','');
			phone3.setAttribute('value','');
			phone.setAttribute('value','');
			
		}

	};
	
	
	function pwd(){
		/* var userId1 = document.getElementById("userId1");
		var userId2 = document.getElementById("userId2"); */
		
		var userName1 = document.getElementById("userName1");
		var userName2 = document.getElementById("userName2");
		
		var phone = document.getElementById("phone");
		var emailId = document.getElementById("emailId");
		var choiceEmail = document.getElementById("choiceEmail");
		
		
		var email = emailId.value + '@' + choiceEmail.value;
		
		
		var userId1 = $("#userId1");
		var userId2 = $("#userId2");
		if(userId1.val()=="" || userId2.val()!=""){
			
			alert("�̸��Ϸ� �ϴ� ��й�ȣ �����̰�! ���� ���̵��!"+userId2.val());
			$(location).attr("href","/user/updatePwd?userId="+userId2.val());
		}
		
		else if(userId1.val()!="" || userId2.val()==""){
			alert("�ڵ������� �ϴ� ��й�ȣ �����̰�! ���� ���̵��!"+userId1.val());
			$(location).attr("href","/user/updatePwd?userId="+userId1.val());
		}
		
		
		/* 		$(self.location).attr("href","/myPage/pointList?userId="+$("input[name='userId']")); */
//		location.href="/myPage/pointList?userId="+$("input[name='userId']");
		
		
		
		// self.location ="/myPage/updatePwdGet?userId="+userId;
		
		/* var form = document.getElementById("pwdForm");
		form.submit(); */
/* 		if(userId1.value!=""){
			var userId = userId1.value;
			
			$.ajax({
				url : "/user/json/checkPhoneUserId",
				method : "post",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					userId :userId
				}),
				success : function(JSONData, Status) {
					alert("�ڵ������� ��� �ִ��� Ȯ��!!");
					alert(JSONData.result);
					//���� ���̵� Ȯ���ؼ� ������  ok ������ error �ߴϱ� �װɷ� ���ǰɾ �̵���ų���� �ƴϸ� �ʱ�ȭ�Ұ��� �ϱ�!
					if(JSONData.result == 'ok'){
						alert("�����ߴٴ� ������");
						alert(JSONData.dbUserName);
						alert(JSONData.dbPhone);
						
						if(JSONData.dbUserName != userName1.value){
							alert("�̸��� ��ġ���� �ʽ��ϴ�.");
							return;
						}
						
						if(JSONData.dbPhone != phone.value){
							alert("�ڵ��� ��ȣ�� ��ġ���� �ʽ��ϴ�.");
							return;
						}
						
						form.submit();
						
						
					}else if(JSONData.result == 'error'){
						alert("�Է��� ���̵�� ��ġ�ϴ� ȸ���� �����ϴ�");
						return;
						
					}else{
						alert("���");
						return;
						
					}
					
					
				}
			})
			
		}else{
			var userId = userId2.value;
			
			$.ajax({
				url : "/user/json/checkEmailUserId",
				method : "post",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					userId :userId
				}),
				success : function(JSONData, Status) {
					alert("�̸��Ϸ� ��� �ִ��� Ȯ��!!");
					alert(JSONData.result);
					//���� ���̵� Ȯ���ؼ� ������  ok ������ error �ߴϱ� �װɷ� ���ǰɾ �̵���ų���� �ƴϸ� �ʱ�ȭ�Ұ��� �ϱ�!
					if(JSONData.result == 'ok'){
						alert("�����ߴٴ� ������");
						alert(JSONData.dbUserName);
						alert(JSONData.dbEmail);
						
						if(JSONData.dbUserName != userName2.value){
							alert("�̸��� ��ġ���� �ʽ��ϴ�.");
							return;
						}
						
						if(JSONData.dbEmail != email){
							alert("�̸����� ��ġ���� �ʽ��ϴ�.");
							return;
						}
							
						form.submit();
						
					}else if(JSONData.result == 'error'){
						alert("�Է��� ���̵�� ��ġ�ϴ� ȸ���� �����ϴ�");
						return;
						
					}else{
						alert("���");
						return;
						
					}
					
					
				}
			})
			
		}
		 */
	
	}

	
	
	
	
	
	
	$(function() {

		$('#phoneConfirm').click(
				
				
				function() {

				$("#userId1").attr("readonly",true);
				$("#userName1").attr("readonly",true);
				$("#phone1").attr("readonly",true);
				$("#phone2").attr("readonly",true);
				$("#phone3").attr("readonly",true);
				
					var phoneCheck = $("input[name='phoneCheck']").val();
					var phoneValue = $("input[name='phoneValue']").val();
					console.log("phoneCheck=" + phoneCheck);
					console.log("phoneValue=" + phoneValue)
					alert("ok");

					if (phoneCheck == phoneValue) {
						alert("��������!");
						$("#phoneAppendDiv").text("��й�ȣ�� ������ �� �ֽ��ϴ�.");
						var emailCheck = document.getElementById("emailCheck");

						var phone = $("${user.phone}");
						var name = $("${user.userName}");
						
						var userId1 =document.getElementById("userId1");
						var name1 = document.getElementById("userName1");
						
						var phone1 = document.getElementById("phone1");
						var phone2 = document.getElementById("phone2");
						var phone3 = document.getElementById("phone3");
						
						var updatePwd = document.getElementById("updatePwd");
						
						updatePwd.setAttribute("type","button");
						updatePwd.setAttribute("value","��й�ȣ����");
						
						
						//userId1.readOnly = true;
						//name1.readOnly = true;
						phone1.readOnly = true;
						phone2.readOnly = true;
						phone3.readOnly = true;
						
						$('#phoneValue').hide();
						$('#phoneConfirm').hide();
						name1.setAttribute("name" , "userName");
						userId1.setAttribute("name","userId");
						
					}else{
						
					}
		});
						
						

		$('#confirm').click(
				function() {
				$("#userId2").attr("readonly",true);
				$("#userName2").attr("readonly",true);
				$("#emailId").attr("readonly",true);
				$("#choiceEmail").attr("readonly",true);
				var value = $("#choiceEmail").val();
				
				$("#choiceEmail option[value!= '"+value+"']").remove();
				
					var mailCheck = $("input[name='mailCheck']").val();
					var mailValue = $("input[name='mailValue']").val();
					console.log("mailCheck=" + mailCheck);
					console.log("mailValue=" + mailValue);

					if (mailCheck == mailValue) {
						alert("��������!");
						$("#mailAppendDiv").text("��й�ȣ�� ������ �� �ֽ��ϴ�.");
						
						var email = "${user.email}";
						var name = "${user.userName}";
						
						
						var userId2 =document.getElementById("userId2");
						var name2 = document.getElementById("userName2");
						
						var emailId = document.getElementById("emailId");
						var choiceEmail = document.getElementById("choiceEmail");
						
						
						var email = emailId.value + '@' + choiceEmail.value;
						
													
						var updatePwd2 = document.getElementById("updatePwd2");
						
						updatePwd2.setAttribute("type","button");
						updatePwd2.setAttribute("value","��й�ȣ����");
						
						
						//userId2.readOnly = true;
						//name2.readOnly = true;
						emailId.readOnly = true;
						choiceEmail.readOnly = true;
						
						$('#mailValue').hide();
						$('#confirm').hide();
						name2.setAttribute("name" , "userName");
						userId2.setAttribute("name" , "userId")
						

					} else {
						alert("��������~ ��������!");
					}

				});

	
	});

	
	
	$(function() {

		$('#confirm').hide();
		$('#phoneConfirm').hide();

		$('#sendPhone').click(
				function() {
					var userId1 = $('#userId1');
					var name1 = $('#userName1');
					$("#emailRadio").hide();
					var phone1 = document.getElementById("phone1");
					var phone2 = document.getElementById("phone2");
					var phone3 = document.getElementById("phone3");
					var phone = document.getElementById("phone");
							phone.value = phone1.value + "-" + phone2.value + "-"
									+ phone3.value;
						if (userId1.val() == null || userId1.val()=="") {
							alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.")
							return;
						}

						if (name1.val() == null || name1.val()=="") {
							
							alert("�̸��� �ݵ�� �Է��ϼž� �մϴ�.");
							return;
						} 

						if (phone1.value != "" && phone2.value != ""
								&& phone3.value != "") {
						}

						if (phone.value == null || phone.value=="") {
							alert("�ڵ��� ��ȣ�� �ݵ�� �Է��ϼž� �մϴ�.");
							return;
						}

						if (phone.value.length > 15) {
							alert("�ڵ��� ��ȣ ���Ŀ� ���� �ʽ��ϴ�.");
							return;
						}


						$.ajax({
							url : "/user/json/checkUser",
							method : "post",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								userId : userId1.val(),
								userName : name1.val(),
								phone : phone.value
							}),
							success : function(JSONData, Status) {
								if(JSONData.result == 'ok'){
								$.ajax({
									url : "/user/json/checkPhone",
									method : "post",
									dataType : "json",
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									data : JSON.stringify({
										phone : phone.value
									}),
									beforeSend : function() {
										$("#phoneAppendDiv").text("���� �߼� ���Դϴ�.");
									},
									success : function(JSONData, Status) {
										console.log(Status);
										console.log(JSONData);
										if (JSONData.result == "done") {
											$("input[name='phoneCheck']").val(
													JSONData.phoneCheck);
											$("#phoneAppendDiv").text("�Է��Ͻ� ��ȣ�� ���� �߼��� �Ϸ�Ǿ����ϴ�.");

											$("input[name='phoneValue']").attr("type",
													"text").attr("placeholder", "������ȣ �Է�").attr("id","phoneValue");

											$('#sendPhone').hide();
											$('#removeDiv').hide();
											$('#phoneConfirm').show();

										}
									}
								})
								
								}else{
									$("#phoneAppendDiv").text(JSONData.result);
								}
								
							}
						})
						
						


					
				})

		$('#sendMail')
				.click(
						function() {
							
							var userId2 = document.getElementById("userId2");

							var name2 = document.getElementById("userName2");

							var emailId = document.getElementById("emailId");
							var choiceEmail = document.getElementById("choiceEmail");
							
							
							var email = emailId.value + '@' + choiceEmail.value;
							
							$("#phoneRadio").hide();
							

								if (userId2.value == null || userId2.value == "") {
									alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.")
									return;
								}

								if (name2.value == null || name2.value == "") {
									alert("�̸��� �ݵ�� �Է��ϼž� �մϴ�.");
									return;
								}



								if (email == null || email.length =="") {
									alert("�̸����� �ݵ�� �Է��ϼž� �մϴ�.");
									return;
								}
								if (email != ""
										&& (email.indexOf('@') < 1 || email.indexOf('.') == -1)) {
									alert("�̸��� ������ �ƴմϴ�.");
									return;
								}
							
									
									
									
									
							
								
									$.ajax({
							url : "/user/json/checkUser",
							method : "post",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								userId : userId2.value,
								userName : name2.value,
								email : email
							}),
							success : function(JSONData, Status) {
								

								
								if(JSONData.result == 'ok'){
									
								
									$.ajax({
										url : "/user/json/checkMail",
										method : "post",
										dataType : "json",
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										data : JSON.stringify({
											email : email
										}),
										beforeSend : function() {
										 $("#mailAppendDiv").text("���� �߼� ���Դϴ�.");
										},
										success : function(JSONData, Status) {
											console.log(Status);
											console.log(JSONData);
											if (JSONData.result == "done") {
												$("input[name='mailCheck']")
														.val(JSONData.mailCheck);
											$("#mailAppendDiv").text("���� �߼��� �Ϸ�Ǿ����ϴ�."); 

												$("input[name='mailValue']")
														.attr("type", "text")
														.attr("placeholder",
																"������ȣ �Է�")
														.attr("id","mailValue");

												$('#sendMail').hide();
												$('#emailRemoveDiv').hide();
												$('#confirm').show();

											}
										}
									})
								
								}else{
									$("#mailAppendDiv").text(JSONData.result);
								}
								
							}
						})

						});
	});
	
	
	
	$(function(){
		$(".nav-link:contains('��й�ȣã��')").addClass("disabled");
	})
	
</script>
</head>
<body>
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>
<p style="font-size:30px; margin-left:500px; margin-top: 50px; margin-bottom: -20px" >
��й�ȣã��<br><hr style="width: 600px;margin-bottom: -5px;">
<small style="margin-left:500px; ">���Ͻô� ����� �������ּ���.</small>
</p>

<div class="container" style="margin-top: 70px;">

	<form action="/user/updatePwd" method="post" id="pwdForm">
		<div class="form-group">
		
			<div class="col-md-7 mx-auto" style="margin-bottom: 24px;" > 
	<div class="custom-control custom-radio ">
	
	  <input type="radio" id="phoneCheck" name="searchId" class="custom-control-input">
	  <label class="custom-control-label" for="phoneCheck"><h3>�ڵ�����ȣ�� ��й�ȣã��</h3></label>
	</div>
	</div>
		
		<div id="phoneDiv" style="display:none">
		<div class="form-group">
			<div class="col-7 mx-auto">
				<b>ID</b>
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
					<input type="text" class="form-control" placeholder="ID" id="userId1">
				</div>
				<h6></h6>
			</div>
		</div>
		
		
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
		 	<div class="col-7 mx-auto" style="margin-bottom: 40px;">
		 		<b>Phone</b>
		 		<div class="input-group-prepend">
		 		  <span class="input-group-text"><i class="fas fa-phone"></i></span>
			      <input type="text" class="form-control" id="phone1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3"> - 
			      <input type="text" class="form-control" id="phone2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"> - 
			      <input type="text" class="form-control" id="phone3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
			      <input type="hidden" name="phone" id="phone"> 
			      <input type="button" value="�����ϱ�" id="sendPhone" class="btn btn-outline-primary">  
			<input type="hidden" id="updatePwd" onclick="javascript:pwd()" class="btn btn-outline-primary">
			<br/>
			<input type="hidden" name="phoneCheck" value="">
			    </div>
			    <div id="phoneAppendDiv" style="margin-top: 20px;"></div>
			<div style="height: 10px;"></div>
			<input type="hidden" name="phoneValue" value="">
			<button type="button" id="phoneConfirm" class="btn btn-outline-primary">������ȣȮ��</button>
			
			</div>
	 	 </div>
	
	</div>
		
		
		

			<div class="form-group">
	<div class="col-md-7 mx-auto" > 
	<div class="custom-control custom-radio">
	  <input type="radio" id="emailCheck" name="searchId" class="custom-control-input">
	  <label class="custom-control-label" for="emailCheck"><h3>�̸��Ϸ� ���̵�ã��</h3></label>
	</div>
	</div>
	<div id="emailDiv" style="display:none">
		<div class="form-group">
			<div class="col-7 mx-auto">
				<b>ID</b>
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
					<input type="text" class="form-control" placeholder="ID" id="userId2">
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-7 mx-auto">
				<b>Name</b>
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
					<input type="text" class="form-control" placeholder="Name"  id="userName2" >
				</div>
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
			 	</select>
			 	<input type="hidden" name="email" id="email">
			    <input type="button" value="�����ϱ�" id="sendMail" class="btn btn-outline-primary">  
				<input type="hidden" id="updatePwd2" onclick="javascript:pwd()" class="btn btn-outline-primary" >
				<br/>
			<input type="hidden" name="mailCheck" value="">
			 	
			</div>
			<div id="mailAppendDiv" style="margin-top: 20px;"></div>
			<div style="height: 10px;"></div>
				<input type="hidden" name="mailValue" value="">
				<button type="button" id="confirm" class="btn btn-outline-primary">������ȣȮ��</button>
		</div>
		</div>
			</div>
			</div>
		
		
		
		</div>
		</div>
	</form>
</body>
<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</html>