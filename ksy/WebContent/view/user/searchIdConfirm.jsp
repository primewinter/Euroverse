<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:if test="${ ! empty user }">
		<jsp:forward page="/main.jsp"/>
	</c:if>
	<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script>
	function openForm() {
		var authForm = document.getElementById("authForm");
		authForm.style.display = "";
	}
	window.onload = function() {
		function login() {
			location.href("/");
		}
		var phoneDiv = document.getElementById("phoneDiv");
		var emailDiv = document.getElementById("emailDiv");
		var userName1 = document.getElementById("userName1");
		var userName2 = document.getElementById("userName2");
		var phone = document.getElementById("phone");
		var email = document.getElementById("email");
	};
</script>


<script>
	$(function() {

		$('#phoneConfirm').click(
				function() {

					var phoneCheck = $("input[name='phoneCheck']").val();
					var phoneValue = $("input[name='phoneValue']").val();
					console.log("phoneCheck=" + phoneCheck);
					console.log("phoneValue=" + phoneValue)

					if (phoneCheck == phoneValue) {
						alert("��������!");
						var phone = $("${user.phone}");
						var name = $("${user.userName}");
						$.ajax({
							url : "/user/json/getUserId",
							method : "post",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								phone : "${user.phone}",
								userName : "${user.userName}"
							}),
							success : function(JSONData, Status) {
								$('#formId').remove();

								console.log(JSONData);
								console.log(JSONData.length);
								if(JSONData.length==0){
									alert("��ġ�ϴ� �����Ͱ� �����ϴ�!");
									history.back();
								}
								
								for (var i = 0; i < JSONData.length; i++) {
									$('#onTheATag').append(
											"<div style='font-size: 20px; margin-bottom: 30px;'><b>"+	JSONData[i] + "</b></div>");

								}
								$('#onTheATag').append("<a href='/'><button type='button' class='btn btn-outline-secondary'>��������</button></a>");
								

							}
						})
					} else {
						alert("��������!")
					}

				});
		

		$('#confirm').click(
				
				function() {
					var mailCheck = $("input[name='mailCheck']").val();
					var mailValue = $("input[name='mailValue']").val();
					console.log("mailCheck=" + mailCheck);
					console.log("mailValue=" + mailValue);

					if (mailCheck == mailValue) {

						var email = "${user.email}";
						var name = "${user.userName}";
						$.ajax({
							url : "/user/json/getUserId",
							method : "post",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								email : "${user.email}",
								userName : "${user.userName}"
							}),
							success : function(JSONData, Status) {
								$('#formId').remove();

								console.log(JSONData);
								alert(JSONData);
								console.log(JSONData.length);
								for (var i = 0; i < JSONData.length; i++) {
									$('#onTheATag').append(
										"<div style='font-size: 20px; margin-bottom: 30px;'><b>"+	JSONData[i] + "</b></div>");

								}
								
								
								$('#onTheATag').append("<a href='/'><button type='button' class='btn btn-outline-secondary'>��������</button></a>");
								
							}
						})

					} else {
						alert("��������~ ��������!");
					}

				});

	
	});

	$(function() {
		$(".nav-link:contains('���̵�ã��')").addClass("disabled");

		$('#confirm').hide();
		$('#phoneConfirm').hide();

		$('#sendPhone').click(
				function() {
					
					var phone = $("${user.phone}");
					var name = $("${user.userName}");

					var phone1 = $('#phone1');
					var phone2 = $('#phone2');
					var phone3 = $('#phone3');

					$.ajax({
						url : "/user/json/checkPhone",
						method : "post",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							phone : "${user.phone}"
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
										"text").attr("placeholder", "������ȣ �Է�");

								$('#sendPhone').hide();
								$('#removeDiv').hide();
								$('#phoneConfirm').show();

							}
						}
					})
				})

		$('#sendMail')
				.click(
						function() {
							var name = "${user.userName}";
							var email = "${user.email}";
							$.ajax({
										url : "/user/json/checkMail",
										method : "post",
										dataType : "json",
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										data : JSON.stringify({
											email : "${user.email}"
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
																"������ȣ �Է�");

												$('#sendMail').hide();
												$('#emailRemoveDiv').hide();
												$('#confirm').show();

											}
										}
									})

						});
	});
