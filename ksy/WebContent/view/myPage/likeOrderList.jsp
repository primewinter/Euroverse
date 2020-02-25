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
<title>Euroverse</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script>
	$(document).ready(function(){
		Show();
	})

	$( function () {
		
		$("td:nth-child(2)").on("click",function(){
			var type = $(this).next().next().val();
			var id = $(this).next().val();
			if( type=="flight" ){
				alert("항공~")
				self.location ="/order/addFlightOrder?flightId="+id;
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
	

	function deleteLike(refId){
		alert(refId);
		$.ajax({
			url : '/myPage/json/deleteLike/'+refId ,
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
					$("#flightBody").append("<input type='hidden' id='roomId' value="+roomList[i].roomId+"/>");
					$("#flightBody").append("<input type='hidden' value='flight' />");
					$("#flightBody").append("<td>"+flightList[i].airline+"</td>");
					$("#flightBody").append("<td>"+flightList[i].depCity+"/"+flightList[i].arrCity+"</td>");
					$("#flightBody").append("<td>"+flightList[i].depTime+"-"+flightList[i].leadTimeCity+" </td>");
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
	
	<div class="container">
		<div class="page-header">
			<h3>찜목록</h3>
		</div>
		
		<div class="btn-group btn-group-toggle" data-toggle="buttons" >
		  <label class="btn btn-secondary active">
		    <input type="radio" name="flight" id="option1" checked onclick="javascript:Show();"> Flight
		  </label>
		  <label class="btn btn-secondary">
		    <input type="radio" name="room" id="option2" onclick="javascript:doShow();"> Room
		  </label>
		</div>

	
  	<br/><br/>
  	<i class="fas fa-plane" id="iconf" style="font-size:40px;" ></i>
  	<i class="fas fa-bed" id="iconr" style="font-size:40px;"></i>
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
				      <td>${flight.airline}</td>
			     	 <input type="hidden" name="${flight.flightId}" id="flightId" value="${flight.flightId}"/>
			     	 <input type="hidden" value="flight">
				      <td>${flight.depCity}/${flight.arrCity }</td>
				      <td>${flight.depTime} - ${flight.arrTime }</td>
				      <td>${flight.stopOver}/${flight.leadTime}</td>
				      <td>${flight.price}원</td>
					 	<td>
					 	<i class="fas fa-heart deleteFlight" onclick="javascript:deleteLike(${flight.flightId})"></i>
					 	</td> 
					 
		   	 </tr>
    	 </c:forEach>
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
	  </tbody>
	</table>
	
</div>	
</body>
<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</html>