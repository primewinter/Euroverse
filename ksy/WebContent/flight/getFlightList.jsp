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
	 $( 'button.btn.btn-warning' ).on("click" , function() {
		 var airline = $(this).next().val();
		 var depCity = $(this).next().next().val();
		 var arrCity = $(this).next().next().next().val();
		 var price = $(this).next().next().next().next().val();
		 var depDate = $("#depDate").val();
		 var arrDate = $("#arrDate").val();
		 var stopOver = $("#stopOver").val();
		 var leadTime = $("#leadTime").val();
		 var tripCourse = $("#tripCourse").val();
		 var seatGrade = $("#seatGrade").val();
		 var depTime = $("#depTime").val();
		 var arrTime = $("#arrTime").val();
		 var infantNum = $("#infantNum").val();
		 var adultNum = $("#adultNum").val();
		 var childNum = $("#childNum").val();
		 alert(depDate+arrDate+stopOver+leadTime+tripCourse);
		 //var depCity = $(this).next().val();
		 //alert(depCity);
			//  $("form").attr("method" , "GET").attr("action" , "/order/addFlightOrder").submit();
			  self.location ="/order/addFlightOrder?airline="+airline+"&depCity="+depCity+"&arrCity="+arrCity+"&price="+price
					  +"&depDate="+depDate+"&arrDate="+arrDate+"&stopOver="+stopOver+"&leadTime="+leadTime
					  +"&tripCourse="+tripCourse+"&seatGrade="+seatGrade+"&depTime="+depTime+"&arrTime="+arrTime
					  +"&infantNum="+infantNum+"&adultNum="+adultNum+"&childNum="+childNum;
			  
	});
});	

/* $(function() {
    $( "#testDatepicker" ).datepicker({
    	changeMonth: true, 
         changeYear: true,
        // nextText: '다음 달',
        // prevText: '이전 달' ,
         dateFormat: "yymmdd"
    });
}); */


	
</script>



</head>




<body>
	
	<div class="container">
		<div class="page-header">
			<h3>Selenium</h3>
		
		<form class="form-horizontal">
		<h3 align="center"> 출발 / 도착</h3>
		<c:forEach var="flight" items = "${flightList}" >
		
		
		
		
		
		
    	<h5 align="center" name="airline"> 항공사${flight.airline} 
    	출발지역 ${flight.depCity}
    	도착지역 ${flight.arrCity} 
    	출발일시 ${flight.depDate}
    	도착일시${flight.arrDate}
    	출발시간${flight.depTime }
    	도착시간${flight.arrTime }
    	경유 ${flight.stopOver} 
    	소요시간 ${flight.leadTime} 
    	가격${flight.price}
    	<button type="button" class="btn btn-warning"  >예약하기</button>
    	<input type="hidden" name="airline" id="airline" value="${flight.airline }" >
		<input type="hidden" name="depCity" id="depCity" value="${flight.depCity }" >
		<input type="hidden" name="arrCity" id="arrCity" value="${flight.arrCity }" >
		<input type="hidden" name="price" id="price" value="${flight.price }" >
		<input type="hidden" name="adultNum" id="adultNum" value="${flight.adultNum }" >
		<input type="hidden" name="childNum" id="childNum" value="${flight.childNum }" >
		<input type="hidden" name="infantNum" id="infantNum" value="${flight.infantNum }" >
		<input type="hidden" name="depDate" id="depDate" value="${flight.depDate }" >
		<input type="hidden" name="arrDate" id="arrDate" value="${flight.arrDate }" >
		<input type="hidden" name="stopOver" id="stopOver" value="${flight.stopOver }" >
		<input type="hidden" name="leadTime" id="leadTime" value="${flight.leadTime }" >
		<input type="hidden" name="tripCourse" id="tripCourse" value="${flight.tripCourse }" >
		<input type="hidden" name="seatGrade" id="seatGrade" value="${flight.seatGrade }" >
		<input type="hidden" name="depTime" id="depTime" value="${flight.depTime }" >
		<input type="hidden" name="arrTime" id="arrTime" value="${flight.arrTime }" >
    	</h5>
    	
    	</c:forEach>
		
		
		
		</form>
		</div>
</div>

	<jsp:include page="../common/pageNavigator_new.jsp"/>			 

</body>
</html>