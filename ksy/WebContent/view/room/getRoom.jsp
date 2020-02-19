<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*" %>

<html lang="ko">
<head>
<title>구매 목록조회</title>
<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	

  	<!-- jQuery UI toolTip 사용 CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
             padding-top : 50px;
			font-family: "Nanum Gothic", "Malgun Gothic", "돋움", Dotum, "돋움", Dotum, Arial, Helvetica, sans-serif;
        }
        
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function() {
	 $( '#reserve' ).on("click" , function() {
	  	
		 var price = $("#price").val();
	     var roomName = $("#roomName").val();
	     var roomCity = $("#roomCity").val();
	     var adultNum = $("#adultNum").val();
	     var childNum = $("#childNum").val();
	     var checkOut = $("#checkOut").val();
	     var checkIn = $("#checkIn").val();
	     var roomNum = $("#roomNum").val();
	     //var location = $("#location").val();
	     //var distance = $("#distance").val();
	     //var grade = $("#grade").val();
	     
	     //$("#checkIn").val(checkIn);
	     
		 self.location ="/room/getRoom?roomName="+roomName+"&price="+price+"&roomCity="+roomCity+"&checkIn="+checkIn
				 +"&roomNum="+roomNum+"&adultNum="+adultNum+"&childNum="+childNum+"&checkOut="+checkOut;
		 
	});
});	

$(function() {
    $( "#testDatepicker" ).datepicker({
    	changeMonth: true, 
         changeYear: true,
        // nextText: '다음 달',
        // prevText: '이전 달' ,
         dateFormat: "yymmdd"
    });
});


	
</script>



</head>


<!-- 폼태크 -> input 안에 link 줌 -> controller 타기  ////link 필드 추가아아 -->

<body>
<form>
	<jsp:include page="/toolbar/toolBar.jsp" />
	<div class="container" style="margin-left:300px;">
		<hr/>
		<div class="row">
		<br/>
				
				<div class="col-sm-8" style="background-color:whitesmoke;">
					<div class="row" style="color:gray;margin-top:10px;margin-left:20px;margin-right:25px;margin-bottom:10px;">
						<p style="font-size:18px;"><strong>${room.roomName}</strong></p>
						<address class="contact">
							<span style="font-size:13px;">${room.roomAddr}</span>
						</address>
					</div>
						<br/>
					<div class="row" style="margin-left:10px;margin-top:-20px;">
							<div class="col-sm-8">
								<p style="margin-bottom:5px;font-size:13px;"><i class="fas fa-map-marker-alt" style="margin-left:2px;font-size:15px;"></i>&nbsp;&nbsp;${room.location}</p>
								<p style="margin-bottom:5px;font-size:13px;"><i class="fas fa-road"></i>&nbsp;&nbsp;${room.distance}</p>
								<p style="font-size:18px;"><strong><i class="fas fa-heart"></i>&nbsp;&nbsp;${room.grade}</strong></p>
							</div>
							<div class="col-sm-4" style="Padding-left:30px">
								<div class="row" id="price" style="margin-left:10px;">
										<i class="fas fa-won-sign" style="font-size:22px;"><fmt:formatNumber value="${room.price}" pattern="###,###" /> 원</i>
								</div>
								<br/>
								<i class="far fa-heart" style="font-size:25px;"></i>
								<button type="button" class="btn btn-info" style="margin-top:-10px;width:120px;" id="reserve">예약하기</button>
									<input type="hidden" name="price" value=" ${room.price}" id="price">
							    	<input type="hidden" name="roomCity" value=" ${room.roomCity}" id="roomCity">
							    	<input type="hidden" name="checkIn" value=" ${room.checkIn}" id="checkIn">
							    	<input type="hidden" name="checkOut" value=" ${room.checkOut}" id="checkOut">
							    	<input type="hidden" name="adultNum" value=" ${room.adultNum}" id="adultNum">
							    	<input type="hidden" name="childNum" value=" ${room.childNum}" id="childNum">
							    	<input type="hidden" name="roomNum" value=" ${room.roomNum}" id="roomNum">
									
							    	<input type="hidden" name="adultNum" value=" ${room.adultNum}" id="adultNum">
							    	<input type="hidden" name="childNum" value=" ${room.childNum}" id="childNum">
							    	<input type="hidden" name="roomNum" value=" ${room.roomNum}" id="roomNum">
							</div>
					</div>
					</div>
							
					<br/>
				</div>
				<br/>
				<div class="row" style="margin-left:-15;">
					<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel"
							style="width:760px;">
					  <ol class="carousel-indicators">
					    <li data-target="#carouselExampleIndicators"  data-slide-to="0" class="active"></li>
					    <li data-target="#carouselExampleIndicators"  data-slide-to="1"></li>
					    <li data-target="#carouselExampleIndicators"  data-slide-to="2"></li>
					    <li data-target="#carouselExampleIndicators"  data-slide-to="3"></li>
					    <li data-target="#carouselExampleIndicators"  data-slide-to="4"></li>
					    <li data-target="#carouselExampleIndicators"  data-slide-to="5"></li>
					    <li data-target="#carouselExampleIndicators"  data-slide-to="6"></li>
					    <li data-target="#carouselExampleIndicators"  data-slide-to="7"></li>
					  </ol>
					  <div class="carousel-inner">
					   	<div class="carousel-item active" >
					      <img src="/resources/images/roomImg/${room.roomImg}" class="d-block w-100" alt="...">
					    </div>
					  <c:forEach var="room" items = "${roomList}"  begin="1">
					    <div class="carousel-item" >
					      <img src="/resources/images/roomImg/${room.roomImg}" class="d-block w-100" alt="...">
					    </div>
					   </c:forEach>
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
				</div>
				<br/>
					<div class="row" style="font-size:13px;">
						<div class="col-sm-4" style="background-color:whitesmoke;">
							<div class="row" style="margin-left:10px;">
								<p style="font-size:18px;margin-top:10px;"><strong>주요 편의 시설</strong></p>
								<p>${room.mainService }</p>
							</div>
							<hr/>
							<div class="row" style="margin-left:10px;">
								<p style="font-size:18px;margin-top:10px;"><strong>가족 여행객을 위한 편의 시설</strong></p>
								<p>${room.familyService } </p>
							</div>
						</div>
				    	<div class="col-sm-4" style="background-color:whitesmoke;">
				    		<p style="font-size:18px;margin-top:10px;"><strong>주변 명소</strong></p>
				    		<p>${room.sights } </p>
				    	</div>
					</div>	
					<hr style="margin-left:-10px;width:65%;"/>
					<div class="row" style="font-size:13px;">
						<div class="col-sm-8" style="background-color:whitesmoke;">
						<p style="font-size:18px;margin-top:10px;"><strong>호텔 내 정보</strong></p>
							<p>${room.hotelInfo } </p>
						<p style="font-size:18px;margin-top:10px;"><strong>객실 내 정보</strong></p>
		    				<p>${room.roomInfo } </p>
	    				</div>
					</div>
					<br/><hr/>
</div>
</form>

</body>
</html>