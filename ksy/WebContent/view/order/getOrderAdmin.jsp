<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<html>
<head>
<title>Insert title here</title>
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
	
		body{
		 padding-top : 50px;
		}
       body > div.container{
        	border: 3px solid white;
            margin-top: 10px;
            
        }
   
    </style>
    <script type="text/javascript">
    $( function () {
	$("#refundApp2").on('click' , function () {
		var orderId = $("#orderId").val();
		var flightId = $("#flightIds").val();
		var roomId = $("#roomIds").val("");
		var orderStatus = $("#orderStatus").val();
			orderStatus = 2;
			
		
		//$("#refundApp1").hide();
		
		self.location ="/order/getOrderRefund?orderId="+orderId+"&orderStatus="+orderStatus;
		
		//$("form").attr("method" , "POST").attr("action" , "/order/getOrderRefund").submit();
	});
}); 
    </script>

</head>

<body>
	<jsp:include page="/toolbar/toolBar.jsp" />
	<form>
	<input type="hidden" name="orderId" id="orderId" value= "${order.orderId }"/>
	<input type="hidden" name="orderStatus" id="orderStatus" value= "${order.orderStatus }"/>
	<input type="hidden" name="flightId" id="flightIds" value= "${flight.flightId }"/>
	<input type="hidden" name="roomId" id="roomIds" value= "${room.roomId }"/>
