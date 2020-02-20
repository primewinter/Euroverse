<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<script type="text/javascript">
	$(function(){
		var userId = $("#comeBackUserId");
		var pwd = $("#comeBackPwd");
		
		
		
		$("#comeBack").on("click",function(){
			
			$.ajax({
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
						alert("Ż���� ȸ���� �ƴմϴ�.")
					}else if(JSONData.result=='unReg'){
						if(JSONData.checkPwd == null||JSONData.checkPwd==""){
							alert("��й�ȣ�� Ʋ��")
							return;
						}
						
						alert("�������ֱ�")
						$("#nicknameDiv").css("display","block");
						$("#yesOrNoDiv").css("display","none");
						//$("form").attr("method","get").attr("action","/user/login").submit();
						
					}else if(JSONData.result =='errorId'){
						alert("�������� �ʴ� ���̵��Դϴ�.");
					}else if(JSONData.result =='errorPwd'){
						alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
					}else{
						alert("���");
					}
				}//success
			})//ajax
			
		})
		
		
	})

$(function(){
	
	$("#realComeBack").on("click",function(){
		
	var nickname = 	$("#comeBackNickname");
	
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
					//h6[4].innerHTML ="";
					$("#comeBackForm").attr("action","/user/comeBack").attr("method","post").submit();
				}else{
					alert("�г����� �ߺ��˴ϴ�.")
				
				}
			}//success
		})//ajax
		
	})
	
})


</script>


</head>


<body>
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>

<form id="comeBackForm" >

���̵�<input name="userId" id="comeBackUserId" type="text" value="${userId}">
<br>��й�ȣ<input name="pwd" id="comeBackPwd" type="password" >

<div id="nicknameDiv" style="display: none;">
�г���<input name="nickname"  id="comeBackNickname" type="text" >
<button type="button" id="realComeBack" class="btn btn-outline-primary">�����ϱ�</button>
</div>

</form>

<div id="yesOrNoDiv">
<button type="button" id="comeBack" class="btn btn-outline-primary">Ȯ��</button>
<button type="button" class="btn btn-outline-secondary">���</button>
</div>

</body>
</html>