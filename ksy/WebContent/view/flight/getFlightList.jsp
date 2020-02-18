<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
<head>
<title>구매 목록조회</title>
<meta charset="EUC-KR">
	
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
	 $( 'button.btn.btn-info' ).on("click" , function() {
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
	<jsp:include page="/toolbar/toolBar.jsp" />
	<div class="container">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">항공사</th>
			      <th scope="col">출발시간</th>
			      <th scope="col">도착시간</th>
			      <th scope="col">경유</th>
			      <th scope="col">소요시간</th>
			      <th scope="col">가격</th>
			      <th scope="col"></th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach var="flight" items = "${flightList}" >
			    <tr>
			      <th scope="row">${flight.airline}</th>
			      <td>${flight.depTime}</td>
			      <td>${flight.arrTime}</td>
			      <td>${flight.stopOver}</td>
			      <td>${flight.leadTime}</td>
			      <td>${flight.price}원</td>
			      <td><i class="far fa-heart" style="font-size:15px;"></i></td>
			      <td><button type="button" class="btn btn-info" style="width:100px;">예약하기</button>
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
					</td>
			    </tr>
			  </c:forEach>
			  </tbody>
			  
			</table>
		</div>

</body>
</html>