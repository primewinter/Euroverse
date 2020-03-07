<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="EUC-KR">
	<title>Euroverse</title>
    <!-- 참조 : http://getbootstrap.com/css/   참조 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/carousel/">
    <!-- sweetalert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
    
    <!-- Use Swiper from CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    <script src="https://unpkg.com/swiper/js/swiper.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <!-- AOS CDN2 :: https://michalsnik.github.io/aos/-->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!--owl carousel CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

	<style>
		.card {
		    width: 70px;
		    height: 70px;
		    border-radius: 70%;
		    overflow: hidden;
		    margin-left: 10px;
		}
	</style>
	
	<script>

		$(function(){
			$("#goodbye").on("click", function(){
				
				var partyId = $(this).next().val();
				var refId = $(this).next().next().val();
				
				 swal({
						title:"동행을 탈퇴하시겠습니까?",
						text:" ",
						icon:"info",
						buttons: [ "아니오", "예"]
				}).then((YES) => {
					if(YES){
						swal({
							icon : 'success',
							title : "동행 탈퇴 완료!",
							text:" ",
							button : false,
						})
				    	setTimeout(function() {     
				    		self.location = "/community/deletePartyUser?postId="+refId+"&partyId="+partyId;
				    	}, 700);
					}
			    });
			});
		});
		
		function getPost(postId) {
            self.location = "/community/getPost?postId="+postId+"&boardName=D";
        }
	
	</script>

</head>
<body>

    <!-- ToolBar Start /////////////////////////////////////-->
    <jsp:include page="/toolbar/toolBar.jsp" />
    <jsp:include page="/toolbar/pushBar.jsp" />
    <!-- ToolBar End /////////////////////////////////////-->

	<div class="container" style="width:60%;margin:auto;">

	 <div class="row" style="font-family: 'Gothic A1', sans-serif;">
       
             <c:set var="i" value="0" />
             <c:forEach var="partyList" items="${list}">
             <c:set var="i" value="${ i+1 }" />
         	 <div class="col-md-12" style="margin-top: 10px;border-top: 1px solid gainsboro;border-bottom: 1px solid gainsboro;border-left: 1px solid gainsboro;border-right: 1px solid gainsboro;height: 190px;">
             <c:forEach var="party" items="${partyList}">
             	<c:forEach var="userList" items="${userList}">
                     <c:if test="${userList.userId == party.partyUserId}">
                         <c:if test="${party.partyRole == 'K'}">
                            <div class="partyKing" style="max-width: 18rem;float: left;border-radius: 10px;width: 165px;height: 174px; margin-left:10px;">
                         	   <span onclick="getPost('${party.refId}');">${party.postTitle}</span>
                                 <img src="/resources/images/userImages/${userList.userImg}" class="card" style="margin-left: 46px;margin-top: 23px;border: 2px solid red;">
                                 <div class="card-body text-dark" style="padding:0;">
                                     <h5 class="card-title" style="font-size: 13px; text-align: center;margin-top: 7px;font-weight: bold;">${userList.nickname}</h5>
                                     <p class="card-text" style="text-align:center;">
                                       <c:forEach var="tripStyle" items="${userList.tripStyle}">
                                           <span style="font-family: 'Gothic A1', sans-serif; font-size: 13px;">${tripStyle}</span>
                                       </c:forEach>
                                     </p>
                                 </div>
                             </div>
                         </c:if>
                         <c:if test="${party.partyRole == 'M'}">
                             <div class="partyMember" style="max-width: 18rem;float: left;border-radius: 10px;width: 165px;height: 174px; margin-left:30px;">
                                 <img src="/resources/images/userImages/${userList.userImg}" class="card" style="margin-left: 46px;margin-top: 23px;border: 2px solid silver;">
                                 <div class="card-body text-dark" style="padding:0;">
                                     <h5 class="card-title" style="font-size: 13px; text-align: center;margin-top: 7px;font-weight: bold;">${userList.nickname}</h5>
                                     <p class="card-text" style="text-align:center;">
                                       <c:forEach var="tripStyle" items="${userList.tripStyle}">
                                           <span style="font-family: 'Gothic A1', sans-serif; font-size: 13px;">${tripStyle}</span>
                                       </c:forEach>
	                                     <c:if test="${user.userId == party.partyUserId}">
	                                     	<span style="font-size:13px;margin-top:5px;" class="badge badge-info" id="goodbye">탈퇴하기</span>
	                                     	<input type="hidden" name="partyId" value="${party.partyId}"/>
	                                     	<input type="hidden" name="postId" value="${party.refId}"/>
	                                     </c:if>
                                     </p>
                                 </div>
                             </div>
                         </c:if>
                     </c:if>
                 </c:forEach>
             </c:forEach>
			 </div>
             </c:forEach>
         </div>
     </div>

	 <jsp:include page="/toolbar/footer.jsp" />

</body>
</html>