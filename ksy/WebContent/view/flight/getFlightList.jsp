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
	 $( 'button' ).on("click" , function() {
	  var airline = $(this).next().val();
		 var depCity = $(this).next().next().val();
		 var arrCity = $(this).next().next().next().val();
		 var price = $(this).next().next().next().next().val();
		 var depDate = $(this).next().next().next().next().next().val();
		 var arrDate = $(this).next().next().next().next().next().next().val();
		 var stopOver = $(this).next().next().next().next().next().next().next().val();
		 var leadTime = $(this).next().next().next().next().next().next().next().next().val();
		 var tripCourse = $(this).next().next().next().next().next().next().next().next().next().val();
		 var seatGrade = $(this).next().next().next().next().next().next().next().next().next().next().val();
		 var depTime = $(this).next().next().next().next().next().next().next().next().next().next().next().val();
		 var arrTime = $(this).next().next().next().next().next().next().next().next().next().next().next().next().val();
		 var infantNum = $(this).next().next().next().next().next().next().next().next().next().next().next().next().next().val();
		 var adultNum = $(this).next().next().next().next().next().next().next().next().next().next().next().next().next().next().val();
		 var childNum = $(this).next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().val(); 
		//var a = $(this).children().find(".flight").val();
		/* var airline = flight;
		var b = flight.find($("#airline")).val()
		 alert("a : "+airline);
		alert("b : "+b);
		var b = $(".flight").siblings().val();
		
		//$(this).next().val().siblings().val(); */
		 
		 alert(depDate+arrDate+stopOver+leadTime+tripCourse);
			//  $("form").attr("method" , "GET").attr("action" , "/order/addFlightOrder").submit();
			  self.location ="/order/addFlightOrder?airline="+airline+"&depCity="+depCity+"&arrCity="+arrCity+"&price="+price
					  +"&depDate="+depDate+"&arrDate="+arrDate+"&stopOver="+stopOver+"&leadTime="+leadTime
					  +"&tripCourse="+tripCourse+"&seatGrade="+seatGrade+"&depTime="+depTime+"&arrTime="+arrTime
					  +"&infantNum="+infantNum+"&adultNum="+adultNum+"&childNum="+childNum;
			  
	} );
});	 



	function addWish() {
		 var airline = $("input[name=airline]").val();
		 var depCity = $("input[name=depCity]").val();
		 var arrCity = $("input[name=arrCity]").val();
		 var price = $("input[name=price]").val();
		 var depDate = $("input[name=depDate]").val();
		 var arrDate = $("input[name=arrDate]").val();
		 var stopOver = $("input[name=stopOver]").val();
		 var leadTime = $("input[name=leadTime]").val();
		 var tripCourse = $("input[name=tripCourse]").val();
		 var seatGrade = $("input[name=seatGrade]").val();
		 var depTime = $("input[name=depTime]").val();
		 var arrTime = $("input[name=arrTime]").val();
		 var infantNum = $("input[name=infantNum]").val();
		 var adultNum = $("input[name=adultNum]").val();
		 var childNum = $("input[name=childNum]").val();
		 alert(depDate+arrDate+stopOver+leadTime+tripCourse);
		 $.ajax({
			url : '/flight/json/addFlight' ,
			type : "POST" ,
			cache : false ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				airline : airline,
 	     		depCity : depCity,
				arrCity : arrCity,
				price : price,
				depDate : depDate,
				arrDate : arrDate,
				stopOver : stopOver,
				leadTime : leadTime,
				tripCourse : tripCourse,
				seatGrade : seatGrade,
				depTime : depTime,
				arrTime : arrTime,
				infantNum : infantNum,
				adultNum : adultNum,
				childNum : childNum  
				
			}),
			success : function(data) {
				var msg = '';
				msg += data.msg;
				alert(msg);
				if(data.likeCheck == 'F'){
				  $(".fas.fa-heart").attr('class','far fa-heart');
				}else{
				  $(".far.fa-heart").attr('class','fas fa-heart');
				}      
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		}); 
	};


	
</script>



</head>



<body>
	<jsp:include page="/toolbar/toolBar.jsp" />
	<div class="container">
	<form id="addFlight">
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
			      <td><i class="far fa-heart" id="addWish" onclick="addWish()" style="font-size:15px;"></i>
			      
			      </td>
			      <td><button type="button" class="btn btn-info" style="width:100px;">예약하기</button>
			      	<input type="hidden"  name="airline"  value="${flight.airline }" />
					<input type="hidden"  name="depCity"  value="${flight.depCity }" />
					<input type="hidden"  name="arrCity"  value="${flight.arrCity }" />
					<input type="hidden" name="price"  value="${flight.price }" />
					<input type="hidden"  name="depDate"  value="${flight.depDate }" >
					<input type="hidden"  name="arrDate"  value="${flight.arrDate }" >
					<input type="hidden"  name="stopOver"  value="${flight.stopOver }" >
					<input type="hidden"  name="leadTime"  value="${flight.leadTime }" >
					<input type="hidden"  name="tripCourse"  value="${flight.tripCourse }" >
					<input type="hidden"  name="seatGrade"  value="${flight.seatGrade }" >
					<input type="hidden" name="depTime"  value="${flight.depTime }" >
					<input type="hidden"  name="arrTime"  value="${flight.arrTime }" >
					<input type="hidden"  name="infantNum" value="${flight.infantNum }" >
					<input type="hidden"  name="adultNum" value="${flight.adultNum }" >
					<input type="hidden"  name="childNum"  value="${flight.childNum }" >
					</td>
			    </tr>
			  </c:forEach>
			  </tbody>
			  
			</table>
		</form>
		</div>

</body>
</html>