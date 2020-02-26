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

	$( function () {
		
		$("td:nth-child(2)").on("click",function(){
			 var type = $(this).next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().next().val();
			var id = $(this).next().val();
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
			}else if(type=="room"){
				alert("숙소~")
				self.location ="/order/addRoomOrder?roomId="+id;
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
				$("#flightBody").html("");
				$("#roomList").html("");
				for(var i=0;i<flightList.length;i++){
					$("#flightBody").append("<tr>");
					$("#flightBody").append("<th scope='row'>"+i+"</th>");
					$("#flightBody").append("<td>"+flightList[i].airline+"</td>");
					$("#flightBody").append("<input type='hidden'  name='airline'  value="+flightList[i].airline+" />");
					$("#flightBody").append("<input type='hidden'  name='depCity'  value="+flightList[i].depCity+" />");
					$("#flightBody").append("<input type='hidden'  name='arrCity'  value="+flightList[i].arrCity+" />");
					$("#flightBody").append("<input type='hidden'  name='price'  value="+flightList[i].price+" />");
					$("#flightBody").append("<input type='hidden'  name='depDate'  value="+flightList[i].depDate+" />");
					$("#flightBody").append("<input type='hidden'  name='stopOver'  value="+flightList[i].arrDate+" />");
					$("#flightBody").append("<input type='hidden'  name='leadTime'  value="+flightList[i].stopOver+" />");
					$("#flightBody").append("<input type='hidden'  name='tripCourse'  value="+flightList[i].leadTime+" />");
					$("#flightBody").append("<input type='hidden'  name='seatGrade'  value="+flightList[i].tripCourse+" />");
					$("#flightBody").append("<input type='hidden'  name='depTime'  value="+flightList[i].seatGrade+" />");
					$("#flightBody").append("<input type='hidden'  name='arrTime'  value="+flightList[i].depTime+" />");
					$("#flightBody").append("<input type='hidden'  name='infantNum'  value="+flightList[i].arrTime+" />");
					$("#flightBody").append("<input type='hidden'  name='adultNum'  value="+flightList[i].infantNum+" />");
					$("#flightBody").append("<input type='hidden'  name='childNum'  value="+flightList[i].adultNum+" />");
					$("#flightBody").append("<input type='hidden'  name='airline'  value="+flightList[i].childNum+" />");
					$("#flightBody").append("<input type='hidden' value='flight' />");
					$("#flightBody").append("<td>"+flightList[i].depCity+"/"+flightList[i].arrCity+"</td>");
					$("#flightBody").append("<td>"+flightList[i].depTime+"-"+flightList[i].arrTime+" </td>");
					$("#flightBody").append("<td>"+flightList[i].stopOver+"/"+flightList[i].leadTime+" </td>");
					$("#flightBody").append("<td>"+flightList[i].price+"원</td>");
					$("#flightBody").append("<td><i class='fas fa-heart deleteFlight' onclick='javascript:deleteLike("+flightList[i].flightId+")'></i></td> ");
					$("#flightBody").append("</tr>");
					
			
				}
				
				for(var j=0;roomList.length;j++){
					$("#roomBody").append("<tr>");
					$("#roomBody").append("<th scope='row'>"+i+"</th>");
					$("#roomBody").append("<td>"+roomList[i].roomCity+"</td>");
					$("#roomBody").append("<input type='hidden' id='roomId' value="+roomList[i].roomId+"/>");
					$("#roomBody").append("<input type='hidden' value='room'/> ");
					$("#roomBody").append("<td>"+roomList[i].roomName+"</td>");
					$("#roomBody").append("<td>"+roomList[i].checkIn+"-"+roomList[i].checkOut+"</td>");
					$("#roomBody").append("<td>"+roomList[i].roomNum+"개/ 성인"+roomList[i].adultNum+"명 , 유아"+roomList[i].childNum+"명</td>");
					$("#roomBody").append("<td>"+roomList[i].price+"원</td>");
					$("#roomBody").append("<td><i class='fas fa-heart deleteFlight' onclick='javascript:deleteLike("+flightList[i].flightId+")'></i></td> ");
					$("#roomBody").append("</tr>");
					
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
				    	<input type="hidden" name="${room.roomId}" id="roomId" value="${room.roomId}"/>
				    	<input type="hidden" value="room">
				    <td>${room.roomName}</td>
				    <td>${room.checkIn} - ${room.checkOut }</td>
				    <td>${room.roomNum} 개 / 성인 ${room.adultNum} 명 , 유아 ${room.childNum} 명</td>
				    <td>${room.price} 원 </td>
				    <td> 
				    <i class="fas fa-heart deleteFlight" onclick="javascript:deleteLike(${room.roomId})"></i>
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