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
	 function addFlightOrder(id){
		 self.location ="/order/flightOrder?flightId="+id;
	 }
	function addRoomOrder(id){
		self.location ="/order/roomOrder?roomId="+id;
	}

	$( function () {
		
		$("td:nth-child(2)").on("click",function(){
			var id = $(this).next().val();
			var type = $(this).next().next().val();
			if( type=="F" ){
		  		self.location ="/order/flightOrder?flightId="+id;
			}else if(type!="F"){
				 self.location ="/order/roomOrder?roomId="+id;
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
				if(JSONData.likeType=='F'){
					$("#flightBody").html("");
					for(var i=0;i<flightList.length;i++){
						$("#flightBody").append("<tr>");
						$("#flightBody").append("<th scope='row'>"+(i+1)+"</th>");
						$("#flightBody").append("<td onclick='javascript:addFlightOrder("+flightList[i].flightId+")'>"+flightList[i].airline+"</td>");
						$("#flightBody").append("<td>"+flightList[i].depCity+"/"+flightList[i].arrCity+"</td>");
						$("#flightBody").append("<td>"+flightList[i].depTime+"-"+flightList[i].arrTime+" </td>");
						$("#flightBody").append("<td>"+flightList[i].stopOver+"/"+flightList[i].leadTime+" </td>");
						$("#flightBody").append("<td>"+flightList[i].price+"원</td>");
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
					 	$("#roomBody").append("<td onclick='javascript:addRoomOrder("+roomList[j].roomId+")'>"+roomList[j].roomCity+"</td>"); 
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
						      	<input type="hidden"  value="${flight.flightId }" />
						      	<input type="hidden" value="F"/>
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
						<input type="hidden"  value="${room.roomId }" />
				      	<input type="hidden" value="R"/>

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