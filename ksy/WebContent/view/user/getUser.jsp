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
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">



<style>

#userInfoDiv .allInfo{
text-align:center;
width:150px; 
height:100px; 
background-color:#668cff; 
position:relative; 
/* border-radius: 100px; */
color: #ffffff;
box-shadow: 2px 10px 10px 0px gray;

}
	
#userInfoDiv .allInfo  p{
font-family: 'Hi Melody', cursive;
font-size: 23px;
}

#userInfoProfile h4{
font-family: 'Hi Melody', cursive;
font-size: 23px;
position: relative;
}


.nicknameClass{

font-family: 'Hi Melody', cursive;
font-size: 30px;
margin-left: 250px;
}
.badge{
font-family: 'Hi Melody', cursive;
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
      <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">내정보조회</h1>
      </div> 
      				<div id="userProfileDiv" style="position: relative; right: 450px; top:50px;">
					    <img alt="" src="/resources/images/userImages/${user.userImg}" style="position:relative; top:10px;right:0px;left:535px; width: 200px;height: 200px;	border-radius: 100px;	-moz-border-radius: 100px;	-khtml-border-radius: 100px;	-webkit-border-radius: 100px;">
					    <span class="nicknameClass" style="position:relative;width:300px; top:140px;left:100px; text-align: center;">
							 ${user.nickname}
			  			</span>
							<i class="far fa-address-card" style="position:relative; top:170px;right:0px;left:-10px; text-decoration: underline; cursor: help;">상세보기</i>
			  			<div style="position:relative; top:-210px;right:0px;left:610px;">
					 		<c:if test="${user.role == 'G' }">
	                    		<span class="badge badge-secondary ">비인증회원</span>
	                    	</c:if>
	                    	<c:if test="${user.role == 'Q' }">
	                    		<span class="badge badge-info">인증회원</span>
	                    	</c:if>
	                    	<c:if test="${user.role == 'A' }">
	                    		<span class="badge badge-info" >관리자</span>
	                    	</c:if>
			  			</div>
      				</div> 
		  			
		  			<div id="userInfoDiv" style="width: 900px;height:350px; position: relative; top:-200px; left:350px; background-color: #ff9933; background-color: rgba( 255, 148, 77, 0.1 );border-radius: 100px;">
		  				<div class="allInfo" id="pointDiv" style="top:50px;left: 120px;">
		  					<p style="position:relative; top: 15px;">
		  					포인트
		  					<br>${user.totalPoint}P
		  					</p>
		  				</div>
		  				
		  				<div class="allInfo" id="tripDateDiv" style="left:400px; top:-50px;">
		  					<p style="position:relative; top: 15px;">
		  					유럽에서
		  					<br>${travelDate}일
		  					</p>
		  				</div>
		  				
		  				<div class="allInfo" id="slotDiv" style="left:680px; top:-150px;">
		  					<p style="position:relative; top: 15px;">
		  					슬룻
		  					<br>${user.slot}개
		  					</p>
		  				</div>
		  				
		  				<div class="allInfo" id="postDiv" style="left:120px; top:-100px;">
		  					<p style="position:relative; top: 15px;">
		  					게시글
		  					<br>0개
		  					</p>
		  				</div>
		  				
		  				<div class="allInfo" id="commentDiv" style="left:400px; top:-200px;">
		  					<p style="position:relative; top: 15px;">
		  					댓글
		  					<br>0개
		  					</p>
		  				</div>
		  				
		  				<div class="allInfo" id="partyDiv" style="left:680px; top:-300px;">
		  					<p style="position:relative; top: 15px;">
		  					동행
		  					<br>0개
		  					</p>
		  				</div>
		  			
		  			
		  			</div>
		  			
		  			
		  			<div id="userInfoProfile" class="row" style="width: 1150px;height:150px;position: relative;left: 100px; top:-200px; display: none;">
						
						<div class="col"  >
						<h4>이름</h4>
						<h4>닉네임</h4>
						<h4>이메일</h4>
						<h4>생일</h4>
						<h4>핸드폰번호</h4>
						<h4>성별</h4>
						<h4>회원가입일자</h4>
						<h4>알림수신여부</h4>
						</div>



						<div class="col" style="position: relative;top: -280px; left:130px;  ">
						
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
                    	<h4><b style="text-decoration: underline;text-underline-position: under;">${user.regDate}</b></h4>
                    	<h4>
                    		<c:if test="${user.pushAgree == 'T'}">
								<b style="text-decoration: underline;text-underline-position: under;">동의함</b>
							</c:if>		
							<c:if test="${user.pushAgree == 'F'}">
								<b style="text-decoration: underline;text-underline-position: under;">거부함</b>
							</c:if>
                    	
                    	</h4>
                    	
                    	<div style="position: relative;top: -220px;right: -330px;">
                    	<h4>가고싶은 도시</h4>
				  		<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
							<c:if test="${tripSurvey.surveyType=='D'}">
							 <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="40px" height="40px" onmouseover="country('${tripSurvey.surveyChoice}')" onmouseout="country('')" >
							</c:if>
						</c:forEach> 
						<p id="appendCountry"></p>
                    	</div>
		  			
		  			
		  			
						<div style="position: absolute;top: 55px;right: 300px;">
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