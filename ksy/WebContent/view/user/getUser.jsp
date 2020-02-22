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
<!-- <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Noto+Sans+KR:300,400,500&display=swap&subset=korean" rel="stylesheet"> -->


<style>

#userInfoDiv .allInfo{
	display: inline-block;
	width: 208px;
	height: 100px;
	text-align: center;
	
}

	
#userInfoDiv .allInfo  p{
/* font-family: 'Noto Sans KR', sans-serif; */
font-size: 23px;
border-right: thin;
}

#userInfoProfile h4{
/* font-family: 'Noto Sans KR', sans-serif; */
font-size: 23px;
/* position: relative; */
}


 .nicknameClass{
/* font-family: 'Noto Sans KR', sans-serif; */
}
.badge{
/* font-family: 'Noto Sans KR', sans-serif; */
align-content: center;
}







/* entire container, keeps perspective */
.flip-container {
    perspective: 1000px;
   border:2px solid rgba(0,0,0,0) !important;
}

/* front pane, placed above back */
.front{
  z-index:2;
  /* for firefox 31 */
  transform: rotateY(0deg);
 /*  background-size:100% 100%; */
}
/* back, initially hidden pane */
.back {
    transform: rotateY(180deg);
  /* background-size:100% 100%; */
}

/* flip the pane when hovered */
.flip-container:hover .flipper, .flip-container.hover .flipper {
    transform: rotateY(180deg);
}

.flip-container, .front, .back {
    width: 240px;
    height: 240px;
   /*border:1px solid lightgray;*/
}
/* flip speed goes here */
.flipper {
    transition: 0.6s;
   /* 하위요소에 3D 좌표값 지정 */
    transform-style: preserve-3d;
    position: relative;
}
/* hide back of pane during swap */
.front, .back{
  position: absolute;
  backface-visibility:hidden;
}



</style>

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


      				<div id="userProfileDiv" style="width:70%;height:230px; padding-left: 400px;padding-top: 30px;margin-left: 240px;">
					    <img alt="" src="/resources/images/userImages/${user.userImg}" style="border-radius: 100px;width:170px;height: 170px;">
					 		
						 	<div style="margin-left: 200px;margin-top:-170px;">
						 		<c:if test="${user.role == 'G' }">
		                    		<div class="badge badge-secondary ">비인증회원</div>
		                    	</c:if>
		                    	<c:if test="${user.role == 'Q' }">
		                    		<div class="badge badge-info">인증회원</div>
		                    	</c:if>
		                    	<c:if test="${user.role == 'A' }">
		                    		<div class="badge badge-info" >관리자</div>
		                    	</c:if>
							    <div class="nicknameClass" style="font-size: 27px" >
									 ${user.nickname}
									<!-- <i class="far fa-address-card" style=" text-decoration: underline; cursor: help;">상세보기</i> -->
					  			</div>
					  			
					  			<div style="font-size: 14px;margin-top: 0px;">
						  			<div>
						  			${user.email}
						  			</div>
						  			
						  			<div style="margin-bottom: 10px;">
						  			${user.phone}
						  			</div>
						  			
						  			<div style="margin-bottom: 8px;">
						  			
						  			<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
										<c:if test="${tripSurvey.surveyType=='D'}">
										 <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="30px" height="25px" onmouseover="country('${tripSurvey.surveyChoice}')" onmouseout="country('')" style="margin-right: 3px;" >
										</c:if>
									</c:forEach> 
						  			
						  			</div>
						  			
						  			<div>
						  				<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
												<c:if test="${tripSurvey.surveyType=='T'}">
												 <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="30px" height="25px" onmouseover="tripStyle('${tripSurvey.surveyChoice}')" onmouseout="tripStyle('')" style="margin-right: 3px;" >
												</c:if>
										</c:forEach>
						  			
						  			</div>
						  			
						  			
					  			</div>
					  			
					  			
			<%--   			<div >	
			  			<div style="">
				  		<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
							<c:if test="${tripSurvey.surveyType=='D'}">
							 <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="30px" height="30px" onmouseover="country('${tripSurvey.surveyChoice}')" onmouseout="country('')" >
							</c:if>
						</c:forEach> 
                    	</div>
		  			
		  			
		  			
						<div >
		  					<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
									<c:if test="${tripSurvey.surveyType=='T'}">
									 <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="30px" height="30px" onmouseover="tripStyle('${tripSurvey.surveyChoice}')" onmouseout="tripStyle('')" >
									</c:if>
							</c:forEach>
						</div>	
			  				</div> --%>
			  		
			  		</div>
			  			
      				</div> 
		  			
		  			
		  			
		  			
		  			<table class="table" id="" style="margin-left:240px;width: 70%; text-align:center;  border-collapse: collapse; border-spacing: 0" >
  <thead>
