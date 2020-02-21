<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script>
$(document).ready(function(){
	Show();
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


</script>


</head>
<body>
	<jsp:include page="/toolbar/toolBar.jsp" />
	
	<jsp:include page="/view/user/userSideBar.jsp"></jsp:include>

 	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
	
	<div class="container">
		<div class="page-header">
			<h3>Order List</h3>
		</div>
	
	
			
		<%-- <div class="col-md-6 text-right">
			<form class="form-inline" name="detailForm">
			<input type="hidden" name="imp_uid" value= "${purchase.imp_uid}" id="imp_uid"/>
				<div class="form-group">
					<select class="form-control" name="searchCondition">
						<option value="0" ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>구매번호</option>
						<option value="1" ${ !empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>구매자ID</option>
						<option value="2" ${ !empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>구매자이름</option>
					</select>
				</div>
				
				<div class="form-group">
					  <label class="sr-only" for="searchKeyword">검색어</label>
				    	<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    		value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				</div>
				  <button type="button" class="btn btn-default">검색</button>
				  <input type="hidden" id="currentPage" name="currentPage" value="" />
			</form>
		</div> --%>
		</div>
		<br/>
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
	 <table class="table table-bordered" id="flight" >
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">항공사</th>
      <th scope="col">출발도시 - 도착도시</th>
      <th scope="col">출발일시/도착일시</th>
      <th scope="col">경유/소요시간</th>
      <th scope="col">가격/결제일시</th>
      <th scope="col">주문상태</th>
    </tr>
  </thead>
 
  <tbody>
   
  <%--    <c:set var = "i" value="0"/>
		<c:forEach var="flight" items = "${list}" >
	<c:set var="i" value="${i+1}"/>
			 <tr>
			      <th scope="row">
			      <i class="fas fa-list" id="refund"></i>
			      <input type="hidden" name="${flight.flightId}" id="flightId" value="${flight.flightId}"/>
			      </th>
				      <td>${flight.airline}</td>
				      <td>${flight.depCity}/${flight.arrCity }</td>
				      <td>${flight.depTime} - ${flight.arrTime }</td>
				      <td>${flight.stopOver}/${flight.leadTime}</td>
				      <td>${flight.price}원/${flight.orderDate}</td>
				      <td>
					      <c:if test="${flight.orderStatus == '1' }">
					      	주문완료
					      </c:if>
					      <c:if test="${flight.orderStatus == '2' }">
					      	환불신청
					      </c:if>
					      <c:if test="${flight.orderStatus == '3' }">
					      	환불완료
						  </c:if>
					  </td>
		   	 </tr>
    	 </c:forEach> --%>
  </tbody>
</table>
	 
	
	
	 <table class="table table-bordered" id="room" >
	 
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">여행지</th>
	      <th scope="col">숙소</th>
	      <th scope="col">출발일시 - 도착일시</th>
	      <th scope="col">객실수/숙박인원</th>
	      <th scope="col">가격/결제일시</th>
	      <th scope="col">주문상태</th>
	    </tr>
	  </thead>
	 
	  <tbody>
	   
	<%--      <c:set var = "i" value="0"/>
		<c:forEach var="room" items = "${list2}" >
		<c:set var="i" value="${i+1}"/>
			 <tr>
			    <th scope="row"  id="refund2" >
			    <i class="fas fa-list"></i>
			    	<input type="hidden" name="${room.roomId}" id="roomId" value="${room.roomId}"/>
			    </th>
			    <td>${room.roomCity }</td>
			    <td>${room.roomName}</td>
			    <td>${room.checkIn} - ${room.checkOut }</td>
			    <td>${room.roomNum} 개 / 성인 ${room.adultNum} 명 , 유아 ${room.childNum} 명</td>
			    <td>${room.price} 원 /${room.orderDate}</td>
			    <td> 
			      <c:if test="${room.orderStatus == '1' }">
			      	주문완료
			      </c:if>
			      <c:if test="${room.orderStatus == '2' }">
			      	환불신청
			      </c:if>
			      <c:if test="${room.orderStatus == '3' }">
			      	환불완료
				  </c:if>
				 </td>
		   	 </tr>
	     </c:forEach> --%>
	  </tbody>
	</table>
	</main>
	</div>
	</div>
	
	
</body>
</html>