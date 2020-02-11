<%@page import="com.ksy.service.domain.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%User user = (User)session.getAttribute("user"); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
/* 	$("button:contains('로그인')").on("click",function(){
		location.href="/view/user/loginTest.jsp";
	});
	
	$("button:contains('로그아웃')").on("click",function(){
		location.href="/user/logout";
	});
	
	$("h1:contains('출석체크페이지로 이동')").on("click",function(){
			location.href="/view/myPage/choolCheck.jsp";
	});
	
	
 	$("h1:contains('회원가입')").on("click",function(){
		location.href="/user/addUser";
	});
 	
 	$("h1:contains('내정보조회')").on("click",function(){
 		location.href="/user/getUser";
 	});
 	
 	$("h5:contains('메인으로')").on("click",function(){
 		location.href="/";
 	}); */
 	
/*
	$("h1:contains('출석체크페이지로 이동')").on("click",function(){
		location.href=
	});

	$("h1:contains('출석체크페이지로 이동')").on("click",function(){
		location.href=
	});
 */
	
});


 
</script>

</head>
<body>

<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>

 	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">내정보조회</h1>
      </div> 
      <div class="row">
					<div class="col-md-2">
					</div>
					
                    <div class="col-md-3">
                        <div class="profile-img">
                         <img src="/resources/images/userImages/${user.userImg}" alt="유저이미지" style="width: 200px;height: 200px; border: 3px solid black; border-radius: 100px;-moz-border-radius: 100px;-khtml-border-radius: 100px;-webkit-border-radius: 100px;"> 
                       	 <!--이미지 클릭하면 프로필사진 수정하게하기... -->
                        </div>
                    	<c:if test="${user.role == 'G' }">
                    	<span class="badge badge-secondary" style="width:200px;">비인증회원</span>
                    	</c:if>
                    	<c:if test="${user.role == 'Q' }">
                    	<span class="badge badge-info" style="width:200px;">인증회원</span>
                    	</c:if>
                    	<c:if test="${user.role == 'A' }">
                    	<span class="badge badge-info" style="width:200px;">관리자</span>
                    	</c:if>
                    </div>
                    <div class="col-md-2">
                    </br>
                    	<h4>이름 </h4>
                    	<h4>닉네임</h4>
                    	<h4>보유한 포인트</h4>
                    	<h4>슬롯개수</h4>
                    	<h4>이메일</h4>
                    	<h4>생일</h4>
                    	<h4>핸드폰번호</h4>
                    	<h4>성별</h4>
                    	<h4>회원가입일자</h4>
                    	<h4>알림수신여부</h4>
                    	<h4></h4>
                    	
                    </div>
                                             
                    <div class="col-md-4">
                    	</br>
                    	<h4>${user.userName}</h4>
                    	<h4>${user.nickname}</h4>
                    	<h4>${user.totalPoint}</h4>
                    	<h4>${user.slot}</h4>
                    	<h4>${user.email}</h4>
                    	<h4>${user.birth}</h4>
                    	<h4>${user.phone}</h4>
                    	<h4>
	                    	<c:if test="${user.sex=='M'}">
	                    		남자
	                    	</c:if>
	                    	<c:if test="${user.sex=='F'}">
	                    		여자
	                    	</c:if>
                    	</h4>
                    	<h4>${user.regDate}</h4>
                    	<h4>
	                    	<c:if test="${user.pushAgree == 'T'}">
								동의함
							</c:if>		
							<c:if test="${user.pushAgree == 'F'}">
								거부함
							</c:if>
                    	</h4>
                    	
                    </div>
		</div><!--row -->
		
      
      
      
    </main>
    </div><!-- include 사이드바와 이어짐  row End-->
    </div><!-- include 사이드바와 이어짐 container End -->


</body>
</html>