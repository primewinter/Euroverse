
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
		
		var emailFirst = document.getElementById("emailFirst");
		var emailSecond = document.getElementById("emailSecond");
		
		
		var email = emailFirst.value + '@' + emailSecond.value;
		
		
		
		document.getElementById('phoneCheck').onclick = function() {
			phoneDiv.style.display = "";
			emailDiv.style.display = "none";
			userName1.setAttribute('name', 'userName');
			userName2.setAttribute('name', '');
			userName2.setAttribute('value', '');
			
			//userId1.setAttribute('name' , 'userId');
			//userId2.setAttribute('name','');
			
			userId2.setAttribute('value','');
			//email.setAttribute('value','');
			
		}

		document.getElementById('emailCheck').onclick = function() {
			phoneDiv.style.display = "none";
			emailDiv.style.display = "";
			userName1.setAttribute('name', '');
			userName1.setAttribute('value', '');
			userName2.setAttribute('name', 'userName');
			
			//userId2.setAttribute('name','userId');
			//userId1.setAttribute('name','');
			
			userId1.setAttribute('value','');
			phone1.setAttribute('value','');
			phone2.setAttribute('value','');
			phone3.setAttribute('value','');
			
		}

	};
	
	
	function pwd(){
		var userId1 = document.getElementById("userId1");
		var userId2 = document.getElementById("userId2");
		
		var userName1 = document.getElementById("userName1");
		var userName2 = document.getElementById("userName2");
		
		var phone = document.getElementById("phone");
		var emailFirst = document.getElementById("emailFirst");
		var emailSecond = document.getElementById("emailSecond");
		
		
		var email = emailFirst.value + '@' + emailSecond.value;
		
		/* 		$(self.location).attr("href","/myPage/pointList?userId="+$("input[name='userId']")); */
//		location.href="/myPage/pointList?userId="+$("input[name='userId']");
		$(location).attr("href","/user/updatePwd?userId="+$("input[name='userId']").val());
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
					alert("핸드폰으로 디비에 있는지 확인!!");
					alert(JSONData.result);
					//이제 아이디 확인해서 있으면  ok 없으면 error 뜨니깐 그걸로 조건걸어서 이동시킬건지 아니면 초기화할건지 하기!
					if(JSONData.result == 'ok'){
						alert("성공했다는 이프문");
						alert(JSONData.dbUserName);
						alert(JSONData.dbPhone);
						
						if(JSONData.dbUserName != userName1.value){
							alert("이름이 일치하지 않습니다.");
							return;
						}
						
						if(JSONData.dbPhone != phone.value){
							alert("핸드폰 번호가 일치하지 않습니다.");
							return;
						}
						
						form.submit();
						
						
					}else if(JSONData.result == 'error'){
						alert("입력한 아이디와 일치하는 회원이 없습니다");
						return;
						
					}else{
						alert("띠용");
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
					alert("이메일로 디비에 있는지 확인!!");
					alert(JSONData.result);
					//이제 아이디 확인해서 있으면  ok 없으면 error 뜨니깐 그걸로 조건걸어서 이동시킬건지 아니면 초기화할건지 하기!
					if(JSONData.result == 'ok'){
						alert("성공했다는 이프문");
						alert(JSONData.dbUserName);
						alert(JSONData.dbEmail);
						
						if(JSONData.dbUserName != userName2.value){
							alert("이름이 일치하지 않습니다.");
							return;
						}
						
						if(JSONData.dbEmail != email){
							alert("이메일이 일치하지 않습니다.");
							return;
						}
							
						form.submit();
						
					}else if(JSONData.result == 'error'){
						alert("입력한 아이디와 일치하는 회원이 없습니다");
						return;
						
					}else{
						alert("띠용");
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

					var phoneCheck = $("input[name='phoneCheck']").val();
					var phoneValue = $("input[name='phoneValue']").val();
					console.log("phoneCheck=" + phoneCheck);
					console.log("phoneValue=" + phoneValue)
					alert("ok");

					if (phoneCheck == phoneValue) {
						alert("인증성공!");
						$("h6").text("비밀번호를 변경할 수 있습니다.");
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
						updatePwd.setAttribute("value","비밀번호변경");
						
						
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
					var mailCheck = $("input[name='mailCheck']").val();
					var mailValue = $("input[name='mailValue']").val();
					console.log("mailCheck=" + mailCheck);
					console.log("mailValue=" + mailValue);

					if (mailCheck == mailValue) {
						alert("인증성공!");
						$("h6").text("비밀번호를 변경할 수 있습니다.");
						
						var email = "${user.email}";
						var name = "${user.userName}";
						
						
						var userId2 =document.getElementById("userId2");
						var name2 = document.getElementById("userName2");
						
						var emailFirst = document.getElementById("emailFirst");
						var emailSecond = document.getElementById("emailSecond");
						
						
						var email = emailFirst.value + '@' + emailSecond.value;
						
													
						var updatePwd2 = document.getElementById("updatePwd2");
						
						updatePwd2.setAttribute("type","button");
						updatePwd2.setAttribute("value","비밀번호변경");
						
						
						//userId2.readOnly = true;
						//name2.readOnly = true;
						emailFirst.readOnly = true;
						emailSecond.readOnly = true;
						
						$('#mailValue').hide();
						$('#confirm').hide();
						name2.setAttribute("name" , "userName");
						userId2.setAttribute("name" , "userId")
						

					} else {
						alert("삐이이이~ 인증실패!");
					}

				});

	
	});

	
	
	$(function() {

		$('#confirm').hide();
		$('#phoneConfirm').hide();

		$('#sendPhone').click(
				function() {
					//var userId1 = document.getElementById("userId1");
					var userId1 = $('#userId1');
					//alert(userId1);
					//alert(userId1.val());
					//var name1 = document.getElementById("name1");
					var name1 = $('#userName1');
					
					$("#emailRadio").hide();
					
					//var phoneRadio = document.getElementById('phoneCheck');
					//var phoneRadio = $('#phoneCheck');
					
					//var emailRadio = document.getElementById('emailCheck');
					//var emailRadio = $('#emailCheck');
					
					
					var phone1 = document.getElementById("phone1");
					var phone2 = document.getElementById("phone2");
					var phone3 = document.getElementById("phone3");
					var phone = document.getElementById("phone");
							phone.value = phone1.value + "-" + phone2.value + "-"
									+ phone3.value;

						if (userId1.val() == null || userId1.val()=="") {
							alert("아이디는 반드시 입력하셔야 합니다.")
							return;
						}

						if (name1.val() == null || name1.val()=="") {
							
							alert("이름은 반드시 입력하셔야 합니다.");
							return;
						} 

						if (phone1.value != "" && phone2.value != ""
								&& phone3.value != "") {
						}

						if (phone.value == null || phone.value=="") {
							alert("핸드폰 번호는 반드시 입력하셔야 합니다.");
							return;
						}

						if (phone.value.length > 15) {
							alert("핸드폰 번호 형식에 맞지 않습니다.");
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
										$("h6").text("문자 발송 중입니다... 잠시만 기다려 주세요.");
									},
									success : function(JSONData, Status) {
										console.log(Status);
										console.log(JSONData);
										if (JSONData.result == "done") {
											$("input[name='phoneCheck']").val(
													JSONData.phoneCheck);
											$("h6").text("입력하신 번호로 문자 발송이 완료되었습니다.");

											$("input[name='phoneValue']").attr("type",
													"text").attr("placeholder", "인증번호 입력").attr("id","phoneValue");

											$('#sendPhone').hide();
											$('#removeDiv').hide();
											$('#phoneConfirm').show();

										}
									}
								})
								
								}else{
									$("h6").text(JSONData.result);
								}
								
							}
						})
						
						


					
				})

		$('#sendMail')
				.click(
						function() {
							
							var userId2 = document.getElementById("userId2");

							var name2 = document.getElementById("userName2");

							var emailFirst = document.getElementById("emailFirst");
							var emailSecond = document.getElementById("emailSecond");
							
							
							var email = emailFirst.value + '@' + emailSecond.value;
							
							$("#phoneRadio").hide();
							

								if (userId2.value == null || userId2.value == "") {
									alert("아이디는 반드시 입력하셔야 합니다.")
									return;
								}

								if (name2.value == null || name2.value == "") {
									alert("이름은 반드시 입력하셔야 합니다.");
									return;
								}



								if (email == null || email.length =="") {
									alert("이메일은 반드시 입력하셔야 합니다.");
									return;
								}
								if (email != ""
										&& (email.indexOf('@') < 1 || email.indexOf('.') == -1)) {
									alert("이메일 형식이 아닙니다.");
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
											$("h6")
													.text(
															"메일 발송 중입니다...");
										},
										success : function(JSONData, Status) {
											console.log(Status);
											console.log(JSONData);
											if (JSONData.result == "done") {
												$("input[name='mailCheck']")
														.val(JSONData.mailCheck);
												$("h6")
														.text(
																"메일 발송이 완료되었습니다.");

												$("input[name='mailValue']")
														.attr("type", "text")
														.attr("placeholder",
																"인증번호 입력")
														.attr("id","mailValue");

												$('#sendMail').hide();
												$('#emailRemoveDiv').hide();
												$('#confirm').show();

											}
										}
									})
								
								}else{
									$("h6").text(JSONData.result);
								}
								
							}
						})

						});
	});
	
	
	
	$(function(){
		$(".nav-link:contains('비밀번호찾기')").addClass("disabled");
	})
	
