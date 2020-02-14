<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	<!--  iamPort -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
    
    window.onload = function () {
    	var price = $("#prices").val(); //상품 가격
    	var total = $("#usertotalPoint").val(); // 원래 있던 총 보유 포인트
    	console.log("total Point : "+total);
    	console.log("price"+$("#prices").val());
    	var totalAmount = $("#totalAmount").val(price); // 총결제금액
    	var actualAmount = $("#actualAmount").text(price); // 실결제금액
    	};	
    	
       function call(){
    	var price = $("#prices").val(); //상품가격
 	   var totalAmount = $("#totalAmount").text(); //총 가격
 	   var total = $("#usertotalPoint").val();
     	var payPoint = $("#payPoint").val(); //사용할 포인트 
    	   
        	
        	console.log("totalAmount"+totalAmount);
        	console.log("payPoint"+payPoint);
        	console.log("price"+price);
        	
        	//사용된 포인트 = 사용할 포인트
    		document.getElementById("usedPoint").value = document.getElementById("payPoint").value;
        	
    		var calculation = price - payPoint; //상품가격 - 사용할 포인트 = 실결제금액 계산
    		console.log("calculation"+calculation);
    		var calculation2 = total - payPoint;// 보유 포인트 - 사용포인트 빼기
    		console.log("calculation2"+calculation2); 
    		
    		
    		var actualAmount = $("#actualAmount").text(calculation); //실 결제금액 입력
    		console.log("actualAmount"+actualAmount+"calculation"+calculation);	
    		
    		$("#totalPoint").text(calculation2);  // 사용할 포인트를 감소한 총 보유한 포인트
    		var addPoint = $("#addPoint").val(Math.floor(calculation * 0.01)); //적립예정 금액
    		console.log("addPoint"+addPoint);
    };	
    
    
    $( function () {
    	$('button.btn.btn-primary').on('click' , function () {
    		var actualAmount = $("#actualAmount").val();
    		var buyerEmail = $("#buyerEmail").val();
    		var buyerName = $("#buyerName").val();
    		var buyerPhone = $("#buyerPhone").val();
    		
    		//$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
    						 IMP.init('imp15344798');
    						 IMP.request_pay({
    							    pg : 'inicis', // version 1.1.0부터 지원.
    							    pay_method : 'card',
    							    merchant_uid : 'merchant_' + new Date().getTime(),
    							    name : 'Flights',
    							    amount : 10,
    							    buyer_email : buyerEmail ,
    							    buyer_name : buyerName,
    							    buyer_tel : buyerPhone ,
    							    buyer_postcode : 1234 ,
    							  
    							    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
    							    
    							}, function(rsp) {
    							    if ( rsp.success ) {
    							        var msg = '결제가 완료되었습니다.';
    							        msg += '고유ID : ' + rsp.imp_uid;
    							        msg += '상점 거래ID : ' + rsp.merchant_uid;
    							        msg += '결제 금액 : ' + rsp.paid_amount;
    							        msg += '카드 승인번호 : ' + rsp.apply_num;
    									msg += '회원 아이디 : ' + '${user.userId}';
    									msg += '결제일시' + rsp.paid_at;
    									msg += '??' + rsp.vbank_name;
    									msg += 'status '+ rsp.pay_method;
    									msg += '할부'+ rsp.card_quota;
    									
    									var payInstal = rsp.card_quota;
    									$("#payInstal").val(payInstal);
    									
    							        var orderId = rsp.imp_uid;
    							        $("#orderId").val(orderId);
    							        
    							        var price = rsp.paid_amount;
    							        $("#price").val(price);
    							        
    							       /*  var orderDate = rsp.paid_at;
    							        $("#orderDate").val(orderDate); */
    							        
    							        var userId = '${user.userId}';
    							        $("#userId").val(userId);
    							        
    							    } else {
    							        var msg = '결제에 실패하였습니다.';
    							        msg += '에러내용 : ' + rsp.error_msg;
    	    							  $("form").attr("method" , "GET").attr("action" , "/view/order/addFlightOrder.jsp").submit();
    							    }
    						        alert(msg);
    						        alert("input imp_uid : "+$("#userId").val());
    						    
    							  $("form").attr("method" , "POST").attr("action" , "/order/addFlightOrder").submit();
    					});	
    				}); 
    	
    			});
    
    
   
    </script>

</head>

<body>
	<jsp:include page="/toolbar/toolBar.jsp" />
