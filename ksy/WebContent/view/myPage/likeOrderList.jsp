<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${  empty user }">
	<jsp:forward page="/main.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Euroverse</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script>

	var maPageCode = 'L';


	$(document).ready(function(){
		Show();
	})
	
/* 	function addFlightOrder(airline , depCity , arrCity , price, depDate , arrDate , stopOver , leadTime , tripCourse , seatGrade , depTime , arrTime , infantNum , adultNum , childNum){
		alert("키") 
		self.location ="/order/addFlightOrder?airline="+airline+"&depCity="+depCity+"&arrCity="+arrCity+"&price="+price
		  +"&depDate="+depDate+"&arrDate="+arrDate+"&stopOver="+stopOver+"&leadTime="+leadTime
		  +"&tripCourse="+tripCourse+"&seatGrade="+seatGrade+"&depTime="+depTime+"&arrTime="+arrTime
		  +"&infantNum="+infantNum+"&adultNum="+adultNum+"&childNum="+childNum;
	}
	 */
	 
	 function addFlightOrder(num){
		 var airline = $("#airline"+num).val()
		 var depCity = $("#depCity"+num).val()
		 var arrCity  = $("#arrCity"+num).val()
		 var price = $("#price"+num).val()
		 var depDate = $("#depDate"+num).val()
		 var arrDate  = $("#arrDate"+num).val()
		 var stopOver = $("#stopOver"+num).val()
		 var leadTime = $("#leadTime"+num).val()
		 var tripCourse  = $("#tripCourse"+num).val()
		 var seatGrade  = $("#seatGrade"+num).val()
		 var depTime = $("#depTime"+num).val()
		 var arrTime = $("#arrTime"+num).val().split(':')
		 var infantNum = $("#infantNum"+num).val().split(':')
		 var adultNum = $("#adultNum"+num).val()
		 var childNum = $("#childNum"+num).val()
		 $(self.location).attr("href","/order/addFlightOrder?airline="+airline+"&depCity="+depCity+"&arrCity="+arrCity+"&price="+price
				  +"&depDate="+depDate+"&arrDate="+arrDate+"&stopOver="+stopOver+"&leadTime="+leadTime
				  +"&tripCourse="+tripCourse+"&seatGrade="+seatGrade+"&depTime="+depTime+"&arrTime="+arrTime[0]
				  +"&infantNum="+infantNum[0]+"&adultNum="+adultNum+"&childNum="+childNum);
	 }
	function addRoomOrder(num){
		var price = $("#roomPrice"+num).val()
		var roomName = $("#roomName"+num).val()
		var roomCity = $("#roomCity"+num).val()
		var checkIn = $("#checkIn"+num).val()
		var roomNum = $("#roomNum"+num).val()
		var adultNum = $("#roomAdultNum"+num).val()
		var childNum = $("#roomAchildNum"+num).val()
		var checkOut = $("#checkOut"+num).val()
		var mainService = $("#mainService"+num).val()
		var familyService = $("#familyService"+num).val()
		var sights = $("#sights"+num).val()
		var hotelInfo = $("#hotelInfo"+num).val()
		var roomInfo = $("#roomInfo"+num).val()
		 $(self.location).attr("href","/order/addRoomOrder?roomName="+roomName+"&price="+price+"&roomCity="+roomCity+"&checkIn="+checkIn
				 +"&roomNum="+roomNum+"&adultNum="+adultNum+"&childNum="+childNum+"&checkOut="+checkOut+"&mainService="+mainService
				 +"&familyService="+familyService+"&sights="+sights+"&hotelInfo="+hotelInfo+"&roomInfo="+roomInfo);
		
		
		
		
		
/* 		 self.location ="/order/addRoomOrder?roomName="+roomName+"&price="+price+"&roomCity="+roomCity+"&checkIn="+checkIn
		 +"&roomNum="+roomNum+"&adultNum="+adultNum+"&childNum="+childNum+"&checkOut="+checkOut+"&mainService="+mainService
		 +"&familyService="+familyService+"&sights="+sights+"&hotelInfo="+hotelInfo+"&roomInfo="+roomInfo;
 */		 
 
	}

	$( function () {
		
		
		
		$("td:nth-child(2)").on("click",function(){
			 var type = $(this).next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().val(); 
			var id = $(this).next().val();
			console.log(type)
			alert(type)
			if( type=="flight" ){
						
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
						
				
				
				
		 self.location ="/order/addFlightOrder?airline="+airline+"&depCity="+depCity+"&arrCity="+arrCity+"&price="+price
		  +"&depDate="+depDate+"&arrDate="+arrDate+"&stopOver="+stopOver+"&leadTime="+leadTime
		  +"&tripCourse="+tripCourse+"&seatGrade="+seatGrade+"&depTime="+depTime+"&arrTime="+arrTime
		  +"&infantNum="+infantNum+"&adultNum="+adultNum+"&childNum="+childNum;
			}else if(type!="flight"){
				alert("숙소~")
				var price =  $(this).next().val();
			     var roomCity =  $(this).next().next().val();
			     var checkIn =  $(this).next().next().next().val();
			     var checkOut = $(this).next().next().next().next().val();
			     var adultNum = $(this).next().next().next().next().next().val();
			     var childNum = $(this).next().next().next().next().next().next().val();
			     var roomNum = $(this).next().next().next().next().next().next().next().val();
			     var roomName = $(this).next().next().next().next().next().next().next().next().val();
			     var roomAddr = $(this).next().next().next().next().next().next().next().next().next().val();
			     
			     var mainService = $(this).next().next().next().next().next().next().next().next().next().next().val();
			     var familyService = $(this).next().next().next().next().next().next().next().next().next().next().next().val();
			     var sights = $(this).next().next().next().next().next().next().next().next().next().next().next().next().val();
			     var hotelInfo =  $(this).next().next().next().next().next().next().next().next().next().next().next().next().next().val();
			     var roomInfo = $(this).next().next().next().next().next().next().next().next().next().next().next().next().next().next().val();
			     
			     self.location ="/order/addRoomOrder?roomName="+roomName+"&price="+price+"&roomCity="+roomCity+"&checkIn="+checkIn
				 +"&roomNum="+roomNum+"&adultNum="+adultNum+"&childNum="+childNum+"&checkOut="+checkOut+"&mainService="+mainService
				 +"&familyService="+familyService+"&sights="+sights+"&hotelInfo="+hotelInfo+"&roomInfo="+roomInfo;
				 
		 
				
			}
		})
	})


	function doShow() { 
	    if ($('#flight').is(":visible")) { 
	        $('#flight').hide();
	        $('#iconf').hide();
	        $('#room').show();
	        $('#iconr').show();// id값을 받아서 숨기기 
	    } 
	} 

	function Show() { 
	    if ($('#room').is(":visible")) { 
	        $('#room').hide(); 
	        $('#iconr').hide();
	        $('#flight').show();
	        $('#iconf').show();// id값을 받아서 숨기기 
	    } 
	} 
	

	function deleteLike(refId,likeType){
		$.ajax({
			url : '/myPage/json/deleteLike/'+refId+'/'+likeType+'/' ,
			type : "GET" ,
			cache : false ,
			dataType : "json" ,
			success : function(JSONData) {
				var flightList = JSONData.flightList;
				var roomList = JSONData.roomList;
				var flight = "F";
				var room = "R";
				console.log(flightList)
				console.log(roomList)
				alert("룸리스트 길이"+roomList.length)
				alert("룸리스트 길이"+roomList.roomName)
				
				if(JSONData.likeType=='F'){
				$("#flightBody").html("");
				
				
				for(var i=0;i<flightList.length;i++){
					$("#flightBody").append("<tr>");
					$("#flightBody").append("<th scope='row'>"+(i+1)+"</th>");
					/* $("#flightBody").append("<td onclick='javascript:addFlightOrder()'>"+flightList[i].airline+"</td>"); */
					/* $("#flightBody").append("<td onclick='javascript:addFlightOrder("+flightList[i].airline+","+flightList[i].depCity+","+flightList[i].arrCity+","+flightList[i].price+","+flightList[i].depDate+","+flightList[i].arrDate+","+flightList[i].stopOver+","+flightList[i].leadTime+","+flightList[i].tripCourse+","+flightList[i].seatGrade+","+flightList[i].depTime+","+flightList[i].arrTime+","+flightList[i].infantNum+","+flightList[i].adultNum+","+flightList[i].childNum+")'>"+flightList[i].airline+"</td>"); */
					 $("#flightBody").append("<td onclick='javascript:addFlightOrder("+i+")'>"+flightList[i].airline+"</td>");
					$("#flightBody").append("<input type='hidden'  name='airline' id='airline"+i+"' value="+flightList[i].airline+" />");
					$("#flightBody").append("<input type='hidden'  name='depCity' id='depCity"+i+"'   value="+flightList[i].depCity+" />");
					$("#flightBody").append("<input type='hidden'  name='arrCity' id='arrCity"+i+"'   value="+flightList[i].arrCity+" />");
					$("#flightBody").append("<input type='hidden'  name='price' id='price"+i+"'   value="+flightList[i].price+" />");
					$("#flightBody").append("<input type='hidden'  name='depDate' id='depDate"+i+"'   value="+flightList[i].depDate+" />");
					$("#flightBody").append("<input type='hidden'  name='stopOver' id='stopOver"+i+"'   value="+flightList[i].arrDate+" />");
					$("#flightBody").append("<input type='hidden'  name='leadTime' id='leadTime"+i+"'   value="+flightList[i].stopOver+" />");
					$("#flightBody").append("<input type='hidden'  name='tripCourse' id='tripCourse"+i+"'   value="+flightList[i].leadTime+" />");
					$("#flightBody").append("<input type='hidden'  name='seatGrade' id='seatGrade"+i+"'   value="+flightList[i].tripCourse+" />");
					$("#flightBody").append("<input type='hidden'  name='depTime' id='depTime"+i+"'   value="+flightList[i].seatGrade+" />");
					$("#flightBody").append("<input type='hidden'  name='arrTime' id='arrTime"+i+"'   value="+flightList[i].depTime+" />");
					$("#flightBody").append("<input type='hidden'  name='infantNum' id='infantNum"+i+"'   value="+flightList[i].arrTime+" />");
					$("#flightBody").append("<input type='hidden'  name='adultNum' id='adultNum"+i+"'   value="+flightList[i].infantNum+" />");
					$("#flightBody").append("<input type='hidden'  name='childNum' id='childNum"+i+"'   value="+flightList[i].adultNum+" />");
					$("#flightBody").append("<input type='hidden'  name='airline' id='airline"+i+"'   value="+flightList[i].childNum+" />");
					$("#flightBody").append("<input type='hidden' value='flight' />");
					$("#flightBody").append("<td>"+flightList[i].depCity+"/"+flightList[i].arrCity+"</td>");
					$("#flightBody").append("<td>"+flightList[i].depTime+"-"+flightList[i].arrTime+" </td>");
					$("#flightBody").append("<td>"+flightList[i].stopOver+"/"+flightList[i].leadTime+" </td>");
					$("#flightBody").append("<td>"+flightList[i].price+"원</td>");
					/* $("#flightBody").append("<td><i class='fas fa-heart deleteFlight' onclick='javascript:deleteLike("+flightList[i].flightId+","+flight+")'></i></td> "); */
					$("#flightBody").append("<td><i class='fas fa-heart deleteFlight' onclick='javascript:deleteLike("+flightList[i].flightId+",\"F\")'></i></td> ");
					$("#flightBody").append("</tr>");
					
				}
			 	$('#room').hide(); 
		        $('#iconr').hide();
		        $('#flight').show();
		        $('#iconf').show();
				
					
				}
				if(JSONData.likeType=='R'){
				
					$("#roomBody").html("");
		 			for(var j=0;j<roomList.length;j++){
						$("#roomBody").append("<tr>");
						$("#roomBody").append("<th scope='row'>"+(j+1)+"</th>");
					 	$("#roomBody").append("<td onclick='javascript:addRoomOrder("+j+")'>"+roomList[j].roomCity+"</td>"); 
						$("#roomBody").append("<input type='hidden' name='price' id='roomPrice"+j+"' value="+roomList[j].price+" id='price'>");
						$("#roomBody").append("<input type='hidden' name='roomCity' id='roomCity"+j+"' value="+roomList[j].roomCity+" id='roomCity'>");
						$("#roomBody").append("<input type='hidden' name='checkIn' id='checkIn"+j+"' value="+roomList[j].checkIn+" id='checkIn'>");
						$("#roomBody").append("<input type='hidden' name='checkOut' id='checkOut"+j+"' value="+roomList[j].checkOut+" id='checkOut'>");
						$("#roomBody").append("<input type='hidden' name='adultNum' id='roomAdultNum"+j+"' value="+roomList[j].adultNum+" id='adultNum'>");
						$("#roomBody").append("<input type='hidden' name='childNum' id='roomChildNum"+j+"' value="+roomList[j].childNum+" id='childNum'>");
						$("#roomBody").append("<input type='hidden' name='roomNum' id='roomNum"+j+"' value="+roomList[j].roomNum+" id='roomNum'>");
						$("#roomBody").append("<input type='hidden' name='roomName' id='roomName"+j+"' value="+roomList[j].roomName+" id='roomName'>");
						$("#roomBody").append("<input type='hidden' name='roomAddr' id='roomAddr"+j+"' value="+roomList[j].roomAddr+" id='roomAddr'>");
						$("#roomBody").append("<input type='hidden' name='mainService' id='mainService"+j+"' value="+roomList[j].mainService+" id='mainService'>");
						$("#roomBody").append("<input type='hidden' name='familyService' id='familyService"+j+"' value="+roomList[j].familyService+" id='familyService'>");
						$("#roomBody").append("<input type='hidden' name='sights' id='sights"+j+"' value="+roomList[j].sights+" id='sights'>");
						$("#roomBody").append("<input type='hidden' name='hotelInfo' id='hotelInfo"+j+"' value="+roomList[j].hotelInfo+" id='hotelInfo'>");
						$("#roomBody").append("<input type='hidden' name='roomInfo' id='roomInfo"+j+"' value="+roomList[j].roomInfo+" id='roomInfo'>");
						$("#roomBody").append("<td>"+roomList[j].roomName+"</td>");
						$("#roomBody").append("<td>"+roomList[j].checkIn+"-"+roomList[j].checkOut+"</td>");
						$("#roomBody").append("<td>"+roomList[j].roomNum+"개/ 성인"+roomList[j].adultNum+"명 , 유아"+roomList[j].childNum+"명</td>");
						$("#roomBody").append("<td>"+roomList[j].price+"원</td>");
						$("#roomBody").append("<td><i class='fas fa-heart deleteFlight' onclick='javascript:deleteLike("+roomList[j].roomId+",\"R\")'></i></td> ");
						$("#roomBody").append("</tr>");
					 	$('#flight').hide();
				        $('#iconf').hide();
				        $('#room').show();
				        $('#iconr').show();
						
					}  
				}
				
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}

</script>
</head>
<body>
	<jsp:include page="/toolbar/toolBar.jsp" />
	<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>
	<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>
	
	
	
	
	<div class="container" style="max-width: 1000px;">
	
		<!-- <div class="page-header"> <h3>찜목록</h3> </div> -->
		<div class="h4" style="font-weight: bold; margin-top: 40px;margin-bottom:20px; padding-left:10px;">
			내가 찜한 상품
		</div>

	  	<div class="d-flex align-items-center" style="margin: 20px;">
		  	<i class="fas fa-plane" id="iconf" style="font-size:40px; width: 50px;"></i>
		  	<i class="fas fa-bed" id="iconr" style="font-size:40px; width: 50px;"></i>
		  	
		  	<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin-left: 20px;">
			  <label class="btn btn-outline-primary active">
			    <input type="radio" name="flight" id="option1" checked onclick="javascript:Show();"> Flight
			  </label>
			  <label class="btn btn-outline-primary">
			    <input type="radio" name="room" id="option2" onclick="javascript:doShow();"> Room
			  </label>
			</div>
	  	</div>
	  	
		<table class="table table-bordered" id="flight" style="text-align: center;">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">항공사</th>
		      <th scope="col">출발도시 - 도착도시</th>
		      <th scope="col">출발일시/도착일시</th>
		      <th scope="col">경유/소요시간</th>
		      <th scope="col">가격</th>
		      <th scope="col">찜</th>
		    </tr>
		  </thead>
		 
		  <tbody id="flightBody">
		   
				<c:forEach var="flight" items = "${flightList}" varStatus="status" >
					 <tr>
					      <th scope="row">
					      ${status.count}
					      </th>
						      <td>${flight.airline}
						      </td>
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
					     		<input type="hidden" value="flight">
						      <td>${flight.depCity}/${flight.arrCity }</td>
						      <td>${flight.depTime} - ${flight.arrTime }</td>
						      <td>${flight.stopOver}/${flight.leadTime}</td>
						      <td>${flight.price}원</td>
							 	<td>
							 	<i class="fas fa-heart deleteFlight" onclick="javascript:deleteLike(${flight.flightId},'F')"></i>
							 	</td> 
							 
				   	 </tr>
		    	 </c:forEach>
		    	 <c:if test="${ empty flightList}">
				    <tr><td colspan="7" style="padding: 40px;">찜한 상품이 없습니다</td></tr>
				</c:if>
		    	 
		  </tbody>
		</table>
	
		 
	
	
		 <table class="table table-bordered" id="room" style="text-align: center;" >
		 
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">여행지</th>
		      <th scope="col">숙소</th>
		      <th scope="col">출발일시 - 도착일시</th>
		      <th scope="col">객실수/숙박인원</th>
		      <th scope="col">가격</th>
		      <th scope="col">찜</th>
		    </tr>
		  </thead>
		 
		  <tbody id="roomBody">
		   
			<c:forEach var="room" items = "${roomList}" varStatus="status" >
				 <tr>
				    <th scope="row"  id="refund2" >
				    ${status.count }
				    </th>
				    <td>${room.roomCity }</td>
	    				<input type="hidden" name="price" value=" ${room.price}" id="price">
				    	<input type="hidden" name="roomCity" value=" ${room.roomCity}" id="roomCity">
				    	<input type="hidden" name="checkIn" value=" ${room.checkIn}" id="checkIn">
				    	<input type="hidden" name="checkOut" value=" ${room.checkOut}" id="checkOut">
				    	<input type="hidden" name="adultNum" value=" ${room.adultNum}" id="adultNum">
				    	<input type="hidden" name="childNum" value=" ${room.childNum}" id="childNum">
				    	<input type="hidden" name="roomNum" value=" ${room.roomNum}" id="roomNum">
				    	<input type="hidden" name="roomName" value=" ${room.roomName}" id="roomName">
				    	<input type="hidden" name="roomAddr" value=" ${room.roomAddr}" id="roomAddr">
				    	
				    	<input type="hidden" name="mainService" value=" ${room.mainService}" id="mainService">
				    	<input type="hidden" name="familyService" value=" ${room.familyService}" id="familyService">
				    	<input type="hidden" name="sights" value=" ${room.sights}" id="sights">
				    	<input type="hidden" name="hotelInfo" value=" ${room.hotelInfo}" id="hotelInfo">
				    	<input type="hidden" name="roomInfo" value=" ${room.roomInfo}" id="roomInfo">
				    <td>${room.roomName}</td>
				    <td>${room.checkIn} - ${room.checkOut }</td>
				    <td>${room.roomNum} 개 / 성인 ${room.adultNum} 명 , 유아 ${room.childNum} 명</td>
				    <td>${room.price} 원 </td>
				    <td> 
				    <i class="fas fa-heart deleteFlight" onclick="javascript:deleteLike(${room.roomId},'R')"></i>
					 </td>
			   	 </tr>
		     </c:forEach> 
		     
		     <c:if test="${ empty roomList}">
			    <tr><td colspan="7" style="padding: 40px;">찜한 상품이 없습니다</td></tr>
			</c:if>
		     
		  </tbody>
		</table>
		
	</div>	
	
	
	
</body>
<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</html>