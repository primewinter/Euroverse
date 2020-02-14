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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<style>
img{
	width: 200px;
	height: 200px;
	border-radius: 100px;
	-moz-border-radius: 100px;
	-khtml-border-radius: 100px;
	-webkit-border-radius: 100px;
}


</style>

<script>
 
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
		
		<hr class="one" style="height: 30" >
		<div class="row">
			<div class="col-md-5">
			</div>
			
			<h3>가고싶은 나라 </h3>
		</div>
		<div class="row">
			<div class="col-md-5"></div>
 				<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
					<c:if test="${tripSurvey.surveyType=='D'}">
						<div class="card" style="width: 100px;">
						  <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" class="card-img-top" alt="...">
						  <div class="card-body">
						    <p class="card-text">${tripSurvey.surveyChoice}</p>
						  </div>
						</div>
					</c:if>
				</c:forEach> 
		</div>
		<div class="row">
			<div class="col-md-5">
			</div>
			<h3>나의 여행 스타일 </h3>
		</div>
		<div class="row">
			<div class="col-md-5"></div>
				<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
						<c:if test="${tripSurvey.surveyType=='T'}">
						<div class="card" style="width: 100px;">
						  <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" class="card-img-top" alt="...">
						  <div class="card-body">
						    <p class="card-text">${tripSurvey.surveyChoice}</p>
						  </div>
						</div>
						</c:if>
				</c:forEach> 
		</div>
		
		
		
		
		
		<hr class="one" style="height: 30" >
		<div class="row">
			<div class="col-md-5">
			</div>
			<h3>유럽에 머문 시간 </h3>
		</div>
		<div class="row">
			<div class="col-md-4">
			</div>
			<div class="col-md-1">
				${travelDate}일  
			</div>
			<div class="col-md-1">
				${travelHour}시간
			</div>
			<div class="col-md-1">
				${travelMin}분
			</div>
		</div>
		
		<div class="row">
		
		</div>
		
      
      
      
    <!--   
      
      	<div class="d-flex bd-highlight" style="background: #DFFDFC">
		  <div class="p-2" style="margin-left: 80px;">
		  <img alt="" src="/resources/images/userImages/defaultUserImage.jpg">
		  </div>
		  <div class="p-2 bd-highlight">Flex item</div>
		  <div class="p-2 bd-highlight">Third flex item</div>
		</div>
      
      
      <div class="d-flex align-items-start flex-column bd-highlight mb-3" style="height: 200px; background: aqua;">
      		<div class="p-2 w-100 bd-highlight">Flex item</div>
		  <div class="mb-auto p-2 bd-highlight">Flex item</div>
		  <div class="p-2 bd-highlight">Flex item</div>
		  <div class="p-2 bd-highlight">Flex item</div>
		</div>
      
       -->
    </main>
    </div><!-- include 사이드바와 이어짐  row End-->
    </div><!-- include 사이드바와 이어짐 container End -->


</body>
</html>