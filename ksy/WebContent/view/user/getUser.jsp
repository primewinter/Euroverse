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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<!-- 구글웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Noto+Sans+KR:300,400,500&display=swap&subset=korean" rel="stylesheet">


<style>

#userInfoDiv .allInfo{
	display: inline-block;
	width: 208px;
	height: 100px;
	text-align: center;
	
}

	
#userInfoDiv .allInfo  p{
font-family: 'Noto Sans KR', sans-serif;
font-size: 23px;
border-right: thin;
}

#userInfoProfile h4{
font-family: 'Noto Sans KR', sans-serif;
font-size: 23px;
/* position: relative; */
}


 .nicknameClass{
font-family: 'Noto Sans KR', sans-serif;
}
.badge{
font-family: 'Noto Sans KR', sans-serif;
align-content: center;
}




</style>
<!-- 핀터레스트 레이아웃 -->

<script>
$(function(){
	$(".fa-address-card").on("click",function(){
		var text = $(".fa-address-card").text();

		if(text == '상세보기'){
			$(".fa-address-card").text("접기");
			$("#userInfoProfile").css("display","block")
		}else if(text =='접기'){
			$(".fa-address-card").text("상세보기");
			$("#userInfoProfile").css("display","none")
		}
	})
	
	
})


function country(country){
	$("#appendCountry").html("");
	
	$("#appendCountry").append(country);

}

function tripStyle(tripStyle){
	$("#appendStyle").html("");
	
	$("#appendStyle").append(tripStyle);

}

 
</script>

</head>
<body>

<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>

 	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      					<div>
					 		<c:if test="${user.role == 'G' }">
	                    		<div class="badge badge-secondary ">비인증회원</div>
	                    	</c:if>
	                    	<c:if test="${user.role == 'Q' }">
	                    		<div class="badge badge-info">인증회원</div>
	                    	</c:if>
	                    	<c:if test="${user.role == 'A' }">
	                    		<div class="badge badge-info" >관리자</div>
	                    	</c:if>
	                    </div>
      				<div id="userProfileDiv" style="height:230px;background-color: #4d4d4d;color: white; padding-left: 20px;padding-top: 30px">
					    <img alt="" src="/resources/images/userImages/${user.userImg}" style="display: inline-block; border-radius: 100px;width:170px;height: 170px;">
					    <div class="nicknameClass" style="display: inline-block;" >
							 ${user.nickname}
							<i class="far fa-address-card" style=" text-decoration: underline; cursor: help;">상세보기</i>
			  			</div>
      				</div> 
		  			
		  			<div id="userInfoDiv" style="width :100% ;">
		  				<div class="allInfo" id="pointDiv">
		  					<p >
		  					<i class="fas fa-coins"></i>
		  					포인트
		  					<br>${user.totalPoint}P
		  					</p>
		  				</div>
		  				
		  				<div class="allInfo" id="tripDateDiv">
		  					<p>
		  					<i class="far fa-flag"></i>
		  					유럽에서
		  					<br>${travelDate}일
		  					</p>
		  				</div>
		  				
		  				<div class="allInfo" id="slotDiv">
		  					<p >
		  					<i class="fab fa-buromobelexperte"></i>
		  					슬롯
		  					<br>${user.slot}개
		  					</p>
		  				</div>
		  				
		  				<div class="allInfo" id="postDiv">
		  					<p >
		  					<i class="far fa-clipboard"></i>
		  					게시글
		  					<br>${postCount}개
		  					</p>
		  				</div>
		  				
		  				<div class="allInfo" id="commentDiv">
		  					<p >
		  					<i class="far fa-copy"></i>
		  					댓글
		  					<br>${commentCount}개
		  					</p>
		  				</div>
		  				
		  				<div class="allInfo" id="partyDiv" >
		  					<p >
		  					<i class="fas fa-user-friends"></i>
		  					동행
		  					<br>${partyCount}개
		  					</p>
		  				</div>
		  			
		  			
		  			</div>
		  			
		  			<hr class="one" >
		  			
		  			
		  			
		  			
		  			<div id="userInfoProfile" class="row" style=" display: none; ">
						
				<%-- 		<div class="col"  >
						<h4>이름</h4>
						<h4>닉네임</h4>
						<h4>이메일</h4>
						<h4>생일</h4>
						<h4>핸드폰번호</h4>
						<h4>성별</h4>
						<h4>회원가입일자</h4>
						<h4>알림수신여부</h4>
						</div>



						<div class="col">
						
		  				<h4> <b style="text-decoration: underline;text-underline-position: under;">${user.userName}</b> </h4>
                    	<h4><b style="text-decoration: underline;text-underline-position: under;">${user.nickname}</b></h4>
                    	<h4><b style="text-decoration: underline;text-underline-position: under;">${user.email}</b></h4>
                    	<h4><b style="text-decoration: underline;text-underline-position: under;">${user.birth}</b></h4>
                    	<h4><b style="text-decoration: underline;text-underline-position: under;">${user.phone}</b></h4>
                    	<h4>
                    		<c:if test="${user.sex=='M'}">
	                    		<b style="text-decoration: underline;text-underline-position: under;">남자</b>
	                    	</c:if>
	                    	<c:if test="${user.sex=='F'}">
	                    		<b style="text-decoration: underline;text-underline-position: under;">여자</b>
	                    	</c:if>
                    	
                    	</h4>
                    	
                    	<c:set var="regDate" value="${fn:split(user.regDate,' ')}"></c:set>
                    	<h4><b style="text-decoration: underline;text-underline-position: under;">${regDate[0]}</b></h4>
                    	
                    	
                    	<h4>
                    		<c:if test="${user.pushAgree == 'T'}">
								<b style="text-decoration: underline;text-underline-position: under;">동의함</b>
							</c:if>		
							<c:if test="${user.pushAgree == 'F'}">
								<b style="text-decoration: underline;text-underline-position: under;">거부함</b>
							</c:if>
                    	
                    	</h4> --%>
                    	
                    	<div style="">
                    	<h4>가고싶은 도시</h4>
				  		<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
							<c:if test="${tripSurvey.surveyType=='D'}">
							 <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="40px" height="40px" onmouseover="country('${tripSurvey.surveyChoice}')" onmouseout="country('')" >
							</c:if>
						</c:forEach> 
						<p id="appendCountry"></p>
                    	</div>
		  			
		  			
		  			
						<div style="">
						<h4>여행스타일</h4>
		  					<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
									<c:if test="${tripSurvey.surveyType=='T'}">
									 <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="40px" height="40px" onmouseover="tripStyle('${tripSurvey.surveyChoice}')" onmouseout="tripStyle('')" >
									</c:if>
							</c:forEach>
							<p id="appendStyle"></p>
						</div>		  			
                    	</div>
		  			
		  			</div>

      
    </main>
    </div><!-- include 사이드바와 이어짐  row End-->
    </div><!-- include 사이드바와 이어짐 container End -->


</body>
</html>