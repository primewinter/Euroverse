<%@page import="com.ksy.service.domain.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%User user = (User)session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-3">
				<h1>내정보조회</h1>
			</div>
		</div>
					
		<div class="row">
					<div class="col-md-1">
					</div>
					
                    <div class="col-md-3">
                        <div class="profile-img">
                         <img src="${user.userImg}" alt="" style="width: 200px;height: 200px; border: 3px solid black; border-radius: 100px;-moz-border-radius: 100px;-khtml-border-radius: 100px;-webkit-border-radius: 100px;"> 
                       	 <!--이미지 클릭하면 프로필사진 수정하게하기... -->
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                    	</br>
                    	<h4>이 름:${user.userName}</h4>
                    	<h4>닉네임:${user.nickname}</h4>
                    	<h4>보유한 포인트:${user.totalPoint}</h4>
                    	<h4>슬롯개수:${user.slot}</h4>
                    	
                    	<c:if test="${user.role == 'G' }">
                    	<span class="badge badge-secondary">비인증회원</span>
                    	</c:if>
                    	<c:if test="${user.role == 'Q' }">
                    	<span class="badge badge-info">인증회원</span>
                    	</c:if>
                    </div>
                    
                    <div class="col-md-3">
                    </br>
                    <div class="btn-group-vertical" role="group" aria-label="Basic example">
					  <button type="button" class="btn btn-secondary"  data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">상세보기</button>
					  <button type="button" class="btn btn-secondary">회원정보수정</button>
					  <button type="button" class="btn btn-secondary">회원탈퇴</button>
					</div>
                    </div>
                    
                   

		</div><!--row -->
		
		<div class="row">
			<div class="col-md-3">
			
			</div>
			
			<div class="col-md-6">
				<div class="collapse" id="collapseExample">
				  <div class="card card-body">
				   	이메일:${user.email}</br>
				   	생일:${user.birth}</br>
				   	핸드폰번호:${user.phone}</br>
				   	성별:
				   	<%if(user.getSex().equals("M")){ %>
				   	남자
				   <%}else{ %>
				   	여자
				   <%} %></br>
				   	회원가입일자:${user.regDate}</br>
				   	
				   	
				   	
				   	알림서비스 여부:
					<c:if test="${user.pushAgree == 'T'}">
						동의함
					</c:if>		
					<c:if test="${user.pushAgree == 'F'}">
						거부함
					</c:if>		
				   
				  </div>
				</div>
			</div>
		
		</div>
		
		
	</div>
</body>
</html>