</script>



<title>Insert title here</title>




</head>
<body>
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>
	
	<div style="text-align:center;margin-top: 50px;">
	
	<div style="margin-bottom: 30px;">
	<h1 style="margin-bottom: -10px;">�˻��� ���̵�</h1>
	<hr style="width: 600px; margin-bottom: -4px">
	<small>*ǥ�� ���ְ� ���̵� ���÷���  �������ּ���.</small>
	</div>
	
	<form action="" id="formId" >
		  
		<div id="userIdListDiv" style="font-size: 20px; margin-bottom: 30px;">
			<%-- <h1>${authType}</h1> --%>
			
			<c:forEach items="${starIdList}" var="userId">
				<b><c:out value="${userId}" /></b>
				</br>
			</c:forEach>

		</div>

		<c:if test="${authType eq 'phone'}">
			<div id="phoneDiv">
				<div id="removeDiv">
				<%-- 	�̸� <input type="text" id="userName1" value="${user.userName}" readonly="readonly"></br> --%>
				<%-- 	�ڵ�����ȣ<input type="text" id="phone1" name="phone1" value="${user.phone1}" readonly="readonly">
					-<input type="text" id="phone2" name="phone2" value="${user.phone2}" readonly="readonly"> 
					-<input type="text" id="phone3" name="phone3" value="${user.phone3}" readonly="readonly">&nbsp;&nbsp; --%>
				<%-- 	<h4>�̸� : ${user.userName}</h4>
					<h4>�ڵ�����ȣ : ${user.phone}</h4> --%>
					
<!-- 					<button type="button" class="btn btn-outline-primary">Primary</button>
<button type="button" class="btn btn-outline-secondary">Secondary</button> -->
				</div>
				<button type="button" id="sendPhone" class="btn btn-outline-primary">�����ϱ�</button>
				<!-- <input type="button"  value="�����ϱ�" id="sendPhone"> -->
				<input type="hidden" id="phone" name="phone"> <input type="hidden" name="phoneValue" value="">
				<button type="button"  class="btn btn-outline-primary" id="phoneConfirm">������ȣȮ��</button>
				<h6 style="margin: 20px;"></h6>
				<input type="hidden" name="phoneCheck" value="">
			</div>
		</c:if>

		<c:if test="${authType eq 'email' }">
			<div id="emailDiv" >
				<div id="emailRemoveDiv">
<%-- 					�̸� <input type="text" id="userName2" value="${user.userName}" readonly="readonly"></br> 
					�̸��� <input type="text" name="email" id="email" value="${user.email}" readonly="readonly"> --%>
				</div>
				<!-- &nbsp;&nbsp; <input type="button" value="�����ϱ�" id="sendMail"> -->
				<button type="button" id="sendMail" class="btn btn-outline-primary">�����ϱ�</button>
				<input type="hidden" name="mailValue" value="">
				<button type="button" class="btn btn-outline-primary" id="confirm">������ȣȮ��</button>
				<h6 style="margin: 20px;"></h6>
				<input type="hidden" name="mailCheck" value="">
			</div>
			</div>
		</c:if>
<!-- 		<a href="/">
		<button type="button" class="btn btn-outline-secondary">��������</button>
		</a> -->
		</br>
	</form>
	
	<div id="onTheATag" style="font-size: 20px; margin-bottom: 30px;text-align:center;"></div>
	

	<a href="/user/login.jsp"> <input type="hidden" name="loginButton">
	</a> 
<%-- 	
<div class="container">
	<div class="form-row text-center">
		<div class="form-group col-md-6">
		    <label for="idList">�˻��� ���̵�</label>
					<c:forEach items="${starIdList}" var="userId">
				<b><c:out value="${userId}" /></b>
				</br>
			</c:forEach>
		</div>
	
	
	</div>
</div> --%>
	</div>
	
</body>
<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</html>