<div class="container"><br/>
			<h4 align="left">
				  <c:if test="${order.orderStatus == '1' }">
			      	주문완료
			      </c:if>
			      <c:if test="${order.orderStatus == '2' }">
			      	환불신청
			      </c:if>
			      <c:if test="${order.orderStatus == '3' }">
			      	환불완료
				  </c:if>
			</h4>
		 <c:if test="${flight.flightId ne null }">
		 	<hr/>
			<i class="fas fa-plane" id="iconf" style="Padding-left:20px;font-size:40px;" ></i>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">항공사</th>
					      <th scope="col">출발시간</th>
					      <th scope="col">도착시간</th>
					      <th scope="col">경유</th>
					      <th scope="col">소요시간</th>
					      <th scope="col">가격</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${flight.airline}</th>
					      <td>${flight.depTime}</td>
					      <td>${flight.arrTime}</td>
					      <td>${flight.stopOver}</td>
					      <td>${flight.leadTime}</td>
					      <td>${flight.price}원</td>
					    </tr>
					  </tbody>
				</table>
		</c:if>
		 <c:if test="${room.roomId ne null }">
		 	<hr/>
			<i class="fas fa-bed" id="iconr" style="Padding-left:20px;font-size:40px;"></i>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">숙소</th>
					      <th scope="col">체크인</th>
					      <th scope="col">체크아웃</th>
					      <th scope="col">객실수</th>
					      <th scope="col">숙박인원</th>
					      <th scope="col">가격</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${room.roomName}</th>
					      <td>${room.checkIn}</td>
					      <td>${room.checkOut}</td>
					      <td>${room.roomNum}</td>
					      <td>성인 ${room.adultNum} 명 , 유아 ${room.childNum} 명</td>
					      <td>${room.price}원</td>
					    </tr>
					  </tbody>
				</table>
		</c:if>
		
		<br/>
		
		<div class="row">
			<i class="fas fa-won-sign" style="Padding-left:20px;font-size:40px;"></i>
			<h4 align="left" style="margin-top:5px;margin-left:10px;font-size:17px;">결제 완료 내역</h4>
		</div>	
			<hr/>
			<div class="row">
	             <div class="col-sm-2">
	            		 총 결제 금액
	                    <div class="row">
	                    	<c:if test="${flight.depCity == null }">	
	                   			<div id="totalAmount" style="Padding-left:30px;">${room.price}원</div> 
	            			</c:if>
	            			<c:if test="${room.roomCity == null }">	
	                   			<div id="totalAmount" style="Padding-left:30px;">${flight.price}원</div>
	            			</c:if>
	            		</div>
	             </div>
	             <div class="col-sm-1">
	             	<i class="fas fa-minus-circle" style="margin-top:10px;"></i>
	             </div>
	             <div class="col-sm-2" style="Padding-left:30px;">
	            		 포인트 할인
	                    <div class="row">
	                    	<div id="usedPoint" style="Padding-left:20px;"> - ${point.usedPoint} P</div>
	            		</div>
	             </div>
	             <div class="col-sm-1">
	             	<i class="fas fa-equals" style="margin-left:15px;margin-top:10px;"></i>
	             </div>
	             <div class="col-sm-2" style="Padding-left:40px;">
	            		 실 결제 금액
	                    <div class="row">
	                    	<div id="actualAmount" style="Padding-left:20px;">${order.actualAmount}원</div>
	            		</div>
	             </div>
			</div>
			<br/>
			<hr style="width:50%;float:left;margin-right:700px;" />
			
				<div class="row" style="Padding-left:190px;">
					<div class="col-sm-1" style="margin-top:10px;">
						<i class="fas fa-plus"></i>
					</div>
					<%-- <div class="col-sm-3">
				 		사용한 포인트 
						<div id="payPoint" style="Padding-left:20px;">${order.payPoint} P</div>
					 <i class="fas fa-minus-circle" style="margin-top:10px;"></i>
					</div> --%>
					<div class="col-sm-2" style="margin-left:30px;">
						<p>적립 된 포인트</p>
							<%-- <c:if test="${point.usedType eq 'F' | point.usedType eq 'R' }"> --%>
					 			<div id="addPoint" style="Padding-left:20px;">${point.usedPoint} P </div>
					</div>
					<div class="col-sm-1" style="margin-left:20px;">
						<i class="fas fa-equals" style="margin-left:15px;margin-top:10px;"></i>
					</div>
					<div class="col-sm-2" style="margin-left:50px;">
						<p>총 포인트</p>
							<div id="totalPoint" style="margin-left:10px;">${user.totalPoint} P </div>
					</div>
				</div>
			<br/>
		<div class="row">
			<i class="fas fa-user" style="Padding-left:20px;font-size:40px;"></i>
			<h4 align="left" style="margin-top:5px;margin-left:10px;font-size:17px;">구매자 정보</h4>
		</div>
		<hr/>
			<div>
				<div class="row" style="margin-bottom: 15px" >
						  <div class="col-md-3">구매자</div>
						  <div class="col-md-9">${order.buyerName}</div>
				</div>
				<div class="row" style="margin-bottom: 15px" >
						  <div class="col-md-3">연락처</div>
						  <div class="col-md-9">${order.buyerPhone}</div>
				</div>
				<div class="row" style="margin-bottom: 15px" >
						  <div class="col-md-3">Email</div>
						  <div class="col-md-9">${order.buyerEmail}</div>
				</div>
			</div>
		<hr/>
	
	   		 <div class="form-group" align="center">
			<button type="button" class="btn btn-warning"  >확인</button>
			<button type="button" class="btn btn-primary" id="refundApp1" data-toggle="modal" data-target="#refund">
			   환불 신청
			</button>
			</div>
</div>
			
<div class="modal fade" id="refund" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">환불 신청</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	  예약한 상품을 환불 신청 하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="reset" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="refundApp2">환불신청</button>
      </div>
    </div>
  </div>
</div>	
			
		
		
		
<%-- 		<div class="row">
		
			<div class="col-xs-4 col-md-2"><strong>도착도시</strong></div>
			<div class="col-xs-8 col-md-4">${flight.depCity }</div>
		 <c:if test="${flight.depCity == null }">
			<div class="col-xs-4 col-md-2"><strong>도착지역</strong></div>
			<div class="col-xs-8 col-md-4">${room.roomCity }</div>
		</c:if>
		</div>
	<hr/>
	
	<div class="row">
	<c:if test="${flight.arrCity == null }">
			<div class="col-xs-4 col-md-2"><strong>숙소이름</strong></div>
			<div class="col-xs-8 col-md-4">${room.roomName }</div>
	</c:if>
	<c:if test="${room.roomName == null }">
			<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${flight.arrCity }</div>
	</c:if>
		</div>
	<hr/>
	
	<div class="row">
			<div class="col-xs-4 col-md-2"><strong>orderId</strong></div>
			<div class="col-xs-8 col-md-4">${order.orderId }</div>
		</div>
	<hr/> --%>

	</form>
</body>
</html>
