<%@ page language="java"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
		$('#refund').on("click" , function (){
			var flightId = $("#flightId").val();
			self.location ="/order/getFlightOrder?flightId="+flightId;
		})
		$('#refund2').on("click" , function (){
			var roomId = $("#roomId").val();
			self.location ="/order/getRoomOrder?roomId="+roomId;
		})
	})
	
	/* 환불 처리중 , 환불완료로 변경 modal */
 	$(function() {
 		
 		$('#orderStatus').change(function() {
 			var state = $('#orderStatus option:selected').val();
	 			if ( state == '3' ) {
	 				$( "#refundmodal3" ).modal('show');
	 			} 
 				if (state == '4') {
 					$( "#refundmodal4" ).modal('show');
				}
 		
 		});
	}); 
	
 	/* close modal */
 	function closeModal(modalName) {
		if( typeof $("."+modalName)[0] != "undefined" ){
			$("."+modalName)[0].reset();	
		}
		$("#"+modalName).modal("hide");
	}
	
	  
	
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
<form>
<body>
<div>
	<jsp:include page="/toolbar/toolBar.jsp" />
	<div class="container">
		<div class="page-header">
			<h3>Order List</h3>
		</div>
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
					      	<select class="custom-select" name="orderStatus" id="orderStatus" style="">
							  <option selected value="2">환불신청</option>
							  <option value="3" id="3">환불처리중</option>
							  <option value="4" id="4">환불완료</option>
							</select>
					      </c:if>
					         <c:if test="${flight.orderStatus == '3' }">
					         <select class="custom-select" name="orderStatus" id="orderStatus" style="">
							  <option selected value="3">환불처리중</option>
							  <option value="4" id="4">환불완료</option>
							</select>
					         </c:if>
					      <c:if test="${flight.orderStatus == '4' }">
					      	환불완료
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
			      	<select class="custom-select" name="orderStatus" id="orderStatus" style="">
					  <option selected value="2" id="2">환불신청</option>
					  <option value="3" id="3" data-toggle="modal" data-target="#refund">환불처리중</option>
					  <option value="4" id="4">환불완료</option>
					</select>
			      </c:if>
			         <c:if test="${room.orderStatus == '3' }">
			         <select class="custom-select" name="orderStatus" id="orderStatus" style="">
					  <option selected value="3" id="3" >환불처리중</option>
					  <option value="4" id="4">환불완료</option>
					</select>
			         </c:if>
			      <c:if test="${room.orderStatus == '4' }">
			      	환불완료
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
	
	<div class="modal fade" id="refundmodal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	        <button type="button" class="btn btn-secondary" onclick="closeModal('refundmodal3');" id="reset" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="refundConfirm">확인</button>
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
	        <button type="button" class="btn btn-secondary" onclick="closeModal('refundmodal4');" id="reset" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="refundConfirm">확인</button>
	      </div>
	    </div>
	  </div>
	</div>	
</body>
</form>
</html>
