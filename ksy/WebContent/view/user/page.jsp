<%@page import="com.ksy.service.domain.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%User user = (User)session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<script>

$(function(){
	$("button:contains('�α���')").on("click",function(){
		location.href="/view/user/loginTest.jsp";
	});
	
	$("button:contains('�α׾ƿ�')").on("click",function(){
		location.href="/user/logout";
	});
	
	$("h1:contains('�⼮üũ�������� �̵�')").on("click",function(){
			location.href="/view/myPage/choolCheck.jsp";
	});
	
	
 	$("h1:contains('ȸ������')").on("click",function(){
		location.href="/user/addUser";
	});
 	
 	$("h1:contains('��������ȸ')").on("click",function(){
 		location.href="/user/getUser";
 	});
 	
 	$("h5:contains('��������')").on("click",function(){
 		location.href="/";
 	});
 	
/*
	$("h1:contains('�⼮üũ�������� �̵�')").on("click",function(){
		location.href=
	});

	$("h1:contains('�⼮üũ�������� �̵�')").on("click",function(){
		location.href=
	});
 */
	
});


 
</script>

</head>
<body>
<%if(user != null){ %>
<p>
�������̵� = ${user.userId}</br>
�����̸� = ${user.userName}</br>
�����г��� = ${user.nickname}</br>
</p>
<button type="button" class="btn btn-dark">�α׾ƿ�</button>
<h1>�⼮üũ�������� �̵�</h1>
<h1>��������ȸ</h1>
<%}else{%>
<button type="button" class="btn btn-dark">�α���</button>
<%} %>
<h1>ȸ������</h1>
<h5>��������</h5>
</body>
</html>