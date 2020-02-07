<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<html>
<head>
<title>Insert title here</title>
<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

	<!--  bootstrap jQuery CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
	<style>
	
		body{
		 padding-top : 50px;
            background: linear-gradient(-100deg, mistyrose,pink, lightpink) fixed;
		}
       body > div.container{
        	border: 3px solid white;
            margin-top: 10px;
            
        }
   
    </style>
    <script type="text/javascript">
    
    window.onload = function () {
    	var price = $("#prices").val();
    	console.log("price"+$("#prices").val());
    	var totalAmount = $("#totalAmount").val(price);
    	var actualAmount = $("#actualAmount").val(price);
    	};	
       function call(){
    	   var price = $("#prices").val(); //상품가격
    	   var totalAmount = $("#totalAmount").val(price); //총 가격
        	var payPoint = document.getElementById("payPoint").value; //사용할 포인트 
        	
        	console.log("totalAmount"+totalAmount);
        	console.log("payPoint"+payPoint);
        	console.log("price"+price);
        	
        	//사용된 포인트 = 사용할 포인트
    		document.getElementById("usedPoint").value = document.getElementById("payPoint").value;
        	
    		var calculation = price - payPoint; //상품가격 - 사용할 포인트 = 실결제금액 계산
    		var calculation2 = 500 - payPoint;// 보유 포인트 - 사용포인트 빼기
    		console.log("calculation2"+calculation2);
    		
    		
    		var point = $("#point").val(calculation2);  //보유한 포인트
    		var actualAmount = $("#actualAmount").val(calculation); //실 결제금액 입력
    		console.log("actualAmount"+actualAmount+"calculation"+calculation);	
    		
    		var accumulate = $("#accumulate").val(calculation * 0.05); //적립예정 금액
    		console.log("accumulate"+accumulate);
    };	
    
    
    $( function () {
    	$('button.btn.btn-primary').on('click' , function () {
    		var actualAmount = $("#actualAmount").val();
    		//$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
    						 IMP.init('imp15344798');
    						 IMP.request_pay({
    							    pg : 'inicis', // version 1.1.0부터 지원.
    							    pay_method : 'card',
    							    merchant_uid : 'merchant_' + new Date().getTime(),
    							    name : 'Order',
    							    amount : 10,
    							    buyer_email : 'iamport@siot.do',
    							    buyer_name : "김유경",
    							    buyer_tel : "010",
    							    buyer_addr : "강남",
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
    									msg += '상품 번호 : '+ '${product.prodNo}';
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
    							        
    							        var orderDate = rsp.paid_at;
    							        $("#orderDate").val(orderDate);
    							        
    							        var userId = '${user.userId}';
    							        $("#userId").val(userId);
    							        
    							    } else {
    							        var msg = '결제에 실패하였습니다.';
    							        msg += '에러내용 : ' + rsp.error_msg;
    							    }
    						        alert(msg);
    						        alert("input imp_uid : "+$("#orderId").val());
    						    
    							  $("form").attr("method" , "POST").attr("action" , "/order/addFlightOrder").submit();
    					});	
    				}); 
    	
    			});
    
    
   
    </script>

</head>

<body>

<div class="container"><br/>
	<div class="alert alert-warning" role="alert">
	  <h5 align="center" style="font-size:30px; font-family : Consolas;">Order History</h5>
	</div>
	
	<form class="form-horizontal">
	<input type="hidden" name="orderId" value= "" id="orderId"/>
	<input type="hidden" name="price" value= "" id="price"/>
	<input type="hidden" name="orderDate" value= "" id="orderDate"/>
	<input type="hidden" name="userId" value= "" id="userId"/>
	<input type="hidden" name="payInstal" value= "" id="payInstal"/>
	
		<div class="form-group">
		<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">회원아이디</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" readonly="readonly" id="userId" name="userId" value="${user.userId}">
		</div>
		</div>
		
		<div class="form-group">
		<label for="depCity" class="col-sm-offset-1 col-sm-3 control-label">출발지역</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" id="depCity" name="depCity" value="${flight.depCity }">
		</div>
		</div>
		
		<div class="form-group">
		<label for="arrCity" class="col-sm-offset-1 col-sm-3 control-label">도착지역</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" id="arrCity" name="arrCity" value="${flight.arrCity}">
		</div>
		</div>
		
		<div class="form-group">
		<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" id="prices" name="price" value="${flight.price}">
		</div>
		</div>
		
		<h4 align="center">포인트 사용 </h4>
		<div class="form-group">
		<label for="payPoint" class="col-sm-offset-1 col-sm-3 control-label"></label>
		<div class="col-sm-4">
		<input	type="text" name="payPoint" id="payPoint" class="form-control" 
		placeholder="사용할 포인트" onkeyup="call()">
		
		</div>
		<div class="col-sm-4">
		
		보유한 포인트
		<input	type="text" name="point" id="point" class="form-control" value="">
		</div>
		</div>
		
		<label for="totalAmount" class="col-sm-offset-1 col-sm-3 control-label">총 주문 금액 </label>
		<div class="col-sm-4">
		<input	type="text" name="totalAmount" id="totalAmount" class="form-control" value="">
	
		</div>
		
		<label for="usedPoint" class="col-sm-offset-1 col-sm-3 control-label"> -포인트사용 </label>
		<div class="col-sm-4">
		<input	type="text" name="usedPoint" id="usedPoint" class="form-control" readonly="readonly">
		
		</div>
		
		<label for="actualAmount" class="col-sm-offset-1 col-sm-3 control-label">실 주문 금액 </label>
		<div class="col-sm-4">
		<input	type="text" name="actualAmount" id="actualAmount" class="form-control" value="${order.actualAmount }">
		
		적립예정
		<div class="col-md-4">
		<input	type="text" name="accumulate" id="accumulate" class="form-control" value="">
		</div>
		</div>
		
	
	
							
		<div class="form-group">
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