<div class="container"><br/>
	
	<form class="form-horizontal">
	<input type="hidden" name="orderId" value= "" id="orderId"/>
	<input type="hidden" name="price" value= "" id="price"/>
<!-- 	<input type="hidden" name="orderDate" value= "" id="orderDate"/> -->
	<input type="hidden" name="userId" value= "" id="userId"/>
	<input type="hidden" name="payInstal" value= "" id="payInstal"/>
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
			<br/><br/>
			<div class="row">
			    <div class="col">
			    <h4 align="left">주문자 정보</h4>
			    <br/>
			    	<div style="width:50%;">
				       <input type="text" class="form-control" placeholder="주문자 이름" id="buyerName" name="buyerName" value="${order.buyerName}">
				      	<br/>
				       <input type="text" class="form-control" placeholder="주문자 핸드폰 번호" id="buyerPhone" name="buyerPhone" value="${order.buyerPhone}">
				       	<br/>
				       	<br/>
				       <input type="text" class="form-control" placeholder="주문자 이메일 " id="buyerEmail" name="buyerEmail" value="${order.buyerEmail}">
			    	</div>
			    </div>
			    <div class="col">
			    	<input type="hidden" name="price" id="prices" value="${flight.price }" >
			    		<h5 align="left">포인트 사용 </h5>
							<div class="form-group">
								<label for="payPoint" class="col-sm-offset-1 col-sm-3 control-label"></label>
									<div class="col-sm-4">
										<input	type="text" name="payPoint" id="payPoint" class="form-control" placeholder="사용할 포인트" onkeyup="call()">
									</div>
									<div class="row" style="Padding-left:30px;">보유 포인트  : &nbsp;
										<div id="totalPoint">${user.totalPoint }</div>
									</div>
											<!-- 포인트 차감시 계산을 위한 totalPoint -->
											<input type="hidden" name="totalPoint" id="usertotalPoint" value="${user.totalPoint }" >
							</div>
							<h5 align="left">결제 금액</h5>
								<div class="row" style="Padding-left:30px;">총 주문 금액  : &nbsp;&nbsp;&nbsp;
										<div id="totalAmount" name="totalAmount" >${flight.price} </div>원
								</div>
								<div class="row" style="Padding-left:30px;">포인트 사용  : &nbsp;&nbsp;&nbsp; - &nbsp;
										<div id="usedPoint" name="usedPoint" >${point.usedPoint} </div>
								</div>
								<div class="row" style="Padding-left:30px;">실 주문 금액  : &nbsp;&nbsp;&nbsp;
										<div id="actualAmount" name="actualAmount" >${order.actualAmount } </div>원
								</div>
								
								
							
								적립예정
						<div class="col-sm-4">
							<input	type="text" name="addPoint" id="addPoint" class="form-control">
						</div>
						
			    </div>
			</div>
		<br/><br/>
		<div class="form-group" align="center">
   		 <div class="col-sm-offset-4  col-sm-4 text-center">
		<button type="button" class="btn btn-primary"  >구매</button>
		<input type="hidden" name="actualAmount" value= "${order.actualAmount }"/>
		<input type="hidden" name="usedPoint" value= "${point.usedPoint }"/>
		<input type="hidden" name="totalAmount" value= "${order.totalAmount }"/>
		<input type="hidden" name="payPoint" value= "${order.payPoint }"/>
		<input type="hidden" name="airline" value= "${flight.airline }"/>
		<input type="hidden" name="tripCourse" value= "${flight.tripCourse }"/>
		<input type="hidden" name="depDate" value= "${flight.depDate }"/>
		<input type="hidden" name="arrDate" value= "${flight.arrDate }"/>
		<input type="hidden" name="depCity" value= "${flight.depCity }"/>
		<input type="hidden" name="arrCity" value= "${flight.arrCity }"/>
		<input type="hidden" name="seatGrade" value= "${flight.seatGrade }"/>
		<input type="hidden" name="adultNum" value= "${flight.adultNum }"/>
		<input type="hidden" name="childNum" value= "${flight.childNum }"/>
		<input type="hidden" name="infantNum" value= "${flight.infantNum }"/>
		<input type="hidden" name="leadTime" value= "${flight.leadTime }"/>	
		<input type="hidden" name="stopOver" value= "${flight.stopOver }"/>	
		<input type="hidden" name="depTime" value= "${flight.depTime }"/>	
		<input type="hidden" name="arrTime" value= "${flight.arrTime }"/>	
		
		</div>
		</div>
		
	</form>
	
	
</div>


</body>
</html>
