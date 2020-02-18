<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
            <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- jquery Ui 링크 (datePicker)  -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!--datePicker CDN  -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- boot strap File upload CDN  -->
<script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.js"></script>

<!-- swiper CDN -->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<!--========================= -->

<!-- fontawesome CDN -->
<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<style>
.profile-card-3 {
  font-family: 'Open Sans', Arial, sans-serif;
  position: relative;
  float: left;
  overflow: hidden;
  width: 85%;
  text-align: center;
  height:368px;
  border:none;
}
.profile-card-3 .background-block {
    float: left;
    width: 100%;
    height: 200px;
    overflow: hidden;
}
.profile-card-3 .background-block .background {
  width:40%;
  vertical-align: top;
  opacity: 0.9;
  -webkit-filter: blur(0.5px);
  filter: blur(0.5px);
   -webkit-transform: scale(1.8);
  transform: scale(2.8);
}
.profile-card-3 .card-content {
  width: 100%;
  padding: 15px 25px;
  color:#232323;
  float:left;
  background:#efefef;
  height:50%;
  border-radius:0 0 5px 5px;
  position: relative;
  z-index: 2;
}
.profile-card-3 .card-content::before {
    content: '';
    background: #efefef;
    width: 120%;
    height: 100%;
    left: 1px;
    bottom: 41px;
    position: absolute;
    z-index: -1;
    transform: rotate(-8deg);
}
.profile-card-3 .profile {
  border-radius: 50%;
  position: absolute;
  bottom: 50%;
  left: 50%;
  max-width: 100px;
  opacity: 1;
  box-shadow: 3px 3px 20px rgba(0, 0, 0, 0.5);
  border: 2px solid rgba(255, 255, 255, 1);
  -webkit-transform: translate(-50%, 0%);
  transform: translate(-50%, 0%);
  z-index:3;
}
.profile-card-3 h2 {
  margin: 0 0 5px;
  font-weight: 600;
  font-size:25px;
}
.profile-card-3 h2 small {
  display: block;
  font-size: 15px;
  margin-top:10px;
}
.profile-card-3 i {
  display: inline-block;
    font-size: 16px;
    color: #232323;
    text-align: center;
    border: 1px solid #232323;
    width: 30px;
    height: 30px;
    line-height: 30px;
    border-radius: 50%;
    margin:0 5px;
}
.profile-card-3 .icon-block{
    float:left;
    width:100%;
    margin-top:15px;
}
.profile-card-3 .icon-block a{
    text-decoration:none;
}
.profile-card-3 i:hover {
  background-color:#232323;
  color:#fff;
  text-decoration:none;
}

.media img{
	width: 200px;
	height: 200px;
	border-radius: 50%;
	box-shadow: 3px 3px 20px rgba(0, 0, 0, 0.5);
	border: 2px solid rgba(255, 255, 255, 1);
}

.media-body{
	margin: 40px;

}



</style>



</head>
<body>
<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"  id="main">
		
	<div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">플래너 초대 목록</h1>
     </div> 
		
	
	<form id="myOfferListForm">
 		<input type="hidden" id="currentPage" name="currentPage" value=0 />
 		<input type="hidden" id="currentPage2" name="currentPage2" value=0 /> 

	</form>


<table class="table">

			<c:forEach var="planOffer" items="${planOfferList}" varStatus="status" >
						<div class="col-md-3" style="float: left;">
			    		    <div class="card profile-card-3">
			    		        <div class="background-block">
			    		            <img src="/resources/images/planImg/${planOffer.planImg}" alt="profile-sample1" class="background"/>
			    		        </div>
			    		        <div class="profile-thumb-block">
			    		            <img src="/resources/images/userImages/${planOffer.userImg}" alt="profile-image" class="profile"/>
			    		        </div>
			    		        <div class="card-content">
			                    		${planOffer.planTitle}
			                    		<small>
			                    			<br>${planOffer.offerMsg} 
			                    			<br>${planOffer.fromUserId} 
			                    			<br>
			                    			 <c:set var="planOfferDate" value="${fn:split(planOffer.offerDate,' ')}"></c:set>
					   						 <c:out value="${planOfferDate[0]}"></c:out>
			                    		</small>
			                    <div class="icon-block"><a href="#">수락</a><a href="#"> 거절</a></div>
			                    </div>
			                </div>
			    		</div>
			</c:forEach>
		
	

</table>
<jsp:include page="../../common/pageNavigator_new.jsp"/>
<hr class="one">


 <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">동행 초대목록</h1>
     </div> 
     
 		<input type="hidden" id="currentPage" name="currentPage" value=0 /> 
	


	
	<ul class="list-unstyled">
		<c:forEach var="partyOffer" items="${partyOfferList}" varStatus="status" >
			<li class="media">
			    <img src="/resources/images/userImages/${partyOffer.userImg}" class="mr-3" alt="..." >
			    <div class="media-body">
			      <h5 class="mt-0 mb-1">${partyOffer.postTitle}</h5>
			      ${partyOffer.toUserId}<br>
			      ${partyOffer.offerMsg}<br>
			      
			      <c:set var="partyOfferDate" value="${fn:split(partyOffer.offerDate,' ')}"></c:set>
					   						 <c:out value="${partyOfferDate[0]}"></c:out>
			      <br>
					
					<button type="button" class="btn btn-primary">수락</button>
					<button type="button" class="btn btn-secondary">거절</button>			      
			    </div>
			  </li>
		
		</c:forEach>
	</ul>




<jsp:include page="../../common/pageNavigator_new2.jsp"/>




</main>
</div>
</div>

</body>
</html>