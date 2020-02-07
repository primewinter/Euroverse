<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
<head>
<title>구매 목록조회</title>
<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
             padding-top : 50px;
            background: linear-gradient(-100deg, mistyrose,pink, lightpink) fixed;

        }
        image {
        	border : 1px solid lightpink;
        }
        h3{
        	color: white;
        	font-family : Consolas;
        }
      
        
        
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function() {
	 $( 'button' ).on("click" , function() {
	  $("form").attr("method" , "GET").attr("action" , "/order/addRoomOrder").submit();
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
	<div class="container">
		<div class="page-header">
			<h3>Selenium</h3>
		<h3 align="center"> 숙소 상세정보 </h3>
		<p>${room.roomCity }</p>
		<p>${room.checkIn }</p>
    	<h2 align="center"> ${room.roomName}</h2>
    	<p>${room.mainService }</p>
    	<p>${room.familyService } </p>
    	<p>${room.sights } </p>
    	<p>${room.hotelInfo } </p>
    	<p>${room.roomInfo } </p>
    	<p>${room.price }</p>
    	<img src = "/images/uploadFiles/${room.roomImg}" id="imgControll" name="imgControll" width="800" height="700" />
		<button type="button" value="${room.roomCity}">구매하기</button>
		<input type="hidden" name="roomCity" value=" ${room.roomCity}">
    	<input type="hidden" name="roomName" value=" ${room.roomName}">
    	<input type="hidden" name="roomNum" value=" ${room.roomNum}">
    	<input type="hidden" name="adultNum" value=" ${room.adultNum}">
    	<input type="hidden" name="childNum" value=" ${room.childNum}">
		<input type="hidden" name="mainService" value=" ${room.mainService}">
    	<input type="hidden" name="familyService" value=" ${room.familyService}">
    	<input type="hidden" name="sights" value=" ${room.sights}">
    	<input type="hidden" name="hotelInfo" value=" ${room.hotelInfo}">
		<input type="hidden" name="roomInfo" value=" ${room.roomInfo}">
    	<input type="hidden" name="price" value=" ${room.price}">
    	<input type="hidden" name="checkIn" value=" ${room.checkIn}">
    	<input type="hidden" name="checkOut" value=" ${room.checkOut}">
    	<input type="hidden" name="detailLink" value=" ${room.detailLink}">
    	<input type="hidden" name="roomImg" value=" ${room.roomImg}">
		</div>
</div>
</form>

</body>
</html>