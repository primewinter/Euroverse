<%@ page language="java"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*" %>

<html>
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
	
	 <!-- jQuery UI toolTip 사용 CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
  <!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
        h3{
        	color: white;
        	font-family : Consolas;
        }
      
        #flight , #room {
        	width: 80%;
			margin:auto;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
$(document).ready(function(){
	Show();
})

function fncGetUserList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/order/getOrderList").submit();
}

 $(function() {
	 $( "button.btn.btn-default" ).on("click" , function() {
	 	fncGetUserList(1);
	 });
 });

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
 
 		$( function () {
		$('.fas.fa-list').on("click" , function (){
			//var flightId = $("#flightId").val();
			var flightId = $(this).next().val();
			var orderId = $(this).next().next().val();
			self.location ="/order/getFlightOrder?flightId="+flightId+"&orderId="+orderId;
		})
		$('.fas.fa-list-ul').on("click" , function (){
			var roomId = $(this).next().val();
			var orderId = $(this).next().next().val();
			self.location ="/order/getRoomOrder?roomId="+roomId+"&orderId="+orderId;
		})
	})
	
	/* ------------------------- 환불 신청에서 환불 처리중  변경 modal ------------------------- */
	function order(orderId){
 			var orderState = $('#'+orderId+' option:selected').val();
 			console.log("orderId "+orderId);
 			 if ( orderState == 'A' ) {
 				
 				$( "#refundmodal3" ).modal('show');
	 			var orderIds = $("#confirmModal3Id").val(orderId);
 				
 			} 
 		}
 		
 		$(function() {
 			$("#refundConfirm3").click(function(){
 				var orderId = $(this).next().val();	
 				console.log("orderID : "+orderId);
 	 			$.ajax (
 	 					{
 	 						url : "/order/json/updateOrderStatus/"+orderId ,
 	 						method : "GET",
 	 						dataType : "json",
 	 						headers : {
 	 							"Accept" : "application/json",
 	 							"Content-Type" : "application/json"
 	 						},
 	 						success : function (JSONData, status ) {
 	 							var displayValue = "<select class='custom-select' name='orderStatus' id='${flight.orderId}' onChange='order2('${flight.orderId}')' >"
 	 							 displayValue +=  "<option selected value='R' >환불처리중</option>"
 	 							+ "<option value='C'>환불완료</option>"
 	 							+ "</select>";
 	 					
 	 							$("td #"+JSONData.orderId+"").html(displayValue);
 	 						}
 	 					})
 	 					$("#refundmodal3").modal("hide");
 			});
 		});
 	/* ------------------------- 여기까징 ------------------------ */	
 	
 	
 	
 	/* ------------------------- 환불완료로 변경 modal ------------------------- */
 	function order2(orderId){
 			
 			var orderState = $('#'+orderId+' option:selected').val();
 			console.log("orderId "+orderId);
 			 if ( orderState == 'C' ) {
 				
 				$( "#refundmodal4" ).modal('show');
	 			var orderIds = $("#confirmModal4Id").val(orderId);
 				
 			} 
 		}
 		
 		$(function() {
 			$("#refundConfirm4").click(function(){
 				var orderId = $(this).next().val();	
 				console.log("orderID : "+orderId);
 	 			$.ajax (
 	 					{
 	 						url : "/order/json/payRefund/"+orderId ,
 	 						method : "GET",
 	 						dataType : "json",
 	 						headers : {
 	 							"Accept" : "application/json",
 	 							"Content-Type" : "application/json"
 	 						},
 	 						success : function (JSONData, status ) {
 	 							console.log("시무룩...");
 	 							/* var displayValue = "<select class='custom-select' name='orderStatus' id='${flight.orderId}' onChange='order2('${flight.orderId}')' >"
 	 	 							 displayValue +=   "<option selected value='4'>환불완료</option>"
 	 	 							+ "</select>";
 	 	 						var value = "<td>"+JSONData.order.refundDate+"</td>";
 	 							 */
 	 	 					 	var result = "<p>환불완료 <i class='far fa-clock'></i>"+JSONData.order.refundDate+"</p>";
 	 					
 	 							$("#"+JSONData.orderId+"s").remove();
 	 							$("#"+JSONData.orderId+"").html(result);
 	 						}
 	 						
 	 					})
 	 					$("#refundmodal4").modal("hide");
 			});
 		});
 	
	/* ------------------------- 여기까징 ------------------------ */	
 	/* -----------------------close modal----------------------- */
 	$(function() {
 		$("#resetmodal4").click(function() {
 			
 			/* if(  $("#refundmodal4")[0] != "undefined" ){
 				$("#refundmodal4")[0].reset();	
 			} */
 			var orderId = $(this).next().next().val();
 			$("#refundmodal4").modal("hide");
 			$('#'+orderId+' option[value=R]').prop('selected', 'selected').change();
 		})
 		$("#resetmodal3").click(function() {
 			/* if( typeof $("#refundmodal3")[0] != "undefined" ){
 				$("#refundmodal3")[0].reset();	
 			} */
 			var orderId = $(this).next().next().val();
 			//alert(orderId);
 			$("#refundmodal3").modal("hide");
 			$('#'+orderId+' option[value=A]').prop('selected', 'selected').change();
 		})
 	})
	/* ------------------------- 여기까징 ------------------------ */	 
	////////////////////////////////////////////////////