</script>
</head>
<body>
 <jsp:include page="/view/user/userToolBar.jsp"></jsp:include>
<h1>비밀번호찾기</h1>
	<form action="/user/updatePwd" method="post" id="pwdForm">

		<div id="phoneRadio">
		<input type="radio" name="searchId" id="phoneCheck">핸드폰번호로
		비밀번호찾기</br>
		</div>
		<div id="phoneDiv" style="display: none">
			아이디<input type="text" id="userId1"> </br> 
			이름 <input type="text" id="userName1"></br> 
			핸드폰번호<input type="text" id="phone1" name="phone1">
			-<input type="text" id="phone2"	name="phone2">
			-<input type="text" id="phone3" name="phone3">&nbsp;&nbsp;
			<!-- <input type="button" value="아이디찾기" onclick="javascript:next()"> -->
			<input type="hidden" id="phone" name="phone"> 
			<input type="button" value="인증하기" id="sendPhone">  
			<input type="hidden" id="updatePwd" onclick="javascript:pwd()">
			<br/>
			<input type="hidden" name="phoneValue" value="">
			<button type="button" id="phoneConfirm">인증번호확인</button>
			<h6></h6>
			<input type="hidden" name="phoneCheck" value="">

		</div>



		<div id="emailRadio">
		<input type="radio" name="searchId" id="emailCheck">이메일로
		비밀번호찾기</br>
		</div>
		<div id="emailDiv" style="display: none">
			아이디<input type="text" id="userId2"></br> 
			이름 <input type="text" id="userName2"></br>
			이메일 <input type="text" name="emailFirst" id="emailFirst"> 
			@ <select name="emailSecond" id="emailSecond">
				<option value="">선택</option>
				<option value="gmail.com">gmail.com</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
			</select>
			
			&nbsp;&nbsp;
			<!-- <input type="button" value="아이디찾기" onclick="javascript:next()"> -->
			<input type="button" value="인증하기" id="sendMail"> 
			<input type="hidden" id="updatePwd2" onclick="javascript:pwd()"></br>
			<input type="hidden" name="mailValue" value="">
			<button type="button" id="confirm">인증번호확인</button>
			<h6></h6>
			<input type="hidden" name="mailCheck" value="">

		</div>
		
		
		
	</form>
</body>
</html>