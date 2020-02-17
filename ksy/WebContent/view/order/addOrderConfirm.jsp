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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	
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
	$('button.btn.btn-warning').on('click' , function () {
		var orderId = $("#orderId").val();
		alert("${order.orderId}");
		self.location ="/view/flight/searchFlight.jsp";

		//  $("form").attr("method" , "POST").attr("action" , "/order/addOrderConfirm?orderId=${order.orderId}").submit();
	});
});
    </script>

</head>

<body>
	<jsp:include page="/toolbar/toolBar.jsp" />
	<form>

<div class="container"><br/>

	<div >
	  <h3 align="center">${user.userName}님 예약이 정상적으로 완료되었습니다.</h3>
	</div>
	
		 <c:if test="${room.roomCity == null }">
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
		 <c:if test="${flight.depCity == null }">
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