/*     $( function () {
		$('.delete:contains("배")').on("click" , function () {
      jQuery.ajax({
        "url": "http://www.myservice.com/payments/cancel",
        "type": "POST",
        "contentType": "application/json",
        "data": JSON.stringify({
          "merchant_uid": "mid_" + new Date().getTime(), // 주문번호
          "cancel_request_amount": 100, // 환불금액
          "reason": "테스트 결제 환불" // 환불사유
          //"refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 가상계좌 예금주
         // "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
          //"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
        }),
        "dataType": "json"
      });
    });
    }); */
	
	
	////////////////////////////////////////////////////


</script>

</head>
<body>
<form>
<div>
	<jsp:include page="/toolbar/toolBar.jsp" />
	 <jsp:include page="/toolbar/pushBar.jsp" />
	<div class="container">
		<br/>
	</div>
<div class="btn-group btn-group-toggle" data-toggle="buttons" style="Padding-left:180px;" >
  <label class="btn btn-secondary active">
    <input type="radio" name="flight" id="option1" checked onclick="javascript:Show();"> Flight
  </label>
  <label class="btn btn-secondary">
    <input type="radio" name="room" id="option2" onclick="javascript:doShow();"> Room
  </label>
</div>

	
  	<br/><br/>
  	<i class="fas fa-plane" id="iconf" style="Padding-left:180px;font-size:40px;" ></i>
  	<i class="fas fa-bed" id="iconr" style="Padding-left:180px;font-size:40px;"></i>
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
   
     <c:set var = "i" value="0"/>
		<c:forEach var="flight" items = "${list}" >
	<c:set var="i" value="${i+1}"/>
			 <tr>
			      <th scope="row">
			      <i class="fas fa-list"></i>
			      <input type="hidden" name="${flight.flightId}"  value="${flight.flightId}"/>
			      <input type="hidden" name="${flight.orderId }"  value="${flight.orderId}" />
			      </th>
				      <td id="refund">${flight.airline}</td>
				      <td>${flight.depCity}/${flight.arrCity }</td>
				      <td>${flight.depTime} - ${flight.arrTime }</td>
				      <td>${flight.stopOver}/${flight.leadTime}</td>
				      <td id="appendStatus"><fmt:formatNumber value="${flight.price}" pattern="###,###" />원/${flight.orderDate}</td>
				      <td id="${flight.orderId }">
					     <c:if test="${flight.orderStatus == 'O' }">
					      	주문완료
					      </c:if>
					      <c:if test="${flight.orderStatus == 'A' }">
					      	<select class="custom-select" onChange="order('${flight.orderId}')" name="orderStatus"  id="${flight.orderId }" style="">
							  <option selected value="A">환불신청</option>
							  <option value="R">환불처리중</option>
							  <option value="C" disabled >환불완료</option>
							</select>
					      </c:if>
					         <c:if test="${flight.orderStatus == 'R' }">
					         <select class="custom-select" onChange="order2('${flight.orderId}')" name="orderStatus" id="${flight.orderId }s" style="">
							  <option selected value="R">환불처리중</option>
							  <option value="C" id="4">환불완료</option>
							</select>
					         </c:if>
					      <c:if test="${flight.orderStatus == 'C' }">
					      	<p>환불완료 <i class="far fa-clock"></i> ${flight.refundDate }</p>
						  </c:if>
					  
					  </td>
					   
		   	 </tr>
    	 </c:forEach>
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
	   
	     <c:set var = "i" value="0"/>
		<c:forEach var="room" items = "${list2}" >
		<c:set var="i" value="${i+1}"/>
			 <tr>
			    <th scope="row"  id="refund2" >
			    <i class="fas fa-list-ul"></i>
			    	<input type="hidden" name="${room.roomId}" value="${room.roomId}"/>
			    	<input type="hidden" name="${room.orderId }"  value="${room.orderId}" />
			    </th>
			    <td>${room.roomCity }</td>
			    <td>${room.roomName}</td>
			    <td>${room.checkIn} - ${room.checkOut }</td>
			    <td>${room.roomNum} 개 / 성인 ${room.adultNum} 명 , 유아 ${room.childNum} 명</td>
			    <td><fmt:formatNumber value="${room.price}" pattern="###,###" /> 원 /${room.orderDate}</td>
			    <td id="${room.orderId }"> 
			    
			      <c:if test="${room.orderStatus == 'O' }">
			      	주문완료
			      </c:if>
			      <c:if test="${room.orderStatus == 'A' }">
			      	<select class="custom-select" name="orderStatus" onChange="order('${room.orderId}')"  id="${room.orderId }" style="">
					  <option selected value="A" id="2">환불신청</option>
					  <option value="R" id="3">환불처리중</option>
					  <option value="C" id="4">환불완료</option>
					</select>
			      </c:if>
			         <c:if test="${room.orderStatus == 'R' }">
			         <select class="custom-select" name="orderStatus" onChange="order2('${room.orderId}')"  id="${room.orderId }" style="">
					  <option selected value="3">환불처리중</option>
					  <option value="4" id="4">환불완료</option>
					</select>
			         </c:if>
			      <c:if test="${room.orderStatus == 'C' }">
			      		<p>환불완료 <i class="far fa-clock"></i> ${room.refundDate }</p>
				  </c:if>
				 </td>
		   	 </tr>
	     </c:forEach>
	  </tbody>
	</table>

	</div>
	<!-- <button type="button" class="btn btn-primary" id="refundApp1" data-toggle="modal" data-target="#refund">
			   환불 신청
			</button> -->
	
	<div class="modal fade" id="refundmodal3" value="" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">환불 처리중으로 변경</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	 환불 처리중으로 변경하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="resetmodal3" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary"
	        		id="refundConfirm3">확인</button>
	        <input type="hidden" name="orderId" id="confirmModal3Id" value="" />
	     
	      </div>
	    </div>
	  </div>
	</div>	
	
	<div class="modal fade" id="refundmodal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">환불 처리 완료</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	 환불 처리를 완료 하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="resetmodal4" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="refundConfirm4">확인</button>
	        <input type="hidden" name="orderId" id="confirmModal4Id" value="" />
	      </div>
	    </div>
	  </div>
	</div>	
</form>
	 <jsp:include page="/toolbar/footer.jsp" />
</body>
</html>
