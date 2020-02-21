
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

					var phoneCheck = $("input[name='phoneCheck']").val();
					var phoneValue = $("input[name='phoneValue']").val();
					console.log("phoneCheck=" + phoneCheck);
					console.log("phoneValue=" + phoneValue)
					alert("ok");

					if (phoneCheck == phoneValue) {
						alert("��������!");
						$("h6").text("��й�ȣ�� ������ �� �ֽ��ϴ�.");
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
					var mailCheck = $("input[name='mailCheck']").val();
					var mailValue = $("input[name='mailValue']").val();
					console.log("mailCheck=" + mailCheck);
					console.log("mailValue=" + mailValue);

					if (mailCheck == mailValue) {
						alert("��������!");
						$("h6").text("��й�ȣ�� ������ �� �ֽ��ϴ�.");
						
						var email = "${user.email}";
						var name = "${user.userName}";
						
						
						var userId2 =document.getElementById("userId2");
						var name2 = document.getElementById("userName2");
						
						var emailFirst = document.getElementById("emailFirst");
						var emailSecond = document.getElementById("emailSecond");
						
						
						var email = emailFirst.value + '@' + emailSecond.value;
						
													
						var updatePwd2 = document.getElementById("updatePwd2");
						
						updatePwd2.setAttribute("type","button");
						updatePwd2.setAttribute("value","��й�ȣ����");
						
						
						//userId2.readOnly = true;
						//name2.readOnly = true;
						emailFirst.readOnly = true;
						emailSecond.readOnly = true;
						
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
										$("h6").text("���� �߼� ���Դϴ�... ��ø� ��ٷ� �ּ���.");
									},
									success : function(JSONData, Status) {
										console.log(Status);
										console.log(JSONData);
										if (JSONData.result == "done") {
											$("input[name='phoneCheck']").val(
													JSONData.phoneCheck);
											$("h6").text("�Է��Ͻ� ��ȣ�� ���� �߼��� �Ϸ�Ǿ����ϴ�.");

											$("input[name='phoneValue']").attr("type",
													"text").attr("placeholder", "������ȣ �Է�").attr("id","phoneValue");

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
											$("h6")
													.text(
															"���� �߼� ���Դϴ�...");
										},
										success : function(JSONData, Status) {
											console.log(Status);
											console.log(JSONData);
											if (JSONData.result == "done") {
												$("input[name='mailCheck']")
														.val(JSONData.mailCheck);
												$("h6")
														.text(
																"���� �߼��� �Ϸ�Ǿ����ϴ�.");

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
									$("h6").text(JSONData.result);
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
<h1>��й�ȣã��</h1>
	<form action="/user/updatePwd" method="post" id="pwdForm">

		<div id="phoneRadio">
		<input type="radio" name="searchId" id="phoneCheck">�ڵ�����ȣ��
		��й�ȣã��</br>
		</div>
		<div id="phoneDiv" style="display: none">
			���̵�<input type="text" id="userId1"> </br> 
			�̸� <input type="text" id="userName1"></br> 
			�ڵ�����ȣ<input type="text" id="phone1" name="phone1">
			-<input type="text" id="phone2"	name="phone2">
			-<input type="text" id="phone3" name="phone3">&nbsp;&nbsp;
			<!-- <input type="button" value="���̵�ã��" onclick="javascript:next()"> -->
			<input type="hidden" id="phone" name="phone"> 
			<input type="button" value="�����ϱ�" id="sendPhone">  
			<input type="hidden" id="updatePwd" onclick="javascript:pwd()">
			<br/>
			<input type="hidden" name="phoneValue" value="">
			<button type="button" id="phoneConfirm">������ȣȮ��</button>
			<h6></h6>
			<input type="hidden" name="phoneCheck" value="">

		</div>



		<div id="emailRadio">
		<input type="radio" name="searchId" id="emailCheck">�̸��Ϸ�
		��й�ȣã��</br>
		</div>
		<div id="emailDiv" style="display: none">
			���̵�<input type="text" id="userId2"></br> 
			�̸� <input type="text" id="userName2"></br>
			�̸��� <input type="text" name="emailFirst" id="emailFirst"> 
			@ <select name="emailSecond" id="emailSecond">
				<option value="">����</option>
				<option value="gmail.com">gmail.com</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
			</select>
			
			&nbsp;&nbsp;
			<!-- <input type="button" value="���̵�ã��" onclick="javascript:next()"> -->
			<input type="button" value="�����ϱ�" id="sendMail"> 
			<input type="hidden" id="updatePwd2" onclick="javascript:pwd()"></br>
			<input type="hidden" name="mailValue" value="">
			<button type="button" id="confirm">������ȣȮ��</button>
			<h6></h6>
			<input type="hidden" name="mailCheck" value="">

		</div>
		
		
		
	</form>
</body>
</html>