<!--       <th scope="col"><i class="fas fa-coins"></i>포인트</th>
      <th scope="col"><i class="far fa-flag"></i>유럽에서</th>
      <th scope="col"><i class="fab fa-buromobelexperte"></i>슬롯</th>
      <th scope="col"><i class="far fa-clipboard"></i>게시글</th>
      <th scope="col"><i class="far fa-copy"></i>댓글</th>
      <th scope="col"><i class="fas fa-user-friends"></i>동행</th> -->
      
      <th></th>
      <th></th>
      <th></th>
      
      
  </thead>
 
  <tbody>
  <tr>
				      <td>
				      	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;">
	  					  <div class="flipper">
	       					 <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
	          					  <!-- front content -->
	        					<p style="font-size: 30px;"><i class="fas fa-coins"></i>포인트</p>
	      					  </div>
	        			<div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
	            <!-- back content -->
	     						<p style="font-size: 30px;">${user.totalPoint}P</p>
	       					 </div>
	    				</div>
					</div>

					</td>
					
					
					<td>
				      	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;">
	  					  <div class="flipper">
	       					 <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
	          					  <!-- front content -->
	        					<p style="font-size: 30px;"><i class="far fa-flag"></i>유럽에서</p>
	      					  </div>
	        			<div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
	            <!-- back content -->
	     						<p style="font-size: 30px;">${travelDate}일</p>
	       					 </div>
	    				</div>
					</div>

					</td>
				     
				     
				      <td>
				      	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;">
	  					  <div class="flipper">
	       					 <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
	          					  <!-- front content -->
	        					<p style="font-size: 30px;"><i class="fab fa-buromobelexperte"></i>슬롯</p>
	      					  </div>
	        			<div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
	            <!-- back content -->
	     						<p style="font-size: 30px;">${user.slot}개</p>
	       					 </div>
	    				</div>
					</div>

					</td>
				     
				     
				     
	</tr>			      
	<tr>
	
	
				       <td>
				      	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;">
	  					  <div class="flipper">
	       					 <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
	          					  <!-- front content -->
	        					<p style="font-size: 30px;"><i class="far fa-clipboard"></i>게시글</p>
	      					  </div>
	        			<div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
	            <!-- back content -->
	     						<p style="font-size: 30px;">${postCount}개</p>
	       					 </div>
	    				</div>
					</div>

					</td>
				     
				     
				     
				     <td>
				      	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;">
	  					  <div class="flipper">
	       					 <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
	          					  <!-- front content -->
	        					<p style="font-size: 30px;"><i class="far fa-copy"></i>댓글</p>
	      					  </div>
	        			<div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
	            <!-- back content -->
	     						<p style="font-size: 30px;">${commentCount}개</p>
	       					 </div>
	    				</div>
					</div>

					</td>
					
					
					 <td>
				      	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;">
	  					  <div class="flipper">
	       					 <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
	          					  <!-- front content -->
	        					<p style="font-size: 30px;"><i class="fas fa-user-friends"></i>동행</p>
	      					  </div>
	        			<div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
	            <!-- back content -->
	     						<p style="font-size: 30px;">${partyCount}개</p>
	       					 </div>
	    				</div>
					</div>

					</td>
				     
				     
				     
				     
				     
				     
				     
				     
				      
				      
	</tr>
				      
	
  </tbody>
</table>
		  			
		  	
		  	
		  	
		  	
		  	
<%-- 		  	
		  	
	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;">
	    <div class="flipper">
	        <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
	            <!-- front content -->
	        		<p style="font-size: 30px;"><i class="fas fa-coins"></i>포인트</p>
	        </div>
	        <div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
	            <!-- back content -->
	     			<p style="font-size: 30px;">${user.totalPoint}P</p>
	        </div>
	    </div>
	</div>

<div >
	<div class="flip-container" ontouchstart="this.classList.toggle('hover');"style="display: inline-block;">
	    <div class="flipper">
	        <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
	            <!-- front content -->
	        		<p style="font-size: 30px;"><i class="fas fa-coins"></i>포인트</p>
	        </div>
	        <div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
	            <!-- back content -->
	     			<p style="font-size: 30px;">${user.totalPoint}P</p>
	        </div>
	    </div>
	</div>
</div> 
		  	 --%>
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  	
		  			
		  			
		  			
		  			
		  			
		  			
		  			
		  			<%-- <div id="userInfoDiv" style="text-align: center; margin-left: 230px;">
		  				<div class="allInfo" id="pointDiv">
		  					<p style="border-right: ">
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
		  			
		  			
		  			
		  			
		  			
		  			<div id="userInfoProfile" class="row" style="margin-left:240px; text-align:center; display: none; ">
						<h3 style="border-bottom: 1px solid;text-align: left;">Profile</h3>
						<div class="row" style="width: 400px; background-color: gray;">
						<div class="col" style=" text-align: center;">
						이이이이
						</div>
						<div class="col" style="text-align: left;" >
						이름<h4>${user.userName}</h4>
						닉네임<h4>${user.nickname}</h4>
						이메일<h4>${user.email}</h4>
						생일<h4>${user.birth}</h4>
						핸드폰번호<h4>${user.phone}</h4>
						성별<h4><c:if test="${user.sex=='M'}">
	                    		남자
	                    	</c:if>
	                    	<c:if test="${user.sex=='F'}">
	                    		여자
	                    	</c:if></h4>
						회원가입일자<c:set var="regDate" value="${fn:split(user.regDate,' ')}"></c:set>
                    	<h4>${regDate[0]}</h4>
						알림수신여부<h4><c:if test="${user.pushAgree == 'T'}">
								동의함
							</c:if>		
							<c:if test="${user.pushAgree == 'F'}">
								거부함
							</c:if></h4>
						</div>

						</div> --%>
<%-- 
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
                    	
                    	<%-- <div style="">
                    	<h4>가고싶은 도시</h4>
				  		<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
							<c:if test="${tripSurvey.surveyType=='D'}">
							 <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="40px" height="40px" onmouseover="country('${tripSurvey.surveyChoice}')" onmouseout="country('')" >
							</c:if>
						</c:forEach> 
						<p style="position: absolute;" id="appendCountry"></p>
                    	</div>
		  			
		  			
		  			
						<div style="margin-top: 20px;">
						<h4>여행스타일</h4>
		  					<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
									<c:if test="${tripSurvey.surveyType=='T'}">
									 <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="40px" height="40px" onmouseover="tripStyle('${tripSurvey.surveyChoice}')" onmouseout="tripStyle('')" >
									</c:if>
							</c:forEach>
							<p style="position: absolute;" id="appendStyle"></p>
						</div>	 --%>	  			
                    	</div>
		  			
		  			</div>










      


</body>
</html>