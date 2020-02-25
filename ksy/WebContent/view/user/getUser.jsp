<%@page import="com.ksy.service.domain.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${  empty user }">
	<jsp:forward page="/main.jsp"/>
</c:if>

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

	<!-- ICON 사용을 위한 스크립트 임포트 -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>
	


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
	margin:20px 30px;
	    perspective: 1000px;
	   border:2px solid rgba(0,0,0,0) !important;
	   
	}
	
	
	/* front pane, placed above back */
	.front{
	  z-index:2;
	  /* for firefox 31 */
	  transform: rotateY(0deg);
	 /*  background-size:100% 100%; */
	 //box-shadow: 5px 5px 7px gray;
	 border-radius :4px; 
	  border: 1px solid #F7F0F0;
	}
	/* back, initially hidden pane */
	.back {
	    transform: rotateY(180deg);
	  /* background-size:100% 100%; */
	  //box-shadow: 5px 5px 7px gray;
	  border-radius :4px;
	   border: 1px solid #F7F0F0;
	  
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

var maPageCode = 'M';

	$(function(){
		$("#pointCard").on("click",function(){
			$(self.location).attr("href","/myPage/pointList");
		})
		
		$("#planCard").on("click",function(){
			$(self.location).attr("href","/plan/getPlanList");
		})
		
		$("#slotCard").on("click",function(){
			$(self.location).attr("href","/plan/getPlanList");
		})
		
		$("#postCard").on("click",function(){
			$(self.location).attr("href","/myPage/myPostCommentList");
		})
		
		$("#commentCard").on("click",function(){
			$(self.location).attr("href","/myPage/myPostCommentList");
		})
		
		$("#partyCard").on("click",function(){
			 $(self.location).attr("href", "/community/getPostList?boardName=D");
		})
		
	})
	
	
	$(function () {
		$('[data-toggle="tooltip"]').tooltip()
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
	<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>
	
	
	<div class="container" style="max-width: 1000px;">
					
		<div id="userProfileDiv" style="width:100%;height:230px;padding-top: 30px;">
			
			<div class="d-flex justify-content-between" style="padding: 0px 70px;">
			
				<!-- 유저이미지 / 유저정보 ////////////////////////////////////////// -->
				<div class="row">
				
					<!-- 유저이미지 -->
			   		<div>
			   			<img alt="" src="/resources/images/userImages/${user.userImg}" style="border-radius: 180px;width:210px;height: 210px;border: 1px solid #DBE0E5;">
				 	</div>
				 	
				 	<!-- 유저정보 -->
				 	<div style="margin-left: 30px;margin-top: 20px;">
				 	
				 		<c:if test="${user.role == 'G' }">
			                 <div class="badge badge-secondary">비인증회원</div>
	                 	</c:if>
	                 	<c:if test="${user.role == 'Q' }">
	                 		<div class="badge badge-info">인증회원</div>
	                 	</c:if>
	                 	<c:if test="${user.role == 'A' }">
	                 		<div class="badge badge-success" >관리자</div>
	                 	</c:if>
	                 	
					    <div class="nicknameClass" style="font-size: 25px;margin:  5px 0px 15px 0px;">
							 ${user.nickname} <span style="font-size: 18px;">님 안녕하세요!</span>
							<!-- <i class="far fa-address-card" style=" text-decoration: underline; cursor: help;">상세보기</i> -->
			  			</div> 
			  			
			  			<div style="font-size: 16px;display: inline-block;">
				  			<div style="">
				  				<span data-feather="user"></span> &nbsp; 
				  				${user.userName}&nbsp;
				  				<c:if test="${user.sex == 'M'}">
					  				<i class="fas fa-mars" style="color: #106ABD;"></i>
					  			</c:if>
					  			<c:if test="${user.sex == 'F'}">
					  				<i class="fas fa-venus" style="color: #BD1010;"></i>
					  			</c:if>
				  			</div>
				  			<%-- <div style="font-size: 16px;">
				  				<span data-feather="user"></span> &nbsp; 
					  			<c:if test="${user.sex == 'M'}">
					  				남자 <i class="fas fa-male"></i>
					  			</c:if>
					  			<c:if test="${user.sex == 'F'}">
					  				여자 <i class="fas fa-female"></i>
					  			</c:if>
				  			</div> --%>
				  			<div style="font-size: 16px;">
				  				<span data-feather="mail"></span> &nbsp; ${user.email}
				  			</div>
				  			
				  			<div style="font-size: 16px;">
				  				<span data-feather="phone"></span> &nbsp; ${user.phone}
				  			</div>
			  			</div>
			  			
			  		</div>
			  	</div>
		  		<!-- 유저이미지 / 유저정보 ////////////////////////////////////////// -->
		  		
		  		
		  		<!-- 가고싶은나라 / 여행스타일 /////////////////////////////// -->
		  		<div style="width: 290px;border-left: 1px solid #E7E7E7; padding-left: 20px;margin-top: 30px;margin-bottom: 10px;float: right;">
					<div style="margin-bottom: 20px;">
						<div style="margin-bottom: 5px;">
							<span data-feather="flag"></span> &nbsp;가고싶은 나라
						</div>
						<div style="margin-left: 20px;">
				  			<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
								<c:if test="${tripSurvey.surveyType=='D'}">
									 <%-- <img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="60px" height="47px" onmouseover="country('${tripSurvey.surveyChoice}')" onmouseout="country('')" style="margin:3px;cursor: help;" title="${tripSurvey.surveyChoice}"  > --%>
									<span data-toggle="tooltip" data-placement="top" title="${tripSurvey.surveyChoice}"><img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="40px" height="37px" onmouseover="country('${tripSurvey.surveyChoice}')" onmouseout="country('')" style="margin:3px;cursor: help"></span>
								</c:if>
							</c:forEach> 
						</div>
					</div>
					
					<div>
						<div style="margin-bottom: 5px;">
							<span data-feather="compass"></span> &nbsp;여행스타일
						</div>
						<div style="margin-left: 20px;">
							<c:forEach var="tripSurvey" items="${tripSurveyList}" varStatus="status" >
								<c:if test="${tripSurvey.surveyType=='T'}">
									<span data-toggle="tooltip" data-placement="top" title="${tripSurvey.surveyChoice}"><img src="/resources/images/tripInfoimges/${tripSurvey.surveyImg}" alt="..." width="40px" height="37px" onmouseover="tripStyle('${tripSurvey.surveyChoice}')" onmouseout="tripStyle('')" style="margin: 3px;cursor: help;" ></span>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 가고싶은나라 / 여행스타일 /////////////////////////////// -->
		  		
	  		</div>
	  		
		</div>  	
				
		
		<!-- 카드 여섯장 ///////////////////////////////////////////////// -->
		<div style="text-align: center;margin-top: 30px;">
	      	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;cursor:pointer" id="pointCard">
				  <div class="flipper">
	   					<div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
	      					  <!-- front content -->
	    					<p style="font-size: 30px;"><i class="fas fa-coins"></i> 포인트</p>
	  					</div>
		    			<div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
		        			<!-- back content -->
	 						<p style="font-size: 30px;">${user.totalPoint}P</p>
		   				</div>
					</div>
			</div>
	
	      	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;cursor:pointer" id="planCard">
				  <div class="flipper">
	   					 <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
	      					  <!-- front content -->
	    					<p style="font-size: 30px;"><i class="far fa-flag"></i> 유럽에서</p>
	  					  </div>
	      				<div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
	         				 <!-- back content -->
	   						<p style="font-size: 30px;">${travelDate}일</p>
	     				</div>
	  				</div>
			</div>
	       
	      	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;cursor:pointer" id="slotCard">
					  <div class="flipper">
     					 <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
        					  <!-- front content -->
      						<p style="font-size: 30px;"><i class="fab fa-buromobelexperte"></i> 슬롯</p>
   					  </div>
      				  <div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
         					 <!-- back content -->
   						<p style="font-size: 30px;">${user.slot}개</p>
   					 </div>
  				</div>
			</div>
	     </div>
	     
	     <div style="text-align: center;">
	      	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;cursor:pointer" id="postCard">
			    <div class="flipper">
   					 <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
      					  <!-- front content -->
    						<p style="font-size: 30px;"><i class="far fa-clipboard"></i> 게시글</p>
  					  </div>
   					  <div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
        				<!-- back content -->
 							<p style="font-size: 30px;">${postCount}개</p>
   					 </div>
  				</div>
			</div>
	    
			<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;cursor:pointer" id="commentCard">
	  			<div class="flipper">
	       			 <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
	          					  <!-- front content -->
	        			<p style="font-size: 30px;"><i class="far fa-copy"></i> 댓글</p>
	      			</div>
	        		<div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
	          				  <!-- back content -->
	     				<p style="font-size: 30px;">${commentCount}개</p>
	       			</div>
   				</div>
			</div>
					
	      	<div class="flip-container" ontouchstart="this.classList.toggle('hover');" style="display: inline-block;cursor:pointer" id="partyCard">
			 	 <div class="flipper">
   					 <div class="front" style="border: 1px solid; text-align: center; padding-top: 90px;">
         					  <!-- front content -->
       					<p style="font-size: 30px;"><i class="fas fa-user-friends"></i> 동행</p>
  					  </div>
       				 <div class="back" style="border: 1px solid; text-align: center;padding-top: 90px;">
           					<!-- back content -->
   						<p style="font-size: 30px;">${partyCount}개</p>
   					 </div>
   				</div>
			</div>
		</div>
	
	</div>
	
	<script>
		/* icon 사용을 위한 스크립트 */
		feather.replace();
	</script>

</body>
<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</html>